package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.toplevel.C_Constant
import org.iets3.core.expr.toplevel.C_ConstantRef
import org.iets3.core.expr.toplevel.C_Library
import org.iets3.core.expr.toplevel.N_Constant
import org.iets3.core.expr.toplevel.N_ConstantRef
import org.iets3.core.expr.toplevel.N_Library
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.INodeConverter
import org.modelix.editor.ReferenceCellTemplateBuilder
import org.modelix.editor.celltemplate.ReferenceCellTemplate
import org.modelix.editor.resolveReferenceCell
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.setNew
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.model.api.meta.NullConcept
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

/**
 * What a reference cell writes for its target, and what it writes when it has nothing to write.
 *
 * The presentation of the target defaults to its name, so the notation of `ConstantRef` is just
 * `concept.constant.cell()` - the answer that is meant in nearly every notation is not spelled out in any of them.
 *
 * The two ways of having no text are kept apart: `<no constant>` means the reference has no target at all, while
 * `<unnamed constant>` means it has one that renders as nothing. Both used to show `<no constant>`, so a reference
 * that was never set looked exactly like one pointing at a constant whose name is still empty.
 */
class ReferenceCellPresentationTest {
    private lateinit var branch: IBranch
    private lateinit var constant: N_Constant
    private lateinit var constantRef: N_ConstantRef
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl

    @Test
    fun theTargetIsWrittenAsItsNameWithoutTheNotationSayingSo() =
        runReferenceTest {
            assertEquals("answer", referenceText())
        }

    @Test
    fun theNameIsReadPerRendering() =
        runReferenceTest {
            rename("theAnswer")

            assertEquals("theAnswer", referenceText())
        }

    @Test
    fun aReferenceWithoutATargetSaysThatItHasNone() =
        runReferenceTest {
            clearTarget()

            assertEquals("<no constant>", referenceText())
        }

    @Test
    fun aTargetThatRendersAsNothingIsNotMistakenForAMissingOne() =
        runReferenceTest {
            rename("")

            assertEquals("<unnamed constant>", referenceText())
        }

    /**
     * The `presentation` builder method - which used to be a `TODO` - changes how the target is written from
     * inside the body block, the same thing the `cell(presentation = ...)` argument does.
     */
    @Test
    fun theBuilderCanOverrideHowTheTargetIsWritten() =
        runReferenceTest {
            val template =
                buildReferenceTemplate {
                    presentation { it.getPropertyValue(IProperty.fromName("name"))?.uppercase() }
                }

            assertEquals("ANSWER", template.presentation(constant.untyped()))
        }

    /**
     * The context-dependent presentation is the escape hatch for the rare concept whose text depends on where it
     * is referenced from (a nested class, a constructor - see `NodePresentationUtil`). It sees both nodes; the
     * common `presentation` sees only the target.
     */
    @Test
    fun theBuilderCanWriteTheTargetFromItsReferencingContext() =
        runReferenceTest {
            val template =
                buildReferenceTemplate {
                    presentationWithContext { referenceNode, targetNode ->
                        referenceNode.concept?.getShortName() + " -> " + targetNode.getPropertyValue(IProperty.fromName("name"))
                    }
                }

            assertEquals(
                "ConstantRef -> answer",
                template.presentationWithContext!!(constantRef.untyped(), constant.untyped()),
            )
        }

    /**
     * A presentation that throws does not bring the editor down: it is logged and treated as no text, the same as
     * the `cell` builder's own presentation.
     */
    @Test
    fun aPresentationThatThrowsIsSwallowed() =
        runReferenceTest {
            val template =
                buildReferenceTemplate {
                    presentation { error("boom") }
                }

            assertNull(template.presentation(constant.untyped()))
        }

    /**
     * A bare reference cell template on the `constant` link, wired by [body] the way the notation's body block would.
     */
    private fun buildReferenceTemplate(body: ReferenceCellTemplateBuilder<INode, IConcept, INode>.() -> Unit): ReferenceCellTemplate {
        val link = C_ConstantRef.constant.untyped()
        val template = ReferenceCellTemplate(NullConcept, link) { getPropertyValue(IProperty.fromName("name")) }
        ReferenceCellTemplateBuilder(template, link, NullConcept as IConcept, INodeConverter.Untyped, INodeConverter.Untyped)
            .also(body)
        return template
    }

    private fun referenceText(): String? = editor.resolveReferenceCell(C_ConstantRef.constant, constantRef)?.getVisibleText()

    private suspend fun rename(newName: String) {
        branch.runWrite { constant.name = newName }
        editor.flushAndUpdateSelection { null }
    }

    private suspend fun clearTarget() {
        branch.runWrite { constantRef.untyped().removeReference(C_ConstantRef.constant.untyped()) }
        editor.flushAndUpdateSelection { null }
    }

    /**
     * Builds a library with a constant `answer` and a constant `alias` whose value is a reference to `answer`, opens
     * an editor on it and runs [body].
     */
    private fun runReferenceTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            branch =
                ModelFacade
                    .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                    .withIncrementalComputationSupport()
            val library =
                branch.computeWrite {
                    val library = PArea(branch).getRoot().addNewChild("root", -1, C_Library.untyped()).typed<N_Library>()
                    constant =
                        library.contents.addNew(C_Constant).apply {
                            name = "answer"
                            value.setNew(C_NumberLiteral) { value = "42" }
                        }
                    library.contents.addNew(C_Constant).apply {
                        name = "alias"
                        constantRef = value.setNew(C_ConstantRef) { constant = this@ReferenceCellPresentationTest.constant }
                    }
                    library
                }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, library.untyped().asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(library.untypedReference())
            editor.flushAndUpdateSelection { null }
            try {
                body()
            } finally {
                editor.dispose()
                service.dispose()
                KernelfLanguages.languages.forEach { it.unregister() }
            }
        }
}
