package org.modelix.model.mpsadapters.tomps

import jetbrains.mps.smodel.SNodeUtil
import org.jetbrains.mps.openapi.language.SAbstractConcept
import org.jetbrains.mps.openapi.language.SConcept
import org.jetbrains.mps.openapi.language.SContainmentLink
import org.jetbrains.mps.openapi.language.SProperty
import org.jetbrains.mps.openapi.language.SReferenceLink
import org.jetbrains.mps.openapi.model.SModelReference
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.model.SNodeId
import org.jetbrains.mps.openapi.model.SNodeReference
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.IChildLinkReference
import org.modelix.model.api.INode
import org.modelix.model.api.IPropertyReference
import org.modelix.model.api.IReadableNode
import org.modelix.model.api.IReferenceLinkReference
import org.modelix.model.api.IWritableNode
import org.modelix.model.api.NullChildLinkReference
import org.modelix.model.api.remove
import org.modelix.model.api.resolve
import org.modelix.model.mpsadapters.MPSChildLink
import org.modelix.model.mpsadapters.MPSConcept
import org.modelix.model.mpsadapters.MPSNode
import org.modelix.model.mpsadapters.MPSProperty
import org.modelix.model.mpsadapters.MPSReferenceLink
import org.modelix.model.mpsadapters.MPSWritableNode

data class ModelixNodeAsMPSNode(
    val node: IReadableNode,
) : SNodeBase() {
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
        fun toMPSNode(node: INode): SNode = getInstance(node.asWritableNode())

        @JvmStatic
        @JvmName("toMPSNodeNullable")
        fun toMPSNode(node: INode?): SNode? {
            if (node == null) return null
            return getInstance(node.asWritableNode())
        }

        @JvmStatic
        fun toMPSNode(node: IReadableNode): SNode = getInstance(node)

        @JvmStatic
        @JvmName("toMPSNodeNullable")
        fun toMPSNode(node: IReadableNode?): SNode? {
            if (node == null) return null
            return getInstance(node)
        }

        @JvmStatic
        fun ensureIsTracked(node: SNode): SNode =
            when (node) {
                is ModelixNodeAsMPSNode -> node
                else -> getInstance(MPSWritableNode(node))
            }

        private val instances = java.util.WeakHashMap<IReadableNode, java.lang.ref.WeakReference<ModelixNodeAsMPSNode>>()

        /**
         * Instances are cached so that MPS code can compare nodes by reference identity, which rules typically use
         * to skip the checked node when iterating its siblings (`it != node`).
         */
        private fun getInstance(node: IReadableNode): ModelixNodeAsMPSNode =
            synchronized(instances) {
                instances[node]?.get()
                    ?: ModelixNodeAsMPSNode(node).also { instances[node] = java.lang.ref.WeakReference(it) }
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

    override fun getModel(): org.jetbrains.mps.openapi.model.SModel? =
        forceUnwrapMPSNode(this).model?.let {
            ModelixModelAsMPSModel.getInstance(it)
        }

    override fun getNodeId(): SNodeId = forceUnwrapMPSNode(this).nodeId

    override fun getReference(): SNodeReference = forceUnwrapMPSNode(this).reference

    override fun getReference(link: SReferenceLink): jetbrains.mps.smodel.SReference? =
        ReferenceAdapter(link).takeIf {
            node.getReferenceTarget(MPSReferenceLink(link).toReference()) != null
        }

    override fun getConcept(): SConcept {
        val concept = node.getConcept()
        if (concept is MPSConcept) return concept.concept as SConcept
        return jetbrains.mps.smodel.SNodeUtil.concept_BaseConcept
    }

    override fun isInstanceOfConcept(superConcept: SAbstractConcept): Boolean = node.getConcept().isSubConceptOf(MPSConcept(superConcept))

    override fun getPresentation(): String = getName() ?: node.toString()

    override fun getName(): String? = getProperty(SNodeUtil.property_INamedConcept_name)

    override fun insertChildBefore(
        link: SContainmentLink,
        newChild: SNode,
        anchor: SNode?,
    ) {
        forceUnwrapMPSNode(this).insertChildBefore(link, forceUnwrapMPSNode(newChild), anchor?.let { forceUnwrapMPSNode(it) })
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

    /**
     * [jetbrains.mps.smodel.SNode.getParent] is `final` and delegates to the overridable [treeParent], so the parent
     * resolution has to be implemented here.
     */
    override fun treeParent(): jetbrains.mps.smodel.SNode? {
        // For root nodes the modelix parent is the model, but the SNode contract expects null.
        if (isRootNode()) return null
        return node.getParent().wrap()
    }

    private fun isRootNode(): Boolean =
        node.getContainmentLink().matches(
            BuiltinLanguages.MPSRepositoryConcepts.Model.rootNodes
                .toReference()
        )

    override fun getContainingRoot(): jetbrains.mps.smodel.SNode = treeParent()?.containingRoot ?: this

    override fun getContainmentLink(): SContainmentLink? {
        val link = node.getContainmentLink().resolve(node.getParent()?.getConceptReference() ?: return null)
        return (link as? MPSChildLink)?.link
    }

    override fun getFirstChild(): SNode? = node.getAllChildren().firstOrNull().wrap()

    override fun getLastChild(): SNode? = node.getAllChildren().lastOrNull().wrap()

    override fun getPrevSibling(): jetbrains.mps.smodel.SNode? {
        if (isRootNode()) return null
        val siblings = node.getParent()?.getAllChildren()?.toList() ?: return null
        val index = siblings.indexOf(node)
        return siblings.getOrNull(index - 1).wrap()
    }

    override fun getNextSibling(): jetbrains.mps.smodel.SNode? {
        if (isRootNode()) return null
        val siblings = node.getParent()?.getAllChildren()?.toList() ?: return null
        val index = siblings.indexOf(node)
        return siblings.getOrNull(index + 1).wrap()
    }

    override fun getChildren(link: SContainmentLink?): List<jetbrains.mps.smodel.SNode> =
        node
            .getChildren(link?.let { MPSChildLink(it).toReference() } ?: NullChildLinkReference)
            .wrap()

    override fun getChildren(): List<jetbrains.mps.smodel.SNode> =
        node
            .getAllChildren()
            .wrap()

    override fun getChildren(role: String?): List<jetbrains.mps.smodel.SNode> {
        requireNotNull(role)
        return node.getChildren(IChildLinkReference.fromName(role)).wrap()
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

    override fun getReferenceTarget(link: SReferenceLink): jetbrains.mps.smodel.SNode? =
        node.getReferenceTarget(MPSReferenceLink(link).toReference()).wrap()

    override fun getReferenceTarget(role: String?): jetbrains.mps.smodel.SNode? {
        if (role == null) return null
        return node.getReferenceTarget(IReferenceLinkReference.fromName(role)).wrap()
    }

    override fun dropReference(link: SReferenceLink) {
        writableNode.setReferenceTargetRef(MPSReferenceLink(link).toReference(), null)
    }

    override fun getReferences(): List<jetbrains.mps.smodel.SReference> =
        node
            .getReferenceLinks()
            .mapNotNull { MPSReferenceLink.tryFromReference(it) }
            .map { ReferenceAdapter(it.link) }

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

    override fun getProperty(role: SProperty): String? = node.getPropertyValue(MPSProperty(role).toReference())

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

    override fun toString(): String = "ModelixNodeAsMPSNode[$node]"

    override fun getUserObjectKeys(): MutableIterable<Any> = mutableListOf()

    override fun getRoleInParent(): String? = containmentLink?.name

    override fun getPropertyNames(): MutableCollection<String> = properties.map { it.name }.toMutableList()

    @JvmName("wrapNode")
    private fun IReadableNode.wrap(): ModelixNodeAsMPSNode = getInstance(this)

    @Suppress("SimpleRedundantLet")
    @JvmName("wrapNodeNullable")
    private fun IReadableNode?.wrap(): ModelixNodeAsMPSNode? = this?.let { it.wrap() }

    @JvmName("wrapNodes")
    private fun Iterable<IReadableNode>.wrap(): List<ModelixNodeAsMPSNode> = map { it.wrap() }

    /**
     * Extends [jetbrains.mps.smodel.SReference] (not just the openapi interface) because
     * [jetbrains.mps.smodel.SNode.getReference]/[getReferences] are narrowed to the concrete reference type.
     * The abstract `getTargetNode_internal` supplies the (still wrapped) target; the final `getTargetNode` delegates
     * to it.
     */
    inner class ReferenceAdapter(
        private val link: SReferenceLink,
    ) : jetbrains.mps.smodel.SReference(link, this@ModelixNodeAsMPSNode) {
        override fun getTargetNode_internal(reporter: jetbrains.mps.smodel.SReference.ProblemReporter?): SNode? =
            this@ModelixNodeAsMPSNode.getReferenceTarget(link)

        override fun getTargetNodeReference(): SNodeReference? = targetNode?.reference

        override fun getTargetSModelReference(): SModelReference? = targetNode?.reference?.modelReference

        override fun getTargetNodeId(): SNodeId? = targetNode?.reference?.nodeId
    }
}
