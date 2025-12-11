package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.onFailure
import kotlinx.coroutines.completeWith
import kotlinx.coroutines.launch
import kotlinx.html.TagConsumer
import kotlinx.html.div
import org.modelix.editor.text.backend.AtomicReference
import org.modelix.editor.text.frontend.FrontendCellTree
import org.modelix.editor.text.frontend.getSelectableText
import org.modelix.editor.text.shared.CompletionMenuEntryData
import org.modelix.editor.text.shared.EditorId
import org.modelix.editor.text.shared.EditorUpdateData
import org.modelix.editor.text.shared.ServiceCallResult
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.editor.text.shared.consume
import org.modelix.incremental.IncrementalIndex
import org.modelix.kotlin.utils.AtomicLong
import org.modelix.model.api.INodeReference
import org.modelix.model.api.runSynchronized
import org.modelix.model.api.toSerialized
import kotlin.math.abs
import kotlin.math.min
import kotlin.math.roundToInt

open class FrontendEditorComponent(
    private val service: TextEditorService,
    val virtualDom: IVirtualDom = IVirtualDom.newInstance(),
) : IProducesHtml {
    val editorId: EditorId = idSequence.incrementAndGet().toInt()
    val cellTree = FrontendCellTree(this)
    private var selection: Selection? = null
    private val layoutablesIndex: IncrementalIndex<Cell, LayoutableCell> = IncrementalIndex()
    protected var codeCompletionMenu: CodeCompletionMenu? = null
    private var selectionView: SelectionView<*>? = null
    val generatedHtmlMap = GeneratedHtmlMap()
    private var highlightedLine: IVirtualDom.HTMLElement? = null
    private var highlightedCell: IVirtualDom.HTMLElement? = null
    private val coroutineScope: CoroutineScope = CoroutineScope(Dispatchers.Default)
    private val uiEventQueue = coroutineScope.consume<JSUIEvent>(capacity = 100, onBufferOverflow = BufferOverflow.DROP_LATEST) { event ->
        when (event) {
            is JSKeyboardEvent -> processKeyEvent(event)
            is JSMouseEvent -> processMouseEvent(event)
        }
    }
    private val uiUpdateQueue = coroutineScope.consume<Pair<() -> Unit, CompletableDeferred<Unit>>>(capacity = Channel.UNLIMITED) {
        it.second.completeWith(runCatching { it.first.invoke() })
    }
    private val updateLoop: AtomicReference<Job?> = AtomicReference(null)
    private val updateLock = Any()

    fun openNode(rootNode: INodeReference): Deferred<EditorUpdateData> {
        val firstUpdate = CompletableDeferred<EditorUpdateData>()
        updateLoop.getAndUpdate { currentJob ->
            currentJob?.cancel("root node changed")
            val updateFlow = service.openNode(editorId, rootNode.toSerialized())
            coroutineScope.launch {
                var isFirst = true
                updateFlow.collect { update ->
                    if (isFirst) {
                        isFirst = false
                        firstUpdate.complete(update)
                    }
                    enqueueUpdate(update)
                }
            }
        }
        return firstUpdate
    }

    suspend fun flush() {
        return enqueueUpdate(service.flush(editorId)).await()
    }

    suspend fun flushRemote() {
        return enqueueUpdate(service.flush(editorId)).await()
    }

    suspend fun flushLocal() {
        return enqueueUpdate(EditorUpdateData()).await()
    }

    fun getMainLayer(): IVirtualDom.HTMLElement? {
        return getHtmlElement()?.childNodes?.filterIsInstance<IVirtualDom.HTMLElement>()?.find { it.getClasses().contains(MAIN_LAYER_CLASS_NAME) }
    }

    suspend fun flushAndUpdateSelection(newSelection: () -> Selection?) {
        val updateData = service.flush(editorId)
        enqueueUpdate {
            updateNow(updateData)
            newSelection()?.let { changeSelection(it) }
        }.await()
    }

    fun resolveCell(reference: CellReference): List<Cell> = cellTree.resolveCell(reference)

    fun resolveLayoutable(cell: Cell): LayoutableCell? {
        updateLayoutablesIndex()
        return layoutablesIndex.lookup(cell).firstOrNull()
    }

    private fun updateLayoutablesIndex() {
        layoutablesIndex.update(cellTree.getRoot().layout.layoutablesIndexList)
    }

    override fun isHtmlOutputValid(): Boolean = false

    fun getHtmlElement(): IVirtualDom.HTMLElement? = generatedHtmlMap.getOutput(this)

    suspend fun editNode(node: INodeReference) {
        openNode(node.toSerialized()).await()
    }

    fun enqueueUpdate(updateData: EditorUpdateData): Deferred<Unit> {
        return enqueueUpdate { updateNow(updateData) }
    }

    fun enqueueUpdate(body: () -> Unit): Deferred<Unit> {
        val result = CompletableDeferred<Unit>()
        uiUpdateQueue.trySend(body to result).getOrThrow()
        return result
    }

    fun updateNow(update: EditorUpdateData? = null) {
        runSynchronized(updateLock) {
            if (update != null) {
                cellTree.applyChanges(update.cellTreeChanges)
            }
            update?.selectionChange?.getBestSelection(this)?.let { selection = it }
            updateSelection()
            updateSelectionView()
            update?.completionMenuTrigger?.let {
                val layoutable = cellTree.getCell(it.anchor).layoutable() ?: return@let
                showCodeCompletionMenu(
                    layoutable,
                    it.completionPosition,
                    update.completionEntries.orEmpty(),
                    it.pattern,
                    it.caretPosition,
                )
            }
            update?.completionEntries?.let { newEntries ->
                codeCompletionMenu?.loadEntries(newEntries)
            }
            updateHtml()
            selectionView?.update()
            codeCompletionMenu?.let { CodeCompletionMenuUI(it, this).updateBounds() }
        }
    }

    suspend fun resetState() {
        serviceCall { resetState(editorId) }
    }

    protected open fun editorElementChanged(newElement: IVirtualDom.HTMLElement) {}

    fun updateHtml() {
        val oldEditorElement = generatedHtmlMap.getOutput(this)
        val newEditorElement = IncrementalVirtualDOMBuilder(virtualDom, oldEditorElement, generatedHtmlMap).produce(this)()
        if (newEditorElement != oldEditorElement) {
            editorElementChanged(newEditorElement)
        }

        val selectedLayoutable = (getSelection() as? CaretSelection)?.layoutable

        val newHighlightedLine = selectedLayoutable?.getLine()?.let { generatedHtmlMap.getOutput(it) }
        if (newHighlightedLine != highlightedLine) {
            highlightedLine?.removeClass("highlighted")
        }
        newHighlightedLine?.addClass("highlighted")
        highlightedLine = newHighlightedLine

        val newHighlightedCell = selectedLayoutable?.let { generatedHtmlMap.getOutput(it) }
        if (newHighlightedCell != highlightedCell) {
            highlightedCell?.removeClass("highlighted-cell")
        }
        newHighlightedCell?.addClass("highlighted-cell")
        highlightedCell = newHighlightedCell
    }

    private fun updateSelectionView() {
        if (selectionView?.selection != getSelection()) {
            selectionView = when (val selection = getSelection()) {
                is CaretSelection -> CaretSelectionView(selection, this)
                is CellSelection -> CellSelectionView(selection, this)
                else -> null
            }
        }
    }

    fun getRootCell() = cellTree.getRoot()

    private fun updateSelection() {
        selection = selection?.takeIf { it.isValid() }
            ?: selection?.update(this)
    }

    open fun changeSelection(newSelection: Selection) {
        selection = newSelection
        codeCompletionMenu = null
        updateNow()
    }

    fun getSelection(): Selection? = selection

    fun showCodeCompletionMenu(
        anchor: LayoutableCell,
        position: CompletionPosition,
        entries: List<CompletionMenuEntryData>,
        pattern: String = "",
        caretPosition: Int? = null,
    ) {
        codeCompletionMenu = CodeCompletionMenu(this, anchor, position, entries, pattern, caretPosition)
        updateNow()
    }

    fun closeCodeCompletionMenu() {
        codeCompletionMenu = null
        updateNow()
    }

    fun dispose() {
        uiEventQueue.close()
        uiUpdateQueue.close()
        updateLoop.getAndUpdate { currentJob ->
            currentJob?.cancel("disposed")
            null
        }
        coroutineScope.cancel("disposed")
    }

    fun enqueueUIEvent(event: JSUIEvent): Boolean {
        uiEventQueue.trySend(event).onFailure { LOG.error(it) { "UI event ignored: $event" } }
        return true
    }

    private fun processKeyUp(event: JSKeyboardEvent): Boolean {
        return true
    }

    private suspend fun processKeyDown(event: JSKeyboardEvent): Boolean {
        try {
            if (event.knownKey == KnownKeys.F5) {
                clearLayoutCache()
                // state.reset()
                return true
            }
            for (handler in listOfNotNull(codeCompletionMenu, selection)) {
                if (handler.processKeyDown(event)) return true
            }
            return false
        } finally {
            flushLocal()
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
        for (target in targets) {
            val htmlElement = target as? IVirtualDom.HTMLElement
            val producer: IProducesHtml = htmlElement?.let { generatedHtmlMap.getProducer(it) } ?: continue
            when (producer) {
                is LayoutableCell -> {
                    val layoutable = producer as? LayoutableCell ?: continue
                    val text = layoutable.toText() // htmlElement.innerText
                    val cellAbsoluteBounds = htmlElement.getInnerBounds()
                    val relativeClickX = event.x - cellAbsoluteBounds.x
                    val characterWidth = cellAbsoluteBounds.width / text.length
                    val caretPos = (relativeClickX / characterWidth).roundToInt()
                        .coerceAtMost(layoutable.cell.getMaxCaretPos())
                    changeSelection(CaretSelection(this, layoutable, caretPos))
                    return true
                }
                is Layoutable -> {
                    if (selectClosestInLine(producer.getLine() ?: continue, event.x)) return true
                }
                is TextLine -> {
                    if (selectClosestInLine(producer, event.x)) return true
                }
                else -> continue
            }
        }
        return false
    }

    private fun selectClosestInLine(line: TextLine, absoluteClickX: Double): Boolean {
        val words = line.words.filterIsInstance<LayoutableCell>()
        val closest = words.map { it to generatedHtmlMap.getOutput(it)!! }.minByOrNull {
            min(
                abs(absoluteClickX - it.second.getOuterBounds().minX()),
                abs(absoluteClickX - it.second.getOuterBounds().maxX()),
            )
        } ?: return false
        val caretPos = if (absoluteClickX <= closest.second.getOuterBounds().minX()) {
            0
        } else {
            closest.first.cell.getSelectableText()?.length ?: 0
        }
        changeSelection(CaretSelection(this, closest.first, caretPos))
        return true
    }

    fun clearLayoutCache() {
        cellTree.getRoot().descendantsAndSelf().forEach { (it as FrontendCellTree.FrontendCellImpl).clearCachedLayout() }
    }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("editor") {
            div(MAIN_LAYER_CLASS_NAME) {
                produceChild(getRootCell().layout)
            }
            div("selection-layer relative-layer") {
                produceChild(selectionView)
            }
            div("popup-layer relative-layer") {
                produceChild(codeCompletionMenu)
            }
        }
    }

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
