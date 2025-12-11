package org.modelix.editor.text.shared.celltree

import kotlinx.serialization.Serializable
import org.modelix.editor.CellReference

@Serializable
sealed class CellPropertyValue<out E> {
    abstract val value: E
}

@Serializable
data class BooleanCellPropertyValue(override val value: Boolean) : CellPropertyValue<Boolean>()

@Serializable
data class StringCellPropertyValue(override val value: String) : CellPropertyValue<String>()

@Serializable
data class CellReferenceListValue(override val value: List<CellReference>) : CellPropertyValue<List<CellReference>>()
