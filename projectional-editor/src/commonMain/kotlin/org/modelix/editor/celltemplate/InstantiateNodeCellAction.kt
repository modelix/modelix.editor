package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.ICellAction
import org.modelix.editor.INonExistingNode
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.model.api.IConcept

class InstantiateNodeCellAction(
    val location: INonExistingNode,
    val concept: IConcept,
) : ICellAction {
    override fun isApplicable(): Boolean = true

    override fun execute(editor: BackendEditorComponent): CaretPositionPolicy {
        val newNode =
            location.getExistingAncestor()!!.getArea().executeWrite {
                location.replaceNode(concept)
            }
        return CaretPositionPolicy(newNode)
    }
}
