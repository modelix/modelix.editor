package svg.plugin

import jetbrains.mps.ide.ThreadUtils
import svg.util.AWTExtensions
import java.awt.Component
import java.awt.Point
import java.awt.event.MouseEvent
import javax.swing.SwingUtilities

class RemoteMouseCursor(
    val targetComponent: Component,
) {
    private var lastTarget: Component? = null
    private var lastPosition: Point? = null

    fun mouseMoved(
        position: Point,
        modifiers: Int,
    ) {
        ThreadUtils.assertEDT()

        val x = position.x
        val y = position.y
        val target = getRedirectedTarget(x, y)

        if (target !== lastTarget) {
            if (lastTarget != null) {
                dispatchEvent(MouseEvent.MOUSE_EXITED, modifiers, 0, position, lastTarget!!, 0)
            }
            dispatchEvent(MouseEvent.MOUSE_ENTERED, modifiers, 0, position, target, 0)
        }

        dispatchEvent(MouseEvent.MOUSE_MOVED, modifiers, 0, position, target, 0)

        lastPosition = position
        lastTarget = target
    }

    /**
     *
     *
     * @param type one of the constants in MouseEvent
     * @param modifiers
     * @param position relative to the mainComponent
     * @param target
     */
    protected fun dispatchEvent(
        type: Int,
        modifiers: Int,
        clickCount: Int,
        position: Point,
        target: Component,
        button: Int,
    ) {
        val event =
            MouseEvent(
                targetComponent,
                type,
                System.currentTimeMillis(),
                modifiers,
                position.x,
                position.y,
                clickCount,
                false,
                button
            )
        target.dispatchEvent(SwingUtilities.convertMouseEvent(targetComponent, event, target))
    }

    fun mouseClicked(
        position: Point,
        modifiers: Int,
    ) {
        ThreadUtils.assertEDT()

        if (lastPosition != position) {
            mouseMoved(position, 0)
        }
        val x = position.x
        val y = position.y
        val target = getRedirectedTarget(x, y)

        for (popup in AWTExtensions.getVisibleOwnedWindows(AWTExtensions.getWindow(target)).toList().reversed()) {
            popup!!.isVisible = false
            popup.dispose()
        }

        dispatchEvent(
            MouseEvent.MOUSE_PRESSED,
            MouseEvent.BUTTON1_DOWN_MASK or modifiers,
            1,
            position,
            target,
            MouseEvent.BUTTON1
        )
        dispatchEvent(
            MouseEvent.MOUSE_RELEASED,
            MouseEvent.BUTTON1_DOWN_MASK or modifiers,
            1,
            position,
            target,
            MouseEvent.BUTTON1
        )
        dispatchEvent(
            MouseEvent.MOUSE_CLICKED,
            MouseEvent.BUTTON1_DOWN_MASK or modifiers,
            1,
            position,
            target,
            MouseEvent.BUTTON1
        )

        lastPosition = position
        lastTarget = target
    }

    fun mouseExited() {
        ThreadUtils.assertEDT()

        if (lastTarget != null) {
            dispatchEvent(
                MouseEvent.MOUSE_EXITED,
                0,
                0,
                ((if (lastPosition != null) lastPosition else Point())!!),
                lastTarget!!,
                MouseEvent.BUTTON1
            )
        }

        lastPosition = null
        lastTarget = null
    }

    fun getRedirectedTarget(
        x: Int,
        y: Int,
    ): Component {
        ThreadUtils.assertEDT()

        var target = SwingUtilities.getDeepestComponentAt(targetComponent, x, y)
        val window = SwingUtilities.getWindowAncestor(targetComponent)
        val windowLocation = targetComponent.locationOnScreen
        for (popup in AWTExtensions.getVisibleOwnedWindows(window)) {
            val offset = popup!!.locationOnScreen
            offset.translate(-windowLocation.x, -windowLocation.y)
            val popupTarget = SwingUtilities.getDeepestComponentAt(popup, x - offset.x, y - offset.y)
            if (popupTarget != null) {
                target = popupTarget
            }
        }
        if (target == null) {
            target = targetComponent
        }
        return target
    }
}
