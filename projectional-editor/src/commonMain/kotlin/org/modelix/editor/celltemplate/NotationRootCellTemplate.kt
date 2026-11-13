package org.modelix.editor.celltemplate

import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpec
import org.modelix.editor.Precedence
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode

class NotationRootCellTemplate(
    concept: IConcept,
) : CellTemplate(concept) {
    var condition: ((INode) -> Boolean)? = null

    /**
     * How tightly the notation binds the nodes written next to it, if it is the notation of an operator.
     */
    var precedence: Precedence? = null

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ) = CellSpec()
}
