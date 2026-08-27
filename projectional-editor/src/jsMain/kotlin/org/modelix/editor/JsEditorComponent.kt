package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.browser.window
import kotlinx.html.div
import kotlinx.html.tabIndex
import org.modelix.editor.text.shared.TextEditorService
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.events.Event
import org.w3c.dom.events.KeyboardEvent
import org.w3c.dom.events.MouseEvent

private val LOG = KotlinLogging.logger {}

class JsEditorComponent(
    service: TextEditorService,
    existingContainerElement: HTMLDivElement? = null,
) : FrontendEditorComponent(service, JSDom()),
    IProducesHtml {
    val containerElement: IVirtualDom.HTMLElement =
        (existingContainerElement?.let { (virtualDom as JSDom).wrap(it) } ?: virtualDom.create().div()).also {
            it.addClass("js-editor-component")
            it.setAttribute("tabIndex", "-1") // allows setting keyboard focus
        }

    /**
     * Marks the editor as being in the state where a click navigates to the target of a reference instead of placing
     * the caret. Only used for styling the reference cell under the mouse as clickable; the click itself is
     * dispatched with the modifiers of the mouse event (see [JSMouseEvent.isNavigationClick]).
     *
     * The modifier is tracked on the window, not on the editor: the reference under the mouse has to be marked even
     * when the editor doesn't have the keyboard focus, which is the case as long as the user hasn't clicked into it.
     */
    private val navigationModeListener: (Event) -> Unit = { event ->
        val active = (event as? KeyboardEvent)?.let { it.metaKey || it.ctrlKey } ?: false
        if (active) {
            containerElement.addClass(NAVIGATION_MODE_CLASS_NAME)
        } else {
            containerElement.removeClass(NAVIGATION_MODE_CLASS_NAME)
        }
    }

    init {
        (virtualDom as JSDom).originElement = containerElement.unwrap()
        containerElement.unwrap().addEventListener("click", { event: Event ->
            LOG.trace { "click $event" }
            (event as? MouseEvent)?.let { enqueueUIEvent(it.convert(JSMouseEventType.CLICK, containerElement.unwrap())) }
        })
        containerElement.unwrap().addEventListener("keydown", { event: Event ->
            LOG.trace { "keydown $event" }
            (event as? KeyboardEvent)?.let {
                enqueueUIEvent(it.convert(JSKeyboardEventType.KEYDOWN))
                event.preventDefault()
            }
        })
        containerElement.unwrap().addEventListener("keyup", { event: Event ->
            (event as? KeyboardEvent)?.let {
                enqueueUIEvent(it.convert(JSKeyboardEventType.KEYUP))
                event.preventDefault()
            }
        })
        window.addEventListener("keydown", navigationModeListener)
        window.addEventListener("keyup", navigationModeListener)
        // The keyup that would end the navigation mode is not delivered when the window loses the focus while the
        // modifier is held, e.g. because Cmd+Tab switched to another window.
        window.addEventListener("blur", navigationModeListener)
    }

    override fun dispose() {
        window.removeEventListener("keydown", navigationModeListener)
        window.removeEventListener("keyup", navigationModeListener)
        window.removeEventListener("blur", navigationModeListener)
        super.dispose()
    }

    override fun editorElementChanged(newElement: IVirtualDom.HTMLElement) {
        super.editorElementChanged(newElement)
        containerElement.childNodes.forEach { it.remove() }
        containerElement.appendChild(newElement)
    }

    override fun scrollIntoView(element: IVirtualDom.HTMLElement) {
        val element = element as? JSDom.HTMLElementWrapper ?: return
        element.unwrap().scrollIntoView(js("""{block: "nearest"}"""))
    }

    companion object {
        const val NAVIGATION_MODE_CLASS_NAME = "navigation-mode"
    }
}
