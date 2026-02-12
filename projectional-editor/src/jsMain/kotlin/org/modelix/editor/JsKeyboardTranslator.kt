package org.modelix.editor

import org.w3c.dom.HTMLElement
import org.w3c.dom.events.KeyboardEvent
import org.w3c.dom.events.MouseEvent

fun KeyboardEvent.convert(eventType: JSKeyboardEventType): JSKeyboardEvent {
    val knownKey = KnownKeys.getIfKnown(key)
    val typedText: String? = key.let { if (it.length == 1) it else null }
    val locationEnum =
        when (this.location) {
            KeyboardEvent.DOM_KEY_LOCATION_STANDARD -> KeyLocation.STANDARD
            KeyboardEvent.DOM_KEY_LOCATION_LEFT -> KeyLocation.LEFT
            KeyboardEvent.DOM_KEY_LOCATION_RIGHT -> KeyLocation.RIGHT
            KeyboardEvent.DOM_KEY_LOCATION_NUMPAD -> KeyLocation.NUMPAD
            else -> KeyLocation.STANDARD
        }
    return JSKeyboardEvent(
        eventType = eventType,
        typedText = typedText,
        knownKey = knownKey,
        rawKey = key,
        modifiers = Modifiers(ctrlKey, altKey, shiftKey, metaKey),
        location = locationEnum,
        repeat = this.repeat,
        composing = this.isComposing,
    )
}

fun MouseEvent.convert(
    eventType: JSMouseEventType,
    relativeTo: HTMLElement?,
): JSMouseEvent {
    val origin = relativeTo?.getAbsoluteBounds() ?: Bounds.ZERO
    return JSMouseEvent(
        eventType = eventType,
        x = this.getAbsolutePositionX() - origin.x,
        y = this.getAbsolutePositionY() - origin.y,
        modifiers = Modifiers(ctrlKey, altKey, shiftKey, metaKey),
        button = button,
        buttons = buttons,
    )
}
