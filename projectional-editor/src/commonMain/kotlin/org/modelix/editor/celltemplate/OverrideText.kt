package org.modelix.editor.celltemplate

import org.modelix.editor.CellTreeState
import org.modelix.editor.ITextChangeAction
import org.modelix.editor.TextCellSpec

class OverrideText(val cell: TextCellSpec, val delegate: ITextChangeAction?) : ITextChangeAction {
    override fun isValid(value: String?): Boolean {
        return true
    }

    override fun replaceText(editor: CellTreeState, range: IntRange, replacement: String, newText: String): Boolean {
        val cellRef = cell.cellReferences.first()
        if (delegate != null && delegate.isValid(newText)) {
            editor.textReplacements.remove(cellRef)
            return delegate.replaceText(editor, range, replacement, newText)
        }

        if (cell.text == newText) {
            editor.textReplacements.remove(cellRef)
        } else {
            editor.textReplacements[cellRef] = newText
        }
        return true
    }
}
