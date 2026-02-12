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
        range: IntRange,
        replacement: String,
    ): EditorUpdateData

    suspend fun triggerCodeCompletion(
        editorId: Int,
        cellId: CellInstanceId,
        caretPosition: Int,
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
        range: IntRange,
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
        range: IntRange,
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
        range: IntRange,
        replacement: String,
        triggerCompletion: Boolean,
    ): ServiceCallResult<Boolean> {
        TODO("Not yet implemented")
    }

    override suspend fun resetState(editorId: Int): EditorUpdateData {
        TODO("Not yet implemented")
    }

    override suspend fun flush(editorId: Int): EditorUpdateData {
        TODO("Not yet implemented")
    }
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
    val completionMenuTrigger: CompletionMenuTrigger? = null,
    val completionEntries: List<CompletionMenuEntryData>? = null,
)

@Serializable
data class CompletionMenuTrigger(
    val anchor: CellInstanceId,
    val completionPosition: CompletionPosition = CompletionPosition.CENTER,
    val pattern: String = "",
    val caretPosition: Int = 0,
)

@Serializable
data class CompletionMenuEntryData(
    val id: Int,
    val matchingText: String,
    val description: String,
) {
    fun matches(pattern: String): Boolean {
        // TODO more sophisticated pattern matching
        return matchingText.contains(pattern)
    }

    fun matchesExactly(pattern: String): Boolean = matchingText == pattern
}
