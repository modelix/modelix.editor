package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
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
}
