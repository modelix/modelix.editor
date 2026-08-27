package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.consumeEach
import kotlinx.coroutines.completeWith
import kotlinx.coroutines.launch
import kotlinx.coroutines.withTimeout
import kotlinx.html.TagConsumer
import kotlinx.html.div
import org.modelix.editor.text.backend.AtomicReference
import org.modelix.editor.text.frontend.FrontendCellTree
import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.shared.CompletionMenuEntryData
import org.modelix.editor.text.shared.CompletionMenuTrigger
import org.modelix.editor.text.shared.EditorId
import org.modelix.editor.text.shared.EditorUpdateData
import org.modelix.editor.text.shared.ServiceCallResult
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.editor.text.shared.celltree.CellInstanceId
import org.modelix.editor.text.shared.celltree.CellTreeOp
import org.modelix.incremental.IncrementalIndex
import org.modelix.kotlin.utils.AtomicLong
import org.modelix.kotlin.utils.ContextValue
import org.modelix.kotlin.utils.JvmSynchronized
import org.modelix.model.api.INodeReference
import org.modelix.model.api.runSynchronized
import org.modelix.model.api.toSerialized
import kotlin.collections.orEmpty
import kotlin.math.abs
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.time.Duration.Companion.seconds

private val LOG = KotlinLogging.logger { }

open class FrontendEditorComponent(
    private val service: TextEditorService,
    val virtualDom: IVirtualDom = IVirtualDom.newInstance(),
) : IProducesHtml {
    val editorId: EditorId = idSequence.incrementAndGet().toInt()
    private val coroutineScope: CoroutineScope = CoroutineScope(Dispatchers.Default)
    private val eventQueue = UIEventDispatcher(coroutineScope)
    private val state =
        FrontendEditorComponentState(this, onHtmlInvalidation = {
            eventQueue.enqueue(UIEventType.Html, { getHtmlElement() })
        })
    private val remoteUpdatesLoop: AtomicReference<Job?> = AtomicReference(null)
    private val openedRootGeneration = AtomicLong(0)

    /**
     * Invoked by [navigateToNode] for a node that is outside the currently opened root node. It receives the node to
     * navigate to and the root node that has to be opened to show it. A host application can use this to open that
     * root node somewhere else (a new browser tab, a tab component, a second editor) instead of replacing the
     * content of this editor. Returns true if it navigated to the node.
     */
    var navigateToExternalNode: ((targetNode: INodeReference, rootNode: INodeReference) -> Boolean)? = null

    /**
     * The root node this editor currently shows, as passed to [openNode].
     */
    private var openedRootNode: INodeReference? = null

    fun openNode(rootNode: INodeReference): Deferred<EditorUpdateData> {
        val firstUpdate = CompletableDeferred<EditorUpdateData>()
        remoteUpdatesLoop.getAndUpdate { currentJob ->
            currentJob?.cancel("root node changed")
            // Cancelling the previous flow doesn't happen immediately. The generation lets an update that is still
            // on its way be recognized as one of the previous root node, whose cells don't exist anymore.
            val generation = openedRootGeneration.incrementAndGet()
            openedRootNode = rootNode
            state.resetCellTree()
            val updateFlow = service.openNode(editorId, rootNode.toSerialized())
            coroutineScope.launch {
                var isFirst = true
                updateFlow.collect { update ->
                    if (openedRootGeneration.get() != generation) {
                        LOG.trace { "Ignoring an update of a root node that is not open anymore" }
                        return@collect
                    }
                    enqueueUpdate(update)
                    if (isFirst) {
                        isFirst = false
                        firstUpdate.complete(update)
                    }
                }
            }
        }
        return firstUpdate
    }

    suspend fun flush() = flushRemote()

    suspend fun flushRemote() {
        flushRemoteLater()
        flushLocal()
    }

    suspend fun flushRemoteLater() = enqueueUpdate(service.flush(editorId))

    suspend fun flushLocal() {
        flushLocalLater().await()
    }

    fun flushLocalLater() = eventQueue.enqueue(UIEventType.UserInput, {})

    fun <R> afterFlushLocal(body: suspend () -> R): UIEventDispatcher.Event<R> {
        flushLocalLater()
        return enqueueUpdate(body)
    }

    suspend fun <R> afterFlushRemote(body: suspend () -> R): UIEventDispatcher.Event<R> {
        flushRemoteLater()
        return enqueueUpdate(body)
    }

    fun getMainLayer(): IVirtualDom.HTMLElement? =
        getHtmlElement()?.childNodes?.filterIsInstance<IVirtualDom.HTMLElement>()?.find {
            it.getClasses().contains(MAIN_LAYER_CLASS_NAME)
        }

    suspend fun flushAndUpdateSelection(newSelection: () -> Selection?) {
        flushRemoteLater().await()
        newSelection()?.let { doChangeSelection(it) }
    }

    fun resolveCell(reference: CellReference): List<Cell> = state.resolveCell(reference)

    fun resolveLayoutable(cell: Cell): LayoutableCell? = state.resolveLayoutable(cell)

    fun getHtmlElement(producer: IProducesHtml) = state.getHtmlElement(producer)

    override fun isHtmlOutputValid(): Boolean = false

    fun getHtmlElement(): IVirtualDom.HTMLElement? = state.getHtmlElement(this)

    suspend fun editNode(node: INodeReference) {
        openNode(node.toSerialized()).await()
    }

    fun enqueueUpdate() = enqueueUpdate(EditorUpdateData())

    fun enqueueUpdate(updateData: EditorUpdateData): UIEventDispatcher.Event<Unit> {
        LOG.trace { "enqueueUpdate $updateData" }
        runSynchronized(state) {
            state.updateCellTree(updateData.cellTreeChanges)
            if (updateData.completionMenuTrigger != null) {
                state.triggerCodeCompletionMenu(updateData.completionMenuTrigger)
            }
            if (updateData.completionEntries != null) {
                state.updateCompletionEntries(updateData.completionEntries)
            }
            if (updateData.selectionChange != null) {
                state.setSelection(updateData.selectionChange)
            }
            return eventQueue.enqueue(UIEventType.Html) {
                state.updateHtml()
            }
        }
    }

    fun <R> enqueueUpdate(body: suspend () -> R): UIEventDispatcher.Event<R> = eventQueue.enqueue(UIEventType.Generic, body)

    suspend fun updateNow(update: EditorUpdateData? = null) {
        enqueueUpdate(update ?: EditorUpdateData()).await()
    }

    suspend fun resetState() {
        serviceCall { resetState(editorId) }
    }

    open fun editorElementChanged(newElement: IVirtualDom.HTMLElement) {}

    fun updateHtml() {
        state.updateHtml()
    }

    fun getCellTree() = state.getCellTree()

    fun getRootCell() = state.getRootCell()

    suspend fun changeSelection(newSelection: Selection) {
        doChangeSelection(newSelection)
    }

    fun doChangeSelection(newSelection: Selection) {
        state.setSelection(newSelection)
        state.closeCompletionMenu()
    }

    fun changeSelectionLater(newSelection: Selection): UIEventDispatcher.Event<Unit> =
        eventQueue.enqueue(UIEventType.Selection) {
            doChangeSelection(newSelection)
        }

    fun getSelection(): Selection? = state.getSelection()

    fun showCodeCompletionMenu(
        anchor: LayoutableCell,
        position: CompletionPosition,
        entries: List<CompletionMenuEntryData>,
        pattern: String = "",
        caretPosition: Int? = null,
    ) = eventQueue.invokeLater {
        state.showCodeCompletionMenu(anchor, position, entries, pattern, caretPosition)
    }

    fun closeCodeCompletionMenu() =
        eventQueue.invokeLater {
            state.closeCompletionMenu()
        }

    open fun dispose() {
        eventQueue.dispose()
        remoteUpdatesLoop.getAndUpdate { currentJob ->
            currentJob?.cancel("disposed")
            null
        }
        coroutineScope.cancel("disposed")
    }

    fun enqueueUIEvent(event: JSUIEvent): UIEventDispatcher.Event<Unit> {
        LOG.trace { "enqueueUIEvent $event" }
        return eventQueue.enqueue(UIEventType.UserInput) {
            LOG.trace { "process event: $event" }
            when (event) {
                is JSKeyboardEvent -> processKeyEvent(event)
                is JSMouseEvent -> processMouseEvent(event)
            }
        }
    }

    private fun processKeyUp(event: JSKeyboardEvent): Boolean = true

    private suspend fun processKeyDown(event: JSKeyboardEvent): Boolean {
        try {
            if (event.knownKey == KnownKeys.F5) {
                clearLayoutCache()
                // state.reset()
                return true
            }
            for (handler in listOfNotNull(state.getCodeCompletionMenu(), state.getSelection())) {
                if (handler.processKeyDown(event)) return true
            }
            return false
        } finally {
            flushLocalLater()
        }
    }

    suspend fun processMouseEvent(event: JSMouseEvent) {
        when (event.eventType) {
            JSMouseEventType.CLICK -> processClick(event)
        }
    }

    suspend fun processKeyEvent(event: JSKeyboardEvent) {
        when (event.eventType) {
            JSKeyboardEventType.KEYDOWN -> processKeyDown(event)
            JSKeyboardEventType.KEYUP -> processKeyUp(event)
        }
    }

    suspend fun processClick(event: JSMouseEvent): Boolean {
        val targets = virtualDom.ui.getElementsAt(event.x, event.y)
        LOG.trace { "targets: $targets" }
        for (target in targets) {
            val htmlElement = target as? IVirtualDom.HTMLElement
            val producer: IProducesHtml = htmlElement?.let { state.getProducer(it) } ?: continue
            when (producer) {
                is LayoutableCell -> {
                    val layoutable = producer as? LayoutableCell ?: continue
                    if (event.isNavigationClick() && navigateToReferenceTarget(layoutable.cell)) return true
                    val text = layoutable.toText() // htmlElement.innerText
                    val cellAbsoluteBounds = htmlElement.getInnerBounds()
                    val relativeClickX = event.x - cellAbsoluteBounds.x
                    val characterWidth = cellAbsoluteBounds.width / text.length
                    val caretPos =
                        (relativeClickX / characterWidth)
                            .roundToInt()
                            .coerceAtMost(layoutable.cell.getMaxCaretPos())
                    doChangeSelection(CaretSelection(this, layoutable, caretPos))
                    return true
                }

                is Layoutable -> {
                    if (selectClosestInLine(producer.getLine() ?: continue, event.x)) return true
                }

                is TextLine -> {
                    if (selectClosestInLine(producer, event.x)) return true
                }

                else -> {
                    continue
                }
            }
        }
        return false
    }

    /**
     * Navigates to the target of the reference that is shown by [cell], like Cmd/Ctrl+click does in MPS.
     *
     * Returns false if the cell doesn't show a reference, if the reference is unset, or if the target couldn't be
     * located (see [navigateToNode]).
     */
    suspend fun navigateToReferenceTarget(cell: Cell): Boolean {
        val targetRef =
            cell
                .ancestors(true)
                .firstNotNullOfOrNull { it.getProperty(CommonCellProperties.referenceTarget) } ?: return false
        return navigateToNode(targetRef)
    }

    /**
     * Moves the selection to the cell of the given node and scrolls it into view.
     *
     * A node outside the currently opened root node has no cell in this editor. Like MPS, which opens the editor of
     * the root node that contains the target, this editor then switches to that root node and selects the target
     * there. A host application that shows more than just this editor (a URL, a node tree, ...) can take over by
     * setting [navigateToExternalNode].
     *
     * Returns false if the node was neither found nor handled.
     */
    suspend fun navigateToNode(targetRef: INodeReference): Boolean {
        if (selectNode(targetRef)) return true

        val rootNode = serviceCall { getContainingRootNode(targetRef.toSerialized()) }
        if (rootNode == null) {
            LOG.warn { "Cannot navigate to $targetRef. The node was not found in the model." }
            return false
        }

        // The node is inside the opened root node, but has no cell. Nothing to open, and opening the same root node
        // somewhere else wouldn't show the node either.
        if (rootNode == openedRootNode) {
            LOG.warn { "Cannot navigate to $targetRef. The node has no cell in the editor of $rootNode." }
            return false
        }

        navigateToExternalNode?.let {
            LOG.trace { "No cell found for $targetRef. Delegating the root node $rootNode to the host application." }
            if (it.invoke(targetRef, rootNode)) return true
        }

        LOG.trace { "No cell found for $targetRef. Opening its root node $rootNode." }
        openNode(rootNode).await()
        return selectNode(targetRef)
    }

    /**
     * Moves the selection to the cell of the given node and scrolls it into view, if that node is part of the
     * currently opened root node. Unlike [navigateToNode] it never opens a different root node.
     */
    fun selectNode(targetRef: INodeReference): Boolean {
        val selection = CaretPositionPolicy(NodeCellReference(targetRef)).getBestSelection(this) ?: return false
        doChangeSelection(selection)
        scrollIntoViewLater { getHtmlElement(selection.layoutable) }
        return true
    }

    private fun selectClosestInLine(
        line: TextLine,
        absoluteClickX: Double,
    ): Boolean {
        val words = line.words.filterIsInstance<LayoutableCell>()
        val closest =
            words.map { it to state.getHtmlElement(it)!! }.minByOrNull {
                min(
                    abs(absoluteClickX - it.second.getOuterBounds().minX()),
                    abs(absoluteClickX - it.second.getOuterBounds().maxX()),
                )
            } ?: return false
        val caretPos =
            if (absoluteClickX <= closest.second.getOuterBounds().minX()) {
                0
            } else {
                closest.first.cell
                    .getSelectableText()
                    ?.length ?: 0
            }
        doChangeSelection(CaretSelection(this, closest.first, caretPos))
        return true
    }

    fun clearLayoutCache() {
        state.getRootCell().descendantsAndSelf().forEach { (it as FrontendCellTree.FrontendCellImpl).clearCachedLayout() }
    }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("editor") {
            div(MAIN_LAYER_CLASS_NAME) {
                produceChild(getRootCell().layout)
            }
            div("selection-layer relative-layer") {
                produceChild(state.getSelectionView())
            }
            div("popup-layer relative-layer") {
                produceChild(state.getCodeCompletionMenu())
            }
        }
    }

    suspend fun updateCodeCompletionActions(
        anchorCell: Cell,
        pattern: String,
    ) {
        serviceCall {
            this.updateCodeCompletionActions(editorId, anchorCell.getId(), pattern)
        }
        state.getCodeCompletionMenu() // flus pending updates of completion entries
    }

    fun invalidateCompletionMenu() = state.invalidateCompletionMenu()

    fun scrollIntoViewLater(element: () -> IVirtualDom.HTMLElement?) {
        eventQueue.invokeLater { element()?.let { scrollIntoView(it) } }
    }

    open fun scrollIntoView(element: IVirtualDom.HTMLElement) {}

    suspend fun <R> serviceCall(call: suspend TextEditorService.() -> R): R {
        val result = call(service)
        when (result) {
            is EditorUpdateData -> enqueueUpdate(result)
            is ServiceCallResult<*> -> result.updateData?.let { enqueueUpdate(it) }
        }
        return result
    }

    companion object {
        private val idSequence = AtomicLong(0L)
        val MAIN_LAYER_CLASS_NAME = "main-layer"
        private val LOG = KotlinLogging.logger { }
    }
}

interface IKeyboardHandler {
    suspend fun processKeyDown(event: JSKeyboardEvent): Boolean
}

class UIEventDispatcher(
    val coroutineScope: CoroutineScope,
) {
    private val eventQueue = Channel<Event<*>>(capacity = Channel.UNLIMITED)
    private val pendingEvents = ArrayList<Event<*>>()
    private val isInsideEvent = ContextValue<Event<*>>()

    init {
        coroutineScope.launch {
            eventQueue.consumeEach {
                runSynchronized(pendingEvents) {
                    pendingEvents.add(it)
                }
                while (processNextEvent()) {}
            }
            LOG.trace { "consuming done" }
        }
    }

    private fun drainEvents() {
        while (true) {
            val event = eventQueue.tryReceive().getOrNull() ?: break
            pendingEvents.add(event)
        }
    }

    private suspend fun processNextEvent(): Boolean {
        val event =
            runSynchronized(pendingEvents) {
                drainEvents()
                if (pendingEvents.isEmpty()) return false
                pendingEvents.sortBy { it.type }
                pendingEvents.removeFirst()
            }
        try {
            event.process()
        } catch (ex: CancellationException) {
            throw ex
        } catch (ex: Throwable) {
            LOG.error(ex) { "UI event processing failed" }
        }
        return true
    }

    fun <R> enqueue(
        type: UIEventType,
        body: suspend () -> R,
    ): Event<R> {
        val event: Event<R> = Event(type, body)
        LOG.trace { "Enqueuing $event" }
        check(eventQueue.trySend(event).isSuccess) {
            "Enqueuing event failed"
        }
        return event
    }

    fun <R> invokeLater(
        type: UIEventType = UIEventType.Generic,
        body: suspend () -> R,
    ): Event<R> = enqueue(type, body)

    suspend fun <R> invokeAndWait(
        type: UIEventType = UIEventType.Generic,
        body: () -> R,
    ): R = enqueue(type, body).await()

    fun dispose() {
        eventQueue.close()
    }

    inner class Event<out E>(
        val type: UIEventType,
        val body: suspend () -> E,
    ) {
        private val returnValue = CompletableDeferred<E>()

        fun getReturnValue(): Deferred<E> = returnValue

        override fun toString(): String = "event:$type:$body"

        suspend fun process() {
            LOG.trace { "Processing $this" }
            returnValue.completeWith(
                runCatching {
                    try {
                        withTimeout(5.seconds) {
                            isInsideEvent.runInCoroutine(this@Event) {
                                body.invoke()
                            }
                        }
                    } catch (ex: Throwable) {
                        LOG.error(ex) { "Event processing failed" }
                        throw ex
                    }
                }
            )
            LOG.trace { "Processed $this" }
        }

        suspend fun await(): E = returnValue.await()
    }
}

enum class UIEventType {
    Generic,
    Selection,
    Html,
    UserInput,
    Scroll,
}

class FrontendEditorComponentState(
    val editorComponent: FrontendEditorComponent,
    val onHtmlInvalidation: () -> Unit,
) {
    private val cellTree =
        Substate(CellTreeState(FrontendCellTree(editorComponent), emptyList())) {
            it.cellTree.applyChanges(it.pendingChanges)
            it.copy(pendingChanges = emptyList())
        }
    private val selection =
        Substate<SelectionState>(SelectionState()) { oldState ->
            var newSelection: Selection? = null
            for (policy in oldState.pendingSelectionUpdates.asReversed()) {
                val s = policy.getBestSelection(editorComponent)
                if (s != null) {
                    newSelection = s
                    break
                }
            }

            if (newSelection == null) {
                newSelection = oldState.selection?.takeIf { it.isValid() }
                    ?: oldState.selection?.update(editorComponent)
            }

            LOG.trace { "selection ${oldState.selection} -> $newSelection" }

            oldState.copy(
                selection = newSelection,
                pendingSelectionUpdates = emptyList()
            )
        }
    private val layoutablesIndex =
        Substate(IncrementalIndex<Cell, LayoutableCell>()) {
            it.update(
                cellTree
                    .getValidState()
                    .cellTree
                    .getRoot()
                    .layout.layoutablesIndexList
            )
            it
        }.also {
            it.addDependency(cellTree)
        }
    private val codeCompletionMenu =
        Substate<CompletionMenuState>(CompletionMenuState()) { oldState ->
            for (trigger in oldState.pendingTriggers.asReversed()) {
                val anchor = getCell(trigger.anchor).layoutable() ?: continue
                return@Substate oldState.copy(
                    menu =
                        CodeCompletionMenu(
                            editorComponent,
                            anchor,
                            trigger.completionPosition,
                            oldState.pendingEntriesUpdate.orEmpty(),
                            trigger.pattern,
                            trigger.caretPosition,
                        ),
                    pendingTriggers = emptyList(),
                    pendingEntriesUpdate = null
                )
            }

            if (oldState.pendingEntriesUpdate != null) {
                oldState.menu?.loadEntries(oldState.pendingEntriesUpdate)
                return@Substate oldState.copy(pendingEntriesUpdate = null)
            }

            return@Substate oldState
        }
    private val selectionView =
        Substate<SelectionView<*>?>(null) {
            if (it?.selection != selection.getValidState().selection) {
                when (val selection = selection.getValidState().selection) {
                    is CaretSelection -> CaretSelectionView(selection, editorComponent)
                    is CellSelection -> CellSelectionView(selection, editorComponent)
                    else -> null
                }
            } else {
                it
            }
        }.also {
            it.addDependency(selection)
        }
    private val htmlState =
        Substate(HtmlState(), onInvalidation = onHtmlInvalidation) { oldState ->
            val oldEditorElement = oldState.generatedHtmlMap.getOutput(editorComponent)
            val newEditorElement =
                IncrementalVirtualDOMBuilder(
                    editorComponent.virtualDom,
                    oldEditorElement,
                    oldState.generatedHtmlMap
                ).produce(editorComponent)()
            if (newEditorElement != oldEditorElement) {
                editorComponent.editorElementChanged(newEditorElement)
            }

            val selectedLayoutable = (selection.getValidState().selection as? CaretSelection)?.layoutable

            val newHighlightedLine = selectedLayoutable?.getLine()?.let { oldState.generatedHtmlMap.getOutput(it) }
            if (newHighlightedLine != oldState.highlightedLine) {
                oldState.highlightedLine?.removeClass("highlighted")
            }
            newHighlightedLine?.addClass("highlighted")

            val newHighlightedCell = selectedLayoutable?.let { oldState.generatedHtmlMap.getOutput(it) }
            if (newHighlightedCell != oldState.highlightedCell) {
                oldState.highlightedCell?.removeClass("highlighted-cell")
            }
            newHighlightedCell?.addClass("highlighted-cell")

            selectionView.getValidState()?.update()
            codeCompletionMenu.getValidState().menu?.let { CodeCompletionMenuUI(it, editorComponent).updateBounds() }

            oldState.copy(
                highlightedLine = newHighlightedLine,
                highlightedCell = newHighlightedCell,
            )
        }.also {
            it.addDependency(selection)
            it.addDependency(selectionView)
            it.addDependency(codeCompletionMenu)
        }

    @JvmSynchronized
    fun getProducer(element: IVirtualDom.HTMLElement) = htmlState.getValidState().generatedHtmlMap.getProducer(element)

    @JvmSynchronized
    fun getRootCell() = cellTree.getValidState().cellTree.getRoot()

    @JvmSynchronized
    fun getCellTree() = cellTree.getValidState().cellTree

    @JvmSynchronized
    fun updateHtml() {
        htmlState.getValidState()
    }

    @JvmSynchronized
    fun invalidateCompletionMenu() {
        codeCompletionMenu.invalidate()
    }

    @JvmSynchronized
    fun resolveCell(reference: CellReference): List<Cell> = cellTree.getValidState().cellTree.resolveCell(reference)

    @JvmSynchronized
    fun getCell(id: CellInstanceId) = cellTree.getValidState().cellTree.getCell(id)

    @JvmSynchronized
    fun resolveLayoutable(cell: Cell): LayoutableCell? = layoutablesIndex.getValidState().lookup(cell).firstOrNull()

    @JvmSynchronized
    fun getHtmlElement(producer: IProducesHtml): IVirtualDom.HTMLElement? = htmlState.getValidState().generatedHtmlMap.getOutput(producer)

    /**
     * Throws away the cells of the previously opened root node. A new root node is rendered by a new backend editor
     * whose cell IDs start from scratch, so the old cells cannot stay in the tree.
     */
    @JvmSynchronized
    fun resetCellTree() {
        cellTree.setState(CellTreeState(FrontendCellTree(editorComponent), emptyList()))
        selection.setState(SelectionState())
        codeCompletionMenu.setState(CompletionMenuState())
    }

    @JvmSynchronized
    fun updateCellTree(changes: List<CellTreeOp>) {
        if (changes.isEmpty()) return
        cellTree.changeState {
            it.copy(pendingChanges = it.pendingChanges + changes)
        }
    }

    @JvmSynchronized
    fun getCodeCompletionMenu() = codeCompletionMenu.getValidState().menu

    @JvmSynchronized
    fun getSelectionView() = selectionView.getValidState()

    @JvmSynchronized
    fun setSelection(newSelection: Selection) {
        selection.changeState {
            it.copy(selection = newSelection, pendingSelectionUpdates = emptyList())
        }
    }

    @JvmSynchronized
    fun setSelection(policy: ICaretPositionPolicy) {
        selection.changeState {
            it.copy(pendingSelectionUpdates = it.pendingSelectionUpdates + policy)
        }
    }

    @JvmSynchronized
    fun getSelection() = selection.getValidState().selection

    @JvmSynchronized
    fun closeCompletionMenu() {
        codeCompletionMenu.changeState { CompletionMenuState() }
    }

    @JvmSynchronized
    fun showCodeCompletionMenu(
        anchor: LayoutableCell,
        position: CompletionPosition,
        entries: List<CompletionMenuEntryData>,
        pattern: String = "",
        caretPosition: Int? = null,
    ) {
        codeCompletionMenu.setState(
            CompletionMenuState(
                menu = CodeCompletionMenu(editorComponent, anchor, position, entries, pattern, caretPosition)
            )
        )
    }

    @JvmSynchronized
    fun triggerCodeCompletionMenu(trigger: CompletionMenuTrigger) {
        codeCompletionMenu.changeState { it.copy(pendingTriggers = it.pendingTriggers + trigger) }
    }

    @JvmSynchronized
    fun updateCompletionEntries(newEntries: List<CompletionMenuEntryData>) {
        codeCompletionMenu.changeState { it.copy(pendingEntriesUpdate = newEntries) }
    }

    data class CellTreeState(
        val cellTree: FrontendCellTree,
        val pendingChanges: List<CellTreeOp>,
    )

    data class HtmlState(
        val generatedHtmlMap: GeneratedHtmlMap = GeneratedHtmlMap(),
        val highlightedLine: IVirtualDom.HTMLElement? = null,
        val highlightedCell: IVirtualDom.HTMLElement? = null,
    )

    data class SelectionState(
        val selection: Selection? = null,
        val pendingSelectionUpdates: List<ICaretPositionPolicy> = emptyList(),
    )

    data class CompletionMenuState(
        val menu: CodeCompletionMenu? = null,
        val pendingTriggers: List<CompletionMenuTrigger> = emptyList(),
        val pendingEntriesUpdate: List<CompletionMenuEntryData>? = null,
    )
}

class Substate<S>(
    initial: S,
    val onInvalidation: (() -> Unit)? = null,
    val updater: ((S) -> S)? = null,
) {
    private var state: S = initial
    private var isValid = false
    private var validating = false
    private val dependsOn = LinkedHashSet<Substate<*>>()
    private val inverseDependencies = LinkedHashSet<Substate<*>>()

    @JvmSynchronized
    fun setState(newState: S) {
        invalidate()
        state = newState
    }

    @JvmSynchronized
    fun changeState(updater: (S) -> S): S {
        dependsOn.forEach { it.validate() }
        val newState = updater(state)
        if (newState == state) return state
        state = newState
        invalidate()
        return newState
    }

    @JvmSynchronized
    fun getState() = state

    @JvmSynchronized
    fun getValidState(): S {
        validate()
        return state
    }

    @JvmSynchronized
    fun addDependency(dep: Substate<*>) {
        dependsOn.add(dep)
        dep.inverseDependencies.add(this)
    }

    @JvmSynchronized
    fun invalidate() {
        if (!isValid) return
        isValid = false
        inverseDependencies.forEach { it.invalidate() }
        onInvalidation?.invoke()
    }

    @JvmSynchronized
    fun validate() {
        if (isValid || validating) return
        try {
            validating = true
            dependsOn.forEach { it.validate() }
            if (updater != null) state = updater(state)
            isValid = true
        } finally {
            validating = false
        }
    }
}
