package org.modelix.model.mpsadapters.tomps

import jetbrains.mps.smodel.SNodeUtil
import org.jetbrains.mps.openapi.language.SAbstractConcept
import org.jetbrains.mps.openapi.language.SConcept
import org.jetbrains.mps.openapi.language.SContainmentLink
import org.jetbrains.mps.openapi.language.SProperty
import org.jetbrains.mps.openapi.language.SReferenceLink
import org.jetbrains.mps.openapi.model.ResolveInfo
import org.jetbrains.mps.openapi.model.SModelReference
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.model.SNodeId
import org.jetbrains.mps.openapi.model.SNodeReference
import org.jetbrains.mps.openapi.model.SReference
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
import org.modelix.model.mpsadapters.toMPS
import org.modelix.model.mpsadapters.toModelix
import org.modelix.mps.multiplatform.model.MPSNodeReference

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

    /**
     * A reference exists as soon as it points somewhere, whether or not the target can be resolved, as in MPS: a
     * broken reference is how MPS code finds out that it is broken.
     */
    override fun getReference(link: SReferenceLink): jetbrains.mps.smodel.SReference? {
        val linkReference = MPSReferenceLink(link).toReference()
        return ReferenceAdapter(link).takeIf {
            node.getReferenceTargetRef(linkReference) != null || node.getReferenceTarget(linkReference) != null
        }
    }

    override fun getConcept(): SConcept {
        val concept = node.getConcept()
        if (concept is MPSConcept) return concept.concept as SConcept
        return jetbrains.mps.smodel.SNodeUtil.concept_BaseConcept
    }

    override fun isInstanceOfConcept(superConcept: SAbstractConcept): Boolean = node.getConcept().isSubConceptOf(MPSConcept(superConcept))

    /**
     * What [jetbrains.mps.smodel.SNode.getPresentation] does: the `getPresentation` behavior, which also honours
     * property getters in the constraints (a derived `name`). It runs on this wrapper rather than the unwrapped node,
     * so every read it makes is dependency tracked.
     */
    override fun getPresentation(): String = SNodeUtil.getPresentation(this).orEmpty()

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

    override fun setReference(
        link: SReferenceLink,
        target: SNodeReference,
    ) {
        writableNode.setReferenceTargetRef(MPSReferenceLink(link).toReference(), target.toModelix())
    }

    /**
     * Only a [ResolveInfo] that names the target node can be stored by modelix. The others carry the text MPS
     * resolves the target from, which only the MPS node can store.
     */
    override fun setReference(
        link: SReferenceLink,
        resolveInfo: ResolveInfo?,
    ) {
        when (resolveInfo) {
            null -> dropReference(link)

            // Its node may be one of these wrappers, which must not end up stored in the MPS node.
            is ResolveInfo.N -> setReferenceTarget(link, resolveInfo.targetNode)

            else -> forceUnwrapMPSNode(this).setReference(link, resolveInfo)
        }
    }

    /**
     * MPS only accepts a reference that already belongs to this node and copies its internal data. A reference that
     * comes from elsewhere, like one of another node that is copied, is stored as what it points to instead.
     */
    override fun setReference(
        link: SReferenceLink,
        reference: SReference?,
    ) {
        if (reference == null) return dropReference(link)
        val target = reference.targetNodeReference
        val resolveInfo = (reference as? jetbrains.mps.smodel.SReference)?.resolveInfo
        when {
            target != null && resolveInfo != null -> setReference(link, ResolveInfo.of(target, resolveInfo))
            target != null -> setReference(link, target)
            resolveInfo != null -> setReference(link, ResolveInfo.of(resolveInfo))
            else -> dropReference(link)
        }
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

    /**
     * User objects are caches that MPS code attaches to a node, not model content, so they need no dependency
     * tracking. They are kept on the MPS node, where they outlive this wrapper and are shared with code that uses the
     * MPS node directly. Only a node of another kind keeps them here.
     */
    private val ownUserObjects = java.util.concurrent.ConcurrentHashMap<Any, Any>()

    private fun userObjectHolder(): SNode? = (node as? MPSWritableNode)?.node

    override fun getUserObject(key: Any?): Any? {
        userObjectHolder()?.let { return it.getUserObject(key) }
        return ownUserObjects[key ?: return null]
    }

    override fun putUserObject(
        key: Any?,
        value: Any?,
    ) {
        userObjectHolder()?.let { return it.putUserObject(key, value) }
        if (key == null) return
        if (value == null) ownUserObjects.remove(key) else ownUserObjects[key] = value
    }

    override fun getUserObjectKeys(): MutableIterable<Any> {
        userObjectHolder()?.let { return it.userObjectKeys.toMutableList() }
        return ownUserObjects.keys.toMutableList()
    }

    override fun toString(): String = "ModelixNodeAsMPSNode[$node]"

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

        /**
         * What the reference points to as it is stored, without resolving it, so that a reference that cannot be
         * resolved still says where it points to. Only a target that is not an MPS node is resolved for it.
         */
        override fun getTargetNodeReference(): SNodeReference? {
            val stored = node.getReferenceTargetRef(MPSReferenceLink(link).toReference())
            stored?.let { MPSNodeReference.tryConvert(it) }?.let { return it.toMPS() }
            return targetNode?.reference
        }

        override fun getTargetSModelReference(): SModelReference? = targetNodeReference?.modelReference

        override fun getTargetNodeId(): SNodeId? = targetNodeReference?.nodeId

        /**
         * The name MPS keeps for the target, which it shows for a reference that cannot be resolved.
         */
        override fun getResolveInfo(): String? {
            // Only for the dependency: the MPS reference the name is read from changes together with the target.
            node.getReferenceTargetRef(MPSReferenceLink(link).toReference())
            val mpsNode = (node as? MPSWritableNode)?.node as? jetbrains.mps.smodel.SNode ?: return null
            return mpsNode.getReference(link)?.resolveInfo
        }
    }
}
