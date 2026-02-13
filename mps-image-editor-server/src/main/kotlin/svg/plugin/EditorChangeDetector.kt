package svg.plugin

import jetbrains.mps.ide.ThreadUtils
import jetbrains.mps.nodeEditor.EditorComponent
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import svg.svg.EditorToImage
import svg.util.AWTExtensions
import java.awt.BasicStroke
import java.awt.Color
import java.awt.Dimension
import java.awt.Rectangle
import java.awt.RenderingHints
import java.awt.image.BufferedImage
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import javax.swing.SwingUtilities
import kotlin.math.max
import kotlin.math.min

abstract class EditorChangeDetector(
    val coroutineScope: CoroutineScope,
) {
    var lastImage: BufferedImage? = null
        private set
    var visibleYRange: Range? = null
        private set
    private val updateRequested = AtomicBoolean(false)
    private val pendingUpdates = AtomicInteger(0)

    protected abstract val editorComponent: EditorComponent?

    protected abstract suspend fun handleFullChange(newImage: BufferedImage?)

    protected abstract suspend fun handlePartialChange(
        newImage: BufferedImage,
        offsetX: Int,
        offsetY: Int,
    )

    fun setVisibleYRange(
        minY: Int,
        maxY: Int,
    ) {
        visibleYRange = Range(minY, maxY)
    }

    protected suspend fun handleChange(
        newImage: BufferedImage?,
        changedRect: Rectangle?,
    ) {
        if (changedRect == null) {
            handleFullChange(newImage)
        } else {
            val biggerRect = Rectangle(changedRect)
            if (biggerRect.x > 0) {
                biggerRect.x -= 1
                biggerRect.width += 1
            }
            if (biggerRect.y > 0) {
                biggerRect.y -= 1
                biggerRect.height += 1
            }
            if (biggerRect.x + biggerRect.width < newImage!!.width) {
                biggerRect.width += 1
            }
            if (biggerRect.y + biggerRect.height < newImage.height) {
                biggerRect.height += 1
            }
            val partialImage = newImage.getSubimage(biggerRect.x, biggerRect.y, biggerRect.width, biggerRect.height)
            handlePartialChange(partialImage, biggerRect.x, biggerRect.y)
        }
    }

    fun scheduleUpdate() {
        updateRequested.set(true)

        coroutineScope.launch {
            if (updateRequested.get()) {
                try {
                    if (pendingUpdates.incrementAndGet() <= 2) {
                        update()
                    }
                } finally {
                    pendingUpdates.decrementAndGet()
                }
            }
        }
    }

    protected suspend fun update() {
        if (updateRequested.compareAndSet(true, false)) {
            doUpdate()
        }
    }

    protected suspend fun doUpdate() {
        if (ThreadUtils.isInEDT()) {
            throw RuntimeException("Run from a separate thread")
        }

        var newImage: BufferedImage? = null
        val oldImage = lastImage
        val rangeY = visibleYRange
        ThreadUtils.runInUIThreadAndWait { newImage = captureImage(rangeY) }
        if (newImage == null) {
            return
        }

        if (oldImage == null || newImage!!.width != oldImage.width || newImage!!.height != oldImage.height) {
            lastImage = newImage
            handleChange(newImage, null)
        } else {
            val height = newImage!!.height
            val oldPixelData = IntArray(newImage!!.width * 4)
            val newPixelData = IntArray(oldImage.width * 4)

            var minChangedY = newImage!!.height - 1
            var maxChangedY = 0
            var minChangedX = newImage!!.width - 1
            var maxChangedX = 0
            var anyChange = false
            var allChanged = true
            for (y in (
                if (rangeY == null) {
                    0
                } else {
                    limitValue(
                        rangeY.start,
                        0,
                        height - 1
                    )
                }
            ) until (
                (
                    if (rangeY == null) {
                        height
                    } else {
                        limitValue(
                            rangeY.end + 1,
                            0,
                            height
                        )
                    }
                )
            )) {
                oldImage.raster.getPixels(0, y, oldImage.width, 1, oldPixelData)
                newImage!!.raster.getPixels(0, y, newImage!!.width, 1, newPixelData)
                val lineChanged = !(oldPixelData.contentEquals(newPixelData))
                if (lineChanged) {
                    anyChange = true
                    minChangedY = min(minChangedY.toDouble(), y.toDouble()).toInt()
                    maxChangedY = max(maxChangedY.toDouble(), y.toDouble()).toInt()
                    var x = 0
                    while (x < oldPixelData.size) {
                        if (oldPixelData[x] != newPixelData[x] || oldPixelData[1 + x] != newPixelData[1 + x] ||
                            oldPixelData[2 + x] != newPixelData[2 + x] ||
                            oldPixelData[3 + x] != newPixelData[3 + x]
                        ) {
                            minChangedX = min(minChangedX.toDouble(), (x / 4).toDouble()).toInt()
                            maxChangedX = max(maxChangedX.toDouble(), (x / 4).toDouble()).toInt()
                        }
                        x += 4
                    }
                } else {
                    allChanged = false
                }
            }
            if (anyChange) {
                lastImage = newImage
                handleChange(
                    newImage,
                    (
                        if (allChanged) {
                            null
                        } else {
                            Rectangle(
                                minChangedX,
                                minChangedY,
                                maxChangedX - minChangedX + 1,
                                maxChangedY - minChangedY + 1
                            )
                        }
                    )
                )
            }
        }
    }

    protected fun captureImage(clipRangeY: Range?): BufferedImage? {
        val editor = editorComponent ?: return null
        if (editor.editedNode == null) {
            return null
        }

        val window = SwingUtilities.getWindowAncestor(editor)
        window.pack()

        val paintedComponent = editor.externalComponent
        val size = (if (editor == null) Dimension(100, 40) else paintedComponent.size)
        if (size.width <= 0) {
            size.width = 1
        }
        if (size.height <= 0) {
            size.height = 1
        }
        var bounds = Rectangle(0, 0, size.width, size.height)
        for (popup in AWTExtensions.getVisibleOwnedWindows(AWTExtensions.getWindow(editor))) {
            val imageOffset = paintedComponent.locationOnScreen
            val ownedOffset = popup!!.locationOnScreen
            ownedOffset.translate(-imageOffset.x, -imageOffset.y)
            val ownedBounds = Rectangle(ownedOffset.x, ownedOffset.y, popup.width, popup.height)
            bounds = bounds.union(ownedBounds)
        }

        val img = BufferedImage(bounds.width, bounds.height, BufferedImage.TYPE_INT_ARGB)
        val g = img.createGraphics()
        g.translate(-bounds.x, -bounds.y)
        g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON)
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON)
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY)

        if (clipRangeY != null) {
            g.setClip(
                0,
                limitValue(clipRangeY.start, 0, bounds.height - 1),
                bounds.width,
                limitValue(
                    clipRangeY.length,
                    0,
                    bounds.height - clipRangeY.start
                )
            )
        }

        if (editor != null) {
            EditorToImage.paintEditor(editor, g)
        } else {
            g.stroke = BasicStroke(2.0f)
            g.color = Color.RED
            g.drawLine(0, 0, 100, 40)
            g.drawLine(100, 0, 0, 40)
        }

        return img
    }

    class Range(
        start: Int,
        end: Int,
    ) {
        val start: Int
        val end: Int

        init {
            assert(start <= end)
            this.start = start
            this.end = end
        }

        val length: Int
            get() = end - start + 1
    }

    companion object {
        private fun limitValue(
            value: Int,
            min: Int,
            max: Int,
        ): Int = max(min(value.toDouble(), max.toDouble()), min.toDouble()).toInt()
    }
}
