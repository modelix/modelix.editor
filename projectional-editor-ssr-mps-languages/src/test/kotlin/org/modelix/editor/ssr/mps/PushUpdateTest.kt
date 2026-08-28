package org.modelix.editor.ssr.mps

import jetbrains.mps.ide.ThreadUtils
import jetbrains.mps.smodel.SNodeUtil
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeoutOrNull
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.IVirtualDom
import org.modelix.editor.descendants
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.incremental.DependencyTracking
import org.modelix.incremental.IDependencyListener
import org.modelix.incremental.IStateVariableGroup
import org.modelix.incremental.IStateVariableReference
import org.modelix.incremental.IncrementalEngine
import org.modelix.model.mpsadapters.MPSArea
import org.modelix.model.mpsadapters.MPSWritableNode
import java.util.concurrent.atomic.AtomicInteger
import kotlin.time.Duration.Companion.seconds

private val INITIAL = """
    public class Class1 {
      public void method1() {

      }
    }
"""

/**
 * Reproduces the case where the model is changed inside MPS (not through the editor) and the change has to be
 * pushed to the already connected editor.
 */
@Suppress("ktlint:standard:function-naming")
class PushUpdateTest : TestBase("SimpleProject") {
    lateinit var editor: FrontendEditorComponent
    lateinit var service: TextEditorServiceImpl
    lateinit var mpsIntegration: EditorIntegrationForMPS
    lateinit var editorEngine: EditorEngine
    lateinit var incrementalEngine: IncrementalEngine
    lateinit var classNode: MPSWritableNode
    lateinit var coroutineScope: CoroutineScope

    private val modifications = AtomicInteger()

    /**
     * This is what ModelixSSRServer does to push updates to all connected editors.
     */
    private val dependencyListener =
        object : IDependencyListener {
            override fun parentGroupChanged(childGroup: IStateVariableGroup) {}

            override fun accessed(key: IStateVariableReference<*>) {}

            override fun modified(key: IStateVariableReference<*>) {
                modifications.incrementAndGet()
                service.triggerUpdates()
            }
        }

    override fun setUp() {
        super.setUp()
        readAction {
            val solution = mpsProject.projectModules.first { it.moduleName == "Solution1" }
            val model = solution.models.first()
            classNode = model.rootNodes.first().let { MPSWritableNode(it) }
        }
        incrementalEngine = IncrementalEngine()
        editorEngine = EditorEngine(incrementalEngine)
        mpsIntegration = EditorIntegrationForMPS(editorEngine)
        mpsIntegration.init(mpsProject.repository)
        coroutineScope = CoroutineScope(Dispatchers.Default)
        service = TextEditorServiceImpl(editorEngine, MPSArea(mpsProject.repository).asModel(), coroutineScope)
        editor = FrontendEditorComponent(service)
        runBlocking {
            editor.openNode(classNode.getNodeReference()).await()
            editor.flush()
        }
        DependencyTracking.registerListener(dependencyListener)
    }

    override fun tearDown() {
        DependencyTracking.removeListener(dependencyListener)
        editor.dispose()
        mpsIntegration.dispose()
        editorEngine.dispose()
        incrementalEngine.dispose()
        super.tearDown()
    }

    private fun editorText() = editor.getRootCell().layout.toString()

    /**
     * The text of the rendered DOM, which is what the browser shows. [editorText] only reads the cell tree, which
     * is updated even when the rendering isn't.
     */
    private fun renderedText() =
        editor
            .getHtmlElement()
            ?.descendants(true)
            ?.filterIsInstance<IVirtualDom.Text>()
            ?.joinToString("") { it.textContent.orEmpty() }
            .orEmpty()

    private fun commandOnEdt(body: () -> Unit) {
        ThreadUtils.runInUIThreadAndWait {
            mpsProject.modelAccess.executeCommand(body)
        }
    }

    private suspend fun awaitEditorText(expected: String) {
        val reached =
            withTimeoutOrNull(20.seconds) {
                while (editorText().normalizedEditorText() != expected.normalizedEditorText()) delay(50)
                true
            }
        assertTrue(
            "No update was pushed (DependencyTracking reported ${modifications.get()} modifications). Editor shows:\n" +
                editorText(),
            reached == true,
        )
    }

    fun `test property change in a write action`() =
        runBlocking {
            assertEquals(INITIAL.normalizedEditorText(), editorText().normalizedEditorText())
            writeActionOnEdt {
                classNode.node.setProperty(SNodeUtil.property_INamedConcept_name, "RenamedClass")
            }
            awaitEditorText(INITIAL.replace("Class1", "RenamedClass"))
        }

    fun `test property change in a command`() =
        runBlocking {
            assertEquals(INITIAL.normalizedEditorText(), editorText().normalizedEditorText())
            commandOnEdt {
                classNode.node.setProperty(SNodeUtil.property_INamedConcept_name, "RenamedClass")
            }
            awaitEditorText(INITIAL.replace("Class1", "RenamedClass"))
        }

    fun `test property change is rendered`() =
        runBlocking {
            editor.updateHtml()
            assertTrue("Unexpected initial rendering: " + renderedText(), renderedText().contains("Class1"))
            commandOnEdt {
                classNode.node.setProperty(SNodeUtil.property_INamedConcept_name, "RenamedClass")
            }
            awaitEditorText(INITIAL.replace("Class1", "RenamedClass"))
            val reached =
                withTimeoutOrNull(20.seconds) {
                    while (!renderedText().contains("RenamedClass")) delay(50)
                    true
                }
            assertTrue("The change was not rendered. The DOM shows:\n" + renderedText(), reached == true)
        }

    fun `test removing a child in a command`() =
        runBlocking {
            assertEquals(INITIAL.normalizedEditorText(), editorText().normalizedEditorText())
            commandOnEdt {
                val member = classNode.node.children.first { it.containmentLink?.name == "member" }
                member.delete()
            }
            awaitEditorText(
                """
                public class Class1 {

                }
                """,
            )
        }
}
