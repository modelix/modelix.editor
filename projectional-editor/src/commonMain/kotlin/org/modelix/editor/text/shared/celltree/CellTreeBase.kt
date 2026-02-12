package org.modelix.editor.text.shared.celltree

import org.modelix.editor.Cell
import org.modelix.editor.CellPropertyKey
import org.modelix.editor.CellReference
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ResettableLazy
import org.modelix.incremental.IncrementalIndex
import org.modelix.incremental.IncrementalList
import org.modelix.model.api.runSynchronized
import kotlin.getValue
import kotlin.jvm.Synchronized

open class CellTreeBase : IMutableCellTree {
    private val root = newCellInstance(CellInstanceId(1L), null)
    private var nextId: Long = 2L
    private val allCells = HashMap<CellInstanceId, CellImpl>()
    private var detachedCells = HashSet<CellInstanceId>()
    private val cellIndex: IncrementalIndex<CellReference, CellInstanceId> = IncrementalIndex()
    protected val treeLock = Any()

    init {
        allCells[root.getId()] = root
    }

    fun <R> withTreeLock(body: () -> R): R = runSynchronized(treeLock, body)

    override fun getRoot(): CellImpl = root

    override fun getCell(id: CellInstanceId): CellImpl = withTreeLock { allCells[id] ?: throw NoSuchElementException("Cell ID: ${id.id}") }

    final override fun createCell(): IMutableCellTree.MutableCell = createCell(CellInstanceId(nextId++))

    override fun createCell(id: CellInstanceId): IMutableCellTree.MutableCell =
        withTreeLock {
            require(!allCells.containsKey(id)) { "Cell already exists: $id" }
            newCellInstance(id, null).also {
                registerCell(it)
                detachedCells.add(id)
            }
        }

    fun resolveCell(reference: CellReference): List<Cell> =
        withTreeLock {
            cellIndex.update(getRoot().referencesIndexList)
            cellIndex.lookup(reference).map { getCell(it) }
        }

    fun deleteDetachedCells() {
        withTreeLock {
            val cells = detachedCells
            detachedCells = HashSet()
            cells.forEach { getCell(it).delete() }
        }
    }

    private fun registerCell(cell: CellImpl) {
        withTreeLock {
            allCells[cell.getId()] = cell
        }
    }

    protected open fun newCellInstance(
        id: CellInstanceId,
        parent: CellImpl? = null,
    ) = CellImpl(id, parent)

    open inner class CellImpl(
        private val id: CellInstanceId,
        private var parent: CellImpl? = null,
    ) : IMutableCellTree.MutableCell {
        protected val properties: MutableMap<String, Any?> = HashMap()
        private val children: MutableList<CellImpl> = ArrayList()

        private val cachedReferencesIndexList =
            ResettableLazy {
                withTreeLock {
                    IncrementalList.concat(
                        IncrementalList.of(this.cellReferences.map { it to id }),
                        IncrementalList.concat(getChildren().map { (it as CellImpl).referencesIndexList }),
                    )
                }
            }
        val referencesIndexList: IncrementalList<Pair<CellReference, CellInstanceId>> by cachedReferencesIndexList

        override fun getTree(): IMutableCellTree = this@CellTreeBase

        override fun getId(): CellInstanceId = id

        override fun getParent(): IMutableCellTree.MutableCell? = withTreeLock { parent }

        override fun isAttached(): Boolean = withTreeLock { this == root || parent?.isAttached() == true }

        override fun <T> getProperty(key: CellPropertyKey<T>): T =
            withTreeLock {
                if (properties.containsKey(key.name)) properties[key.name] as T else key.defaultValue
            }

        fun setProperty(
            key: String,
            newValue: CellPropertyValue<*>?,
        ) {
            withTreeLock {
                properties[key] = newValue?.value
            }
        }

        @Synchronized
        override fun <T> setProperty(
            key: CellPropertyKey<T>,
            newValue: T,
        ) {
            withTreeLock {
                require(newValue !is CellPropertyKey<*>)
                properties[key.name] = newValue
                if (key == CommonCellProperties.cellReferences) cachedReferencesIndexList.reset()
            }
        }

        fun removeProperty(key: String) {
            withTreeLock {
                properties.remove(key)
            }
        }

        override fun removeProperty(key: CellPropertyKey<*>) {
            withTreeLock {
                properties.remove(key.name)
                if (key == CommonCellProperties.cellReferences) cachedReferencesIndexList.reset()
            }
        }

        override fun hasProperty(key: CellPropertyKey<*>): Boolean = withTreeLock { properties.containsKey(key.name) }

        override fun getChildren(): List<IMutableCellTree.MutableCell> = withTreeLock { children }

        override fun getChildAt(index: Int): IMutableCellTree.MutableCell? = withTreeLock { children.getOrNull(index) }

        fun addNewChild(
            index: Int,
            childId: CellInstanceId,
        ): IMutableCellTree.MutableCell =
            withTreeLock {
                newCellInstance(childId, this).also {
                    children.add(index, it)
                    registerCell(it)
                }
            }

        override fun addNewChild(index: Int): IMutableCellTree.MutableCell =
            withTreeLock {
                cachedReferencesIndexList.reset()
                addNewChild(index, CellInstanceId(nextId++))
            }

        override fun moveCell(index: Int) {
            withTreeLock {
                val parent = requireNotNull(parent)
                parent.children.remove(this)
                parent.children.add(index, this)
            }
        }

        override fun moveCell(
            targetParent: IMutableCellTree.MutableCell,
            index: Int,
        ) {
            withTreeLock {
                targetParent as CellImpl
                require(targetParent != parent) { "Use moveCell(index: Int)" }
                parent?.cachedReferencesIndexList?.reset()
                targetParent.cachedReferencesIndexList.reset()
                val oldParent = parent
                oldParent?.children?.remove(this)
                targetParent.children.add(index, this)
                parent = targetParent
                detachedCells.remove(id)
            }
        }

        override fun detach() {
            withTreeLock {
                parent?.cachedReferencesIndexList?.reset()
                detachedCells.add(id)
                parent?.children?.remove(this)
                parent = null
            }
        }

        override fun delete() {
            withTreeLock {
                parent?.cachedReferencesIndexList?.reset()
                children.toList().forEach { it.delete() }
                parent?.children?.remove(this)
                parent = null
                allCells.remove(id)
                detachedCells.remove(id)
            }
        }

        override fun index(): Int {
            val parent = parent ?: return 0
            val index = parent.children.indexOf(this)
            return if (index >= 0) index else 0
        }

        override fun toString(): String = id.id.toString()
    }
}
