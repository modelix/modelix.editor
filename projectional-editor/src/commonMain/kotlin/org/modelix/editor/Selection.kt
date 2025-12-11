package org.modelix.editor

import org.modelix.editor.text.shared.celltree.ICellTree

abstract class Selection : IKeyboardHandler {
    abstract fun isValid(): Boolean
    abstract fun update(editor: FrontendEditorComponent): Selection?
    abstract fun getSelectedCells(): List<ICellTree.Cell>
}

abstract class SelectionView<E : Selection>(val selection: E) : IProducesHtml {
    abstract fun update()
}
