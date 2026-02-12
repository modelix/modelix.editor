package org.modelix.editor

import org.modelix.editor.text.shared.celltree.BackendCellTree
import org.modelix.editor.text.shared.celltree.cellReferences
import org.modelix.incremental.TrackableMap

class CellTreeState {
    val cellTree = BackendCellTree()
    val substitutionPlaceholderPositions = TrackableMap<TemplateCellReference, SubstitutionPlaceholderPosition>()
    val forceShowOptionals = TrackableMap<TemplateCellReference, Boolean>()
    val textReplacements = TrackableMap<CellReference, String>()

    fun reset() {
        substitutionPlaceholderPositions.clear()
        forceShowOptionals.clear()
        textReplacements.clear()
    }

    fun clearTextReplacement(cell: Cell): Unit = cell.cellReferences.forEach { clearTextReplacement(it) }

    fun clearTextReplacement(cell: CellReference): Unit = textReplacements.remove(cell)
}

class SubstitutionPlaceholderPosition(
    val index: Int,
)
