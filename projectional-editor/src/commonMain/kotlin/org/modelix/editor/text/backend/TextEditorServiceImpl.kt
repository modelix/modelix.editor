package org.modelix.editor.text.backend

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.channels.SendChannel
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.channelFlow
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.withContext
import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CaretPositionPolicyWithIndex
import org.modelix.editor.Cell
import org.modelix.editor.CellActionProperties
import org.modelix.editor.ChildCompletionToken
import org.modelix.editor.ChildNodeCellReference
import org.modelix.editor.CodeCompletionActionProviderWrapper
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.CompletionPosition
import org.modelix.editor.CompletionToken
import org.modelix.editor.ContextActionsAspect
import org.modelix.editor.ECellType
import org.modelix.editor.EditorEngine
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICellAction
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.ITextChangeAction
import org.modelix.editor.NonExistingChild
import org.modelix.editor.NonExistingNode
import org.modelix.editor.PropertyCellReference
import org.modelix.editor.ReferencedNodeCellReference
import org.modelix.editor.ReplaceNodeActionProvider
import org.modelix.editor.RoleToken
import org.modelix.editor.SpaceCompletionToken
import org.modelix.editor.ancestors
import org.modelix.editor.applyShadowing
import org.modelix.editor.celltemplate.ChildCellTemplate
import org.modelix.editor.celltemplate.ClearOptionalCellAction
import org.modelix.editor.celltemplate.OverrideText
import org.modelix.editor.centerAlignedHierarchy
import org.modelix.editor.descendantsAndSelf
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getActionsAfter
import org.modelix.editor.getActionsBefore
import org.modelix.editor.getBordersBetween
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getContainmentLinkDefinition
import org.modelix.editor.getContextActions
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.isTabTarget
import org.modelix.editor.isVisible
import org.modelix.editor.leftBorder
import org.modelix.editor.nextCells
import org.modelix.editor.nextLeaf
import org.modelix.editor.previousCells
import org.modelix.editor.previousLeaf
import org.modelix.editor.replacement
import org.modelix.editor.rightBorder
import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.frontend.type
import org.modelix.editor.text.shared.CompletionMenuEntryData
import org.modelix.editor.text.shared.CompletionMenuTrigger
import org.modelix.editor.text.shared.ContextActionsMenuTrigger
import org.modelix.editor.text.shared.EditorId
import org.modelix.editor.text.shared.EditorUpdateData
import org.modelix.editor.text.shared.ServiceCallResult
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.editor.text.shared.celltree.CellInstanceId
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.editor.text.shared.celltree.cellReferences
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.IMutableModel
import org.modelix.model.api.IReadableNode
import org.modelix.model.api.NodeReference
import org.modelix.model.api.remove
import org.modelix.model.api.runSynchronized
import org.modelix.model.api.toSerialized

private val ROOT_NODES_LINK =
    BuiltinLanguages.MPSRepositoryConcepts.Model.rootNodes
        .toReference()

class TextEditorServiceImpl(
    val engine: EditorEngine,
    val model: IMutableModel,
    val coroutineScope: CoroutineScope,
) : TextEditorService {
    private var updateChannels: AtomicReference<Map<EditorId, EditorUpdateChannel>> = AtomicReference(emptyMap())
    private val validator = Validator(coroutineScope) { sendUpdates() }

    init {
        validator.start()
    }

    fun getAllEditorBackends(): List<BackendEditorComponent> = updateChannels.get().map { it.value.editor }

    fun getEditorBackend(editorId: Int): BackendEditorComponent = updateChannels.get().getValue(editorId).editor

    override fun openNode(
        editorId: EditorId,
        nodeRef: NodeReference,
    ): Flow<EditorUpdateData> {
        val node = model.executeRead { model.resolveNode(nodeRef) }
        val editorBackend = engine.editNode(node)
        return channelFlow {
            val updateChannel = EditorUpdateChannel(editorId, editorBackend, channel)
            try {
                updateChannels.getAndUpdate { it + (editorId to updateChannel) }
                updateChannel.sendUpdate()
                awaitClose()
            } finally {
                // Opening a different root node registers a new channel under the same editor ID before this
                // (cancelled) one is cleaned up, so only remove the channel that is still the registered one.
                updateChannels.getAndUpdate { if (it[editorId] === updateChannel) it - editorId else it }
            }
        }
    }

    private suspend fun <R> runWithCell(
        editorId: Int,
        cellId: CellInstanceId,
        body: (EditorUpdateChannel, ICellTree.Cell) -> R,
    ): R =
        runWithEditor(editorId) { updateChannel, editor ->
            body(updateChannel, editor.tree.getCell(cellId))
        }

    private suspend fun <R> runWithEditor(
        editorId: Int,
        body: (EditorUpdateChannel, BackendEditorComponent) -> R,
    ): R {
        val updateChannel: EditorUpdateChannel =
            requireNotNull(updateChannels.get().get(editorId)) {
                "Editor not found: $editorId"
            }
        return updateChannel.withPausedUpdates {
            val editor = updateChannel.editor
            body(updateChannel, editor)
        }
    }

    override suspend fun navigateTab(
        editorId: Int,
        cellId: CellInstanceId,
        forward: Boolean,
    ): EditorUpdateData =
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
                        updateChannel.editor.state.forceShowOptionals
                            .clear()
                        return@runWithCell updateChannel.createSelection(action.execute(updateChannel.editor))
                    }
                }
            }
            return@runWithCell updateChannel.createUpdate()
        }

    override suspend fun getContainingRootNode(nodeRef: NodeReference): NodeReference? =
        model.executeRead {
            model
                .tryResolveNode(nodeRef)
                ?.containingRootNode()
                ?.getNodeReference()
                ?.toSerialized()
        }

    /**
     * The node that an editor is opened on to show this node: the closest ancestor that is a root node of a model,
     * or the topmost ancestor if the model has no such structure.
     */
    private fun IReadableNode.containingRootNode(): IReadableNode {
        val parent = getParent() ?: return this
        return if (getContainmentLink().matches(ROOT_NODES_LINK)) this else parent.containingRootNode()
    }

    override suspend fun executeDelete(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            val ancestors = cell.ancestors(true).toList()
            val innermostAction =
                ancestors
                    .mapNotNull { it.getProperty(CellActionProperties.delete) }
                    .firstOrNull { it.isApplicable() }
            val deleteAction =
                if (innermostAction is ChildCellTemplate.EmptySlotDeleteAction &&
                    !updateChannel.editor.runRead { innermostAction.hasEffect() }
                ) {
                    // An empty slot in an optional part of the notation, like the `<>` of `int x = <>`. Deleting in
                    // it deletes that part, as deleting the `=` would.
                    val nodeCellIndex = ancestors.indexOfFirst { it.getProperty(CommonCellProperties.node) != null }
                    ancestors
                        .take(if (nodeCellIndex == -1) ancestors.size else nodeCellIndex)
                        .mapNotNull { it.getProperty(CellActionProperties.delete) }
                        .firstOrNull { it is ClearOptionalCellAction }
                        ?: innermostAction
                } else {
                    innermostAction
                }
            if (deleteAction != null) {
                return@runWithCell updateChannel.createSelection(deleteAction.execute(updateChannel.editor))
            }
            return@runWithCell updateChannel.createUpdate()
        }

    override suspend fun executeInsert(
        editorId: Int,
        cellId: CellInstanceId,
    ): EditorUpdateData =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            val actionOnSelectedCell = cell.getProperty(CellActionProperties.insert)?.takeIf { it.isApplicable() }
            if (actionOnSelectedCell != null) {
                return@runWithCell updateChannel.createSelection(actionOnSelectedCell.execute(updateChannel.editor))
            } else {
                var previousLeaf: Cell? = cell
                while (previousLeaf != null) {
                    val nextLeaf = previousLeaf.nextLeaf { it.isVisible() }
                    val actions =
                        getBordersBetween(previousLeaf.rightBorder(), nextLeaf?.leftBorder())
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
        rangeStart: Int,
        rangeEnd: Int,
        replacement: String,
    ): EditorUpdateData {
        val range = IntRange(rangeStart, rangeEnd)
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            val oldText = cell.getSelectableText() ?: ""
            val newText = oldText.replaceRange(range, replacement)
            val leftTransform = range.isEmpty() && range.first == 0
            val rightTransform = range.isEmpty() && range.first == oldText.length
            // Text that is still being typed is not a node yet that could be transformed. It goes on in the cell.
            val isPendingText = cell.getProperty(CommonCellProperties.textReplacement) != null
            val completionPosition =
                when {
                    leftTransform -> CompletionPosition.LEFT
                    rightTransform && !isPendingText -> CompletionPosition.RIGHT
                    else -> null
                }
            if (completionPosition != null) {
                val providers =
                    (
                        if (completionPosition == CompletionPosition.LEFT) {
                            cell.getActionsBefore()
                        } else {
                            cell.getActionsAfter()
                        }
                    ).toList()
                val params = CodeCompletionParameters(updateChannel.editor, replacement)
                val matchingActions =
                    updateChannel.editor.runRead {
                        val actions = providers.flatMap { it.flattenApplicableActions(params) }
                        actions
                            .filter { it.getCompletionPattern().startsWith(replacement) }
                            .applyShadowing()
                    }
                // The text of the cell goes on as long as it is still the text of something, like `1.` of `1.5`. A
                // side transform of the node behind the cell only applies to text that doesn't belong to it anymore.
                if (matchingActions.isEmpty() || continuesSubstitution(cell, newText, updateChannel.editor)) {
                    return@runWithCell overtypeConstant(cell, range, replacement, oldText, updateChannel)
                        ?: replaceText(cell, range, replacement, updateChannel, true).updateData
                        ?: updateChannel.createUpdate()
                }
                if (matchingActions.size == 1 && matchingActions.first().getCompletionPattern() == replacement) {
                    return@runWithCell matchingActions.first().executeAndUpdateSelection(updateChannel)
                }
                // A constant that is already there is what the user means, rather than a transformation that starts
                // with the same text: `:` in `c ? a : b` is the colon behind `a`.
                overtypeConstant(cell, range, replacement, oldText, updateChannel)?.let { return@runWithCell it }
                return@runWithCell updateChannel.createUpdate().copy(
                    menuTrigger =
                        CompletionMenuTrigger(
                            anchor = cell.getId(),
                            completionPosition = completionPosition,
                            pattern = replacement,
                            caretPosition = replacement.length
                        ),
                    completionEntries = updateChannel.editor.loadCompletionEntries(providers, replacement).toEntryData()
                )
            }
            overtypeConstant(cell, range, replacement, oldText, updateChannel)?.let { return@runWithCell it }
            replaceText(cell, range, replacement, updateChannel, true).updateData ?: updateChannel.createUpdate()
        }
    }

    /**
     * Whether [newText] is still, or can still become, what one of the substitutions of the cell writes.
     */
    private fun continuesSubstitution(
        cell: ICellTree.Cell,
        newText: String,
        editor: BackendEditorComponent,
    ): Boolean {
        if (newText.isBlank()) return false
        val providers = cell.getSubstituteActions().toList()
        if (providers.isEmpty()) return false
        val actions = editor.runRead { providers.flatMap { it.flattenApplicableActions(CodeCompletionParameters(editor, newText)) } }
        return actions.matchingCompletely(newText).isNotEmpty() || actions.any { it.isContinuedBy(newText) }
    }

    /**
     * Typing the text of a constant that is already there moves the caret over it, as in a text editor where the
     * brackets were inserted automatically. The constants of a notation are there from the start, so writing `if (`
     * or `x)` the way it's written in a text editor would otherwise end up as text that means nothing.
     *
     * The constant has to be right next to the caret: behind it, or in front of it in a cell that is still empty, which
     * is where the caret is after `if` created the statement.
     */
    private fun overtypeConstant(
        cell: ICellTree.Cell,
        range: IntRange,
        replacement: String,
        oldText: String,
        updateChannel: EditorUpdateChannel,
    ): EditorUpdateData? {
        if (!range.isEmpty() || replacement.isBlank()) return null

        fun ICellTree.Cell.isConstant() = getProperty(CommonCellProperties.constant)

        // Behind the whole constant, the caret goes on into a slot that follows it and still is empty.
        fun moveOver(
            constant: ICellTree.Cell,
            position: Int,
        ): EditorUpdateData {
            if (position == constant.getSelectableText().orEmpty().length) {
                val next = constant.nextLeaf { it.isVisible() }
                if (next != null && next.isTabTarget() && next.getSelectableText().isNullOrEmpty()) {
                    return updateChannel.createSelection(next, 0)
                }
            }
            return updateChannel.createSelection(constant, position)
        }

        val caretPos = range.first
        if (cell.isConstant() && oldText.startsWith(replacement, caretPos)) {
            return moveOver(cell, caretPos + replacement.length)
        }
        if (caretPos == oldText.length) {
            val next = cell.nextLeaf { it.isVisible() }
            if (next != null && next.isConstant() && next.getSelectableText().orEmpty().startsWith(replacement)) {
                return moveOver(next, replacement.length)
            }
        }
        if (oldText.isEmpty()) {
            val previous = cell.previousLeaf { it.isVisible() }
            if (previous != null && previous.isConstant() && previous.getSelectableText() == replacement) {
                return updateChannel.createUpdate()
            }
        }
        return null
    }

    override suspend fun triggerCodeCompletion(
        editorId: Int,
        cellId: CellInstanceId,
        caretPosition: Int,
    ): EditorUpdateData =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            val fullPattern = cell.getSelectableText().orEmpty()
            val pattern = fullPattern.take(caretPosition)
            val providers = cell.getSubstituteActions().toList()
            updateChannel.createUpdate().copy(
                menuTrigger =
                    CompletionMenuTrigger(
                        anchor = cell.getId(),
                        completionPosition = CompletionPosition.CENTER,
                        pattern = fullPattern,
                        caretPosition = caretPosition
                    ),
                completionEntries = updateChannel.editor.loadCompletionEntries(providers, pattern).toEntryData()
            )
        }

    override suspend fun triggerContextActions(
        editorId: Int,
        cellId: CellInstanceId,
        anchorCellId: CellInstanceId,
    ): EditorUpdateData =
        withContext(ContextActionsAspect.loadingContext) {
            loadContextActions(editorId, cellId, anchorCellId)
        }

    private suspend fun loadContextActions(
        editorId: Int,
        cellId: CellInstanceId,
        anchorCellId: CellInstanceId,
    ): EditorUpdateData =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            updateChannel.createUpdate().copy(
                menuTrigger = ContextActionsMenuTrigger(anchorCellId),
                completionEntries = updateChannel.editor.loadCompletionEntries(listOfNotNull(cell.getContextActions()), "").toEntryData()
            )
        }

    override suspend fun updateCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): EditorUpdateData =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            // The menu that was opened knows its providers: the side transforms of the anchor's border if it was
            // opened by typing next to a cell, which the substitute actions of the cell do not include.
            val entries =
                updateChannel.editor.completionMenu?.updateActions(pattern)
                    ?: updateChannel.editor.loadCompletionEntries(cell.getSubstituteActions().toList(), pattern)
            updateChannel.createUpdate().copy(completionEntries = entries.toEntryData())
        }

    override suspend fun hasCodeCompletionActions(
        editorId: Int,
        cellId: CellInstanceId,
        pattern: String,
    ): Boolean =
        runWithCell(editorId, cellId) { updateChannel, cell ->
            model.executeRead {
                updateChannel.editor.completionMenu
                    ?.computeActions(pattern)
                    ?.any() == true
            }
        }

    override suspend fun executeCodeCompletionAction(
        editorId: Int,
        actionId: Int,
    ): EditorUpdateData =
        runWithEditor(editorId) { updateChannel, editor ->
            model.executeWrite {
                val action =
                    requireNotNull(editor.completionMenu?.getEntries()?.getOrNull(actionId)) {
                        "Action with ID $actionId not found"
                    }
                val policy = action.execute(editor)
                val update = updateChannel.createUpdate()
                update.copy(
                    selectionChange = policy ?: update.selectionChange,
                )
            }
        }

    private fun replaceText(
        cell: ICellTree.Cell,
        range: IntRange,
        replacement: String,
        updateChannel: EditorUpdateChannel,
        triggerCompletion: Boolean,
    ): ServiceCallResult<Boolean> {
        val editor = updateChannel.editor
        val oldText = cell.getSelectableText() ?: ""
        val newText = oldText.replaceRange(range, replacement)

        if (triggerCompletion) {
            val providers = cell.getSubstituteActions().toList()
            val actions = editor.runRead { providers.flatMap { it.flattenApplicableActions(CodeCompletionParameters(editor, newText)) } }
            val matchingActions = actions.matchingCompletely(newText)

            // Complete immediately if there is a single matching action, unless the user may still be typing a
            // longer one: `do` is not the `do`-`while` loop yet as long as it can become a `double`.
            val singleAction = matchingActions.singleOrNull()
            if (singleAction != null && actions.none { it.isContinuedBy(newText) }) {
                return editor
                    .runWrite<EditorUpdateData> {
                        editor.state.clearTextReplacement(cell)
                        singleAction.executeAndUpdateSelection(updateChannel)
                    }.let { ServiceCallResult(updateData = it, result = true) }
            }

            // Text that nothing can be made of anymore, because the last key started a new token. What was typed
            // before is complete if exactly one action matches it, like the name of a variable before a `=`. That is
            // applied, and the new key is typed again behind it.
            val isAppended = range.isEmpty() && range.first == oldText.length
            val isPendingText = cell.getProperty(CommonCellProperties.textReplacement) != null
            if (isAppended && isPendingText && matchingActions.isEmpty() && actions.none { it.isContinuedBy(newText) } &&
                startsNewToken(oldText, replacement)
            ) {
                val previousActions =
                    editor.runRead { providers.flatMap { it.flattenApplicableActions(CodeCompletionParameters(editor, oldText)) } }
                val previousMatches = previousActions.matchingCompletely(oldText)
                val previousAction =
                    previousMatches.singleOrNull()
                        ?: editor
                            .runRead {
                                val location = providers.firstNotNullOfOrNull { it.replacedLocation() }
                                previousMatches.filter { it.acceptsNext(oldText, replacement, location, editor) }
                            }.singleOrNull()
                if (previousAction != null) {
                    return editor
                        .runWrite<EditorUpdateData> {
                            editor.state.clearTextReplacement(cell)
                            previousAction.executeAndUpdateSelection(updateChannel).copy(textToRetype = replacement)
                        }.let { ServiceCallResult(updateData = it, result = true) }
                }
            }
        }

        if (replacement.isEmpty() && newText.isEmpty()) {
            deleteNodeWithoutText(cell, updateChannel)?.let { return ServiceCallResult(updateData = it, result = true) }
        }

        val replaceTextActions = cell.centerAlignedHierarchy().mapNotNull { it.getProperty(CellActionProperties.replaceText) }

        // Spaces separate tokens. Where the model can't hold one and no text is pending, there is nothing a space can
        // separate, and it's dropped instead of being shown as text that means nothing - `return 1` is a return of 1.
        if (replacement.isNotEmpty() && replacement.isBlank() && cell.getProperty(CommonCellProperties.textReplacement) == null &&
            replaceTextActions.none { it.acceptsAsModelText(newText) }
        ) {
            return ServiceCallResult(updateData = updateChannel.createUpdate(), result = true)
        }
        for (action in replaceTextActions) {
            val newCaretPosition =
                CaretPositionPolicyWithIndex(
                    CaretPositionPolicy(avoidedCellRefs = emptySet(), preferredCellRefs = cell.cellReferences.toSet()),
                    range.first + replacement.length
                )
            if (action.isValid(newText) && action.replaceText(editor.state, range, replacement, newText)) {
                return ServiceCallResult(
                    updateData =
                        updateChannel.createUpdate().copy(
                            selectionChange = newCaretPosition
                        ),
                    result = true
                )
            }
        }

        return ServiceCallResult(false)
    }

    override suspend fun replaceText(
        editorId: Int,
        cellId: CellInstanceId,
        rangeStart: Int,
        rangeEnd: Int,
        replacement: String,
        triggerCompletion: Boolean,
    ): ServiceCallResult<Boolean> {
        val range = IntRange(rangeStart, rangeEnd)
        return runWithCell(editorId, cellId) { updateChannel, cell ->
            replaceText(cell, range, replacement, updateChannel, triggerCompletion)
        }
    }

    override suspend fun resetState(editorId: Int): EditorUpdateData =
        runWithEditor(editorId) { updateChannel, editor ->
            editor.state.reset()
            updateChannel.createUpdate()
        }

    override suspend fun flush(editorId: Int): EditorUpdateData =
        runWithEditor(editorId) { updateChannel, editor -> updateChannel.createUpdate() }

    private fun List<ICodeCompletionAction>.toEntryData(): List<CompletionMenuEntryData> =
        mapIndexed { index, entry ->
            CompletionMenuEntryData(
                id = index,
                matchingText = entry.getMatchingText(),
                description = entry.getDescription(),
                group = entry.getGroup(),
                icon = entry.getIcon(),
            )
        }

    private fun ICellAction.executeAndUpdateSelection(channel: EditorUpdateChannel): EditorUpdateData =
        channel.createSelection(execute(channel.editor))

    private fun ICodeCompletionAction.executeAndUpdateSelection(channel: EditorUpdateChannel): EditorUpdateData =
        channel.editor.runWrite {
            channel.createSelection(execute(channel.editor))
        }

    /**
     * Deleting the last character of the only text a node has deletes the node, rather than leaving a node behind
     * that shows nothing - like the `1` of `int x = 1`. The caret stays where the node was, in the then empty slot.
     *
     * Only applies to text that shows the node itself, its keyword or one of its properties or references, and to a
     * node in a single child link, where an empty slot takes its place.
     */
    private fun deleteNodeWithoutText(
        cell: ICellTree.Cell,
        updateChannel: EditorUpdateChannel,
    ): EditorUpdateData? {
        val nodeCell = cell.ancestors(true).firstOrNull { it.getProperty(CommonCellProperties.node) != null } ?: return null
        val node = nodeCell.getProperty(CommonCellProperties.node)?.getNode() ?: return null
        val otherText = nodeCell.descendantsAndSelf().filter { it != cell && it.type == ECellType.TEXT }
        if (otherText.any { !it.getSelectableText().isNullOrEmpty() }) return null
        val slot =
            updateChannel.editor.runWrite<ChildNodeCellReference?> {
                val nodeRef = node.reference.serialize()
                val showsTheNode =
                    cell.getProperty(CommonCellProperties.constant) ||
                        cell.cellReferences.any {
                            (it is PropertyCellReference && it.nodeRef.serialize() == nodeRef) ||
                                (it is ReferencedNodeCellReference && it.sourceNodeRef.serialize() == nodeRef)
                        }
                val parent = node.parent
                val link = node.asWritableNode().getContainmentLinkDefinition()
                if (!showsTheNode || parent == null || link == null || link.isMultiple) return@runWrite null
                updateChannel.editor.state.clearTextReplacement(cell)
                node.remove()
                ChildNodeCellReference(parent.reference, link.toReference(), 0)
            } ?: return null
        return updateChannel.createSelection(CaretPositionPolicy(slot))
    }

    /**
     * The actions whose completion pattern consumes all of [text].
     */
    private fun List<ICodeCompletionAction>.matchingCompletely(text: String) =
        filter { it.getTokens().consumeForAutoApply(text)?.length == 0 }.applyShadowing()

    /**
     * Whether the user can still be typing this action after having typed [text]: its pattern goes on after it, but
     * doesn't accept it yet.
     */
    private fun ICodeCompletionAction.isContinuedBy(text: String): Boolean {
        val pattern = getCompletionPattern()
        return pattern.length > text.length && pattern.startsWith(text) && getTokens().consumeForAutoApply(text)?.length != 0
    }

    /**
     * Whether what this action expects behind [typedBefore] can start with [typed]. That tells apart the actions
     * that all match what was typed before: `(` can be a parenthesized expression or a cast, but only an expression
     * can start with the `1` of `(1`.
     *
     * Only a child is checked, by the substitutions of its concept. Anything else is assumed to accept it.
     */
    private fun ICodeCompletionAction.acceptsNext(
        typedBefore: String,
        typed: String,
        replacedLocation: INonExistingNode?,
        editor: BackendEditorComponent,
    ): Boolean {
        val next = getTokens().nextTokenAfter(typedBefore) ?: return false
        if (next !is ChildCompletionToken) return next is RoleToken
        // The child is somewhere below where the typed text is, which is what scopes are computed for.
        val parent =
            replacedLocation?.let { it.replacement(it.expectedConcept() ?: next.role.targetConcept) }
                ?: NonExistingNode(next.role.targetConcept)
        val parameters = CodeCompletionParameters(editor, typed)
        val actions = ReplaceNodeActionProvider(NonExistingChild(parent, next.role)).flattenSafely(parameters).toList()
        return actions.matchingCompletely(typed).isNotEmpty() || actions.any { it.isContinuedBy(typed) }
    }

    /**
     * The actions of a provider, leaving out those of nested providers that fail - which the scope of a reference
     * may, where its node does not exist yet.
     */
    private fun IActionOrProvider.flattenSafely(parameters: CodeCompletionParameters): Sequence<ICodeCompletionAction> =
        when (this) {
            is ICodeCompletionAction -> {
                sequenceOf(this)
            }

            is ICodeCompletionActionProvider -> {
                runCatching { getApplicableActions(parameters) }
                    .getOrElse { emptyList() }
                    .asSequence()
                    .flatMap { it.flattenSafely(parameters) }
            }

            else -> {
                emptySequence()
            }
        }

    /**
     * Where the node goes that a substitution of a cell creates.
     */
    private fun ICodeCompletionActionProvider.replacedLocation(): INonExistingNode? =
        when (this) {
            is ReplaceNodeActionProvider -> location
            is CodeCompletionActionProviderWrapper -> wrappedProvider.replacedLocation()
            else -> null
        }

    /**
     * The token of a completion pattern that follows the part that [text] consumes, if [text] ends between tokens.
     */
    private fun ICompletionTokenOrList.nextTokenAfter(text: String): CompletionToken? {
        var remaining: CharSequence = text
        for (token in flatten()) {
            if (remaining.isEmpty()) {
                if (token is SpaceCompletionToken) continue
                return token
            }
            remaining = token.consumeForAutoApply(remaining) ?: return null
        }
        return null
    }

    /**
     * Whether [typed] starts a new token behind [before]. Letters and digits continue a name or a number.
     */
    private fun startsNewToken(
        before: String,
        typed: String,
    ): Boolean {
        fun Char.isWordChar() = isLetterOrDigit() || this == '_'
        val last = before.lastOrNull() ?: return false
        val first = typed.firstOrNull() ?: return false
        return !(last.isWordChar() && first.isWordChar())
    }

    /**
     * Whether [text] is valid as what the cell shows of the model, not only as text that is shown instead of it. A
     * cell can be wrapped in an [OverrideText] for each template it is part of.
     */
    private fun ITextChangeAction.acceptsAsModelText(text: String): Boolean =
        if (this is OverrideText) delegate?.acceptsAsModelText(text) == true else isValid(text)

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

class EditorUpdateChannel(
    val editorId: EditorId,
    val editor: BackendEditorComponent,
    val channel: SendChannel<EditorUpdateData>,
) {
    private val mutex = Mutex()

    suspend fun sendUpdate() {
        mutex.withLock {
            editor
                .update()
                .takeIf { it.isNotEmpty() }
                ?.let { channel.send(EditorUpdateData(it)) }
        }
    }

    suspend fun <R> withPausedUpdates(body: suspend () -> R): R =
        mutex.withLock {
            body()
        }

    fun createSelection(
        textCell: ICellTree.Cell,
        position: Int,
    ): EditorUpdateData {
        require(textCell.type == ECellType.TEXT) { "Not a text cell: $textCell" }
        val newSelection =
            CaretPositionPolicyWithIndex(
                policy =
                    CaretPositionPolicy(
                        avoidedCellRefs = emptySet(),
                        preferredCellRefs = textCell.cellReferences.toSet()
                    ),
                index = position
            )
        return createSelection(newSelection)
    }

    fun createSelection(newSelection: ICaretPositionPolicy?): EditorUpdateData =
        EditorUpdateData(cellTreeChanges = editor.update(), selectionChange = newSelection)

    fun createUpdate(): EditorUpdateData = EditorUpdateData(editor.update())
}

class AtomicReference<E>(
    private var value: E,
) {
    fun getAndUpdate(updater: (E) -> E): E {
        runSynchronized(this) {
            value = updater(value)
            return value
        }
    }

    fun get() = value
}
