package org.modelix.editor.text.frontend

import org.modelix.editor.CellPropertyKey
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ECellType
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.LayoutableCell
import org.modelix.editor.LayoutedText
import org.modelix.editor.ResettableLazy
import org.modelix.editor.TextCellProperties
import org.modelix.editor.TextLayouter
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.shared.EditorId
import org.modelix.editor.text.shared.celltree.CellDeleteOp
import org.modelix.editor.text.shared.celltree.CellDetachOp
import org.modelix.editor.text.shared.celltree.CellInstanceId
import org.modelix.editor.text.shared.celltree.CellPropertyChangeOp
import org.modelix.editor.text.shared.celltree.CellPropertyRemoveOp
import org.modelix.editor.text.shared.celltree.CellTreeBase
import org.modelix.editor.text.shared.celltree.CellTreeOp
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import org.modelix.editor.text.shared.celltree.MoveCellOp
import org.modelix.editor.text.shared.celltree.MoveCellToOp
import org.modelix.editor.text.shared.celltree.NewCellOp
import org.modelix.editor.text.shared.celltree.NewChildCellOp

class FrontendCellTree(
    val editorComponent: FrontendEditorComponent? = null,
) : CellTreeBase() {
    override fun newCellInstance(
        id: CellInstanceId,
        parent: CellImpl?,
    ): CellImpl = FrontendCellImpl(id, parent as FrontendCellImpl?)

    override fun getRoot(): FrontendCellImpl = super.getRoot() as FrontendCellImpl

    fun applyChanges(changes: List<CellTreeOp>) {
        withTreeLock {
            for (op in changes) {
                when (op) {
                    is CellDeleteOp -> getCell(op.id).detach()
                    is CellDetachOp -> getCell(op.id).detach()
                    is CellPropertyChangeOp -> getCell(op.id).setProperty(op.key, op.value)
                    is CellPropertyRemoveOp -> getCell(op.id).removeProperty(op.key)
                    is MoveCellOp -> getCell(op.childId).moveCell(op.index)
                    is MoveCellToOp -> getCell(op.childId).moveCell(getCell(op.targetParent), op.index)
                    is NewCellOp -> createCell(op.id)
                    is NewChildCellOp -> getCell(op.parentId).addNewChild(op.index, op.childId)
                }
            }
        }
    }

    inner class FrontendCellImpl(
        id: CellInstanceId,
        parent: FrontendCellImpl?,
    ) : CellImpl(id, parent) {
        private var cachedLayout =
            ResettableLazy<LayoutedText> {
                runLayoutOnCell(this) { it.layout }
            }
        val layout: LayoutedText
            get() = cachedLayout.value

        fun clearCachedLayout() {
            withTreeLock {
                cachedLayout.reset()
            }
        }

        fun invalidateLayout() {
            withTreeLock {
                cachedLayout.reset()
                getParent()?.invalidateLayout()
            }
        }

        fun getEditorComponent() = this@FrontendCellTree.editorComponent

        override fun getParent() = super.getParent() as FrontendCellImpl?

        override fun <T> getProperty(key: CellPropertyKey<T>): T =
            withTreeLock {
                require(key.frontend) { "Property ${key.name} is not available in the frontend" }
                if (properties.containsKey(key.name)) key.fromSerializableValue(properties[key.name]) else key.defaultValue
            }

        override fun <T> setProperty(
            key: CellPropertyKey<T>,
            newValue: T,
        ) {
            withTreeLock {
                super.setProperty(key, newValue)
                invalidateLayout()
            }
        }

        override fun removeProperty(key: CellPropertyKey<*>) {
            withTreeLock {
                super.removeProperty(key)
                invalidateLayout()
            }
        }

        override fun addNewChild(index: Int): IMutableCellTree.MutableCell =
            withTreeLock {
                super.addNewChild(index).also {
                    invalidateLayout()
                }
            }

        override fun moveCell(index: Int) {
            withTreeLock {
                super.moveCell(index)
                invalidateLayout()
            }
        }

        override fun moveCell(
            targetParent: IMutableCellTree.MutableCell,
            index: Int,
        ) {
            withTreeLock {
                invalidateLayout()
                super.moveCell(targetParent, index)
                invalidateLayout()
            }
        }

        override fun detach() {
            withTreeLock {
                invalidateLayout()
                super.detach()
            }
        }

        override fun delete() {
            withTreeLock {
                invalidateLayout()
                super.delete()
            }
        }
    }
}

val ICellTree.Cell.type: ECellType get() = getProperty(CommonCellProperties.type)

val ICellTree.Cell.text: String? get() = getProperty(TextCellProperties.text)
var IMutableCellTree.MutableCell.text: String?
    get() = getProperty(TextCellProperties.text)
    set(value) = setProperty(TextCellProperties.text, value)
val ICellTree.Cell.placeholderText: String? get() = getProperty(TextCellProperties.placeholderText)

fun ICellTree.Cell.getVisibleText(): String =
    getProperty(CommonCellProperties.textReplacement)
        ?: text?.takeIf { it.isNotEmpty() }
        ?: placeholderText
        ?: ""

fun ICellTree.Cell.getSelectableText(): String? = getProperty(CommonCellProperties.textReplacement) ?: text

val ICellTree.Cell.layout: LayoutedText get() = (this as FrontendCellTree.FrontendCellImpl).layout

val ICellTree.Cell.editorComponent: FrontendEditorComponent get() {
    return checkNotNull((this.getTree() as FrontendCellTree).editorComponent) {
        "Cell tree isn't attached to any editor component"
    }
}

fun ICellTree.Cell.backend(
    service: TextEditorServiceImpl,
    editor: FrontendEditorComponent,
) = backend(service, editor.editorId)

fun ICellTree.Cell.backend(
    service: TextEditorServiceImpl,
    editorId: EditorId,
) = service.getEditorBackend(editorId).tree.getCell(getId())

fun runLayoutOnCell(cell: ICellTree.Cell): LayoutedText = runLayoutOnCell(cell) { runLayoutOnCell(it) }

fun runLayoutOnCell(
    cell: ICellTree.Cell,
    layoutChild: (ICellTree.Cell) -> LayoutedText,
): LayoutedText =
    TextLayouter()
        .also {
            runLayoutOnCell(it, cell, layoutChild)
        }.done()

fun runLayoutOnCell(
    layouter: TextLayouter,
    cell: ICellTree.Cell,
    layoutChild: (ICellTree.Cell) -> LayoutedText,
) {
    when (cell.type) {
        ECellType.COLLECTION -> {
            val body: () -> Unit = {
                if (cell.getProperty(CommonCellProperties.onNewLine)) layouter.onNewLine()
                if (cell.getProperty(CommonCellProperties.noSpace)) layouter.noSpace()
                cell.getChildren().forEach { layouter.append(layoutChild(it)) }
                if (cell.getProperty(CommonCellProperties.noSpace)) layouter.noSpace()
            }
            if (cell.getProperty(CommonCellProperties.indentChildren)) {
                layouter.withIndent(body)
            } else {
                body()
            }
        }

        ECellType.TEXT -> {
            if (cell.getProperty(CommonCellProperties.onNewLine)) layouter.onNewLine()
            if (cell.getProperty(CommonCellProperties.noSpace)) layouter.noSpace()
            layouter.append(LayoutableCell(cell))
            if (cell.getProperty(CommonCellProperties.noSpace)) layouter.noSpace()
        }
    }
}
