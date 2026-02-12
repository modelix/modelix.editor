package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.base.C_MinusExpression
import org.iets3.core.expr.base.C_ParensExpression
import org.iets3.core.expr.base.C_PlusExpression
import org.iets3.core.expr.base.N_ParensExpression
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.simpleTypes.N_NumberLiteral
import org.modelix.editor.CaretSelection
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KeyLocation
import org.modelix.editor.Modifiers
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.layoutable
import org.modelix.editor.resolvePropertyCell
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.backend
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.setNew
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.ModelFacade
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class PropertyChangeTest {
    lateinit var numberLiteral: N_NumberLiteral
    lateinit var editor: FrontendEditorComponent
    lateinit var service: TextEditorServiceImpl

    private fun ICellTree.Cell.backend() = backend(service, editor)

    @Test
    fun propertyChange() =
        runPropertyTest {
            assertEquals("200", numberLiteral.value)
            editor.processKeyEvent(
                JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, "8", null, "8", Modifiers.NONE, KeyLocation.STANDARD, false, false)
            )
            assertEquals("8200", numberLiteral.value)
        }

    @Test
    fun substituteActions() =
        runPropertyTest {
            val parameters = CodeCompletionParameters(service.getEditorBackend(editor.editorId), "")
            val cell = editor.resolvePropertyCell(C_NumberLiteral.value, numberLiteral)!!
            val actions: List<ICodeCompletionAction> =
                cell
                    .backend()
                    .getSubstituteActions()
                    .flatMap {
                        it.flattenApplicableActions(parameters)
                    }.toList()
            actions.forEach { println(it.getCompletionPattern() + " | " + it.getDescription()) }
            assertTrue(actions.isNotEmpty())
        }

    private fun runPropertyTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            val branch = ModelFacade.toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false)).withIncrementalComputationSupport()
            val parensExpression =
                branch.computeWrite {
                    val parensExpression =
                        PArea(
                            branch
                        ).getRoot().addNewChild("root", -1, C_ParensExpression.untyped()).typed<N_ParensExpression>()
                    parensExpression.apply {
                        expr.setNew(C_PlusExpression) {
                            left.setNew(C_MinusExpression) {
                                left.setNew(C_NumberLiteral) {
                                    numberLiteral = this
                                    value = "200"
                                }
                                right.setNew(C_NumberLiteral) {
                                    value = "56"
                                }
                            }
                            right.setNew(C_NumberLiteral) {
                                value = "100"
                            }
                        }
                    }
                }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, parensExpression.untyped().asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(parensExpression.untypedReference())
            editor.flushAndUpdateSelection {
                val cell =
                    checkNotNull(editor.resolvePropertyCell(C_NumberLiteral.value, numberLiteral)) {
                        "Cell for property 'value' not found"
                    }
                val layoutable =
                    checkNotNull(cell.layoutable()) {
                        "Layoutable not found"
                    }
                CaretSelection(layoutable, 0)
            }
            body()
            KernelfLanguages.languages.forEach { it.unregister() }
        }
}
