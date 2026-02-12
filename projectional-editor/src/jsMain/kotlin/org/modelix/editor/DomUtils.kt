package org.modelix.editor

import kotlinx.browser.document
import kotlinx.browser.window
import org.w3c.dom.DOMRect
import org.w3c.dom.Element
import org.w3c.dom.HTMLElement
import org.w3c.dom.Node
import org.w3c.dom.asList
import org.w3c.dom.events.MouseEvent

fun Element.getAbsoluteBounds(): Bounds = getBoundingClientRect().toBounds().translated(window.scrollX, window.scrollY)

fun HTMLElement.setBounds(bounds: Bounds) {
    with(style) {
        left = "${bounds.x}px"
        top = "${bounds.y}px"
        width = "${bounds.width}px"
        height = "${bounds.height}px"
    }
}

fun Element.getAbsoluteInnerBounds(): Bounds =
    (
        getClientRects()
            .asSequence()
            .firstOrNull()
            ?.toBounds()
            ?.translated(window.scrollX, window.scrollY) ?: Bounds.ZERO
    )

fun DOMRect.toBounds() = Bounds(x, y, width, height)

private fun getBodyAbsoluteBounds() = document.body?.getBoundingClientRect()?.toBounds() ?: Bounds.ZERO

fun MouseEvent.getAbsolutePositionX() = clientX + window.scrollX

fun MouseEvent.getAbsolutePositionY() = clientY + window.scrollY

fun Node.descendants(): Sequence<Node> = childNodes.asList().asSequence().flatMap { sequenceOf(it) + it.descendants() }
