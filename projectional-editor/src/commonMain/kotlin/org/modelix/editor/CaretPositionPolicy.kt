package org.modelix.editor

import kotlinx.serialization.Serializable
import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.editor.text.shared.celltree.cellReferences
import org.modelix.model.api.INode

@Serializable
sealed interface ICaretPositionPolicy {
    fun getBestSelection(editor: FrontendEditorComponent): CaretSelection?
}

@Serializable
data class CaretPositionPolicyWithIndex(val policy: ICaretPositionPolicy, val index: Int) : ICaretPositionPolicy {
    constructor(cellReference: CellReference, index: Int) : this(setOf(cellReference), index)
    constructor(cellReferences: Set<CellReference>, index: Int) : this(
        CaretPositionPolicy(
            avoidedCellRefs = emptySet(),
            preferredCellRefs = cellReferences
        ),
        index
    )

    override fun getBestSelection(editor: FrontendEditorComponent): CaretSelection? {
        return policy.getBestSelection(editor)?.let {
            val expectedPos = if (index < 0) it.layoutable.getMaxCaretPos() + index + 1 else index
            if (it.end != expectedPos) CaretSelection(editor, it.layoutable, expectedPos) else it
        }
    }
}

@Serializable
data class CaretPositionPolicy(
    private val avoidedCellRefs: Set<CellReference>,
    private val preferredCellRefs: Set<CellReference>,
) : ICaretPositionPolicy {
    constructor(preferredCellRef: CellReference) : this(emptySet(), setOf(preferredCellRef))
    constructor(preferredNode: INode) : this(NodeCellReference(preferredNode.reference))

    fun prefer(cellReference: CellReference) = copy(preferredCellRefs = preferredCellRefs + cellReference)
    fun avoid(cellReference: CellReference) = copy(avoidedCellRefs = avoidedCellRefs + cellReference)

    fun merge(other: CaretPositionPolicy) = CaretPositionPolicy(
        avoidedCellRefs + other.avoidedCellRefs,
        preferredCellRefs + other.preferredCellRefs,
    )

    override fun getBestSelection(editor: FrontendEditorComponent): CaretSelection? {
        val candidates = preferredCellRefs
            .flatMap { editor.cellTree.resolveCell(it) }
            .flatMap { it.descendantsAndSelf() }
            .mapNotNull { editor.resolveLayoutable(it) }

        val best = candidates
            .sortedByDescending { it.cell.isTabTarget() }
            .sortedBy { it.cell.ancestors(true).filter { isAvoided(it) }.count() }
            .firstOrNull() ?: return null

        return CaretSelection(editor, best, (best.cell.getSelectableText() ?: "").length)
    }

    private fun isAvoided(cell: ICellTree.Cell) = cell.cellReferences.intersect(avoidedCellRefs).isNotEmpty()
}

enum class CaretPositionType {
    START,
    END,
}

@Serializable
data class SavedCaretPosition(
    val previousLeafs: Set<CellReference>,
    val nextLeafs: Set<CellReference>,
    val selectedCell: CellReference?,
) : ICaretPositionPolicy {
    constructor(selectedCell: ICellTree.Cell) : this(
        selectedCell.previousLeafs(false).mapNotNull { it.cellReferences.firstOrNull() }.toSet(),
        selectedCell.nextLeafs(false).mapNotNull { it.cellReferences.firstOrNull() }.toSet(),
        selectedCell.cellReferences.firstOrNull(),
    )

    override fun getBestSelection(editor: FrontendEditorComponent): CaretSelection? {
        if (selectedCell != null) {
            val resolvedCell = editor.resolveCell(selectedCell).firstOrNull()?.layoutable()
            if (resolvedCell != null) {
                return CaretSelection(editor, resolvedCell, resolvedCell.getMaxCaretPos())
            }
        }

        val leftCell = previousLeafs.asSequence().flatMap { editor.resolveCell(it) }.firstOrNull()
        val rightCell = nextLeafs.asSequence().flatMap { editor.resolveCell(it) }.firstOrNull()
        if (leftCell != null && rightCell != null) {
            val centerCells = leftCell.nextLeafs(false).takeWhile { it != rightCell }.mapNotNull { it.layoutable() }
            val lastCell = centerCells.lastOrNull()
            if (lastCell != null) {
                return CaretSelection(editor, lastCell, lastCell.getMaxCaretPos())
            }
        }

        if (leftCell != null) {
            val layoutable = leftCell.layoutable()
            if (layoutable != null) {
                return CaretSelection(editor, layoutable, layoutable.getMaxCaretPos())
            }
        }

        if (rightCell != null) {
            val layoutable = rightCell.layoutable()
            if (layoutable != null) {
                return CaretSelection(editor, layoutable, 0)
            }
        }

        return null
    }

    companion object {
        fun saveAndRun(editor: FrontendEditorComponent, body: () -> Unit): SavedCaretPosition? {
            val savedCaretPosition = editor.getSelection()?.getSelectedCells()?.firstOrNull()?.let { SavedCaretPosition(it) }
            body()
            return savedCaretPosition
        }
    }
}
