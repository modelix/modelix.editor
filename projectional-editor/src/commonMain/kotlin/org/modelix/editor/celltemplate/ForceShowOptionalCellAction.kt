package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICellAction
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.text.backend.BackendEditorComponent

class ForceShowOptionalCellAction(val cell: TemplateCellReference) : ICodeCompletionAction, ICellAction {
    override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy {
        editor.state.forceShowOptionals[cell] = true
        return CaretPositionPolicy(cell)
    }

    override fun getMatchingText(): String {
        return ""
    }

    override fun getDescription(): String {
        return "Add optional part"
    }

    override fun isApplicable(): Boolean {
        return true
    }
}
