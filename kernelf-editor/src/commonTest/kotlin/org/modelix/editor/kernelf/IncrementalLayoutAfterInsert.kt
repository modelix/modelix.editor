package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.tests.N_AssertTestItem
import org.iets3.core.expr.tests.N_TestSuite
import org.modelix.editor.CaretSelection
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KnownKeys
import org.modelix.editor.firstLeaf
import org.modelix.editor.isVisible
import org.modelix.editor.layoutable
import org.modelix.editor.nextLeafs
import org.modelix.editor.resolveNodeCell
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.ModelData
import org.modelix.metamodel.descendants
import org.modelix.metamodel.ofType
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.PBranch
import org.modelix.model.area.getArea
import org.modelix.model.client.IdGenerator
import org.modelix.model.repositoryconcepts.N_Module
import org.modelix.model.repositoryconcepts.models
import org.modelix.model.repositoryconcepts.rootNodes
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals

open class IncrementalLayoutAfterInsert {
    lateinit var assertTestItem: N_AssertTestItem
    lateinit var editor: FrontendEditorComponent
    lateinit var branch: IBranch
    lateinit var testSuite: N_TestSuite

    @Test
    fun layoutAfterInsert() =
        runLayoutTest {
            editor.processKeyEvent(JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, KnownKeys.Enter))
            val incrementalText = editor.getRootCell().layout.toString()
            editor.clearLayoutCache()
            val nonIncrementalText = editor.getRootCell().layout.toString()
            assertEquals(nonIncrementalText, incrementalText)
        }

    private fun runLayoutTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            branch =
                PBranch(ModelFacade.newLocalTree(useRoleIds = false), IdGenerator.getInstance(56754)).withIncrementalComputationSupport()
            ModelData.fromJson(modelJson).load(branch)

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            testSuite =
                branch.computeRead {
                    branch
                        .getArea()
                        .getRoot()
                        .allChildren
                        .ofType<N_Module>()
                        .models.rootNodes
                        .ofType<N_TestSuite>()
                        .first()
                }
            editor =
                FrontendEditorComponent(TextEditorServiceImpl(engine, testSuite.untyped().asWritableNode().getModel(), backgroundScope))
            editor.editNode(testSuite.untypedReference())
            assertTestItem = branch.computeRead { testSuite.descendants<N_AssertTestItem>().drop(1).first() }
            editor.flushAndUpdateSelection {
                val cell =
                    editor
                        .resolveNodeCell(assertTestItem)!!
                        .firstLeaf()
                        .nextLeafs(true)
                        .first { it.isVisible() }
                println(cell.toString())
                CaretSelection(cell.layoutable()!!, 0)
            }
            body()
            KernelfLanguages.languages.forEach { it.unregister() }
        }
}
