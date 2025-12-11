package org.modelix.editor.text.backend

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.channels.SendChannel
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.channelFlow
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CaretPositionPolicyWithIndex
import org.modelix.editor.Cell
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.CompletionPosition
import org.modelix.editor.ECellType
import org.modelix.editor.EditorEngine
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICellAction
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ancestors
import org.modelix.editor.applyShadowing
import org.modelix.editor.centerAlignedHierarchy
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getActionsAfter
import org.modelix.editor.getActionsBefore
import org.modelix.editor.getBordersBetween
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.isTabTarget
import org.modelix.editor.isVisible
import org.modelix.editor.leftBorder
import org.modelix.editor.nextCells
import org.modelix.editor.nextLeaf
import org.modelix.editor.previousCells
import org.modelix.editor.rightBorder
import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.frontend.type
import org.modelix.editor.text.shared.CompletionMenuEntryData
import org.modelix.editor.text.shared.CompletionMenuTrigger
import org.modelix.editor.text.shared.EditorId
import org.modelix.editor.text.shared.EditorUpdateData
import org.modelix.editor.text.shared.ServiceCallResult
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.editor.text.shared.celltree.CellInstanceId
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.editor.text.shared.celltree.cellReferences
import org.modelix.model.api.IMutableModel
import org.modelix.model.api.NodeReference
import org.modelix.model.api.runSynchronized

class TextEditorServiceImpl(val engine: EditorEngine, val model: IMutableModel, val coroutineScope: CoroutineScope) : TextEditorService {
    private var updateChannels: AtomicReference<Map<EditorId, EditorUpdateChannel>> = AtomicReference(emptyMap())
    private val validator = Validator(coroutineScope) { sendUpdates() }

    init {
        validator.start()
    }

    fun getAllEditorBackends(): List<BackendEditorComponent> {
        return updateChannels.get().map { it.value.editor }
    }

    fun getEditorBackend(editorId: Int): BackendEditorComponent = updateChannels.get().getValue(editorId).editor

    override fun openNode(editorId: EditorId, nodeRef: NodeReference): Flow<EditorUpdateData> {
        val node = model.executeRead { model.resolveNode(nodeRef) }
        val editorBackend = engine.editNode(node)
        return channelFlow {
            val updateChannel = EditorUpdateChannel(editorId, editorBackend, channel)
            try {
                updateChannels.getAndUpdate { it + (editorId to updateChannel) }
                updateChannel.sendUpdate()
                awaitClose()
            } finally {
                updateChannels.getAndUpdate { it - editorId }
            }
        }
    }

    private suspend fun <R> runWithCell(editorId: Int, cellId: CellInstanceId, body: (EditorUpdateChannel, ICellTree.Cell) -> R): R {
        return runWithEditor(editorId) { updateChannel, editor ->
            body(updateChannel, editor.tree.getCell(cellId))
        }
    }

    private suspend fun <R> runWithEditor(editorId: Int, body: (EditorUpdateChannel, BackendEditorComponent) -> R): R {
        val updateChannel: EditorUpdateChannel = requireNotNull(updateChannels.get().get(editorId)) {
            "Editor not found: $editorId"
        }
        return updateChannel.withPausedUpdates {
            val editor = updateChannel.editor
            body(updateChannel, editor)
        }
    }

    override suspend fun navigateTab(editorId: Int, cellId: CellInstanceId, forward: Boolean): EditorUpdateData =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            for (c in if (forward) cell.nextCells() else cell.previousCells()) {
                if (c.isTabTarget()) {
                    if (c.type == ECellType.TEXT) {
                        return@runWithCell updateChannel.createSelection(c, 0)
                    }
                }
                val action = c.getProperty(CellActionProperties.show)
                if (action != null) {
                    // cannot tab into nested optionals because the parent optional will disappear
                    if (!c.ancestors(true).any { it.getProperty(CommonCellProperties.isForceShown) }) {
                        updateChannel.editor.state.forceShowOptionals.clear()
                        return@runWithCell updateChannel.createSelection(action.execute(updateChannel.editor))
                    }
                }
            }
            return@runWithCell updateChannel.createUpdate()
        }

    override suspend fun executeDelete(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData = runWithCell(editorId, cellId) { updateChannel, cell ->
        val deleteAction = cell.ancestors(true)
            .mapNotNull { it.getProperty(CellActionProperties.delete) }
            .firstOrNull { it.isApplicable() }
        if (deleteAction != null) {
            return@runWithCell updateChannel.createSelection(deleteAction.execute(updateChannel.editor))
        }
        return@runWithCell updateChannel.createUpdate()
    }

    override suspend fun executeInsert(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData = runWithCell(editorId, cellId) { updateChannel, cell ->
        val actionOnSelectedCell = cell.getProperty(CellActionProperties.insert)?.takeIf { it.isApplicable() }
        if (actionOnSelectedCell != null) {
            return@runWithCell updateChannel.createSelection(actionOnSelectedCell.execute(updateChannel.editor))
        } else {
            var previousLeaf: Cell? = cell
            while (previousLeaf != null) {
                val nextLeaf = previousLeaf.nextLeaf { it.isVisible() }
                val actions = getBordersBetween(previousLeaf.rightBorder(), nextLeaf?.leftBorder())
                    .filter { it.isLeft }
                    .mapNotNull { it.cell.getProperty(CellActionProperties.insert) }
                    .distinct()
                    .filter { it.isApplicable() }
                // TODO resolve conflicts if multiple actions are applicable
                val action = actions.firstOrNull()
                if (action != null) {
                    return@runWithCell updateChannel.createSelection(action.execute(updateChannel.editor))
                }
                previousLeaf = nextLeaf
            }
        }
        return@runWithCell updateChannel.createUpdate()
    }

    override suspend fun processTypedText(
        editorId: Int,
        cellId: CellInstanceId,
        range: IntRange,
        replacement: String,
    ): EditorUpdateData {
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            val oldText = cell.getSelectableText() ?: ""
            val textLength = oldText.length
            val leftTransform = range.isEmpty() && range.first == 0
            val rightTransform = range.isEmpty() && range.first == textLength
            if (leftTransform || rightTransform) {
                // if (replaceText(range, typedText, editor, false)) return

                val completionPosition = if (leftTransform) CompletionPosition.LEFT else CompletionPosition.RIGHT
                val providers = (
                    if (completionPosition == CompletionPosition.LEFT) {
                        cell.getActionsBefore()
                    } else {
                        cell.getActionsAfter()
                    }
                    ).toList()
                val params = CodeCompletionParameters(updateChannel.editor, replacement)
                val matchingActions = updateChannel.editor.runRead {
                    val actions = providers.flatMap { it.flattenApplicableActions(params) }
                    actions
                        .filter { it.getCompletionPattern().startsWith(replacement) }
                        .applyShadowing()
                }
                if (matchingActions.isNotEmpty()) {
                    if (matchingActions.size == 1 && matchingActions.first().getCompletionPattern() == replacement) {
                        return@runWithCell matchingActions.first().executeAndUpdateSelection(updateChannel)
                    }
                    return@runWithCell updateChannel.createUpdate().copy(
                        completionMenuTrigger = CompletionMenuTrigger(
                            anchor = cell.getId(),
                            completionPosition = completionPosition,
                            pattern = replacement,
                            caretPosition = replacement.length
                        ),
                        completionEntries = updateChannel.editor.loadCompletionEntries(providers, replacement).mapIndexed { index, entry ->
                            CompletionMenuEntryData(
                                id = index,
                                matchingText = entry.getMatchingText(),
                                description = entry.getDescription()
                            )
                        }
                    )
                }
            }
            replaceText(cell, range, replacement, updateChannel, true) ?: updateChannel.createUpdate()
        }
    }

    private fun replaceText(cell: ICellTree.Cell, range: IntRange, replacement: String, updateChannel: EditorUpdateChannel, triggerCompletion: Boolean): EditorUpdateData? {
        val editor = updateChannel.editor
        val oldText = cell.getSelectableText() ?: ""
        val newText = oldText.replaceRange(range, replacement)

        if (triggerCompletion) {
            // complete immediately if there is a single matching action
            val providers = cell.getSubstituteActions()
            val params = CodeCompletionParameters(editor, newText)
            val actions = editor.runRead { providers.flatMap { it.flattenApplicableActions(params) }.toList() }
            val matchingActions = actions
                .filter { it.getTokens().consumeForAutoApply(newText)?.length == 0 }
                .applyShadowing()
            val singleAction = matchingActions.singleOrNull()
            if (singleAction != null) {
                val caretPolicy = editor.runWrite {
                    singleAction.execute(editor).also {
                        editor.state.clearTextReplacement(cell)
                    }
                }
                return updateChannel.createSelection(caretPolicy)
            }
        }

        val replaceTextActions = cell.centerAlignedHierarchy().mapNotNull { it.getProperty(CellActionProperties.replaceText) }
        for (action in replaceTextActions) {
            if (action.isValid(newText) && action.replaceText(editor.state, range, replacement, newText)) {
                val cellReferences = cell.cellReferences.toSet()
                return updateChannel.createUpdate()
                    .copy(selectionChange = CaretPositionPolicyWithIndex(cellReferences, range.first + replacement.length))
            }
        }
        return null
    }

    override suspend fun triggerCodeCompletion(
        editorId: Int,
        cellId: CellInstanceId,
        caretPosition: Int,
    ): EditorUpdateData {
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            val pattern = cell.getSelectableText().orEmpty().take(caretPosition)
            val providers = cell.getSubstituteActions().toList()
            updateChannel.createUpdate().copy(
                completionMenuTrigger = CompletionMenuTrigger(
                    anchor = cell.getId(),
                    completionPosition = CompletionPosition.CENTER,
                    pattern = pattern,
                    caretPosition = caretPosition
                ),
                completionEntries = updateChannel.editor.loadCompletionEntries(providers, pattern).mapIndexed { index, entry ->
                    CompletionMenuEntryData(
                        id = index,
                        matchingText = entry.getMatchingText(),
                        description = entry.getDescription()
                    )
                }
            )
        }
    }

    override suspend fun updateCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): EditorUpdateData {
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            val providers = cell.getSubstituteActions().toList()
            updateChannel.createUpdate().copy(
                completionEntries = updateChannel.editor.loadCompletionEntries(providers, pattern).mapIndexed { index, entry ->
                    CompletionMenuEntryData(
                        id = index,
                        matchingText = entry.getMatchingText(),
                        description = entry.getDescription()
                    )
                }
            )
        }
    }

    override suspend fun hasCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): Boolean {
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            model.executeRead {
                updateChannel.editor.completionMenu?.computeActions(pattern)?.any() == true
            }
        }
    }

    override suspend fun executeCodeCompletionAction(editorId: Int, actionId: Int): EditorUpdateData {
        return runWithEditor(editorId) { updateChannel, editor ->
            model.executeWrite {
                val action = requireNotNull(editor.completionMenu?.getEntries()?.getOrNull(actionId)) {
                    "Action with ID $actionId not found"
                }
                val policy = action.execute(editor)
                val update = updateChannel.createUpdate()
                update.copy(
                    selectionChange = policy ?: update.selectionChange,
                )
            }
        }
    }

    override suspend fun replaceText(
        editorId: Int,
        cellId: CellInstanceId,
        range: IntRange,
        replacement: String,
        triggerCompletion: Boolean,
    ): ServiceCallResult<Boolean> {
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            val editor = updateChannel.editor
            val oldText = cell.getSelectableText() ?: ""
            val newText = oldText.replaceRange(range, replacement)

            if (triggerCompletion) {
                // complete immediately if there is a single matching action
                val providers = cell.getSubstituteActions()
                val params = CodeCompletionParameters(editor, newText)
                val actions = editor.runRead { providers.flatMap { it.flattenApplicableActions(params) }.toList() }
                val matchingActions = actions
                    .filter { it.getTokens().consumeForAutoApply(newText)?.length == 0 }
                    .applyShadowing()
                val singleAction = matchingActions.singleOrNull()
                if (singleAction != null) {
                    editor.runWrite<Unit> {
                        singleAction.executeAndUpdateSelection(updateChannel)
                        editor.state.clearTextReplacement(cell)
                    }
                    return@runWithCell ServiceCallResult(
                        updateData = updateChannel.createUpdate(),
                        result = true
                    )
                }
            }

            val replaceTextActions = cell.centerAlignedHierarchy().mapNotNull { it.getProperty(CellActionProperties.replaceText) }
            for (action in replaceTextActions) {
                val newCaretPosition = CaretPositionPolicyWithIndex(
                    CaretPositionPolicy(avoidedCellRefs = emptySet(), preferredCellRefs = cell.cellReferences.toSet()),
                    range.first + replacement.length
                )
                if (action.isValid(newText) && action.replaceText(editor.state, range, replacement, newText)) {
                    return@runWithCell ServiceCallResult(
                        updateData = updateChannel.createUpdate().copy(
                            selectionChange = newCaretPosition
                        ),
                        result = true
                    )
                }
            }
            return@runWithCell ServiceCallResult(false)
        }
    }

    override suspend fun resetState(editorId: Int): EditorUpdateData {
        return runWithEditor(editorId) { updateChannel, editor ->
            editor.state.reset()
            updateChannel.createUpdate()
        }
    }

    override suspend fun flush(editorId: Int): EditorUpdateData {
        return runWithEditor(editorId) { updateChannel, editor -> updateChannel.createUpdate() }
    }

    private fun ICellAction.executeAndUpdateSelection(channel: EditorUpdateChannel): EditorUpdateData {
        return channel.createSelection(execute(channel.editor))
    }

    private fun ICodeCompletionAction.executeAndUpdateSelection(channel: EditorUpdateChannel): EditorUpdateData {
        return channel.createSelection(execute(channel.editor))
    }

    fun triggerUpdates() {
        validator.invalidate()
    }

    private suspend fun sendUpdates() {
        for (updateChannel in updateChannels.get().values) {
            updateChannel.sendUpdate()
        }
    }

    fun dispose() {
        validator.stop()
        engine.dispose()
    }
}

class EditorUpdateChannel(val editorId: EditorId, val editor: BackendEditorComponent, val channel: SendChannel<EditorUpdateData>) {
    private val mutex = Mutex()
    suspend fun sendUpdate() {
        mutex.withLock {
            editor.update()
                .takeIf { it.isNotEmpty() }
                ?.let { channel.send(EditorUpdateData(it)) }
        }
    }

    suspend fun <R> withPausedUpdates(body: suspend () -> R): R {
        return mutex.withLock {
            body()
        }
    }

    fun createSelection(textCell: ICellTree.Cell, position: Int): EditorUpdateData {
        require(textCell.type == ECellType.TEXT) { "Not a text cell: $textCell" }
        val newSelection = CaretPositionPolicyWithIndex(
            policy = CaretPositionPolicy(
                avoidedCellRefs = emptySet(),
                preferredCellRefs = textCell.cellReferences.toSet()
            ),
            index = position
        )
        return createSelection(newSelection)
    }

    fun createSelection(newSelection: ICaretPositionPolicy?): EditorUpdateData {
        return EditorUpdateData(cellTreeChanges = editor.update(), selectionChange = newSelection)
    }

    fun createUpdate(): EditorUpdateData {
        return EditorUpdateData(editor.update())
    }
}

class AtomicReference<E>(private var value: E) {
    fun getAndUpdate(updater: (E) -> E): E {
        runSynchronized(this) {
            value = updater(value)
            return value
        }
    }

    fun get() = value
}
