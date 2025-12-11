package org.modelix.editor

import kotlinx.serialization.Serializable
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.ITypedProperty
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.api.IChildLinkReference
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.api.IProperty
import org.modelix.model.api.IPropertyReference
import org.modelix.model.api.IReferenceLinkReference

/**
 * A cell can have multiple CellReferences. Multiple CellReferences can resolve to the same cell.
 */
@Serializable
sealed class CellReference

@Serializable
data class PropertyCellReference(val property: IPropertyReference, val nodeRef: INodeReference) : CellReference()

fun FrontendEditorComponent.resolvePropertyCell(property: IProperty, nodeRef: INodeReference): Cell? =
    resolveCell(PropertyCellReference(property.toReference(), nodeRef)).firstOrNull()

fun FrontendEditorComponent.resolvePropertyCell(property: IProperty, node: INode): Cell? =
    resolvePropertyCell(property, node.reference)

fun FrontendEditorComponent.resolvePropertyCell(property: IProperty, node: ITypedNode): Cell? =
    resolvePropertyCell(property, node.untyped())

fun FrontendEditorComponent.resolvePropertyCell(property: ITypedProperty<*>, node: ITypedNode): Cell? =
    resolvePropertyCell(property.untyped(), node.untyped())

data class NodeCellReference(val nodeRef: INodeReference) : CellReference()

fun FrontendEditorComponent.resolveNodeCell(nodeRef: INodeReference): Cell? =
    resolveCell(NodeCellReference(nodeRef)).firstOrNull()

fun FrontendEditorComponent.resolveNodeCell(node: INode): Cell? =
    resolveNodeCell(node.reference)

fun FrontendEditorComponent.resolveNodeCell(node: ITypedNode): Cell? =
    resolveNodeCell(node.untypedReference())

@Serializable
data class ChildNodeCellReference(val parentNodeRef: INodeReference, val link: IChildLinkReference, val index: Int = 0) : CellReference()

@Serializable
data class SeparatorCellReference(val before: CellReference) : CellReference()

@Serializable
data class ReferencedNodeCellReference(val sourceNodeRef: INodeReference, val link: IReferenceLinkReference) : CellReference()

@Serializable
data class TemplateCellReference(val template: ICellTemplateReference, val node: INodeReference) : CellReference()

@Serializable
data class PlaceholderCellReference(val childCellRef: TemplateCellReference) : CellReference()
