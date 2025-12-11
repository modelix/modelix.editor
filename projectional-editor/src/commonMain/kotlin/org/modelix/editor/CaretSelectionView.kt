package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.classes
import kotlinx.html.div
import kotlinx.html.style
import org.modelix.editor.text.frontend.getVisibleText
import kotlin.math.max
import kotlin.math.min

class CaretSelectionView(selection: CaretSelection, val editor: FrontendEditorComponent) : SelectionView<CaretSelection>(selection) {

    private fun hasRange() = selection.start != selection.end

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("caret-selection") {
            style = "position: absolute"
            if (hasRange()) {
                div("selected-word") {
                    style = "position: absolute; background-color:hsla(196, 67%, 45%, 0.3)"
                }
            }
            div("caret own") {
                style = "position: absolute"
                val textLength = selection.layoutable.cell.getVisibleText()?.length ?: 0
                if (textLength == 0) {
                    // A typical case is a StringLiteral editor for an empty string.
                    // There is no space around the empty text cell.
                    // 'leftend' or 'rightend' styles would look like the caret is set into one of the '"' cells.
                } else if (selection.end == 0) {
                    classes += "leftend"
                } else if (selection.end == textLength) {
                    classes += "rightend"
                }
            }
        }
    }

    override fun update() {
        val textDom = editor.generatedHtmlMap.getOutput(selection.layoutable) ?: return
        val mainLayerBounds = editor.getMainLayer()?.getOuterBounds() ?: Bounds.ZERO
        val textBoundsUtil = TextBoundsUtil(textDom)
        val selectionDom = editor.generatedHtmlMap.getOutput(this) ?: return
        val selectionBounds = textBoundsUtil.getTextBounds().expanded(1.0)
        selectionDom.setBounds(selectionBounds.relativeTo(mainLayerBounds))
        val caretDom = selectionDom.childNodes.filterIsInstance<IVirtualDom.HTMLElement>().lastOrNull() ?: return
        updateCaretBounds(textDom, selection.end, selectionBounds, caretDom)

        if (hasRange()) {
            val rangeDom = selectionDom.childNodes.filterIsInstance<IVirtualDom.HTMLElement>().firstOrNull() ?: return
            val minPos = min(selection.start, selection.end)
            val maxPos = max(selection.start, selection.end)
            val substringBounds = textBoundsUtil.getSubstringBounds(minPos until maxPos)
            rangeDom.setBounds(substringBounds.relativeTo(selectionBounds))
        }
    }

    companion object {
        fun updateCaretBounds(textElement: IVirtualDom.HTMLElement, caretPos: Int, coordinatesElement: IVirtualDom.HTMLElement?, caretDom: IVirtualDom.HTMLElement) {
            updateCaretBounds(textElement, caretPos, coordinatesElement?.getOuterBounds() ?: Bounds.ZERO, caretDom)
        }

        fun updateCaretBounds(textElement: IVirtualDom.HTMLElement, caretPos: Int, relativeTo: Bounds, caretDom: IVirtualDom.HTMLElement) {
            val textBoundsUtil = TextBoundsUtil(textElement, relativeTo)
            val textBounds = textBoundsUtil.getTextBounds()
            val text = textBoundsUtil.getText()
            val leftEnd = caretPos == 0
            val rightEnd = caretPos == text.length
            val caretOffsetX = if (rightEnd && !leftEnd) -4 else -1
            val caretOffsetY = if (leftEnd || rightEnd) -1 else 0
            caretDom.style["height"] = "${textBounds.height}px"
            caretDom.style["left"] = "${textBoundsUtil.getCaretX(caretPos) + caretOffsetX}px"
            caretDom.style["top"] = "${textBounds.y + caretOffsetY}px"
        }
    }
}

private class TextBoundsUtil(val dom: IVirtualDom.HTMLElement, val relativeTo: Bounds = Bounds.ZERO) {
    fun getText(): String = dom.innerText()
    fun getTextLength() = getText().length
    fun getTextBounds() = dom.getInnerBounds().relativeTo(relativeTo)
    fun getTextWidth() = getTextBounds().width
    fun getTextHeight() = getTextBounds().height
    fun getCharWidth() = getTextWidth() / getTextLength()
    fun getCaretX(pos: Int) = getTextBounds().let {
        val charWidth = it.width / getTextLength()
        it.x + pos * charWidth
    }
    fun getSubstringBounds(range: IntRange) = getTextBounds().let {
        val charWidth = it.width / getTextLength()
        val minX = it.x + range.first * charWidth
        val maxX = it.x + (range.last + 1) * charWidth
        it.copy(x = minX, width = maxX - minX)
    }
}
