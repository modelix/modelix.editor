package org.modelix.editor

import org.modelix.editor.text.frontend.FrontendCellTree
import org.modelix.editor.text.frontend.layout
import kotlin.test.Test
import kotlin.test.assertEquals

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
