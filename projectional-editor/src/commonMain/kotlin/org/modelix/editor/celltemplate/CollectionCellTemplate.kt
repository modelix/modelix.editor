package org.modelix.editor.celltemplate

import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpec
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode

class CollectionCellTemplate(
    concept: IConcept,
) : CellTemplate(concept) {
    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ) = CellSpec()
}
