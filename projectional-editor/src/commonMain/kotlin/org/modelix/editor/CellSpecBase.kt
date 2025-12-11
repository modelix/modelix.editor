package org.modelix.editor

import org.modelix.editor.text.frontend.layout
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import org.modelix.model.api.INode

sealed class CellSpecBase : Freezable(), ILocalOrChildNodeCell {
    val cellReferences: MutableList<CellReference> = ArrayList()
    val children: MutableList<ILocalOrChildNodeCell> = ArrayList()
    val properties = CellProperties()

    fun addChild(child: ILocalOrChildNodeCell) {
        children.add(child)
    }

    open fun layout(buffer: TextLayouter, cell: Cell) {
        val body: () -> Unit = {
            if (properties[CommonCellProperties.onNewLine]) buffer.onNewLine()
            if (properties[CommonCellProperties.noSpace]) buffer.noSpace()
            cell.getChildren().forEach { buffer.append(it.layout) }
            if (properties[CommonCellProperties.noSpace]) buffer.noSpace()
        }
        if (properties[CommonCellProperties.indentChildren]) {
            buffer.withIndent(body)
        } else {
            body()
        }
    }

    open fun cellToString(cell: Cell) = "[${cell.getChildren().joinToString(" ")}]"

    open fun isVisible(): Boolean = false
}

fun Cell.isVisible() = when (getProperty(CommonCellProperties.type)) {
    ECellType.COLLECTION -> false
    ECellType.TEXT -> true
}

sealed interface ILocalOrChildNodeCell

class ChildSpecReference(val childNode: INode) : ILocalOrChildNodeCell

class CellSpec : CellSpecBase()

class TextCellSpec(val text: String, val placeholderText: String = "") : CellSpecBase() {
    fun getVisibleText(cell: Cell): String {
        return if (cell.getChildren().isEmpty()) {
            text.ifEmpty { placeholderText }
        } else {
            """$text<${cell.getChildren()}>"""
        }
    }

    override fun layout(buffer: TextLayouter, cell: Cell) {
        if (properties[CommonCellProperties.onNewLine]) buffer.onNewLine()
        if (properties[CommonCellProperties.noSpace]) buffer.noSpace()
        buffer.append(LayoutableCell(cell))
        if (properties[CommonCellProperties.noSpace]) buffer.noSpace()
    }

    override fun cellToString(cell: Cell) = getVisibleText(cell)

    override fun isVisible(): Boolean = true
}

val ICellTree.Cell.type: ECellType get() = getProperty(CommonCellProperties.type)

var IMutableCellTree.MutableCell.type: ECellType?
    get() = getProperty(CommonCellProperties.type)
    set(value) = if (value == null) removeProperty(CommonCellProperties.type) else setProperty(CommonCellProperties.type, value)
