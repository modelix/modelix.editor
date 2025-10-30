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
import org.modelix.model.api.IChildLink
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.api.IProperty
import org.modelix.model.api.IReadableNode
import org.modelix.model.api.IReferenceLink
import org.modelix.model.api.NullChildLink
import org.modelix.model.api.isSubConceptOf
import org.modelix.model.api.remove
import org.modelix.model.mpsadapters.MPSChildLink
import org.modelix.model.mpsadapters.MPSConcept
import org.modelix.model.mpsadapters.MPSNode
import org.modelix.model.mpsadapters.MPSProperty
import org.modelix.model.mpsadapters.MPSReferenceLink
import org.modelix.model.mpsadapters.MPSWritableNode

data class ModelixNodeAsMPSNode(val node: INode) : SNode {
    companion object {
        @JvmStatic
        fun toModelixNode(node: SNode): INode {
            return when (node) {
                is ModelixNodeAsMPSNode -> node.node
                else -> MPSNode(node)
            }
        }

        @JvmStatic
        fun toMPSNode(node: INode): SNode {
            return ModelixNodeAsMPSNode(node)
        }

        @JvmStatic
        fun toMPSNode(node: IReadableNode): SNode {
            return ModelixNodeAsMPSNode(node.asLegacyNode())
        }

        private fun unwrapMPSNode(node: SNode): SNode {
            return ((node as? ModelixNodeAsMPSNode)?.node?.asWritableNode() as? MPSWritableNode)?.node
                ?: node
        }

        private fun forceUnwrapMPSNode(node: SNode): SNode {
            return if (node is ModelixNodeAsMPSNode) {
                val writableNode = node.node.asWritableNode()
                if (writableNode is MPSWritableNode) {
                    writableNode.node
                } else {
                    throw UnsupportedOperationException("Not an MPS node: $node")
                }
            } else {
                node
            }
        }
    }

    override fun addChild(link: SContainmentLink, newChild: SNode) {
        forceUnwrapMPSNode(this).addChild(link, forceUnwrapMPSNode(newChild))
    }

    override fun getModel(): SModel? {
        return forceUnwrapMPSNode(this).model
    }

    override fun getNodeId(): SNodeId {
        return forceUnwrapMPSNode(this).nodeId
    }

    override fun getReference(): SNodeReference {
        return forceUnwrapMPSNode(this).reference
    }

    override fun getReference(link: SReferenceLink): SReference? {
        return ReferenceAdapter(link).takeIf { node.getReferenceTarget(MPSReferenceLink(link)) != null }
    }

    @Suppress("removal")
    override fun getReference(p0: String?): SReference {
        TODO("Not yet implemented")
    }

    override fun getConcept(): SConcept {
        val concept = node.concept
        if (concept is MPSConcept) return concept.concept as SConcept
        return jetbrains.mps.smodel.SNodeUtil.concept_BaseConcept
    }

    override fun isInstanceOfConcept(superConcept: SAbstractConcept): Boolean {
        return node.concept.isSubConceptOf(MPSConcept(superConcept))
    }

    override fun getPresentation(): String {
        TODO("Not yet implemented")
    }

    override fun getName(): String? {
        return getProperty(SNodeUtil.property_INamedConcept_name)
    }

    @Suppress("removal")
    override fun addChild(role: String?, newChild: SNode?) {
        TODO("Not yet implemented")
    }

    override fun insertChildBefore(link: SContainmentLink, newChild: SNode, anchor: SNode?) {
        forceUnwrapMPSNode(this).insertChildBefore(link, forceUnwrapMPSNode(newChild), anchor?.let { forceUnwrapMPSNode(it) })
    }

    @Suppress("removal")
    override fun insertChildBefore(role: String, p1: SNode, p2: SNode?) {
        TODO("Not yet implemented")
    }

    override fun insertChildAfter(link: SContainmentLink, newChild: SNode, anchor: SNode?) {
        forceUnwrapMPSNode(this).insertChildAfter(link, forceUnwrapMPSNode(newChild), anchor?.let { forceUnwrapMPSNode(it) })
    }

    override fun removeChild(child: SNode) {
        node.removeChild(toModelixNode(child))
    }

    override fun delete() {
        node.remove()
    }

    override fun getParent(): SNode? {
        return node.parent?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getContainingRoot(): SNode {
        return parent?.containingRoot ?: this
    }

    override fun getContainmentLink(): SContainmentLink? {
        return (node.getContainmentLink() as? MPSChildLink)?.link
    }

    override fun getFirstChild(): SNode? {
        return node.allChildren.firstOrNull()?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getLastChild(): SNode? {
        return node.allChildren.lastOrNull()?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getPrevSibling(): SNode? {
        val siblings = node.parent?.allChildren?.toList() ?: return null
        val index = siblings.indexOf(node)
        return siblings.getOrNull(index - 1)?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getNextSibling(): SNode? {
        val siblings = node.parent?.allChildren?.toList() ?: return null
        val index = siblings.indexOf(node)
        return siblings.getOrNull(index + 1)?.let { ModelixNodeAsMPSNode(it) }
    }

    override fun getChildren(link: SContainmentLink?): MutableIterable<SNode> {
        return node.getChildren(link?.let { MPSChildLink(it) } ?: NullChildLink)
            .map { ModelixNodeAsMPSNode(it) }
            .toMutableList()
    }

    override fun getChildren(): MutableIterable<SNode> {
        return node.allChildren
            .map { ModelixNodeAsMPSNode(it) }
            .toMutableList()
    }

    @Suppress("removal")
    override fun getChildren(role: String?): MutableIterable<SNode> {
        requireNotNull(role)
        return node.getChildren(IChildLink.fromName(role)).wrap().toMutableList()
    }

    override fun setReferenceTarget(role: SReferenceLink, target: SNode?) {
        node.setReferenceTarget(MPSReferenceLink(role), target?.let { toModelixNode(it) })
    }

    @Suppress("removal")
    override fun setReferenceTarget(role: String?, target: SNode?) {
        requireNotNull(role)
        node.setReferenceTarget(IReferenceLink.fromName(role), target?.let { toModelixNode(it) })
    }

    override fun setReference(p0: SReferenceLink, p1: ResolveInfo?) {
        TODO("Not yet implemented")
    }

    override fun setReference(p0: SReferenceLink, p1: SNodeReference) {
        TODO("Not yet implemented")
    }

    override fun setReference(p0: SReferenceLink, p1: SReference?) {
        TODO("Not yet implemented")
    }

    @Suppress("removal")
    override fun setReference(role: String?, reference: SReference?) {
        TODO("Not yet implemented")
    }

    override fun getReferenceTarget(link: SReferenceLink): SNode? {
        return node.getReferenceTarget(MPSReferenceLink(link)).wrap()
    }

    @Suppress("removal")
    override fun getReferenceTarget(role: String?): SNode? {
        if (role == null) return null
        return node.getReferenceTarget(IReferenceLink.fromName(role)).wrap()
    }

    override fun dropReference(link: SReferenceLink) {
        node.setReferenceTarget(MPSReferenceLink(link), null as INodeReference?)
    }

    override fun getReferences(): MutableIterable<SReference> {
        return node.getReferenceLinks().filterIsInstance<MPSReferenceLink>().map { ReferenceAdapter(it.link) }.toMutableList()
    }

    override fun getProperties(): MutableIterable<SProperty> {
        return node.getPropertyLinks().filterIsInstance<MPSProperty>().map { it.property }.toMutableList()
    }

    override fun hasProperty(role: SProperty): Boolean {
        return node.getPropertyLinks().filterIsInstance<MPSProperty>().any { it.property == role }
    }

    @Suppress("removal")
    override fun hasProperty(p0: String?): Boolean {
        TODO("Not yet implemented")
    }

    override fun getProperty(role: SProperty): String? {
        return node.getPropertyValue(MPSProperty(role))
    }

    @Suppress("removal")
    override fun getProperty(role: String?): String? {
        if (role == null) return null
        return node.getPropertyValue(IProperty.fromName(role))
    }

    override fun setProperty(role: SProperty, value: String?) {
        node.setPropertyValue(MPSProperty(role), value)
    }

    @Suppress("removal")
    override fun setProperty(role: String?, value: String?) {
        requireNotNull(role)
        node.setPropertyValue(IProperty.fromName(role), value)
    }

    override fun getUserObject(key: Any?): Any? {
        return null
    }

    override fun putUserObject(key: Any?, value: Any?) {
        TODO("Not yet implemented")
    }

    override fun getUserObjectKeys(): MutableIterable<Any> {
        return mutableListOf()
    }

    override fun getRoleInParent(): String? {
        return containmentLink?.name
    }

    override fun getPropertyNames(): MutableIterable<String> {
        return properties.map { it.name }.toMutableList()
    }

    @JvmName("wrapNode")
    private fun INode.wrap(): ModelixNodeAsMPSNode = ModelixNodeAsMPSNode(this)

    @Suppress("SimpleRedundantLet")
    @JvmName("wrapNodeNullable")
    private fun INode?.wrap(): ModelixNodeAsMPSNode? = this?.let { it.wrap() }

    @JvmName("wrapNodes")
    private fun Iterable<INode>.wrap(): List<ModelixNodeAsMPSNode> = map { it.wrap() }

    inner class ReferenceAdapter(private val link: SReferenceLink) : SReference {
        override fun getLink(): SReferenceLink = link

        override fun getSourceNode(): SNode = this@ModelixNodeAsMPSNode

        override fun getTargetNode(): SNode? = getReferenceTarget(link)

        override fun getTargetNodeReference(): SNodeReference? = targetNode?.reference

        override fun getTargetSModelReference(): SModelReference? = targetNode?.reference?.modelReference

        override fun getTargetNodeId(): SNodeId? = targetNodeReference?.nodeId
    }
}
