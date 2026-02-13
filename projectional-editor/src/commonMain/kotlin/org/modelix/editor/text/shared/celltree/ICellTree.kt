package org.modelix.editor.text.shared.celltree

import kotlinx.serialization.Serializable
import org.modelix.editor.CellPropertyKey
import kotlin.jvm.JvmInline

@Serializable
@JvmInline
value class CellInstanceId(
    val id: Long,
)

interface ICellTree {
    fun getRoot(): Cell

    fun getCell(id: CellInstanceId): Cell?

    interface Cell {
        fun getTree(): ICellTree

        fun getId(): CellInstanceId

        fun <T> getProperty(key: CellPropertyKey<T>): T

        fun hasProperty(key: CellPropertyKey<*>): Boolean

        fun getChildren(): List<Cell>

        fun getChildAt(index: Int): Cell?

        fun getParent(): Cell?

        fun isAttached(): Boolean

        fun index(): Int
    }
}

interface IMutableCellTree : ICellTree {
    override fun getRoot(): MutableCell

    override fun getCell(id: CellInstanceId): MutableCell?

    fun createCell(): MutableCell

    fun createCell(id: CellInstanceId): MutableCell

    interface MutableCell : ICellTree.Cell {
        override fun getTree(): IMutableCellTree

        override fun getParent(): MutableCell?

        fun <T> setProperty(
            key: CellPropertyKey<T>,
            newValue: T,
        )

        fun removeProperty(key: CellPropertyKey<*>)

        override fun getChildren(): List<MutableCell>

        override fun getChildAt(index: Int): MutableCell?

        fun addNewChild(index: Int): MutableCell

        fun addNewChild(): MutableCell = addNewChild(getChildren().size)

        fun moveCell(index: Int)

        fun moveCell(
            targetParent: MutableCell,
            index: Int,
        )

        fun detach()

        fun delete()
    }
}
