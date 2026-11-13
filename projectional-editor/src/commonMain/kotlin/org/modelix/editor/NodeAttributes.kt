package org.modelix.editor

import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.getAllConcepts

/**
 * Node attributes (`jetbrains.mps.lang.core.structure.NodeAttribute`) are children in the `smodelAttribute` role that
 * annotate the node they are attached to. Their notation wraps the notation of that node: an `attributed` cell
 * ([org.modelix.editor.celltemplate.AttributedCellTemplate]) stands for it.
 *
 * Concepts are compared by UID, because the same concept can be represented by different [IConcept] implementations
 * (generated, MPS, simple).
 */
internal val smodelAttributeLink: IChildLink = BuiltinLanguages.jetbrains_mps_lang_core.BaseConcept.smodelAttribute

private val nodeAttributeUID = BuiltinLanguages.jetbrains_mps_lang_core.NodeAttribute.getUID()

fun IConcept.isNodeAttribute(): Boolean = getAllConcepts().any { it.getUID() == nodeAttributeUID }

fun IConcept.isSubConceptOfUID(uid: String): Boolean = getAllConcepts().any { it.getUID() == uid }

fun IChildLink.isSmodelAttribute(): Boolean = toReference().matches(smodelAttributeLink.toReference())

/**
 * All attributes of [this] node, node attributes or not, in the order MPS stores them.
 *
 * Read through [INode.allChildren], because a model may store the role by name or by ID. Reading one specific role
 * records a dependency on that spelling only, and the incremental engine would miss attributes added with the other.
 */
fun INode.getAttributes(): List<INode> = allChildren.filter { it.getContainmentLink()?.isSmodelAttribute() == true }

/**
 * The node an attribute is attached to.
 */
fun INode.getAttributedNode(): INode? = parent?.takeIf { getContainmentLink()?.isSmodelAttribute() == true }

/**
 * Follows [getAttributedNode] for attributes of attributes, up to the node that is not an attribute.
 */
fun INode.getUltimateAttributedNode(): INode = generateSequence(this) { it.getAttributedNode() }.last()
