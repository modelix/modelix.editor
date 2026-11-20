package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.html.TagConsumer
import kotlinx.html.div
import org.modelix.editor.text.shared.CompletionMenuEntryData
import org.modelix.editor.text.shared.celltree.cellReferences

private val LOG = KotlinLogging.logger { }

class ReresolvableLayoutable(
    initial: LayoutableCell,
) {
    private var current: LayoutableCell = initial
    private var references = initial.cell.cellReferences

    fun get(editor: FrontendEditorComponent): LayoutableCell {
        if (!current.cell.isAttached()) {
            val resolvedCell =
                checkNotNull(references.firstNotNullOfOrNull { editor.resolveCell(it).firstOrNull() }) {
                    "Cell not found: $references"
                }
            current =
                checkNotNull(editor.resolveLayoutable(resolvedCell)) {
                    "Layoutable not found for cell $resolvedCell"
                }
        }
        return current
    }
}

/**
 * A popup at a cell with a list of actions, which is navigated with the keyboard and narrowed down by typing.
 * What the actions are for decides how they are matched, what typing does and how the menu looks.
 *
 * @see CodeCompletionMenu
 * @see ContextActionsMenu
 */
abstract class ActionMenu(
    val editor: FrontendEditorComponent,
    anchor: LayoutableCell,
    initialEntries: List<CompletionMenuEntryData>,
    initialPattern: String = "",
    initialCaretPosition: Int? = null,
) : IProducesHtml,
    IKeyboardHandler {
    val patternEditor = PatternEditor(initialPattern, initialCaretPosition)
    protected var selectedIndex: Int = 0
        private set
    protected var allEntries: List<CompletionMenuEntryData> = initialEntries
        private set
    protected var filteredEntries: List<CompletionMenuEntryData> = allEntries
        private set
    private val anchor = ReresolvableLayoutable(anchor)

    init {
        applyFilter()
    }

    /**
     * The CSS class of the element that contains the text of the pattern.
     */
    protected abstract val patternClass: String

    /**
     * The CSS class of the element of the selected entry.
     */
    protected abstract val selectedEntryClass: String

    /**
     * Invoked from the constructor of this class, so it can't use any state of the subclass.
     */
    protected abstract fun matches(entry: CompletionMenuEntryData): Boolean

    /**
     * Brings the entries in line with the pattern after it or the caret changed.
     */
    protected abstract suspend fun updateEntries()

    /**
     * The position of the menu relative to the main layer, given the bounds of the anchor relative to the same layer.
     */
    protected abstract fun getPosition(anchorBounds: Bounds): Position

    /**
     * Where the menu goes, given the bounds of the anchor and of the part of the editor that is visible, both relative
     * to the main layer. A menu can also adapt its size to the visible part here. [visibleBounds] is null where it
     * can't be measured.
     */
    protected open fun place(
        menuElement: IVirtualDom.HTMLElement,
        anchorBounds: Bounds,
        visibleBounds: Bounds?,
    ): Position = getPosition(anchorBounds)

    protected open suspend fun onPatternEdited() = updateEntries()

    protected open suspend fun onTextInserted(
        oldTextBeforeCaret: String,
        remainingText: String,
    ) = onPatternEdited()

    fun getAnchor() = anchor.get(editor)

    override fun isHtmlOutputValid(): Boolean = false

    fun loadEntries(newActions: List<CompletionMenuEntryData>) {
        allEntries = newActions
        applyFilter()
    }

    fun applyFilter() {
        filteredEntries = allEntries.filter { matches(it) }
        selectedIndex = selectedIndex.coerceAtMost(filteredEntries.lastIndex).coerceAtLeast(0)
    }

    fun selectNext() {
        selectedIndex++
        if (selectedIndex >= filteredEntries.size) selectedIndex = 0
        editor.invalidateActionMenu()
    }

    fun selectPrevious() {
        selectedIndex--
        if (selectedIndex < 0) selectedIndex = (filteredEntries.size - 1).coerceAtLeast(0)
        editor.invalidateActionMenu()
    }

    fun getSelectedEntry(): CompletionMenuEntryData? = filteredEntries.getOrNull(selectedIndex)

    fun getVisibleEntries(): List<CompletionMenuEntryData> = filteredEntries

    override suspend fun processKeyDown(event: JSKeyboardEvent): Boolean {
        when (event.knownKey) {
            KnownKeys.ArrowUp -> {
                selectPrevious()
            }

            KnownKeys.ArrowDown -> {
                selectNext()
            }

            KnownKeys.ArrowLeft -> {
                patternEditor.moveCaret(-1)
            }

            KnownKeys.ArrowRight -> {
                patternEditor.moveCaret(1)
            }

            KnownKeys.Escape -> {
                editor.closeActionMenu()
            }

            KnownKeys.Enter -> {
                getSelectedEntry()?.let { execute(it) }
            }

            KnownKeys.Backspace -> {
                patternEditor.deleteText(true)
            }

            KnownKeys.Delete -> {
                patternEditor.deleteText(false)
            }

            else -> {
                if (event.typedText.isNullOrEmpty()) return false
                if (event.typedText == " " && event.modifiers.ctrl) {
                    patternEditor.moveCaret(-patternEditor.caretPos)
                } else {
                    patternEditor.insertText(event.typedText)
                }
            }
        }
        editor.flushLocalLater()
        return true
    }

    protected suspend fun execute(entry: CompletionMenuEntryData) {
        editor.serviceCall {
            executeCodeCompletionAction(editor.editorId, entry.id)
        }
        editor.closeActionMenu()
    }

    fun updateBounds() {
        LOG.trace { "ActionMenu.updateBounds()" }
        val containerElement = editor.getHtmlElement(this) ?: return
        val anchorElement = editor.getHtmlElement(getAnchor()) ?: return
        val mainLayerBounds = editor.getMainLayer()?.getOuterBounds() ?: Bounds.ZERO
        val anchorBounds = anchorElement.getOuterBounds().relativeTo(mainLayerBounds)
        val visibleBounds = editor.getVisibleBounds()?.relativeTo(mainLayerBounds)
        val position = place(containerElement, anchorBounds, visibleBounds)
        containerElement.style.left = "${position.left}px"
        containerElement.style.top = "${position.top}px"

        getPatternElement()?.let { patternElement ->
            CaretSelectionView.updateCaretBounds(
                patternElement,
                patternEditor.caretPos,
                containerElement,
                containerElement.elementsWithClass("caret").first(),
            )
        }

        editor.scrollIntoViewLater { editor.getHtmlElement(this)?.elementsWithClass(selectedEntryClass)?.firstOrNull() }
    }

    protected fun getPatternElement(): IVirtualDom.HTMLElement? =
        editor.getHtmlElement(this)?.elementsWithClass(patternClass)?.firstOrNull()

    protected fun IVirtualDom.HTMLElement.elementsWithClass(cssClass: String): Sequence<IVirtualDom.HTMLElement> =
        descendants().filterIsInstance<IVirtualDom.HTMLElement>().filter { it.getClasses().contains(cssClass) }

    data class Position(
        val left: Double,
        val top: Double,
    )

    inner class PatternEditor(
        initialPattern: String,
        initialCaretPosition: Int?,
    ) : IProducesHtml {
        var caretPos: Int = initialCaretPosition ?: initialPattern.length
        var pattern: String = initialPattern

        override fun isHtmlOutputValid(): Boolean = false

        fun getTextBeforeCaret() = pattern.substring(0, caretPos)

        suspend fun deleteText(before: Boolean): Boolean {
            if (before) {
                if (caretPos == 0) return false
                pattern = pattern.removeRange((caretPos - 1) until caretPos)
                caretPos--
            } else {
                if (caretPos == pattern.length) return false
                pattern = pattern.removeRange(caretPos..caretPos)
            }
            onPatternEdited()
            return true
        }

        suspend fun insertText(text: String) {
            val oldTextBeforeCaret = getTextBeforeCaret()
            pattern = pattern.replaceRange(caretPos until caretPos, text)
            val remainingText = pattern.substring(caretPos)
            caretPos += text.length
            onTextInserted(oldTextBeforeCaret, remainingText)
        }

        suspend fun moveCaret(delta: Int) {
            caretPos = (caretPos + delta).coerceIn(0..pattern.length)
            updateEntries()
        }

        override fun <T> produceHtml(consumer: TagConsumer<T>) {
            consumer.div {
                div(patternClass) {
                    +pattern.useNbsp()
                }
                div(if (caretPos > 0 && caretPos == pattern.length) "caret own rightend" else "caret own") { }
            }
        }
    }
}
