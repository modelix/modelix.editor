package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.adt.C_NameAnnotation
import org.iets3.core.expr.base.C_ParensExpression
import org.iets3.core.expr.doc.C_BookmarkAnnotation
import org.iets3.core.expr.doc.C_DotDotDot
import org.iets3.core.expr.lambda.C_AttachedConstraint
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.tests.C_OldNodeAnnotation
import org.modelix.editor.CaretSelection
import org.modelix.editor.Cell
import org.modelix.editor.EditorAspect
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KeyLocation
import org.modelix.editor.Modifiers
import org.modelix.editor.descendants
import org.modelix.editor.layoutable
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.untyped
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Node attributes wrap the cell of the node they are attached to. The notation of an attribute says where that node
 * goes with an `attributed` cell, and it is also how the attribute is added: typing the text in front of the
 * `attributed` cell in front of the node, or the text behind it behind the node.
 */
class NodeAttributeTest {
    private lateinit var literal: INode
    private lateinit var parens: INode
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl
    private lateinit var branch: IBranch

    @Test
    fun anAttributeWrapsTheNodeItIsAttachedTo() =
        runAttributeTest {
            addAttribute(C_BookmarkAnnotation.untyped()) { it.setPropertyValue("label", "b1") }

            assertEquals("(bookmark b1 200)", renderedText())
        }

    @Test
    fun theFirstAttributeIsTheOutermost() =
        runAttributeTest {
            addAttribute(C_BookmarkAnnotation.untyped()) { it.setPropertyValue("label", "b1") }
            addAttribute(C_DotDotDot.untyped())

            assertEquals("(bookmark b1 todo 200)", renderedText())
        }

    @Test
    fun anAttributeCanWriteSomethingBehindTheNode() =
        runAttributeTest {
            addAttribute(C_OldNodeAnnotation.untyped())
            addAttribute(C_DotDotDot.untyped())

            assertEquals("(todo 200 !!)", renderedText())
        }

    @Test
    fun anAttributeWhoseNotationHasNoAttributedCellIsNotRendered() =
        runAttributeTest({ conceptEditor(C_NameAnnotation) { "name".constant() } }) {
            // Rendering it would hide the node it is attached to.
            addAttribute(C_NameAnnotation.untyped())

            assertEquals("(200)", renderedText())
        }

    @Test
    fun anAttributeWithoutANotationIsRenderedReflectivelyAroundTheNode() =
        runAttributeTest {
            addAttribute(C_AttachedConstraint.untyped())

            val text = renderedText()
            assertTrue(text.contains("attributed node:"), text)
            assertTrue(text.contains("200"), text)
        }

    @Test
    fun removingAnAttributeUnwrapsTheNode() =
        runAttributeTest {
            val attribute = addAttribute(C_BookmarkAnnotation.untyped()) { it.setPropertyValue("label", "b1") }
            branch.runWrite { literal.removeChild(attribute) }
            editor.flushAndUpdateSelection { null }

            assertEquals("(200)", renderedText())
        }

    @Test
    fun typingTheNotationInFrontOfANodeAddsTheAttribute() =
        runAttributeTest {
            typeBefore(cellWithText("200"), "bookmark")

            assertEquals(listOf("BookmarkAnnotation"), attributeConcepts())
            assertEquals("(bookmark <no label> 200)", renderedText())
        }

    @Test
    fun typingTheNotationKeyByKeyAddsTheAttribute() =
        runAttributeTest {
            // As in the browser: the first key opens the completion menu of the left transform, the others extend
            // its pattern until the single entry matches exactly.
            editor.flushAndUpdateSelection { CaretSelection(editor, cellWithText("200").layoutable()!!, 0) }
            editor.flush()
            for (c in "bookmark") {
                editor.processKeyEvent(
                    JSKeyboardEvent(
                        JSKeyboardEventType.KEYDOWN,
                        c.toString(),
                        null,
                        c.toString(),
                        Modifiers.NONE,
                        KeyLocation.STANDARD,
                        false,
                        false
                    ),
                )
                editor.flush()
            }

            assertEquals(listOf("BookmarkAnnotation"), attributeConcepts())
        }

    @Test
    fun typingTheNotationBehindANodeAddsTheAttribute() =
        runAttributeTest {
            typeAfter(cellWithText("200"), "!!")

            assertEquals(listOf("OldNodeAnnotation"), attributeConcepts())
        }

    @Test
    fun anAttributeTypedInFrontOfAnotherOneGoesOutsideOfIt() =
        runAttributeTest {
            addAttribute(C_DotDotDot.untyped())

            typeBefore(cellWithText("todo"), "bookmark")

            assertEquals(listOf("BookmarkAnnotation", "DotDotDot"), attributeConcepts())
        }

    @Test
    fun anAttributeTypedInFrontOfTheNodeGoesInsideTheExistingOnes() =
        runAttributeTest {
            addAttribute(C_DotDotDot.untyped())

            typeBefore(cellWithText("200"), "bookmark")

            assertEquals(listOf("DotDotDot", "BookmarkAnnotation"), attributeConcepts())
        }

    @Test
    fun anAttributeThatCannotBeRepeatedIsNotOfferedTwice() =
        runAttributeTest {
            addAttribute(C_BookmarkAnnotation.untyped()) { it.setPropertyValue("label", "b1") }

            typeBefore(cellWithText("200"), "bookmark")

            assertEquals(listOf("BookmarkAnnotation"), attributeConcepts())
        }

    @Test
    fun anAttributeIsOnlyOfferedForTheConceptsItCanBeAttachedTo() =
        runAttributeTest({
            conceptEditor(C_NameAnnotation) {
                attributed { attributedConcept(C_ParensExpression.untyped()) }
                "??".constant()
            }
        }) {
            typeAfter(cellWithText("200"), "??")

            assertEquals(emptyList(), attributeConcepts())
        }

    @Test
    fun deletingTheTextOfAnAttributeRemovesTheAttributeButNotTheNode() =
        runAttributeTest {
            addAttribute(C_BookmarkAnnotation.untyped()) { it.setPropertyValue("label", "b1") }

            editor.enqueueUpdate(service.executeDelete(editor.editorId, cellWithText("bookmark").getId())).await()
            editor.flushAndUpdateSelection { null }

            assertEquals(emptyList(), attributeConcepts())
            branch.computeRead { assertEquals(listOf(literal), parens.getChildren("expr").toList()) }
            assertEquals("(200)", renderedText())
        }

    private suspend fun addAttribute(
        concept: IConcept,
        init: (INode) -> Unit = {},
    ): INode {
        val attribute = branch.computeWrite { literal.addNewChild("smodelAttribute", -1, concept).also(init) }
        editor.flushAndUpdateSelection { null }
        return attribute
    }

    private suspend fun typeBefore(
        cell: Cell,
        text: String,
    ) {
        editor.enqueueUpdate(service.processTypedText(editor.editorId, cell.getId(), 0, -1, text)).await()
        editor.flushAndUpdateSelection { null }
    }

    private suspend fun typeAfter(
        cell: Cell,
        text: String,
    ) {
        val length = cell.getVisibleText()!!.length
        editor.enqueueUpdate(service.processTypedText(editor.editorId, cell.getId(), length, length - 1, text)).await()
        editor.flushAndUpdateSelection { null }
    }

    private fun attributeConcepts(): List<String> =
        branch.computeRead { literal.getChildren("smodelAttribute").map { it.concept!!.getShortName() }.toList() }

    private fun cellWithText(text: String): Cell =
        assertNotNull(
            editor.getRootCell().descendants().firstOrNull { it.getVisibleText() == text },
            "No cell '$text' in ${renderedText()}"
        )

    private fun renderedText(): String =
        editor
            .getRootCell()
            .layout
            .toString()
            .trim()

    private fun runAttributeTest(
        extraNotations: EditorAspect.() -> Unit = {},
        body: suspend () -> Unit,
    ) = runTest {
        KernelfLanguages.registerAll()
        branch =
            ModelFacade
                .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                .withIncrementalComputationSupport()
        branch.runWrite {
            parens = PArea(branch).getRoot().addNewChild("root", -1, C_ParensExpression.untyped())
            literal = parens.addNewChild("expr", -1, C_NumberLiteral.untyped())
            literal.setPropertyValue("value", "200")
        }

        val engine = EditorEngine(IncrementalEngine())
        KernelfEditor.register(engine)
        attributeNotations().apply(extraNotations).register(engine)
        service = TextEditorServiceImpl(engine, parens.asWritableNode().getModel(), backgroundScope)
        editor = FrontendEditorComponent(service)
        editor.editNode(parens.reference)
        editor.flushAndUpdateSelection { null }
        try {
            body()
        } finally {
            editor.dispose()
            service.dispose()
            KernelfLanguages.languages.forEach { it.unregister() }
        }
    }

    private fun attributeNotations() =
        EditorAspect().apply {
            conceptEditor(C_BookmarkAnnotation) {
                "bookmark".constant()
                concept.label.cell()
                attributed()
            }
            conceptEditor(C_DotDotDot) {
                "todo".constant()
                attributed { multiple(true) }
            }
            conceptEditor(C_OldNodeAnnotation) {
                attributed { attributedConcept(C_NumberLiteral.untyped()) }
                "!!".constant()
            }
        }
}
