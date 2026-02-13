package org.modelix.editor

import kotlinx.serialization.Serializable

sealed interface JSUIEvent

@Serializable
data class JSMouseEvent(
    val eventType: JSMouseEventType,
    val x: Double,
    val y: Double,
    val modifiers: Modifiers = Modifiers.NONE,
    val button: Short,
    val buttons: Short,
) : JSUIEvent {
    fun getButtonAsEnum(): JSMouseButton =
        when (button) {
            0.toShort() -> JSMouseButton.PRIMARY
            1.toShort() -> JSMouseButton.AUXILIARY
            2.toShort() -> JSMouseButton.SECONDARY
            3.toShort() -> JSMouseButton.FOURTH
            4.toShort() -> JSMouseButton.FIFTH
            else -> JSMouseButton.NONE
        }

    fun getButtonsAsEnum(): Set<JSMouseButton> {
        val bitToValue =
            listOf(
                JSMouseButton.PRIMARY,
                JSMouseButton.SECONDARY,
                JSMouseButton.AUXILIARY,
                JSMouseButton.FOURTH,
                JSMouseButton.FIFTH,
            )
        return bitToValue
            .withIndex()
            .filter { (buttons.toInt() ushr it.index) and 1 == 1 }
            .map { it.value }
            .toSet()
    }
}

enum class JSMouseButton {
    NONE,
    PRIMARY,
    SECONDARY,
    AUXILIARY,
    FOURTH,
    FIFTH,
}

enum class JSMouseEventType {
    CLICK,
}
