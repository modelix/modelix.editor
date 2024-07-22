package svg.svg

import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes._void_P1_E0
import jetbrains.mps.ide.ThreadUtils
import jetbrains.mps.openapi.editor.EditorComponent
import svg.util.AWTExtensions
import java.awt.Color
import java.awt.Component
import java.awt.Graphics
import java.awt.Graphics2D
import java.awt.Rectangle
import java.awt.RenderingHints
import java.awt.image.BufferedImage
import java.awt.image.RenderedImage
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.UnsupportedEncodingException
import java.util.Base64
import javax.imageio.ImageIO

/*Generated by MPS */

object EditorToImage {
    fun paintEditor(editor: EditorComponent, g: Graphics2D) {
        ThreadUtils.assertEDT()

        val paintedComponent = (editor as jetbrains.mps.nodeEditor.EditorComponent).externalComponent
        paintedComponent.paint(g)
        val window = AWTExtensions.getWindow((editor as Component))
        for (popup in AWTExtensions.getVisibleOwnedWindows(window)) {
            val g2 = g.create() as Graphics2D
            try {
                val imageOffset = paintedComponent.locationOnScreen
                val childOffset = popup!!.locationOnScreen
                childOffset.translate(-imageOffset.x, -imageOffset.y)
                g2.translate(childOffset.x, childOffset.y)
                popup.paintAll(g2)
                g2.color = Color.LIGHT_GRAY
                g2.drawRect(0, 0, popup.width, popup.height)
            } finally {
                g2.dispose()
            }
        }
    }

    fun toPngBase64(editor: EditorComponent, clip: Rectangle?): String {
        val size = (editor as jetbrains.mps.nodeEditor.EditorComponent).size
        val img = BufferedImage(size.width, size.height, BufferedImage.TYPE_INT_ARGB)
        val g = img.createGraphics()
        g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON)
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON)
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY)

        if (clip != null) {
            g.clip = clip
        }

        paintEditor(editor, g)

        var os: ByteArrayOutputStream? = null
        try {
            os = ByteArrayOutputStream()
            ImageIO.write(img, "png", os)
            os.close()
            val result = Base64.getEncoder().encodeToString(os.toByteArray())
            return result
        } catch (ex: UnsupportedEncodingException) {
            throw RuntimeException(ex)
        } catch (ex: IOException) {
            throw RuntimeException(ex)
        } finally {
            try {
                os!!.close()
            } catch (ex: Exception) {
            }
        }
    }

    fun toPngBase64(img: RenderedImage?): String {
        var os: ByteArrayOutputStream? = null
        try {
            os = ByteArrayOutputStream()
            ImageIO.write(img, "png", os)
            os.close()
            val result = Base64.getEncoder().encodeToString(os.toByteArray())
            return result
        } catch (ex: UnsupportedEncodingException) {
            throw RuntimeException(ex)
        } catch (ex: IOException) {
            throw RuntimeException(ex)
        } finally {
            try {
                os!!.close()
            } catch (ex: Exception) {
            }
        }
    }

    internal fun withGraphicsCopy(g: Graphics, r: _void_P1_E0<in Graphics?>) {
        val g2 = g.create()
        try {
            r.invoke(g2)
        } finally {
            g2.dispose()
        }
    }
}
