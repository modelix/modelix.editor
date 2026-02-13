package svg.util

import java.awt.Component
import java.awt.Container
import java.awt.Window
import javax.swing.SwingUtilities

object AWTExtensions {
    fun getVisibleOwnedWindows(_this: Window?): Sequence<Window> {
        if (_this == null) {
            return emptySequence()
        }
        return _this.ownedWindows
            .asSequence()
            .filter { it.isVisible }
            .flatMap { sequenceOf(it) + getVisibleOwnedWindows(it) }
    }

    fun getWindow(_this: Component?): Window = SwingUtilities.getWindowAncestor(_this)

    fun descendants(_this: Component): Sequence<Component> {
        if (_this is Container) {
            return _this.components.asSequence().flatMap { descendantsAndSelf(it) }
        } else {
            return emptySequence()
        }
    }

    fun descendantsAndSelf(_this: Component): Sequence<Component> = sequenceOf(_this) + descendants(_this)
}
