package org.modelix.editor.text.shared.celltree

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
sealed class CellTreeOp

@Serializable
@SerialName("propChange")
data class CellPropertyChangeOp(
    val id: CellInstanceId,
    val key: String,
    val value: CellPropertyValue<*>?,
) : CellTreeOp()

@Serializable
@SerialName("propRemove")
data class CellPropertyRemoveOp(
    val id: CellInstanceId,
    val key: String,
) : CellTreeOp()

@Serializable
@SerialName("newChild")
data class NewChildCellOp(
    val parentId: CellInstanceId,
    val index: Int,
    val childId: CellInstanceId,
) : CellTreeOp()

@Serializable
@SerialName("newCell")
data class NewCellOp(
    val id: CellInstanceId,
) : CellTreeOp()

@Serializable
@SerialName("move")
data class MoveCellOp(
    val index: Int,
    val childId: CellInstanceId,
) : CellTreeOp()

@Serializable
@SerialName("moveTo")
data class MoveCellToOp(
    val targetParent: CellInstanceId,
    val index: Int,
    val childId: CellInstanceId,
) : CellTreeOp()

@Serializable
@SerialName("delete")
data class CellDeleteOp(
    val id: CellInstanceId,
) : CellTreeOp()

@Serializable
@SerialName("detach")
data class CellDetachOp(
    val id: CellInstanceId,
) : CellTreeOp()
