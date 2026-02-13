package org.modelix.editor

import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.frontend.layout
import org.modelix.editor.text.shared.celltree.cellReferences

data class CellSelection(
    val editor: FrontendEditorComponent,
    val cell: Cell,
    val directionLeft: Boolean,
    val previousSelection: Selection?,
) : Selection() {
    override fun getSelectedCells(): List<Cell> = listOf(cell)

    override fun isValid(): Boolean = cell.isAttached()

    override fun update(editor: FrontendEditorComponent): Selection? =
        cell.cellReferences
            .asSequence()
            .flatMap { editor.resolveCell(it) }
            .map { CellSelection(editor, it, directionLeft, previousSelection?.update(editor)) }
            .firstOrNull()

    override suspend fun processKeyDown(event: JSKeyboardEvent): Boolean {
        when (event.knownKey) {
            KnownKeys.ArrowUp -> {
                if (event.modifiers.meta) {
                    cell
                        .ancestors()
                        .firstOrNull { it.getProperty(CommonCellProperties.selectable) }
                        ?.let { editor.doChangeSelection(CellSelection(editor, it, directionLeft, this)) }
                } else {
                    unwrapCaretSelection()?.selectNextPreviousLine(false)
                }
            }

            KnownKeys.ArrowDown -> {
                if (event.modifiers == Modifiers.META && previousSelection != null) {
                    editor.doChangeSelection(previousSelection)
                } else {
                    unwrapCaretSelection()?.selectNextPreviousLine(true)
                }
            }

            KnownKeys.ArrowLeft, KnownKeys.ArrowRight -> {
                if (event.modifiers == Modifiers.SHIFT) {
                    val isLeft = event.knownKey == KnownKeys.ArrowLeft
                    if (isLeft == directionLeft) {
                        cell
                            .ancestors()
                            .firstOrNull { it.isSelectable() }
                            ?.let { editor.doChangeSelection(CellSelection(editor, it, directionLeft, this)) }
                    } else {
                        previousSelection?.let { editor.doChangeSelection(it) }
                    }
                } else {
                    val caretSelection = unwrapCaretSelection()
                    if (caretSelection != null) {
                        editor.doChangeSelection(CaretSelection(editor, caretSelection.layoutable, caretSelection.start))
                    } else {
                        val tabTargets = cell.descendantsAndSelf().filter { it.isTabTarget() }
                        if (event.knownKey == KnownKeys.ArrowLeft) {
                            tabTargets
                                .firstOrNull()
                                ?.layoutable()
                                ?.let { editor.doChangeSelection(CaretSelection(editor, it, 0)) }
                        } else {
                            tabTargets
                                .lastOrNull()
                                ?.layoutable()
                                ?.let { editor.doChangeSelection(CaretSelection(editor, it, it.cell.getSelectableText()?.length ?: 0)) }
                        }
                    }
                }
            }

            else -> {
                val typedText = event.typedText
                if (!typedText.isNullOrEmpty()) {
                    val anchor = getLayoutables().filterIsInstance<LayoutableCell>().firstOrNull()
                    if (anchor != null) {
                        if (typedText == " " && event.modifiers == Modifiers.CTRL) {
                            editor.serviceCall { triggerCodeCompletion(editor.editorId, anchor.cell.getId(), 0) }
                        } else {
                            editor.serviceCall { triggerCodeCompletion(editor.editorId, anchor.cell.getId(), typedText.length) }
                        }
                    }
                }
            }
        }

        return true
    }

    private fun unwrapCaretSelection(): CaretSelection? =
        generateSequence<Selection>(this) { (it as? CellSelection)?.previousSelection }
            .lastOrNull() as? CaretSelection

    fun getLayoutables(): List<Layoutable> {
        val rootText = editor.getRootCell().layout
        return cell.layout.lines
            .asSequence()
            .flatMap { it.words }
            .filter { it.getLine()?.getText() === rootText }
            .toList()
    }
}
