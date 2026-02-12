package org.modelix.editor

import org.modelix.model.api.IChildLink
import org.modelix.model.api.IChildLinkDefinition
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IReadableNode
import org.modelix.model.api.NullChildLinkReference
import org.modelix.model.api.index
import org.modelix.model.api.isInstanceOf
import org.modelix.model.api.remove
import org.modelix.model.api.tryResolveChildLink
import org.modelix.model.api.upcast

interface INonExistingNode {
    fun getExistingAncestor(): INode?

    fun getParent(): INonExistingNode?

    fun getContainmentLink(): IChildLinkDefinition?

    fun index(): Int

    fun replaceNode(subConcept: IConcept?): INode

    fun getOrCreateNode(subConcept: IConcept? = null): INode

    fun getNode(): INode?

    fun expectedConcept(): IConcept?

    /**
     * How many levels of nodes are created by getOrCreateNode().
     */
    fun nodeCreationDepth(): Int
}

fun INonExistingNode.ancestors(includeSelf: Boolean = false): Sequence<INonExistingNode> =
    generateSequence(if (includeSelf) this else getParent()) {
        it.getParent()
    }

fun INonExistingNode.commonAncestor(otherNode: INonExistingNode): INonExistingNode? {
    val ancestors1 = HashSet<INonExistingNode>()
    val ancestors2 = HashSet<INonExistingNode>()

    for (ancestorPair in ancestors(true).zip(otherNode.ancestors(true))) {
        ancestors1.add(ancestorPair.first)
        ancestors2.add(ancestorPair.second)
        if (ancestors1.contains(ancestorPair.second)) return ancestorPair.second
        if (ancestors2.contains(ancestorPair.first)) return ancestorPair.first
    }
    return null
}

data class NodeReplacement(
    val nodeToReplace: INonExistingNode,
    val replacementConcept: IConcept,
) : INonExistingNode {
    override fun getExistingAncestor(): INode? = nodeToReplace.getExistingAncestor()

    override fun getParent(): INonExistingNode? = nodeToReplace.getParent()

    override fun getContainmentLink(): IChildLinkDefinition? = nodeToReplace.getContainmentLink()

    override fun index(): Int = nodeToReplace.index()

    override fun replaceNode(subConcept: IConcept?): INode = nodeToReplace.replaceNode(coerceOutputConcept(subConcept))

    override fun getOrCreateNode(subConcept: IConcept?): INode = replaceNode(subConcept)

    override fun nodeCreationDepth(): Int = nodeToReplace.nodeCreationDepth().coerceAtLeast(1)

    override fun getNode(): INode? = null

    override fun expectedConcept(): IConcept = replacementConcept
}

fun INonExistingNode.replacement(newConcept: IConcept): INonExistingNode = NodeReplacement(this, newConcept)

fun INonExistingNode.coerceOutputConcept(subConcept: IConcept?): IConcept? {
    val expectedConcept = expectedConcept()
    return if (subConcept != null) {
        require(subConcept.isSubConceptOf(expectedConcept)) {
            "$subConcept is not a sub-concept of $expectedConcept"
        }
        subConcept
    } else {
        expectedConcept
    }
}

data class ExistingNode(
    private val node: INode,
) : INonExistingNode {
    override fun getExistingAncestor(): INode = node

    override fun getParent(): INonExistingNode? = node.parent?.let { ExistingNode(it) }

    override fun getContainmentLink() = node.asWritableNode().getContainmentLinkDefinition()

    override fun index() = node.index()

    override fun replaceNode(subConcept: IConcept?): INode {
        val parent = node.parent ?: throw RuntimeException("cannot replace the root node")
        val newNode =
            parent.asWritableNode().addNewChild(
                node.asWritableNode().getContainmentLink(),
                node.index(),
                coerceOutputConcept(subConcept)?.getReference().upcast()
            )
        node.remove()
        return newNode.asLegacyNode()
    }

    override fun getOrCreateNode(subConcept: IConcept?): INode =
        if (subConcept == null || node.isInstanceOf(coerceOutputConcept(subConcept))) {
            node
        } else {
            replaceNode(subConcept)
        }

    override fun nodeCreationDepth(): Int = 0

    override fun getNode(): INode = node

    override fun expectedConcept(): IConcept? = node.asWritableNode().getContainmentLinkDefinition()?.targetConcept
}

fun INode.toNonExisting() = ExistingNode(this)

data class NonExistingChild(
    private val parent: INonExistingNode,
    val link: IChildLink,
    private val index: Int = 0,
) : INonExistingNode {
    override fun getExistingAncestor(): INode? = parent.getExistingAncestor()

    override fun getParent() = parent

    override fun getContainmentLink() = link

    override fun index(): Int = index

    override fun replaceNode(subConcept: IConcept?): INode {
        val parentNode = parent.getOrCreateNode(null)
        val newNode = parentNode.addNewChild(link, index, coerceOutputConcept(subConcept))
        return newNode
    }

    override fun getOrCreateNode(subConcept: IConcept?): INode = replaceNode(subConcept)

    override fun nodeCreationDepth(): Int = parent.nodeCreationDepth() + 1

    override fun getNode(): INode? = null

    override fun expectedConcept(): IConcept = link.targetConcept
}

data class NonExistingNode(
    val concept: IConcept,
) : INonExistingNode {
    override fun getExistingAncestor(): INode? = null

    override fun getParent() = null

    override fun getContainmentLink() = null

    override fun index(): Int = 0

    override fun replaceNode(subConcept: IConcept?): INode = throw UnsupportedOperationException("Don't know where to create the node")

    override fun getOrCreateNode(subConcept: IConcept?): INode = replaceNode(subConcept)

    override fun nodeCreationDepth(): Int = 0

    override fun getNode(): INode? = null

    override fun expectedConcept(): IConcept = concept
}

fun IReadableNode.getContainmentLinkDefinition(): IChildLinkDefinition? {
    val linkRef = getContainmentLink()
    if (linkRef is NullChildLinkReference) return null
    val parentConcept = (getParent() ?: return null).getConcept()
    return checkNotNull(parentConcept.tryResolveChildLink(linkRef)) {
        "Link $linkRef not found in $parentConcept"
    }
}
