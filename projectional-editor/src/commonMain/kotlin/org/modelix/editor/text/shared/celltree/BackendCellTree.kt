package org.modelix.editor.text.shared.celltree

import org.modelix.editor.CellPropertyKey
import org.modelix.editor.CellReference
import org.modelix.editor.CommonCellProperties

class BackendCellTree : CellTreeBase() {
    private var operations: MutableList<CellTreeOp> = ArrayList()
    private var updating = false

    override fun getRoot() = super.getRoot() as BackendCellImpl

    override fun getCell(id: CellInstanceId): BackendCellImpl = super.getCell(id) as BackendCellImpl

    override fun createCell(id: CellInstanceId): IMutableCellTree.MutableCell =
        withTreeLock {
            super.createCell(id).also {
                operations += NewCellOp(it.getId())
            }
        }

    override fun newCellInstance(
        id: CellInstanceId,
        parent: CellImpl?,
    ): CellImpl = BackendCellImpl(id, parent as BackendCellImpl?)

    fun runUpdate(body: () -> Unit): List<CellTreeOp> {
        return withTreeLock {
            check(!updating) { "Already updating" }
            updating = true
            try {
                body()
                deleteDetachedCells()
                return@withTreeLock getPendingChanges()
            } finally {
                updating = false
            }
        }
    }

    private fun getPendingChanges(): List<CellTreeOp> = withTreeLock { operations.also { operations = ArrayList() } }

    inner class BackendCellImpl(
        id: CellInstanceId,
        parent: BackendCellImpl? = null,
    ) : CellTreeBase.CellImpl(id, parent) {
        override fun <T> setProperty(
            key: CellPropertyKey<T>,
            newValue: T,
        ) {
            withTreeLock {
                if (getProperty(key) == newValue) return@withTreeLock
                super.setProperty(key, newValue)
                if (key.frontend) {
                    operations += CellPropertyChangeOp(getId(), key.name, key.toSerializableValue(newValue))
                }
            }
        }

        override fun removeProperty(key: CellPropertyKey<*>) {
            withTreeLock {
                if (!hasProperty(key)) return@withTreeLock
                super.removeProperty(key)
                if (key.frontend) {
                    operations += CellPropertyRemoveOp(getId(), key.name)
                }
            }
        }

        override fun getParent(): BackendCellImpl? = super.getParent() as BackendCellImpl?

        override fun getChildren(): List<BackendCellImpl> = super.getChildren() as List<BackendCellImpl>

        override fun getChildAt(index: Int): BackendCellImpl? = super.getChildAt(index) as BackendCellImpl?

        override fun addNewChild(index: Int): IMutableCellTree.MutableCell =
            withTreeLock {
                val newChild = super.addNewChild(index)
                operations += NewChildCellOp(getId(), index, newChild.getId())
                newChild
            }

        override fun moveCell(index: Int) {
            withTreeLock {
                super.moveCell(index)
                operations += MoveCellOp(index, getId())
            }
        }

        override fun moveCell(
            targetParent: IMutableCellTree.MutableCell,
            index: Int,
        ) {
            withTreeLock {
                targetParent as BackendCellImpl
                super.moveCell(targetParent, index)
                operations += MoveCellToOp(targetParent.getId(), index, getId())
            }
        }

        override fun detach() {
            withTreeLock {
                super.detach()
                operations += CellDetachOp(getId())
            }
        }

        override fun delete() {
            withTreeLock {
                super.delete()
                operations += CellDeleteOp(getId())
            }
        }
    }
}

val ICellTree.Cell.cellReferences: List<CellReference> get() = getProperty(CommonCellProperties.cellReferences)
