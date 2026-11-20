package org.modelix.editor.ssr.mps

import com.intellij.openapi.diagnostic.debug
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.runBlocking
import org.modelix.editor.CaretSelection
import org.modelix.editor.ChildNodeCellReference
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KnownKeys
import org.modelix.editor.NodeCellReference
import org.modelix.editor.applyShadowing
import org.modelix.editor.descendantsAndSelf
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getMaxCaretPos
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.lastLeaf
import org.modelix.editor.layoutable
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.incremental.IncrementalEngine
import org.modelix.model.api.INode
import org.modelix.model.api.IWritableNode
import org.modelix.model.mpsadapters.MPSArea
import org.modelix.model.mpsadapters.MPSWritableNode

/**
 * Opens the class of the test project in an editor that uses the notations of baseLanguage, and offers the gestures
 * of a user typing into it.
 */
@Suppress("ktlint:standard:wrapping", "ktlint:standard:trailing-comma-on-call-site")
abstract class BaseLanguageTestBase : TestBase("SimpleProject") {
    lateinit var editor: FrontendEditorComponent
    lateinit var service: TextEditorServiceImpl
    lateinit var mpsIntegration: EditorIntegrationForMPS
    lateinit var editorEngine: EditorEngine
    lateinit var incrementalEngine: IncrementalEngine
    lateinit var classNode: MPSWritableNode
    lateinit var coroutineScope: CoroutineScope

    protected fun getBackend() = service.getAllEditorBackends().single()

    override fun setUp() {
        super.setUp()
        println("Running test " + getTestName(false))

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
            println(editor.getRootCell().layout.toString())
        }
    }

    override fun tearDown() {
        editor.dispose()
        mpsIntegration.dispose()
        editorEngine.dispose()
        incrementalEngine.dispose()
        super.tearDown()
    }

    protected fun ICellTree.Cell.backend() = service.getEditorBackend(editor.editorId).tree.getCell(getId())

    suspend fun assertFinalEditorText(expected: String) {
        assertEditorText(expected)

        // Reset all editor state to ensure the typed text triggered a model transformation.
        editor.resetState()
        assertEditorText(expected)
    }

    fun assertCaretPosition(cellTextWithCaret: String) {
        val selection = checkNotNull(editor.getSelection()) { "No active selection" }
        if (selection !is CaretSelection) error("Not a caret selection: $selection")
        assertEquals(cellTextWithCaret, selection.toString())
    }

    suspend fun assertEditorText(expected: String) {
        editor.flush()
        assertEquals(
            expected.normalizedEditorText(),
            editor
                .getRootCell()
                .layout
                .toString()
                .normalizedEditorText()
        )
    }

    suspend fun placeCaretAtEnd(node: INode) {
        val cell = editor.resolveCell(NodeCellReference(node.reference)).first()
        val lastLeafCell = cell.lastLeaf()
        editor.changeSelection(CaretSelection(lastLeafCell.layoutable()!!, lastLeafCell.getMaxCaretPos()))
    }

    protected fun childOf(
        node: IWritableNode,
        role: String,
    ) = readAction { node.getAllChildren().first { it.getContainmentLink().getSimpleName() == role } }

    protected val methodNode: IWritableNode get() = childOf(classNode, "member")

    protected val methodBodyNode: IWritableNode get() = childOf(methodNode, "body")

    /**
     * Puts the caret into the placeholder of an empty child link.
     *
     * It used to be reachable through [placeCaretIntoCellWithText] by its `<no [link]>` text, but a notation can
     * now say what an empty link renders as - the baseLanguage ones render nothing, like MPS - so the placeholder
     * is resolved through the cell reference it carries instead of through what it shows.
     */
    fun placeCaretIntoPlaceholderOf(
        node: IWritableNode,
        linkName: String,
    ) {
        val link = readAction { checkNotNull(node.tryGetConcept()).getAllChildLinks().first { it.getSimpleName() == linkName } }
        val cell =
            editor.resolveCell(ChildNodeCellReference(node.getNodeReference(), link.toReference())).firstOrNull()
                ?: throw NoSuchElementException("No placeholder cell for the empty $linkName of $node")
        editor.doChangeSelection(CaretSelection(cell.layoutable()!!, cell.getMaxCaretPos()))
    }

    fun placeCaretIntoCellWithText(
        text: String,
        position: Int = -1,
    ) {
        val cell = editor.getRootCell().descendantsAndSelf().firstOrNull { it.getVisibleText() == text }
        if (cell == null) {
            editor.getRootCell().descendantsAndSelf().forEach {
                println("$it: ${it.getVisibleText()}")
            }
            throw NoSuchElementException("Cell with text not found: $text")
        }
        editor.doChangeSelection(CaretSelection(cell.layoutable()!!, if (position == -1) cell.getMaxCaretPos() else position))
    }

    suspend fun pressEnter() = pressKey(KnownKeys.Enter)

    suspend fun pressKey(key: KnownKeys) {
        editor.processKeyEvent(JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, key))
    }

    suspend fun typeText(text: CharSequence) {
        for (c in text) {
            LOG.debug { "type: $c" }
            editor
                .enqueueUIEvent(
                    JSKeyboardEvent(
                        eventType = JSKeyboardEventType.KEYDOWN,
                        typedText = c.toString(),
                        knownKey = null,
                        rawKey = c.toString(),
                    ),
                ).await()
            editor.flushLocalLater().await()
        }
    }

    fun getCodeCompletionEntries(pattern: String): List<ICodeCompletionAction> =
        readAction {
            val selection = editor.getSelection() as CaretSelection
            val actionProviders: Sequence<ICodeCompletionActionProvider> =
                selection.layoutable.cell
                    .backend()
                    .getSubstituteActions()
            val actions = actionProviders.flatMap { it.flattenApplicableActions(CodeCompletionParameters(getBackend(), pattern)) }.toList()
            val matchingActions =
                actions.filter {
                    val matchingText = it.getCompletionPattern()
                    matchingText.isNotEmpty() && matchingText.startsWith(pattern)
                }
            val shadowedActions = matchingActions.applyShadowing()
            val sortedActions = shadowedActions.sortedBy { it.getCompletionPattern().lowercase() }
            sortedActions
        }
}
