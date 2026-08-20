package org.modelix.editor

import org.modelix.editor.text.frontend.FrontendCellTree
import org.modelix.editor.text.frontend.layout
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

/**
 * The font style properties are inheriting, so they are set on the collection cell here and are expected to reach
 * the text cell inside it, which is the only cell that renders them.
 */
class FontStylePropertiesTest {
    private fun renderTextCell(configure: IMutableCellTree.MutableCell.() -> Unit): IVirtualDom.HTMLElement {
        val tree = FrontendCellTree()
        val root = EditorTestUtils.buildCells(listOf("keyword"), tree)
        root.configure()
        val html = root.layout.toHtml(IVirtualDom.newInstance().create())
        return html
            .descendants(includeSelf = true)
            .filterIsInstance<IVirtualDom.HTMLElement>()
            .single { it.getClasses().contains("text-cell") }
    }

    @Test
    fun familySizeWeightAndSlantBecomeInlineCss() {
        val cell =
            renderTextCell {
                setProperty(CommonCellProperties.fontFamily, "Fira Code, monospace")
                setProperty(CommonCellProperties.fontSize, "12px")
                setProperty(CommonCellProperties.bold, true)
                setProperty(CommonCellProperties.italic, true)
            }

        assertEquals(
            "font-family: Fira Code, monospace;font-size: 12px;font-weight: bold;font-style: italic",
            cell.getAttribute("style"),
        )
    }

    @Test
    fun noFontStyleLeavesTheCellUnstyled() {
        val cell = renderTextCell { }

        assertNull(cell.getAttribute("style"))
    }

    @Test
    fun decorationsGoOnANestedSpanSoACheckMessageCanUnderlineTheCellItself() {
        val cell =
            renderTextCell {
                setProperty(CommonCellProperties.underlined, true)
                setProperty(CommonCellProperties.strikeOut, true)
            }

        // The decoration must not land on the text cell itself: the has-error/has-warning classes own its
        // text-decoration, and a single declaration cannot carry two line styles.
        assertNull(cell.getAttribute("style"))
        val inner = cell.childNodes.single() as IVirtualDom.HTMLElement
        assertEquals("text-decoration-line: underline line-through", inner.getAttribute("style"))
        assertEquals("keyword", inner.innerText())
    }

    @Test
    fun strikeOutAlone() {
        val cell = renderTextCell { setProperty(CommonCellProperties.strikeOut, true) }

        val inner = cell.childNodes.single() as IVirtualDom.HTMLElement
        assertEquals("text-decoration-line: line-through", inner.getAttribute("style"))
    }
}
