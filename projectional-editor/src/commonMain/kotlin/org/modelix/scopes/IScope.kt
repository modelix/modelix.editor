package org.modelix.scopes

import org.modelix.editor.INonExistingNode
import org.modelix.model.api.IReferenceLink

interface IScope {
    fun getVisibleElements(
        node: INonExistingNode,
        link: IReferenceLink,
    ): List<INonExistingNode>
}
