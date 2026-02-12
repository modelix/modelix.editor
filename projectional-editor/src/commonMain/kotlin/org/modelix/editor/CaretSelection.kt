package org.modelix.editor

import org.modelix.editor.text.frontend.editorComponent
import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.editor.text.shared.celltree.cellReferences
import kotlin.math.max
import kotlin.math.min

class CaretSelection(
    val editor: FrontendEditorComponent,
    val layoutable: LayoutableCell,
    val start: Int,
    val end: Int,
    val desiredXPosition: Int? = null,
) : Selection() {
    constructor(editor: FrontendEditorComponent, cell: LayoutableCell, pos: Int) : this(editor, cell, pos, pos)
    constructor(
        editor: FrontendEditorComponent,
        cell: LayoutableCell,
        pos: Int,
        desiredXPosition: Int?,
    ) : this(editor, cell, pos, pos, desiredXPosition)
    constructor(cell: LayoutableCell, pos: Int) : this(cell.cell.editorComponent, cell, pos, pos)
    constructor(cell: LayoutableCell, pos: Int, desiredXPosition: Int?) : this(cell.cell.editorComponent, cell, pos, pos, desiredXPosition)

    init {
        require(start >= 0) { "invalid start: $start" }
        require(end >= 0) { "invalid end: $start" }
    }

    fun getSelectedTextRange() = min(start, end) until max(start, end)

    override fun getSelectedCells(): List<ICellTree.Cell> = listOf(layoutable.cell)

    override fun isValid(): Boolean {
        val visibleText = editor.getRootCell().layout
        val ownText = layoutable.getLine()?.getText()
        return visibleText === ownText
    }

    private fun reResolveLayoutable(editor: FrontendEditorComponent): LayoutableCell? =
        layoutable.cell.cellReferences
            .asSequence()
            .mapNotNull { editor.resolveCell(it).firstOrNull() }
            .firstOrNull()
            ?.layoutable()

    override fun update(editor: FrontendEditorComponent): Selection? {
        val newLayoutable = reResolveLayoutable(editor) ?: return null
        val textLength = newLayoutable.getLength()
        return CaretSelection(editor, newLayoutable, start.coerceAtMost(textLength), end.coerceAtMost(textLength))
    }

    override suspend fun processKeyDown(event: JSKeyboardEvent): Boolean {
        val knownKey = event.knownKey
        when (knownKey) {
            KnownKeys.ArrowLeft -> {
                if (end > 0) {
                    if (event.modifiers.shift) {
                        editor.changeSelection(CaretSelection(editor, layoutable, start, end - 1))
                    } else {
                        editor.changeSelection(CaretSelection(editor, layoutable, end - 1))
                    }
                } else {
                    val previous =
                        layoutable
                            .getSiblingsInText(next = false)
                            .filterIsInstance<LayoutableCell>()
                            .find { it.cell.getSelectableText() != null }
                    if (previous != null) {
                        if (event.modifiers.shift) {
                            val commonAncestor = layoutable.cell.commonAncestor(previous.cell)
                            val selectableAncestor = commonAncestor.ancestors(true).filter { it.isSelectable() }.firstOrNull()
                            selectableAncestor?.let { editor.changeSelection(CellSelection(editor, it, true, this)) }
                        } else {
                            editor.changeSelection(CaretSelection(editor, previous, previous.cell.getMaxCaretPos()))
                        }
                    }
                }
            }

            KnownKeys.ArrowRight -> {
                if (end < (layoutable.cell.getSelectableText()?.length ?: 0)) {
                    if (event.modifiers.shift) {
                        editor.changeSelection(CaretSelection(editor, layoutable, start, end + 1))
                    } else {
                        editor.changeSelection(CaretSelection(editor, layoutable, end + 1))
                    }
                } else {
                    val next =
                        layoutable
                            .getSiblingsInText(next = true)
                            .filterIsInstance<LayoutableCell>()
                            .find { it.cell.getSelectableText() != null }
                    if (next != null) {
                        if (event.modifiers.shift) {
                            val commonAncestor = layoutable.cell.commonAncestor(next.cell)
                            val selectableAncestor = commonAncestor.ancestors(true).filter { it.isSelectable() }.firstOrNull()
                            selectableAncestor?.let { editor.changeSelection(CellSelection(editor, it, false, this)) }
                        } else {
                            editor.changeSelection(CaretSelection(editor, next, 0))
                        }
                    }
                }
            }

            KnownKeys.ArrowDown -> {
                selectNextPreviousLine(true)
            }

            KnownKeys.ArrowUp -> {
                if (event.modifiers.meta) {
                    layoutable.cell.let { editor.changeSelection(CellSelection(editor, it, true, this)) }
                } else {
                    selectNextPreviousLine(false)
                }
            }

            KnownKeys.Tab -> {
                editor.serviceCall { navigateTab(editor.editorId, layoutable.cell.getId(), forward = !event.modifiers.shift) }
            }

            KnownKeys.Delete, KnownKeys.Backspace -> {
                if (start == end) {
                    val posToDelete =
                        when (knownKey) {
                            KnownKeys.Delete -> end
                            KnownKeys.Backspace -> (end - 1)
                            else -> throw RuntimeException("Cannot happen")
                        }
                    val legalRange = 0 until (layoutable.cell.getSelectableText()?.length ?: 0)
                    if (legalRange.contains(posToDelete)) {
                        replaceText(posToDelete until posToDelete, "", editor, true)
                    } else {
                        val savedCaretPosition = SavedCaretPosition(layoutable.cell)
                        editor.serviceCall {
                            val updateData = executeDelete(editor.editorId, layoutable.cell.getId())
                            updateData.copy(
                                selectionChange = updateData.selectionChange ?: savedCaretPosition
                            )
                        }
                    }
                } else {
                    replaceText(min(start, end) until max(start, end), "", editor, true)
                }
            }

            KnownKeys.Enter -> {
                editor.serviceCall { executeInsert(editor.editorId, layoutable.cell.getId()) }
            }

            else -> {
                val typedText = event.typedText
                if (!typedText.isNullOrEmpty()) {
                    if (typedText == " " && event.modifiers.ctrl) {
                        editor.serviceCall { triggerCodeCompletion(editor.editorId, layoutable.cell.getId(), min(start, end)) }
                    } else {
                        editor.serviceCall { processTypedText(editor.editorId, layoutable.cell.getId(), getSelectedTextRange(), typedText) }
                    }
                }
            }
        }

        return true
    }

    suspend fun processTypedText(typedText: String) {
        editor.serviceCall { processTypedText(editor.editorId, layoutable.cell.getId(), getSelectedTextRange(), typedText) }
    }

    fun selectNextPreviousLine(next: Boolean) {
        createNextPreviousLineSelection(next, desiredXPosition ?: getAbsoluteX())
            ?.let { editor?.changeSelection(it) }
    }

    fun getAbsoluteX() = layoutable.getX() + end

    fun getTextBeforeCaret() = (layoutable.cell.getSelectableText() ?: "").substring(0, end)

    fun getCurrentCellText() = layoutable.cell.getSelectableText() ?: ""

    suspend fun replaceText(newText: String): Boolean = replaceText(0 until getCurrentCellText().length, newText, editor, false)

    private suspend fun replaceText(
        range: IntRange,
        replacement: String,
        editor: FrontendEditorComponent,
        triggerCompletion: Boolean,
    ): Boolean =
        editor
            .serviceCall {
                replaceText(editor.editorId, layoutable.cell.getId(), range, replacement, triggerCompletion)
            }.result

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || this::class != other::class) return false

        other as CaretSelection

        if (editor != other.editor) return false
        if (layoutable != other.layoutable) return false
        if (start != other.start) return false
        if (end != other.end) return false

        return true
    }

    override fun hashCode(): Int {
        var result = editor.hashCode()
        result = 31 * result + layoutable.hashCode()
        result = 31 * result + start
        result = 31 * result + end
        return result
    }

    override fun toString(): String {
        val text = layoutable.toText()
        return text.substring(0 until end) + "|" + text.substring(end)
    }

    private fun createNextPreviousLineSelection(
        next: Boolean,
        x: Int,
    ): CaretSelection? {
        val line: TextLine = layoutable.getLine() ?: return null
        val text: LayoutedText = line.getText() ?: return null
        val lines = text.lines.asSequence()
        val nextPrevLines =
            if (next) {
                lines.dropWhile { it != line }.drop(1)
            } else {
                lines
                    .takeWhile { it != line }
                    .toList()
                    .reversed()
                    .asSequence()
            }
        return nextPrevLines.mapNotNull { it.createBestMatchingCaretSelection(x) }.firstOrNull()
    }

    fun TextLine.createBestMatchingCaretSelection(x: Int): CaretSelection? {
        var currentOffset = 0
        for (layoutable in words) {
            val length = layoutable.getLength()
            val range = currentOffset..(currentOffset + length)
            if (layoutable is LayoutableCell) {
                if (x < range.first) return CaretSelection(editor, layoutable, 0, desiredXPosition = x)
                if (range.contains(
                        x
                    )
                ) {
                    return CaretSelection(
                        editor,
                        layoutable,
                        (x - range.first).coerceAtMost(layoutable.cell.getMaxCaretPos()),
                        desiredXPosition = x
                    )
                }
            }
            currentOffset += length
        }
        return words.filterIsInstance<LayoutableCell>().lastOrNull()?.let {
            CaretSelection(editor, it, it.cell.getMaxCaretPos(), desiredXPosition = x)
        }
    }
}
