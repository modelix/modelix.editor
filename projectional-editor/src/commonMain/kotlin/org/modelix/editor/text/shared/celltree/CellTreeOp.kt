package org.modelix.editor.text.shared.celltree

import kotlinx.serialization.Serializable

@Serializable
sealed class CellTreeOp

@Serializable
data class CellPropertyChangeOp(val id: CellInstanceId, val key: String, val value: CellPropertyValue<*>?) : CellTreeOp()

@Serializable
data class CellPropertyRemoveOp(val id: CellInstanceId, val key: String) : CellTreeOp()

@Serializable
data class NewChildCellOp(val parentId: CellInstanceId, val index: Int, val childId: CellInstanceId) : CellTreeOp()

@Serializable
data class NewCellOp(val id: CellInstanceId) : CellTreeOp()

@Serializable
data class MoveCellOp(val index: Int, val childId: CellInstanceId) : CellTreeOp()

@Serializable
data class MoveCellToOp(val targetParent: CellInstanceId, val index: Int, val childId: CellInstanceId) : CellTreeOp()

@Serializable
data class CellDeleteOp(val id: CellInstanceId) : CellTreeOp()

@Serializable
data class CellDetachOp(val id: CellInstanceId) : CellTreeOp()
