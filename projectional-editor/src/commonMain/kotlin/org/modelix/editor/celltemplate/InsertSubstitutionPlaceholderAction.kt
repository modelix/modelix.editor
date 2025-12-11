package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellTreeState
import org.modelix.editor.ICellAction
import org.modelix.editor.PlaceholderCellReference
import org.modelix.editor.SubstitutionPlaceholderPosition
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.text.backend.BackendEditorComponent

class InsertSubstitutionPlaceholderAction(
    val cellTreeState: CellTreeState,
    val ref: TemplateCellReference,
    val index: Int,
) : ICellAction {
    override fun isApplicable(): Boolean = true

    override fun execute(editor: BackendEditorComponent): CaretPositionPolicy {
        cellTreeState.substitutionPlaceholderPositions[ref] = SubstitutionPlaceholderPosition(index)
        cellTreeState.textReplacements.remove(PlaceholderCellReference(ref))
        return CaretPositionPolicy(PlaceholderCellReference(ref))
    }
}
