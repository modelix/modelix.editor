package org.modelix.scopes

import org.modelix.editor.INonExistingNode
import org.modelix.model.api.IReferenceLink

class EmptyScope : IScope {
    override fun getVisibleElements(
        node: INonExistingNode,
        link: IReferenceLink,
    ): List<INonExistingNode> = emptyList()
}
