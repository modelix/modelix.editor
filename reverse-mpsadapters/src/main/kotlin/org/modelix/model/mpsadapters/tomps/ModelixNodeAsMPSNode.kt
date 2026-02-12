package org.modelix.model.mpsadapters.tomps

import jetbrains.mps.smodel.SNodeUtil
import org.jetbrains.mps.openapi.language.SAbstractConcept
import org.jetbrains.mps.openapi.language.SConcept
import org.jetbrains.mps.openapi.language.SContainmentLink
import org.jetbrains.mps.openapi.language.SProperty
import org.jetbrains.mps.openapi.language.SReferenceLink
import org.jetbrains.mps.openapi.model.ResolveInfo
import org.jetbrains.mps.openapi.model.SModel
import org.jetbrains.mps.openapi.model.SModelReference
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.model.SNodeId
import org.jetbrains.mps.openapi.model.SNodeReference
import org.jetbrains.mps.openapi.model.SReference
import org.modelix.model.api.IChildLinkReference
import org.modelix.model.api.INode
import org.modelix.model.api.IPropertyReference
import org.modelix.model.api.IReadableNode
import org.modelix.model.api.IReferenceLinkReference
import org.modelix.model.api.IWritableNode
import org.modelix.model.api.NullChildLinkReference
import org.modelix.model.api.remove
import org.modelix.model.mpsadapters.MPSChildLink
import org.modelix.model.mpsadapters.MPSConcept
import org.modelix.model.mpsadapters.MPSNode
import org.modelix.model.mpsadapters.MPSProperty
import org.modelix.model.mpsadapters.MPSReferenceLink
import org.modelix.model.mpsadapters.MPSWritableNode

data class ModelixNodeAsMPSNode(
    val node: IReadableNode,
) : SNode {
    companion object {
        @JvmStatic
        fun toModelixNode(node: SNode): INode =
            when (node) {
                is ModelixNodeAsMPSNode -> node.node.asLegacyNode()
                else -> MPSNode(node)
            }

        @JvmStatic
        @JvmName("toModelixNodeNullable")
        fun toModelixNode(node: SNode?): INode? =
            when (node) {
                null -> null
                is ModelixNodeAsMPSNode -> node.node.asLegacyNode()
                else -> MPSNode(node)
            }

        @JvmStatic
        fun toMPSNode(node: INode): SNode = ModelixNodeAsMPSNode(node.asWritableNode())

        @JvmStatic
        @JvmName("toMPSNodeNullable")
        fun toMPSNode(node: INode?): SNode? {
            if (node == null) return null
            return ModelixNodeAsMPSNode(node.asWritableNode())
        }

        @JvmStatic
        fun toMPSNode(node: IReadableNode): SNode = ModelixNodeAsMPSNode(node)

        @JvmStatic
        @JvmName("toMPSNodeNullable")
        fun toMPSNode(node: IReadableNode?): SNode? {
            if (node == null) return null
            return ModelixNodeAsMPSNode(node)
        }

        @JvmStatic
        fun ensureIsTracked(node: SNode): SNode =
            when (node) {
                is ModelixNodeAsMPSNode -> node
                else -> ModelixNodeAsMPSNode(MPSWritableNode(node))
            }

        @JvmStatic
        @JvmName("ensureIsTrackedNullable")
        fun ensureIsTracked(node: SNode?): SNode? = if (node == null) null else ensureIsTracked(node)

        private fun unwrapMPSNode(node: SNode): SNode =
            ((node as? ModelixNodeAsMPSNode)?.node as? MPSWritableNode)?.node
                ?: node

        private fun forceUnwrapMPSNode(node: SNode): SNode =
            if (node is ModelixNodeAsMPSNode) {
                val writableNode = node.node
                if (writableNode is MPSWritableNode) {
                    writableNode.node
                } else {
                    throw UnsupportedOperationException("Not an MPS node: $node")
                }
            } else {
                node
            }
    }

    constructor(node: INode) : this(node.asReadableNode())

    private val writableNode: IWritableNode get() = node as IWritableNode

    override fun addChild(
        link: SContainmentLink,
        newChild: SNode,
    ) {
        forceUnwrapMPSNode(this).addChild(link, forceUnwrapMPSNode(newChild))
    }

    override fun getModel(): SModel? = forceUnwrapMPSNode(this).model

    override fun getNodeId(): SNodeId = forceUnwrapMPSNode(this).nodeId

    override fun getReference(): SNodeReference = forceUnwrapMPSNode(this).reference

    override fun getReference(link: SReferenceLink): SReference? =
        ReferenceAdapter(link).takeIf {
            node.getReferenceTarget(MPSReferenceLink(link).toReference()) != null
        }

    @Suppress("removal")
    override fun getReference(p0: String?): SReference {
        TODO("Not yet implemented")
    }

    override fun getConcept(): SConcept {
        val concept = node.getConcept()
        if (concept is MPSConcept) return concept.concept as SConcept
        return jetbrains.mps.smodel.SNodeUtil.concept_BaseConcept
    }

    override fun isInstanceOfConcept(superConcept: SAbstractConcept): Boolean = node.getConcept().isSubConceptOf(MPSConcept(superConcept))

    override fun getPresentation(): String {
        TODO("Not yet implemented")
    }

    override fun getName(): String? = getProperty(SNodeUtil.property_INamedConcept_name)

    @Suppress("removal")
    override fun addChild(
        role: String?,
        newChild: SNode?,
    ) {
        TODO("Not yet implemented")
    }

    override fun insertChildBefore(
        link: SContainmentLink,
        newChild: SNode,
        anchor: SNode?,
    ) {
        forceUnwrapMPSNode(this).insertChildBefore(link, forceUnwrapMPSNode(newChild), anchor?.let { forceUnwrapMPSNode(it) })
    }

    @Suppress("removal")
    override fun insertChildBefore(
        role: String,
        p1: SNode,
        p2: SNode?,
    ) {
        TODO("Not yet implemented")
    }

    override fun insertChildAfter(
        link: SContainmentLink,
        newChild: SNode,
        anchor: SNode?,
    ) {
        forceUnwrapMPSNode(this).insertChildAfter(link, forceUnwrapMPSNode(newChild), anchor?.let { forceUnwrapMPSNode(it) })
    }

    override fun removeChild(child: SNode) {
        writableNode.removeChild(toModelixNode(child).asWritableNode())
    }

    override fun delete() {
        writableNode.remove()
    }

    override fun getParent(): SNode? = node.getParent()?.let { ModelixNodeAsMPSNode(it) }

    override fun getContainingRoot(): SNode = parent?.containingRoot ?: this

    override fun getContainmentLink(): SContainmentLink? = (node.getContainmentLink() as? MPSChildLink)?.link

    override fun getFirstChild(): SNode? = node.getAllChildren().firstOrNull()?.let { ModelixNodeAsMPSNode(it) }

    override fun getLastChild(): SNode? = node.getAllChildren().lastOrNull()?.let { ModelixNodeAsMPSNode(it) }

    override fun getPrevSibling(): SNode? {
        val siblings = node.getParent()?.getAllChildren()?.toList() ?: return null
        val index = siblings.indexOf(node)
        return siblings.getOrNull(index - 1)?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getNextSibling(): SNode? {
        val siblings = node.getParent()?.getAllChildren()?.toList() ?: return null
        val index = siblings.indexOf(node)
        return siblings.getOrNull(index + 1)?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getChildren(link: SContainmentLink?): MutableIterable<SNode> =
        node
            .getChildren(link?.let { MPSChildLink(it).toReference() } ?: NullChildLinkReference)
            .map { ModelixNodeAsMPSNode(it) }
            .toMutableList()

    override fun getChildren(): MutableIterable<SNode> =
        node
            .getAllChildren()
            .map { ModelixNodeAsMPSNode(it) }
            .toMutableList()

    @Suppress("removal")
    override fun getChildren(role: String?): MutableIterable<SNode> {
        requireNotNull(role)
        return node.getChildren(IChildLinkReference.fromName(role)).wrap().toMutableList()
    }

    override fun setReferenceTarget(
        role: SReferenceLink,
        target: SNode?,
    ) {
        writableNode.setReferenceTarget(MPSReferenceLink(role).toReference(), target?.let { toModelixNode(it).asWritableNode() })
    }

    @Suppress("removal")
    override fun setReferenceTarget(
        role: String?,
        target: SNode?,
    ) {
        requireNotNull(role)
        writableNode.setReferenceTarget(IReferenceLinkReference.fromName(role), target?.let { toModelixNode(it).asWritableNode() })
    }

    override fun setReference(
        p0: SReferenceLink,
        p1: ResolveInfo?,
    ) {
        TODO("Not yet implemented")
    }

    override fun setReference(
        p0: SReferenceLink,
        p1: SNodeReference,
    ) {
        TODO("Not yet implemented")
    }

    override fun setReference(
        p0: SReferenceLink,
        p1: SReference?,
    ) {
        TODO("Not yet implemented")
    }

    @Suppress("removal")
    override fun setReference(
        role: String?,
        reference: SReference?,
    ) {
        TODO("Not yet implemented")
    }

    override fun getReferenceTarget(link: SReferenceLink): SNode? = node.getReferenceTarget(MPSReferenceLink(link).toReference()).wrap()

    @Suppress("removal")
    override fun getReferenceTarget(role: String?): SNode? {
        if (role == null) return null
        return node.getReferenceTarget(IReferenceLinkReference.fromName(role)).wrap()
    }

    override fun dropReference(link: SReferenceLink) {
        writableNode.setReferenceTargetRef(MPSReferenceLink(link).toReference(), null)
    }

    override fun getReferences(): MutableIterable<SReference> =
        node
            .getReferenceLinks()
            .mapNotNull { MPSReferenceLink.tryFromReference(it) }
            .map { ReferenceAdapter(it.link) }
            .toMutableList()

    override fun getProperties(): MutableIterable<SProperty> =
        node
            .getPropertyLinks()
            .mapNotNull { MPSProperty.tryFromReference(it) }
            .map { it.property }
            .toMutableList()

    override fun hasProperty(role: SProperty): Boolean =
        node
            .getPropertyLinks()
            .mapNotNull { MPSProperty.tryFromReference(it) }
            .any { it.property == role }

    @Suppress("removal")
    override fun hasProperty(p0: String?): Boolean {
        TODO("Not yet implemented")
    }

    override fun getProperty(role: SProperty): String? = node.getPropertyValue(MPSProperty(role).toReference())

    @Suppress("removal")
    override fun getProperty(role: String?): String? {
        if (role == null) return null
        return node.getPropertyValue(IPropertyReference.fromName(role))
    }

    override fun setProperty(
        role: SProperty,
        value: String?,
    ) {
        writableNode.setPropertyValue(MPSProperty(role).toReference(), value)
    }

    @Suppress("removal")
    override fun setProperty(
        role: String?,
        value: String?,
    ) {
        requireNotNull(role)
        writableNode.setPropertyValue(IPropertyReference.fromName(role), value)
    }

    override fun getUserObject(key: Any?): Any? = null

    override fun putUserObject(
        key: Any?,
        value: Any?,
    ) {
        TODO("Not yet implemented")
    }

    override fun getUserObjectKeys(): MutableIterable<Any> = mutableListOf()

    override fun getRoleInParent(): String? = containmentLink?.name

    override fun getPropertyNames(): MutableIterable<String> = properties.map { it.name }.toMutableList()

    @JvmName("wrapNode")
    private fun IReadableNode.wrap(): ModelixNodeAsMPSNode = ModelixNodeAsMPSNode(this)

    @Suppress("SimpleRedundantLet")
    @JvmName("wrapNodeNullable")
    private fun IReadableNode?.wrap(): ModelixNodeAsMPSNode? = this?.let { it.wrap() }

    @JvmName("wrapNodes")
    private fun Iterable<IReadableNode>.wrap(): List<ModelixNodeAsMPSNode> = map { it.wrap() }

    inner class ReferenceAdapter(
        private val link: SReferenceLink,
    ) : SReference {
        override fun getLink(): SReferenceLink = link

        override fun getSourceNode(): SNode = this@ModelixNodeAsMPSNode

        override fun getTargetNode(): SNode? = getReferenceTarget(link)

        override fun getTargetNodeReference(): SNodeReference? = targetNode?.reference

        override fun getTargetSModelReference(): SModelReference? = targetNode?.reference?.modelReference

        override fun getTargetNodeId(): SNodeId? = targetNodeReference?.nodeId
    }
}
