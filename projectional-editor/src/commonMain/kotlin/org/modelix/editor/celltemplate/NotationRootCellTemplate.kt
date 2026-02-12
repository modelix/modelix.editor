package org.modelix.editor.celltemplate

import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpec
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode

class NotationRootCellTemplate(
    concept: IConcept,
) : CellTemplate(concept) {
    var condition: ((INode) -> Boolean)? = null

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ) = CellSpec()
}
