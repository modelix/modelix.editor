package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.div
import kotlinx.html.span
import kotlinx.html.style

class CellSelectionView(selection: CellSelection, val editor: FrontendEditorComponent) : SelectionView<CellSelection>(selection) {

    override fun update() {
        val mainLayerBounds = editor.getMainLayer()?.getOuterBounds() ?: Bounds.ZERO
        val selectionDom = editor.generatedHtmlMap.getOutput(this) ?: return
        val lines: Map<TextLine, List<Layoutable>> = selection.getLayoutables().groupBy { it.getLine()!! }
        val lineSelectionDoms = selectionDom.childNodes.filterIsInstance<IVirtualDom.HTMLElement>()

        val applyBounds = ArrayList<() -> Unit>()

        var selectionBounds: Bounds? = null
        for ((words, lineSelectionDom) in lines.values.zip(lineSelectionDoms)) {
            val wordSelectionDoms = lineSelectionDom.childNodes.filterIsInstance<IVirtualDom.HTMLElement>()
            var lineBounds: Bounds? = null
            for ((word, wordSelectionDom) in words.zip(wordSelectionDoms)) {
                val wordDom = editor.generatedHtmlMap.getOutput(word) ?: continue
                val wordBounds = wordDom.getOuterBounds().relativeTo(mainLayerBounds)
                lineBounds = lineBounds.union(wordBounds)
                applyBounds += {
                    with(wordSelectionDom.style) {
                        position = "absolute"
                        left = "${wordBounds.x - lineBounds!!.x}px"
                        top = "${wordBounds.y - lineBounds!!.y}px"
                        width = "${wordBounds.width}px"
                        height = "${wordBounds.height}px"
                    }
                }
            }
            selectionBounds = selectionBounds.union(lineBounds)
            applyBounds += {
                if (lineBounds != null) {
                    with(lineSelectionDom.style) {
                        position = "absolute"
                        left = "${lineBounds.x - selectionBounds!!.x}px"
                        top = "${lineBounds.y - selectionBounds!!.y}px"
                        width = "${lineBounds.width}px"
                        height = "${lineBounds.height}px"
                    }
                }
            }
        }
        applyBounds += {
            if (selectionBounds != null) {
                with(selectionDom.style) {
                    position = "absolute"
                    left = "${selectionBounds.x}px"
                    top = "${selectionBounds.y}px"
                    width = "${selectionBounds.width}px"
                    height = "${selectionBounds.height}px"
                }
            }
        }
        applyBounds.forEach { it() }
    }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("cell-selection own") {
            val lines: Map<TextLine, List<Layoutable>> = selection.getLayoutables().groupBy { it.getLine()!! }
            for (line in lines) {
                div("selected-line") {
                    for (word in line.value) {
                        span("selected-word") {
                            style = "background-color:hsla(196, 67%, 45%, 0.3)"
                        }
                    }
                }
            }
        }
    }
}
