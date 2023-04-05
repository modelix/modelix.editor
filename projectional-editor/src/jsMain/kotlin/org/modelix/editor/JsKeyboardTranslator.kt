package org.modelix.editor

import org.w3c.dom.events.KeyboardEvent

fun KeyboardEvent.convert(): JSKeyboardEvent {
    val knownKey = KnownKeys.getIfKnown(key)
    var typedText: String? = key.let { if (it.length == 1) it else null }
    val locationEnum = when (this.location) {
        KeyboardEvent.DOM_KEY_LOCATION_STANDARD -> KeyLocation.STANDARD
        KeyboardEvent.DOM_KEY_LOCATION_LEFT -> KeyLocation.LEFT
        KeyboardEvent.DOM_KEY_LOCATION_RIGHT -> KeyLocation.RIGHT
        KeyboardEvent.DOM_KEY_LOCATION_NUMPAD -> KeyLocation.NUMPAD
        else -> KeyLocation.STANDARD
    }
    return JSKeyboardEvent(
        typedText = typedText,
        knownKey = knownKey,
        rawKey = key,
        modifiers = Modifiers(ctrlKey, altKey, shiftKey, metaKey),
        location = locationEnum,
        repeat = this.repeat,
        composing = this.isComposing
    )
}