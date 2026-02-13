package svg.plugin

import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.actionSystem.DataContext
import jetbrains.mps.ide.project.ProjectHelper
import jetbrains.mps.nodeEditor.EditorComponent
import jetbrains.mps.nodeEditor.Highlighter
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteChooser
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteChooserHandler
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstitutePatternEditor
import jetbrains.mps.nodeEditor.configuration.EditorConfigurationBuilder
import jetbrains.mps.nodeEditor.keyboard.TextChangeEvent
import jetbrains.mps.openapi.editor.cells.EditorCell
import jetbrains.mps.openapi.editor.cells.SubstituteInfo
import jetbrains.mps.project.Project
import org.jetbrains.annotations.NonNls
import org.jetbrains.mps.openapi.model.SNode
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import java.awt.Dimension
import java.awt.GraphicsConfiguration
import java.awt.GraphicsDevice
import java.awt.Point
import java.awt.Rectangle
import java.awt.Window
import java.awt.event.KeyEvent
import java.awt.geom.AffineTransform
import java.awt.image.ColorModel
import javax.swing.JFrame

open class ServerEditorComponent(
    node: SNode?,
    project: Project,
) : EditorComponent(project.repository, EditorConfigurationBuilder().showErrorsGutter(true).build()) {
    private val mpsProject: Project
    val dataContext: DataContext =
        object : DataContext {
            override fun getData(key: String): Any? = this@ServerEditorComponent.getData(key)
        }
    private val highlighter: Highlighter
    private val gc: GraphicsConfiguration =
        object : GraphicsConfiguration() {
            private val graphicsConfig: GraphicsConfiguration = this
            private val device: GraphicsDevice =
                object : GraphicsDevice() {
                    override fun getType(): Int = TYPE_RASTER_SCREEN

                    override fun getIDstring(): String = "Modelix EditorComponent"

                    override fun getConfigurations(): Array<GraphicsConfiguration> = arrayOf(graphicsConfig)

                    override fun getDefaultConfiguration(): GraphicsConfiguration = graphicsConfig
                }

            override fun getBounds(): Rectangle = Rectangle(0, 0, 1000, 1000)

            override fun getColorModel(): ColorModel = ColorModel.getRGBdefault()

            override fun getColorModel(transparency: Int): ColorModel = ColorModel.getRGBdefault()

            override fun getDefaultTransform(): AffineTransform = AffineTransform()

            override fun getDevice(): GraphicsDevice = device

            override fun getNormalizingTransform(): AffineTransform = AffineTransform()
        }
    private var frame: JFrame? = null

    init {
        require(node !is ModelixNodeAsMPSNode) { "MPS node without Modelix wrapper expected" }

        // was executionMode == EModelixExecutionMode.PROJECTOR || executionMode == EModelixExecutionMode.DEFAULT
        if (true) {
            frame = JFrame("Modelix Editor")
            frame!!.contentPane.add(this.externalComponent)
            frame!!.isVisible = true
            frame!!.defaultCloseOperation = JFrame.DO_NOTHING_ON_CLOSE
        }
        this.mpsProject = project
        editNode(node)
        update()
        highlighter = project.getComponent(Highlighter::class.java)
        highlighter?.addAdditionalEditorComponent(this)
        if (frame == null) {
            ReflectionUtil.writeField(
                EditorComponent::class.java,
                (this as EditorComponent),
                "myNodeSubstituteChooser",
                object : NodeSubstituteChooser(
                    this
                ) {
                    private val headlessPatternEditor: NodeSubstitutePatternEditor =
                        object : NodeSubstitutePatternEditor() {
                            private var active = false

                            override fun setText(text: String) {
                            }

                            override fun getText(): String = ""

                            override fun setCaretPosition(caretPosition: Int) {
                            }

                            override fun getCaretPosition(): Int = 0

                            override fun isActivated(): Boolean = active

                            override fun processKeyPressed(keyEvent: KeyEvent): Boolean = false

                            override fun toggleReplaceMode() {
                            }

                            override fun processKeyTyped(keyEvent: KeyEvent): Boolean = false

                            override fun processTextChanged(textChangeEvent: TextChangeEvent): Boolean = false

                            override fun getPattern(): String = ""

                            override fun activate(
                                owner: Window,
                                location: Point,
                                size: Dimension,
                                show: Boolean,
                            ) {
                                active = true
                            }

                            override fun setLocation(point: Point) {
                            }

                            override fun getLeftBottomPosition(): Point = Point(0, 0)

                            override fun done() {
                                active = false
                            }
                        }

                    override fun getPatternEditor(): NodeSubstitutePatternEditor = headlessPatternEditor
                }
            )
        }
        frame?.pack()
    }

    override fun dispose() {
        highlighter?.removeAdditionalEditorComponent(this)
        if (frame != null) {
            frame!!.isVisible = false
            frame!!.dispose()
        }
        super.dispose()
    }

    @Suppress("removal")
    override fun hasFocus(): Boolean = true

    override fun getData(dataId: @NonNls String): Any? {
        if (CommonDataKeys.PROJECT.`is`(dataId)) {
            return ProjectHelper.toIdeaProject(mpsProject)
        }
        return super.getData(dataId!!)
    }

    override fun activateNodeSubstituteChooser(
        editorCell: EditorCell,
        substituteInfo: SubstituteInfo,
        resetPattern: Boolean,
        isSmart: Boolean,
    ): Boolean {
        if (editorCell == null || substituteInfo == null) {
            return false
        }
        val patternEditor = (editorCell as jetbrains.mps.nodeEditor.cells.EditorCell).createSubstitutePatternEditor()
        if (resetPattern) {
            patternEditor.toggleReplaceMode()
        }
        val substituteChooserHandler =
            NodeSubstituteChooserHandler(editorCell, this, substituteInfo, patternEditor, isSmart)
        if (!(substituteChooserHandler.tryToSubstituteImmediately())) {
            substituteChooserHandler.showNodeSubstituteChooser(nodeSubstituteChooser)
        }
        return true
    }

    override fun updateStatusBarMessage() {
    }

    override fun editNode(node: SNode?) {
        require(node !is ModelixNodeAsMPSNode) { "MPS node without Modelix wrapper expected" }
        super.editNode(node)
    }
}
