package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.base.C_ParensExpression
import org.iets3.core.expr.base.C_PlusExpression
import org.iets3.core.expr.base.N_ParensExpression
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.simpleTypes.N_NumberLiteral
import org.modelix.checks.CheckMessage
import org.modelix.checks.CheckMessageTarget
import org.modelix.checks.CheckSeverity
import org.modelix.checks.IModelChecker
import org.modelix.checks.ModelCheckAspect
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.resolvePropertyCell
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.setNew
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.ModelFacade
import org.modelix.model.api.INode
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class CheckMessagesTest {
    @Test
    fun checkMessagesAreShownOnCells() =
        runTest {
            KernelfLanguages.registerAll()
            lateinit var numberLiteral: N_NumberLiteral
            lateinit var otherNumberLiteral: N_NumberLiteral
            val branch = ModelFacade.toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false)).withIncrementalComputationSupport()
            val parensExpression =
                branch.computeWrite {
                    PArea(branch)
                        .getRoot()
                        .addNewChild("root", -1, C_ParensExpression.untyped())
                        .typed<N_ParensExpression>()
                        .apply {
                            expr.setNew(C_PlusExpression) {
                                left.setNew(C_NumberLiteral) {
                                    numberLiteral = this
                                    value = "200"
                                }
                                right.setNew(C_NumberLiteral) {
                                    otherNumberLiteral = this
                                    value = "100"
                                }
                            }
                        }
                }

            val checker =
                object : IModelChecker {
                    override fun getMessages(
                        engine: IIncrementalEngine,
                        node: INode,
                    ): List<CheckMessage> =
                        if (node.reference == numberLiteral.untypedReference()) {
                            listOf(
                                CheckMessage("whole node error", CheckSeverity.ERROR, CheckMessageTarget.WholeNode),
                                CheckMessage("property warning", CheckSeverity.WARNING, CheckMessageTarget.PropertyTarget("value")),
                            )
                        } else {
                            emptyList()
                        }
                }
            ModelCheckAspect.checkers.add(checker)
            try {
                val engine = EditorEngine(IncrementalEngine())
                KernelfEditor.register(engine)
                val service = TextEditorServiceImpl(engine, parensExpression.untyped().asWritableNode().getModel(), backgroundScope)
                val editor = FrontendEditorComponent(service)
                editor.editNode(parensExpression.untypedReference())
                editor.flush()

                val cellWithMessages =
                    checkNotNull(editor.resolvePropertyCell(C_NumberLiteral.value, numberLiteral)) {
                        "Cell for property 'value' not found"
                    }
                assertEquals("whole node error", cellWithMessages.getProperty(CommonCellProperties.errorMessage))
                assertEquals("property warning", cellWithMessages.getProperty(CommonCellProperties.warningMessage))

                val cellWithoutMessages =
                    checkNotNull(editor.resolvePropertyCell(C_NumberLiteral.value, otherNumberLiteral)) {
                        "Cell for property 'value' not found"
                    }
                assertEquals(null, cellWithoutMessages.getProperty(CommonCellProperties.errorMessage))
                assertEquals(null, cellWithoutMessages.getProperty(CommonCellProperties.warningMessage))
            } finally {
                ModelCheckAspect.checkers.remove(checker)
                KernelfLanguages.languages.forEach { it.unregister() }
            }
        }

    @Test
    fun checkerFailureIsShownAsError() =
        runTest {
            KernelfLanguages.registerAll()
            lateinit var numberLiteral: N_NumberLiteral
            val branch = ModelFacade.toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false)).withIncrementalComputationSupport()
            val parensExpression =
                branch.computeWrite {
                    PArea(branch)
                        .getRoot()
                        .addNewChild("root", -1, C_ParensExpression.untyped())
                        .typed<N_ParensExpression>()
                        .apply {
                            expr.setNew(C_NumberLiteral) {
                                numberLiteral = this
                                value = "200"
                            }
                        }
                }

            val checker =
                object : IModelChecker {
                    override fun getMessages(
                        engine: IIncrementalEngine,
                        node: INode,
                    ): List<CheckMessage> = error("checker is broken")
                }
            ModelCheckAspect.checkers.add(checker)
            try {
                val engine = EditorEngine(IncrementalEngine())
                KernelfEditor.register(engine)
                val service = TextEditorServiceImpl(engine, parensExpression.untyped().asWritableNode().getModel(), backgroundScope)
                val editor = FrontendEditorComponent(service)
                editor.editNode(parensExpression.untypedReference())
                editor.flush()

                val cell =
                    checkNotNull(editor.resolvePropertyCell(C_NumberLiteral.value, numberLiteral)) {
                        "Cell for property 'value' not found"
                    }
                val errorMessage = cell.getProperty(CommonCellProperties.errorMessage)
                assertTrue(
                    errorMessage?.contains("Model checker failed") == true &&
                        errorMessage.contains("checker is broken"),
                    "Unexpected error message: $errorMessage",
                )
            } finally {
                ModelCheckAspect.checkers.remove(checker)
                KernelfLanguages.languages.forEach { it.unregister() }
            }
        }
}
