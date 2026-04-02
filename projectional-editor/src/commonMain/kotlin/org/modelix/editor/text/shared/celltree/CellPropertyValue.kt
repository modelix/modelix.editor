package org.modelix.editor.text.shared.celltree

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import org.modelix.editor.CellReference

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
