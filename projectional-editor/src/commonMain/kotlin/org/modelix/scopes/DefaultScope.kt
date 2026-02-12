package org.modelix.scopes

import org.modelix.editor.INonExistingNode
import org.modelix.editor.toNonExisting
import org.modelix.model.api.IReferenceLink
import org.modelix.model.api.getDescendants
import org.modelix.model.api.getRoot
import org.modelix.model.api.isInstanceOfSafe

class DefaultScope : IScope {
    override fun getVisibleElements(
        node: INonExistingNode,
        link: IReferenceLink,
    ): List<INonExistingNode> {
        // TODO performance
        val targetConcept = link.targetConcept
        return (node.getExistingAncestor() ?: return emptyList())
            .getRoot()
            .getDescendants(true)
            .filter { it.isInstanceOfSafe(targetConcept) }
            .map { it.toNonExisting() }
            .toList()
    }
}
