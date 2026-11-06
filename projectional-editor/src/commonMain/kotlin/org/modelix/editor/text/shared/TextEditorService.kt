package org.modelix.editor.text.shared

import kotlinx.coroutines.flow.Flow
import kotlinx.rpc.annotations.Rpc
import kotlinx.serialization.Serializable
import org.modelix.editor.CompletionPosition
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.text.shared.celltree.CellInstanceId
import org.modelix.editor.text.shared.celltree.CellTreeOp
import org.modelix.model.api.NodeReference

typealias EditorId = Int

@Rpc
interface TextEditorService {
    fun openNode(
        editorId: EditorId,
        nodeRef: NodeReference,
    ): Flow<EditorUpdateData>

    suspend fun navigateTab(
        editorId: Int,
        cellId: CellInstanceId,
        forward: Boolean,
    ): EditorUpdateData

    /**
     * The root node that contains [nodeRef], the one an editor has to be opened on to make that node visible.
     * Used to navigate to a reference target that is outside the currently opened root node.
     * Returns null if the node doesn't exist in the model.
     */
    suspend fun getContainingRootNode(nodeRef: NodeReference): NodeReference?

    suspend fun executeDelete(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData

    suspend fun executeInsert(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData

    suspend fun processTypedText(
        editorId: Int,
        cellId: CellInstanceId,
        rangeStart: Int,
        rangeEnd: Int,
        replacement: String,
    ): EditorUpdateData

    suspend fun triggerCodeCompletion(
        editorId: Int,
        cellId: CellInstanceId,
        caretPosition: Int,
    ): EditorUpdateData

    /**
     * Opens the context actions menu with the actions of [cellId]. [anchorCellId] is the text cell the menu is shown
     * at. They differ if a whole node is selected, which has no text cell of its own.
     */
    suspend fun triggerContextActions(
        editorId: Int,
        cellId: CellInstanceId,
        anchorCellId: CellInstanceId,
    ): EditorUpdateData

    suspend fun updateCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): EditorUpdateData

    suspend fun hasCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): Boolean

    suspend fun executeCodeCompletionAction(
        editorId: Int,
        actionId: Int,
    ): EditorUpdateData

    suspend fun replaceText(
        editorId: Int,
        cellId: CellInstanceId,
        rangeStart: Int,
        rangeEnd: Int,
        replacement: String,
        triggerCompletion: Boolean,
    ): ServiceCallResult<Boolean>

    suspend fun resetState(editorId: Int): EditorUpdateData

    suspend fun flush(editorId: Int): EditorUpdateData
}

class NullTextEditorService : TextEditorService {
    override fun openNode(
        editorId: EditorId,
        nodeRef: NodeReference,
    ): Flow<EditorUpdateData> {
        TODO("Not yet implemented")
    }

    override suspend fun navigateTab(
        editorId: Int,
        cellId: CellInstanceId,
        forward: Boolean,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun getContainingRootNode(nodeRef: NodeReference): NodeReference? = null

    override suspend fun executeDelete(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun executeInsert(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun processTypedText(
        editorId: Int,
        cellId: CellInstanceId,
        rangeStart: Int,
        rangeEnd: Int,
        replacement: String,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun triggerCodeCompletion(
        editorId: Int,
        cellId: CellInstanceId,
        caretPosition: Int,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun triggerContextActions(
        editorId: Int,
        cellId: CellInstanceId,
        anchorCellId: CellInstanceId,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun updateCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun hasCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): Boolean {
        TODO("Not yet implemented")
    }

    override suspend fun executeCodeCompletionAction(
        editorId: Int,
        actionId: Int,
    ): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun replaceText(
        editorId: Int,
        cellId: CellInstanceId,
        rangeStart: Int,
        rangeEnd: Int,
        replacement: String,
        triggerCompletion: Boolean,
    ): ServiceCallResult<Boolean> {
        TODO("Not yet implemented")
    }

    override suspend fun resetState(editorId: Int): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun flush(editorId: Int): EditorUpdateData = EditorUpdateData()
}

@Serializable
data class ServiceCallResult<E>(
    val result: E,
    val updateData: EditorUpdateData? = null,
)

@Serializable
data class EditorUpdateData(
    val cellTreeChanges: List<CellTreeOp> = emptyList(),
    val selectionChange: ICaretPositionPolicy? = null,
    val menuTrigger: ActionMenuTrigger? = null,
    val completionEntries: List<CompletionMenuEntryData>? = null,
)

/**
 * Opens an [org.modelix.editor.ActionMenu] at the cell [anchor].
 */
@Serializable
sealed interface ActionMenuTrigger {
    val anchor: CellInstanceId
}

@Serializable
data class CompletionMenuTrigger(
    override val anchor: CellInstanceId,
    val completionPosition: CompletionPosition = CompletionPosition.CENTER,
    val pattern: String = "",
    val caretPosition: Int = 0,
) : ActionMenuTrigger

@Serializable
data class ContextActionsMenuTrigger(
    override val anchor: CellInstanceId,
) : ActionMenuTrigger

@Serializable
data class CompletionMenuEntryData(
    val id: Int,
    val matchingText: String,
    val description: String,
) {
    fun matches(
        pattern: String,
        ignoreCase: Boolean = false,
    ): Boolean {
        // TODO more sophisticated pattern matching
        return matchingText.contains(pattern, ignoreCase)
    }

    fun matchesExactly(pattern: String): Boolean = matchingText == pattern
}
