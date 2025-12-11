package org.modelix.editor.text.backend

import org.modelix.editor.CachedCodeCompletionActions
import org.modelix.editor.CellCreationCall
import org.modelix.editor.CellTreeState
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.EditorEngine
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.NodeCellCreationCall
import org.modelix.editor.Selection
import org.modelix.editor.applyShadowing
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.text.shared.celltree.BackendCellTree
import org.modelix.editor.text.shared.celltree.CellTreeOp

class BackendEditorComponent(val rootCall: CellCreationCall, val engine: EditorEngine) {

    val state = CellTreeState()
    val tree: BackendCellTree get() = state.cellTree
    var completionMenu: CompletionMenuBackend? = null
    private var selectionUpdater: (() -> Selection?)? = null

    fun dispose() {}

    fun updateNow() = update()

    fun selectAfterUpdate(newSelection: () -> Selection?) {
        selectionUpdater = newSelection
    }

    fun update(): List<CellTreeOp> {
        return tree.runUpdate {
            runRead {
                val newCell = engine.createCell(state, rootCall)
                tree.getRoot().getChildren().minus(newCell).forEach { it.detach() }
                if (newCell.getParent() != tree.getRoot()) {
                    newCell.moveCell(tree.getRoot(), 0)
                }
            }
        }
    }

    fun loadCompletionEntries(providers: List<ICodeCompletionActionProvider>, pattern: String): List<ICodeCompletionAction> {
        return CompletionMenuBackend(providers).let {
            completionMenu = it
            it.updateActions(pattern)
        }
    }

    fun <R> runWrite(body: () -> R): R {
        return when (rootCall) {
            is NodeCellCreationCall -> rootCall.node.getModel().executeWrite(body)
        }
    }

    fun <R> runRead(body: () -> R): R {
        return when (rootCall) {
            is NodeCellCreationCall -> rootCall.node.getModel().executeRead(body)
        }
    }

    inner class CompletionMenuBackend(
        val providers: List<ICodeCompletionActionProvider>,
    ) {
        val actionsCache = CachedCodeCompletionActions(providers)
        private var entries: List<ICodeCompletionAction> = emptyList()

        fun updateActions(pattern: String): List<ICodeCompletionAction> {
            return computeActions(pattern).also { entries = it }
        }

        fun getEntries(): List<ICodeCompletionAction> = entries

        fun computeActions(pattern: String): List<ICodeCompletionAction> {
            return runRead {
                val parameters = CodeCompletionParameters(this@BackendEditorComponent, pattern)
                actionsCache.update(parameters)
                    .filter {
                        val matchingText = it.getCompletionPattern()
                        matchingText.isNotEmpty() && matchingText.startsWith(parameters.pattern)
                    }
                    .applyShadowing()
                    .sortedBy { it.getCompletionPattern().lowercase() }
            }
        }
    }
}
