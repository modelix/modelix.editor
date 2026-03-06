package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging

private val LOG = KotlinLogging.logger { }

class CodeCompletionMenuUI(
    val ccmenu: CodeCompletionMenu,
    val editor: FrontendEditorComponent,
) {
    fun updateBounds() {
        LOG.trace { "CodeCompletionMenuUI.updateBounds()" }
        val ccContainerElement = editor.getHtmlElement(ccmenu) ?: return
        val layoutable = ccmenu.getAnchor()
        val anchorElement = editor.getHtmlElement(layoutable) ?: return
        val anchorAbsoluteBounds = anchorElement.getOuterBounds()
        val anchorRelativeBounds =
            anchorAbsoluteBounds.relativeTo(editor.getMainLayer()?.getOuterBounds() ?: Bounds.ZERO)
        val patternElement =
            ccContainerElement
                .descendants()
                .filterIsInstance<IVirtualDom.HTMLElement>()
                .first { it.getClasses().contains("ccmenu-pattern") }
        val left: Double =
            when (ccmenu.completionPosition) {
                CompletionPosition.CENTER -> {
                    anchorRelativeBounds.x
                }

                CompletionPosition.LEFT -> {
                    anchorRelativeBounds.x - patternElement.getOuterBounds().width
                }

                CompletionPosition.RIGHT -> {
                    anchorRelativeBounds.maxX()
                }
            }
        ccContainerElement.style.left = "${left}px"
        ccContainerElement.style.top = "${anchorRelativeBounds.y}px"

        val caretElement =
            ccContainerElement.descendants().filterIsInstance<IVirtualDom.HTMLElement>().first { it.getClasses().contains("caret") }
        CaretSelectionView.updateCaretBounds(
            patternElement,
            ccmenu.patternEditor.caretPos,
            ccContainerElement,
            caretElement,
        )

        // TODO
//        ccContainerElement.descendants().filterIsInstance<IVirtualDom.HTMLElement>()
//            .firstOrNull { it.classList.contains("ccSelectedEntry") }
//            ?.scrollIntoView(js("""{block: "nearest"}"""))
    }
}
