package org.modelix.model.mpsadapters.tomps

import jetbrains.mps.smodel.SNodeUtil
import org.jetbrains.mps.openapi.language.SAbstractConcept
import org.jetbrains.mps.openapi.language.SConcept
import org.jetbrains.mps.openapi.language.SContainmentLink
import org.jetbrains.mps.openapi.language.SProperty
import org.jetbrains.mps.openapi.language.SReferenceLink
import org.jetbrains.mps.openapi.model.ResolveInfo
import org.jetbrains.mps.openapi.model.SModel
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.model.SNodeId
import org.jetbrains.mps.openapi.model.SNodeReference
import org.jetbrains.mps.openapi.model.SReference

/**
 * Base class that makes a Modelix adapter a *real* [jetbrains.mps.smodel.SNode] instance rather than just an
 * implementation of the [org.jetbrains.mps.openapi.model.SNode] interface.
 *
 * This is required because MPS's type inference builds transient type-term nodes as concrete
 * [jetbrains.mps.smodel.SNode]s and copies references from the checked model nodes onto them. When the source of such
 * a reference has no model (a detached type node), [jetbrains.mps.smodel.SNode.setReferenceTarget] stores the target
 * verbatim in a `DirectNode`, and `getReferenceTarget` later does an unguarded `(jetbrains.mps.smodel.SNode)` cast on
 * it. If the target were only an openapi-`SNode` wrapper, that cast would throw a [ClassCastException]. By extending
 * the concrete class the wrapper can safely inhabit a real node's reference slot while [ModelixNodeAsMPSNode] keeps
 * routing every API call through Modelix (preserving read tracking and identity).
 *
 * Every overridable member of [jetbrains.mps.smodel.SNode] throws here so that any path [ModelixNodeAsMPSNode] does not
 * explicitly override fails loudly instead of silently operating on this instance's empty internal node state. The
 * `final` members (`getParent`, `hasProperty(String)`, `getProperty(String)`) cannot be overridden; they already
 * delegate to overridable members (`treeParent` / the [SProperty] overloads via `SNodeLegacy`).
 */
open class SNodeBase : jetbrains.mps.smodel.SNode(SNodeUtil.concept_BaseConcept) {
    override fun getConcept(): SConcept = throw UnsupportedOperationException()

    override fun isInstanceOfConcept(c: SAbstractConcept): Boolean = throw UnsupportedOperationException()

    override fun insertChildAfter(
        role: SContainmentLink,
        child: SNode,
        anchor: SNode?,
    ): Unit = throw UnsupportedOperationException()

    override fun getNodeId(): SNodeId? = throw UnsupportedOperationException()

    override fun getContainingRoot(): jetbrains.mps.smodel.SNode = throw UnsupportedOperationException()

    override fun getName(): String? = throw UnsupportedOperationException()

    override fun removeChild(child: SNode): Unit = throw UnsupportedOperationException()

    override fun delete(): Unit = throw UnsupportedOperationException()

    override fun getPresentation(): String = throw UnsupportedOperationException()

    override fun toString(): String = throw UnsupportedOperationException()

    override fun getReference(): SNodeReference = throw UnsupportedOperationException()

    override fun getUserObject(key: Any?): Any? = throw UnsupportedOperationException()

    override fun putUserObject(
        key: Any?,
        value: Any?,
    ): Unit = throw UnsupportedOperationException()

    override fun getChildren(): List<jetbrains.mps.smodel.SNode> = throw UnsupportedOperationException()

    override fun getChildren(role: SContainmentLink?): List<jetbrains.mps.smodel.SNode> = throw UnsupportedOperationException()

    override fun getChildren(role: String?): List<jetbrains.mps.smodel.SNode> = throw UnsupportedOperationException()

    override fun getReferences(): List<jetbrains.mps.smodel.SReference> = throw UnsupportedOperationException()

    override fun getFirstChild(): SNode? = throw UnsupportedOperationException()

    override fun getLastChild(): SNode? = throw UnsupportedOperationException()

    override fun getPrevSibling(): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun getNextSibling(): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun getUserObjectKeys(): MutableIterable<Any> = throw UnsupportedOperationException()

    override fun getModel(): SModel? = throw UnsupportedOperationException()

    override fun setId(id: SNodeId?): Unit = throw UnsupportedOperationException()

    override fun firstChild(): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun treePrevious(): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun treeNext(): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun treeParent(): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun children_insertBefore(
        anchor: jetbrains.mps.smodel.SNode?,
        node: jetbrains.mps.smodel.SNode,
    ): Unit = throw UnsupportedOperationException()

    override fun children_remove(node: jetbrains.mps.smodel.SNode): Unit = throw UnsupportedOperationException()

    override fun getContainmentLink(): SContainmentLink? = throw UnsupportedOperationException()

    override fun hasProperty(property: SProperty): Boolean = throw UnsupportedOperationException()

    override fun getProperty(property: SProperty): String? = throw UnsupportedOperationException()

    override fun setProperty(
        property: SProperty,
        propertyValue: String?,
    ): Unit = throw UnsupportedOperationException()

    override fun setProperty(
        propertyName: String?,
        propertyValue: String?,
    ): Unit = throw UnsupportedOperationException()

    override fun getProperties(): MutableIterable<SProperty> = throw UnsupportedOperationException()

    override fun setReferenceTarget(
        role: SReferenceLink,
        target: SNode?,
    ): Unit = throw UnsupportedOperationException()

    override fun setReference(
        role: SReferenceLink,
        resolveInfo: ResolveInfo?,
    ): Unit = throw UnsupportedOperationException()

    override fun setReference(
        role: SReferenceLink,
        target: SNodeReference,
    ): Unit = throw UnsupportedOperationException()

    override fun setReference(
        role: SReferenceLink,
        toAdd: SReference?,
    ): Unit = throw UnsupportedOperationException()

    override fun getReferenceTarget(role: SReferenceLink): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun getReferenceTarget(role: String?): jetbrains.mps.smodel.SNode? = throw UnsupportedOperationException()

    override fun getReference(role: SReferenceLink): jetbrains.mps.smodel.SReference? = throw UnsupportedOperationException()

    override fun dropReference(role: SReferenceLink): Unit = throw UnsupportedOperationException()

    override fun insertChildBefore(
        role: SContainmentLink,
        child: SNode,
        anchor: SNode?,
    ): Unit = throw UnsupportedOperationException()

    override fun insertChildBefore(
        role: String,
        child: SNode?,
        anchor: SNode?,
    ): Unit = throw UnsupportedOperationException()

    override fun addChild(
        role: SContainmentLink,
        child: SNode,
    ): Unit = throw UnsupportedOperationException()

    override fun addChild(
        role: String?,
        child: SNode?,
    ): Unit = throw UnsupportedOperationException()

    override fun getRoleInParent(): String? = throw UnsupportedOperationException()

    override fun getPropertyNames(): MutableCollection<String> = throw UnsupportedOperationException()
}
