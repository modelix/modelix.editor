package org.modelix.editor

import org.modelix.editor.text.frontend.FrontendCellTree
import org.modelix.editor.text.frontend.layout
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotSame
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * Verifies that check messages are aggregated into the gutter of the line where the message-bearing cell's content
 * begins, including cells that render no text of their own (see [LayoutableGutterMarker]).
 */
class GutterLayoutTest {
    private val newLine = EditorTestUtils.newLine
    private val indentChildren = EditorTestUtils.indentChildren

    @Test
    fun markerDoesNotChangeIndentationOrText() {
        fun render(withMessage: Boolean): String {
            val tree = FrontendCellTree()
            val wrapper = EditorTestUtils.buildCells(listOf("b"), tree)
            if (withMessage) wrapper.setProperty(CommonCellProperties.errorMessage, "b error")
            val root =
                EditorTestUtils.buildCells(
                    listOf("{", newLine, listOf(indentChildren, wrapper, newLine, "c"), newLine, "}"),
                    tree,
                )
            return root.layout.toString()
        }

        // The invisible marker must not shift the text or its indentation.
        assertEquals("{\n  b\n  c\n}", render(false))
        assertEquals(render(false), render(true))
    }

    @Test
    fun messageOnTextCellShowsInGutter() {
        val tree = FrontendCellTree()
        val cell = EditorTestUtils.buildCells("literal", tree)
        cell.setProperty(CommonCellProperties.errorMessage, "boom")

        val line = cell.layout.lines.single()
        assertEquals(setOf("boom"), line.getGutterState().errors)
    }

    @Test
    fun messageOnAncestorUnderlinesDescendantAndInvalidatesItsLayout() {
        val tree = FrontendCellTree()
        val wrapper = EditorTestUtils.buildCells(listOf("inner"), tree)

        val innerBefore =
            wrapper.layout.lines
                .single()
                .words
                .filterIsInstance<LayoutableCell>()
                .single()
        assertNull(innerBefore.cell.effectiveMessage(CommonCellProperties.errorMessage))

        wrapper.setProperty(CommonCellProperties.errorMessage, "boom")

        val innerAfter =
            wrapper.layout.lines
                .single()
                .words
                .filterIsInstance<LayoutableCell>()
                .single()
        // The message on the wrapper must invalidate the child's cached layout, so its line re-renders with a new
        // layoutable and can pick up the inherited underline while rendering.
        assertNotSame(innerBefore, innerAfter)
        assertEquals("boom", innerAfter.cell.effectiveMessage(CommonCellProperties.errorMessage))
    }

    @Test
    fun spaceBetweenTwoErroredCellsIsUnderlined() {
        val tree = FrontendCellTree()
        val a = EditorTestUtils.buildCells("a", tree)
        val b = EditorTestUtils.buildCells("b", tree)
        a.setProperty(CommonCellProperties.errorMessage, "e")
        b.setProperty(CommonCellProperties.errorMessage, "e")
        val root = EditorTestUtils.buildCells(listOf(a, b), tree)

        val line = root.layout.lines.single()
        val space = line.words.first { it is LayoutableSpace }
        assertTrue(line.isUnderlinedError(space), "space inside the errored range should be underlined")
    }

    @Test
    fun spaceNextToOnlyOneErroredCellIsNotUnderlined() {
        val tree = FrontendCellTree()
        val a = EditorTestUtils.buildCells("a", tree)
        val b = EditorTestUtils.buildCells("b", tree)
        a.setProperty(CommonCellProperties.errorMessage, "e")
        // b has no message
        val root = EditorTestUtils.buildCells(listOf(a, b), tree)

        val line = root.layout.lines.single()
        val space = line.words.first { it is LayoutableSpace }
        assertFalse(line.isUnderlinedError(space), "space at the edge of the range should not be underlined")
    }

    @Test
    fun messageOnTextlessWrapperShowsInGutter() {
        val tree = FrontendCellTree()
        // A wrapper collection that only delegates to a child has no text cell of its own.
        val wrapper = EditorTestUtils.buildCells(listOf("inner"), tree)
        wrapper.setProperty(CommonCellProperties.warningMessage, "wrapper warning")

        val text = wrapper.layout
        val line = text.lines.single()
        assertEquals(setOf("wrapper warning"), line.getGutterState().warnings)
        assertEquals(emptySet(), line.getGutterState().errors)
        // The invisible marker must not change the rendered text or its spacing.
        assertEquals("inner", text.toString())
    }

    @Test
    fun messageOnWrapperLandsOnTheLineWhereItsContentBegins() {
        val tree = FrontendCellTree()
        val wrapper = EditorTestUtils.buildCells(listOf("b"), tree)
        wrapper.setProperty(CommonCellProperties.errorMessage, "b error")
        val root = EditorTestUtils.buildCells(listOf("a", newLine, wrapper), tree)

        val text = root.layout
        assertEquals("a\nb", text.toString())
        val lines = text.lines.toList()
        assertEquals(emptySet(), lines[0].getGutterState().errors)
        assertEquals(setOf("b error"), lines[1].getGutterState().errors)
    }

    @Test
    fun markerDoesNotSwallowSpaceBetweenWords() {
        val tree = FrontendCellTree()
        // "a" followed by a wrapper (with a message) delegating to "b": the space between a and b must remain.
        val wrapper = EditorTestUtils.buildCells(listOf("b"), tree)
        wrapper.setProperty(CommonCellProperties.errorMessage, "b error")
        val root = EditorTestUtils.buildCells(listOf("a", wrapper), tree)

        val text = root.layout
        assertEquals("a b", text.toString())
        assertEquals(
            setOf("b error"),
            text.lines
                .single()
                .getGutterState()
                .errors
        )
    }
}
