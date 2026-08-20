package org.modelix.editor

import org.modelix.editor.text.frontend.FrontendCellTree
import kotlin.test.Test
import kotlin.test.assertEquals

class CellPropertyInheritanceTest {
    @Test
    fun inheritedFromTheClosestAncestorThatSetsIt() {
        val tree = FrontendCellTree()
        val root = EditorTestUtils.buildCells(listOf(listOf("a", "b")), tree)
        val collection = root.getChildren().single()
        val text = collection.getChildren().first()

        root.setProperty(CommonCellProperties.textColor, "#00428c")
        assertEquals("#00428c", text.getProperty(CommonCellProperties.textColor))

        collection.setProperty(CommonCellProperties.textColor, "#8c8c8c")
        assertEquals("#8c8c8c", text.getProperty(CommonCellProperties.textColor))
    }

    @Test
    fun unsetInheritedPropertyFallsBackToTheDefault() {
        val tree = FrontendCellTree()
        val root = EditorTestUtils.buildCells(listOf("a"), tree)

        assertEquals(null, root.getChildren().single().getProperty(CommonCellProperties.textColor))
    }

    @Test
    fun nonInheritedPropertyStaysOnItsOwnCell() {
        val tree = FrontendCellTree()
        val root = EditorTestUtils.buildCells(listOf("a"), tree)

        root.setProperty(CommonCellProperties.noSpace, true)
        assertEquals(false, root.getChildren().single().getProperty(CommonCellProperties.noSpace))
    }
}
