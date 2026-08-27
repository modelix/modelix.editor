package org.modelix.editor.text.shared.celltree

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import org.modelix.editor.CellReference
import org.modelix.model.api.INodeReference

@Serializable
sealed class CellPropertyValue<out E> {
    abstract val value: E
}

@Serializable
@SerialName("bool")
data class BooleanCellPropertyValue(
    override val value: Boolean,
) : CellPropertyValue<Boolean>()

@Serializable
@SerialName("string")
data class StringCellPropertyValue(
    override val value: String,
) : CellPropertyValue<String>()

@Serializable
@SerialName("reflist")
data class CellReferenceListValue(
    override val value: List<CellReference>,
) : CellPropertyValue<List<CellReference>>()

/**
 * The node a reference cell points to. Transferred to the frontend so that a Cmd/Ctrl+click can navigate to the
 * target without asking the backend for it (see [org.modelix.editor.CommonCellProperties.referenceTarget]).
 */
@Serializable
@SerialName("noderef")
data class NodeReferenceCellPropertyValue(
    override val value: INodeReference,
) : CellPropertyValue<INodeReference>()
