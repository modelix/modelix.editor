package org.modelix.editor.ssr.mps

import com.intellij.openapi.progress.EmptyProgressIndicator
import com.intellij.openapi.progress.ProcessCanceledException
import com.intellij.openapi.progress.ProgressManager
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.checks.CheckMessage
import org.modelix.checks.IModelChecker
import org.modelix.editor.ssr.mps.MPSModelChecker.toCheckMessage
import org.modelix.editor.text.backend.Validator
import org.modelix.incremental.DependencyTracking
import org.modelix.incremental.IDependencyListener
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.IInternalStateVariableReference
import org.modelix.incremental.IStateVariableGroup
import org.modelix.incremental.IStateVariableReference
import org.modelix.incremental.IncrementalEngine
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.mps.editor.common.IncrementalModelChecker
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.ConcurrentLinkedQueue
import kotlin.time.Duration
import kotlin.time.Duration.Companion.milliseconds

/**
 * Runs the MPS model checkers in the background, so that they don't delay the editor's response to user input.
 *
 * The editor only reads the messages published by the last completed check, which makes them eventually consistent
 * with the model. Messages are published per node, so a new check result only re-renders the cells of the nodes
 * whose messages changed.
 *
 * The checks are cached in an [IncrementalEngine] of their own. A check holds the engine's lock while it runs and
 * would otherwise block the rendering of the editor.
 *
 * The checks run in a read action that is cancelled when a write action is requested, so that a running check doesn't
 * delay model changes either. Only the type inference of a root node can't be cancelled.
 */
class AsyncMPSModelChecker(
    private val repository: SRepository,
    private val debounceDelay: Duration = 300.milliseconds,
) : IModelChecker {
    private val checkEngine = IncrementalEngine()
    private val checker = IncrementalModelChecker(checkEngine)
    private val coroutineScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private val validator = Validator(coroutineScope) { checkRequestedRoots() }

    /**
     * Nodes rendered by the editor since the last check. Their root nodes are checked.
     */
    private val requestedNodes = ConcurrentLinkedQueue<INode>()

    // Only accessed by the validator, which never runs concurrently with itself.
    private val checkedRoots = LinkedHashMap<INodeReference, INode>()
    private val publishedNodesByRoot = HashMap<INodeReference, Set<INodeReference>>()

    private val publishedMessages = ConcurrentHashMap<INodeReference, List<CheckMessage>>()

    private val modelChangeListener =
        object : IDependencyListener {
            override fun accessed(key: IStateVariableReference<*>) {}

            override fun parentGroupChanged(childGroup: IStateVariableGroup) {}

            override fun modified(key: IStateVariableReference<*>) {
                // Changes of cached values and of the published messages are a consequence of the checks.
                if (key is IInternalStateVariableReference<*, *> || key is MessagesOfNode) return
                validator.invalidate()
            }
        }

    init {
        DependencyTracking.registerListener(modelChangeListener)
        validator.start()
    }

    override fun getMessages(
        engine: IIncrementalEngine,
        node: INode,
    ): List<CheckMessage> {
        requestedNodes.add(node)
        validator.invalidate()
        val messages = MessagesOfNode(this, node.reference)
        DependencyTracking.accessed(messages)
        return messages.read()
    }

    fun dispose() {
        DependencyTracking.removeListener(modelChangeListener)
        validator.stop()
        coroutineScope.cancel("disposed")
        checkEngine.dispose()
        publishedMessages.clear()
    }

    private suspend fun checkRequestedRoots() {
        delay(debounceDelay)
        while (true) {
            val messages = runCancellableRead { checkRoots() }
            if (messages != null) {
                publish(messages)
                return
            }
            checker.retryCancelledChecks()
            // Give the write action that cancelled the check the chance to finish.
            delay(debounceDelay)
        }
    }

    /**
     * Returns null if a write action cancelled [body].
     */
    private fun <R : Any> runCancellableRead(body: () -> R): R? {
        var result: R? = null
        // Requesting a write action cancels the indicator.
        val indicator = EmptyProgressIndicator()
        val completed =
            try {
                ProgressManager.getInstance().runInReadActionWithWriteActionPriority(
                    { repository.modelAccess.runReadAction { result = checker.runCancellable(indicator::isCanceled, body) } },
                    indicator,
                )
            } catch (ex: ProcessCanceledException) {
                false
            }
        return if (completed) result else null
    }

    /**
     * The messages of the checked root nodes, grouped by root node and node.
     */
    private fun checkRoots(): Map<INodeReference, Map<INodeReference, List<CheckMessage>>> {
        while (true) {
            val node = requestedNodes.poll() ?: break
            if (!node.isValid) continue
            val root = checker.getRootNodeOrNull(node) ?: continue
            checkedRoots[root.reference] = root
        }
        val result = LinkedHashMap<INodeReference, Map<INodeReference, List<CheckMessage>>>()
        val iterator = checkedRoots.values.iterator()
        while (iterator.hasNext()) {
            val root = iterator.next()
            val messages = root.takeIf { it.isValid }?.let { checker.getMessagesOfRoot(it) }
            if (messages == null) {
                // The root node was deleted.
                iterator.remove()
                continue
            }
            result[root.reference] =
                messages
                    .mapValues { (_, items) -> items.mapNotNull { it.toCheckMessage() } }
                    .filterValues { it.isNotEmpty() }
        }
        return result
    }

    private fun publish(messagesByRoot: Map<INodeReference, Map<INodeReference, List<CheckMessage>>>) {
        for (root in publishedNodesByRoot.keys - messagesByRoot.keys) {
            publishedNodesByRoot.remove(root)?.forEach { publish(it, null) }
        }
        for ((root, messagesByNode) in messagesByRoot) {
            val previousNodes = publishedNodesByRoot[root].orEmpty()
            for (node in previousNodes - messagesByNode.keys) {
                publish(node, null)
            }
            for ((node, messages) in messagesByNode) {
                publish(node, messages)
            }
            publishedNodesByRoot[root] = messagesByNode.keys
        }
    }

    private fun publish(
        node: INodeReference,
        messages: List<CheckMessage>?,
    ) {
        val previous = if (messages == null) publishedMessages.remove(node) else publishedMessages.put(node, messages)
        if (previous != messages) {
            DependencyTracking.modified(MessagesOfNode(this, node))
        }
    }

    /**
     * The published messages of a node. Reading it in a cell makes the cell depend on that node's messages only.
     */
    private data class MessagesOfNode(
        val checker: AsyncMPSModelChecker,
        val node: INodeReference,
    ) : IStateVariableReference<List<CheckMessage>> {
        override fun read(): List<CheckMessage> = checker.publishedMessages[node] ?: emptyList()

        override fun getGroup(): IStateVariableGroup? = null
    }
}
