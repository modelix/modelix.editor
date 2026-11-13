package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import kotlinx.html.stream.createHTML
import org.iets3.core.expr.adt.C_NameAnnotation
import org.iets3.core.expr.base.C_ParensExpression
import org.iets3.core.expr.doc.C_BookmarkAnnotation
import org.iets3.core.expr.doc.C_DotDotDot
import org.iets3.core.expr.lambda.C_AttachedConstraint
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.tests.C_OldNodeAnnotation
import org.modelix.editor.CaretSelection
import org.modelix.editor.Cell
import org.modelix.editor.CellSelection
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.ContextActionsAspect
import org.modelix.editor.ContextActionsMenu
import org.modelix.editor.EditorAspect
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.IContextActionsProvider
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KeyLocation
import org.modelix.editor.KnownKeys
import org.modelix.editor.Modifiers
import org.modelix.editor.NodeCellReference
import org.modelix.editor.NodeContextActions
import org.modelix.editor.descendants
import org.modelix.editor.layoutable
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.shared.ActionIcon
import org.modelix.editor.toHtml
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
import kotlin.test.assertIs
import kotlin.test.assertNotNull
import kotlin.test.assertNull
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

    @Test
    fun altEnterOffersTheAttributesOfTheSelectedNode() =
        runAttributeTest {
            openContextActions(cellWithText("200"))

            assertEquals(listOf(ADD_BOOKMARK, ADD_TODO, ADD_OLD_NODE), contextActions())
            assertEquals(emptyList(), attributeConcepts())
        }

    @Test
    fun enterExecutesTheSelectedContextAction() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            pressKey(KnownKeys.ArrowDown)
            pressKey(KnownKeys.Enter)

            assertEquals(listOf("DotDotDot"), attributeConcepts())
            assertEquals("(todo 200)", renderedText())
            assertNull(editor.getActionMenu())
        }

    @Test
    fun escapeClosesTheContextActionsMenu() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            pressKey(KnownKeys.Escape)

            assertNull(editor.getActionMenu())
            assertEquals(emptyList(), attributeConcepts())
        }

    @Test
    fun enterWithoutAltDoesNotOpenTheContextActionsMenu() =
        runAttributeTest {
            selectText(cellWithText("200"))
            pressKey(KnownKeys.Enter)

            assertNull(editor.getActionMenu())
        }

    @Test
    fun searchingUsesTheWholePatternWhereverTheCaretIs() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            typeIntoMenu("mark")
            pressKey(KnownKeys.ArrowLeft)

            assertEquals(listOf(ADD_BOOKMARK), contextActions())
        }

    @Test
    fun typingSearchesTheContextActionsAnywhereInTheirTextIgnoringTheCase() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            typeIntoMenu("MARK")

            assertEquals(listOf(ADD_BOOKMARK), contextActions())
        }

    @Test
    fun aContextActionIsNotExecutedBeforeItIsConfirmed() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            typeIntoMenu(ADD_BOOKMARK)

            assertEquals(emptyList(), attributeConcepts())
            pressKey(KnownKeys.Enter)
            assertEquals(listOf("BookmarkAnnotation"), attributeConcepts())
        }

    @Test
    fun narrowingTheContextActionsKeepsAnEntrySelected() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            pressKey(KnownKeys.ArrowUp) // wraps around to the last one
            typeIntoMenu("bookmark")
            pressKey(KnownKeys.Enter)

            assertEquals(listOf("BookmarkAnnotation"), attributeConcepts())
        }

    @Test
    fun anAttributeWithoutTextOfItsOwnCanBeAddedWithAContextAction() =
        runAttributeTest({ conceptEditor(C_NameAnnotation) { attributed() } }) {
            openContextActions(cellWithText("200"))
            typeIntoMenu(C_NameAnnotation.untyped().getShortName())
            pressKey(KnownKeys.Enter)

            assertEquals(listOf("NameAnnotation"), attributeConcepts())
            assertEquals("(200)", renderedText())
        }

    @Test
    fun aContextActionIsOnlyOfferedForAnAttributeThatCanBeAdded() =
        runAttributeTest {
            addAttribute(C_BookmarkAnnotation.untyped()) { it.setPropertyValue("label", "b1") }

            openContextActions(cellWithText("200"))

            assertEquals(listOf(ADD_TODO, ADD_OLD_NODE), contextActions())
        }

    @Test
    fun aContextActionAppliesToTheSelectedParentNode() =
        runAttributeTest {
            // OldNodeAnnotation can only be attached to a number literal.
            val parensCell = editor.resolveCell(NodeCellReference(parens.reference)).single()
            editor.doChangeSelection(CellSelection(editor, parensCell, true, null))
            pressKey(KnownKeys.Enter, Modifiers.ALT)
            assertEquals(listOf(ADD_BOOKMARK, ADD_TODO), contextActions())

            pressKey(KnownKeys.Enter)

            assertEquals(emptyList(), attributeConcepts())
            assertEquals(listOf("BookmarkAnnotation"), attributeConcepts(parens))
        }

    @Test
    fun anAttributeAddedOnTheNodeGoesInsideTheExistingOnes() =
        runAttributeTest {
            addAttribute(C_DotDotDot.untyped())

            openContextActions(cellWithText("200"))
            typeIntoMenu("bookmark")
            pressKey(KnownKeys.Enter)

            assertEquals(listOf("DotDotDot", "BookmarkAnnotation"), attributeConcepts())
        }

    @Test
    fun anAttributeAddedOnAnotherOneGoesOutsideOfIt() =
        runAttributeTest {
            addAttribute(C_DotDotDot.untyped())

            openContextActions(cellWithText("todo"))
            typeIntoMenu("bookmark")
            pressKey(KnownKeys.Enter)

            assertEquals(listOf("BookmarkAnnotation", "DotDotDot"), attributeConcepts())
        }

    @Test
    fun theActionsForNodeAttributesAreListedInTheirOwnGroup() =
        runAttributeTest {
            openContextActions(cellWithText("200"))

            assertEquals(listOf(NODE_ATTRIBUTES, NODE_ATTRIBUTES, NODE_ATTRIBUTES), contextActionGroups())
            assertEquals(List(3) { ActionIcon.NODE_ATTRIBUTE }, contextActionIcons())
            assertEquals(listOf(NODE_ATTRIBUTES), renderedGroupHeadings())
        }

    @Test
    fun aContextActionIsShownWithItsIconInsteadOfItsDescription() =
        runAttributeTest {
            openContextActions(cellWithText("200"))
            typeIntoMenu("bookmark")

            val html = renderedMenu()
            assertTrue(html.contains("""<div class="context-action-icon icon-node-attribute"></div>"""), html)
            assertTrue(!html.contains("context-action-description"), html)
            assertTrue(!html.contains("Attribute of"), html)
        }

    @Test
    fun contextActionsOfOtherProvidersAreOfferedWithTheirGroups() =
        runAttributeTest {
            val executedOn = mutableListOf<INode>()
            withContextActionsProvider({ node ->
                listOf(
                    TestContextAction("Zzz without group", null) { executedOn.add(node) },
                    TestContextAction("Refactor it", "Refactoring") { executedOn.add(node) },
                )
            }) {
                openContextActions(cellWithText("200"))

                // Without a group first, then the groups by name, like the sections of the MPS intentions menu.
                assertEquals(listOf("Zzz without group", ADD_BOOKMARK, ADD_TODO, ADD_OLD_NODE, "Refactor it"), contextActions())
                assertEquals(listOf(null, NODE_ATTRIBUTES, NODE_ATTRIBUTES, NODE_ATTRIBUTES, "Refactoring"), contextActionGroups())
                assertEquals(listOf(NODE_ATTRIBUTES, "Refactoring"), renderedGroupHeadings())

                typeIntoMenu("refactor")
                assertEquals(listOf("Refactoring"), renderedGroupHeadings())
                pressKey(KnownKeys.Enter)

                assertEquals(listOf(literal.reference), executedOn.map { it.reference })
                assertNull(editor.getActionMenu())
            }
        }

    @Test
    fun aFailingContextActionsProviderDoesNotHideTheOtherActions() =
        runAttributeTest {
            withContextActionsProvider({ error("provider failed") }) {
                openContextActions(cellWithText("200"))

                assertEquals(listOf(ADD_BOOKMARK, ADD_TODO, ADD_OLD_NODE), contextActions())
            }
        }

    private suspend fun withContextActionsProvider(
        actions: (INode) -> List<IActionOrProvider>,
        body: suspend () -> Unit,
    ) {
        val provider =
            object : IContextActionsProvider {
                override fun getContextActions(
                    node: INode,
                    parameters: CodeCompletionParameters,
                ): List<IActionOrProvider> = actions(node)
            }
        ContextActionsAspect.providers.add(provider)
        try {
            body()
        } finally {
            ContextActionsAspect.providers.remove(provider)
        }
    }

    private class TestContextAction(
        private val text: String,
        private val group: String?,
        private val onExecute: () -> Unit,
    ) : ICodeCompletionAction {
        override fun getMatchingText(): String = text

        override fun getDescription(): String = ""

        override fun getGroup(): String? = group

        override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? {
            onExecute()
            return null
        }
    }

    private suspend fun selectText(cell: Cell) {
        editor.flushAndUpdateSelection { CaretSelection(editor, cell.layoutable()!!, 0) }
        editor.flush()
    }

    private suspend fun openContextActions(cell: Cell) {
        selectText(cell)
        pressKey(KnownKeys.Enter, Modifiers.ALT)
    }

    private suspend fun pressKey(
        key: KnownKeys,
        modifiers: Modifiers = Modifiers.NONE,
    ) {
        editor.processKeyEvent(
            JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, null, key, key.name, modifiers, KeyLocation.STANDARD, false, false),
        )
        editor.flush()
    }

    private suspend fun typeIntoMenu(text: String) {
        for (c in text) {
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
    }

    private fun contextActions(): List<String> =
        assertIs<ContextActionsMenu>(editor.getActionMenu(), "The context actions menu is not open")
            .getVisibleEntries()
            .map { it.matchingText }

    private fun contextActionGroups(): List<String?> =
        assertIs<ContextActionsMenu>(editor.getActionMenu(), "The context actions menu is not open")
            .getVisibleEntries()
            .map { it.group }

    private fun contextActionIcons(): List<ActionIcon?> =
        assertIs<ContextActionsMenu>(editor.getActionMenu(), "The context actions menu is not open")
            .getVisibleEntries()
            .map { it.icon }

    private fun renderedMenu(): String =
        assertIs<ContextActionsMenu>(editor.getActionMenu(), "The context actions menu is not open")
            .toHtml(createHTML(prettyPrint = false))

    private fun renderedGroupHeadings(): List<String> {
        val html = renderedMenu()
        return Regex("""<div class="context-actions-group">([^<]*)</div>""").findAll(html).map { it.groupValues[1] }.toList()
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

    private fun attributeConcepts(node: INode = literal): List<String> =
        branch.computeRead { node.getChildren("smodelAttribute").map { it.concept!!.getShortName() }.toList() }

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

    private companion object {
        const val ADD_BOOKMARK = "Add BookmarkAnnotation"
        const val ADD_TODO = "Add DotDotDot"
        const val ADD_OLD_NODE = "Add OldNodeAnnotation"
        const val NODE_ATTRIBUTES = NodeContextActions.NODE_ATTRIBUTES_GROUP
    }
}
