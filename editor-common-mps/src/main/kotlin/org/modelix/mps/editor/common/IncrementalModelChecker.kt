package org.modelix.mps.editor.common

import jetbrains.mps.checkers.ConstraintsChecker
import jetbrains.mps.errors.item.IssueKindReportItem
import jetbrains.mps.errors.item.NodeReportItem
import jetbrains.mps.errors.item.NodeReportItemBase
import jetbrains.mps.errors.messageTargets.MessageTarget
import jetbrains.mps.progress.EmptyProgressMonitor
import jetbrains.mps.smodel.MPSModuleRepository
import jetbrains.mps.typesystemEngine.checker.NonTypesystemChecker
import jetbrains.mps.typesystemEngine.checker.TypesystemChecker
import org.jetbrains.mps.openapi.language.SConceptFeature
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.util.Consumer
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.mpsadapters.MPSWritableNode
import org.modelix.model.mpsadapters.toModelix
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode

/**
 * Runs the MPS model checkers (typesystem, non-typesystem, constraints) on the root node of a given node and caches
 * the result in the provided incremental engine, so it's automatically re-executed on model changes.
 */
class IncrementalModelChecker(
    private val engine: IIncrementalEngine,
) {
    private val fCheckRootNode =
        incrementalFunction<List<NodeReportItem>, INode>("checkRootNode") { context, node ->
            runCheck(ModelixNodeAsMPSNode.toMPSNode(node))
        }

    private val fGetRootNode =
        incrementalFunction<INode, INode>("getRootNode") { context, node ->
            if (node.getContainmentLink()?.getUID() ==
                BuiltinLanguages.MPSRepositoryConcepts.Model.rootNodes
                    .getUID()
            ) {
                node
            } else {
                getRootNode(node.parent ?: return@incrementalFunction node)
            }
        }

    fun getAllMessages(node: INode): List<NodeReportItem> = checkRoot(getRootNode(node))[node.reference] ?: emptyList()

    fun getAllMessages(node: SNode): List<NodeReportItem> = getAllMessages(ModelixNodeAsMPSNode.toModelixNode(node))

    fun getMessages(
        node: SNode,
        feature: SConceptFeature?,
    ): List<NodeReportItem> = getMessages(node, NodeReportItem.conceptFeatureToMessageTarget(feature))

    fun getMessages(
        node: SNode,
        target: MessageTarget,
    ): List<NodeReportItem> = getAllMessages(node).filter { it.messageTarget.sameAs(target) }

    private fun checkRoot(rootNode: INode): Map<INodeReference, List<NodeReportItem>> {
        val messages: List<NodeReportItem> = fCheckRootNode(rootNode).bind(engine).invoke()
        return messages.groupBy { it.node.toModelix() }
    }

    private fun getRootNode(node: INode): INode = fGetRootNode(node).bind(engine).invoke()

    /**
     * The MPS checkers (especially the typesystem) don't work reliably on [ModelixNodeAsMPSNode], e.g.
     * `jetbrains.mps.smodel.CopyUtil` fails with an AssertionError when the typesystem copies nodes into the type
     * graph. Use the raw MPS node whenever the model is MPS backed.
     */
    private fun INode.toMPS(): SNode {
        val writableNode = asWritableNode()
        return if (writableNode is MPSWritableNode) writableNode.node else ModelixNodeAsMPSNode.toMPSNode(this)
    }

    private fun registerDependencies(node: INode) {
        node.getPropertyRoles().forEach { node.getPropertyValue(it) }
        node.getReferenceRoles().forEach { node.getReferenceTargetRef(it) }
        node.allChildren.forEach { registerDependencies(it) }
    }

    private fun runCheck(root: SNode): List<NodeReportItem> {
        val items = ArrayList<NodeReportItem>()
        val consumer: Consumer<NodeReportItem> =
            object : Consumer<NodeReportItem> {
                override fun consume(item: NodeReportItem) {
                    items.add(item)
                }
            }

        @Suppress("removal")
        val repository = MPSModuleRepository.getInstance()

        // A failing checker should not discard the messages of the other checkers.
        // Its failure is shown in the editor as an error on the root node.
        fun runSafely(
            checkerName: String,
            body: () -> Unit,
        ) = try {
            body()
        } catch (ex: Throwable) {
            LOG.error(ex) { "$checkerName failed for $root" }
            items.add(
                NodeReportItemBase.error(
                    "$checkerName failed: $ex",
                    root.reference,
                    IssueKindReportItem.ENVIRONMENT_PROBLEM.deriveItemKind(),
                ),
            )
        }

        runSafely("TypesystemChecker") { TypesystemChecker().check(root, repository, consumer, EmptyProgressMonitor()) }
        runSafely("NonTypesystemChecker") { NonTypesystemChecker().check(root, repository, consumer, EmptyProgressMonitor()) }
        runSafely("ConstraintsChecker") {
            ConstraintsChecker(null).asRootChecker().check(root, repository, consumer, EmptyProgressMonitor())
        }
        return items
    }

    companion object {
        private val LOG =
            io.github.oshai.kotlinlogging.KotlinLogging
                .logger {}

        private val instances = java.util.WeakHashMap<IIncrementalEngine, IncrementalModelChecker>()

        /**
         * Returns a checker whose results are cached in the given engine.
         */
        @Synchronized
        fun getInstance(engine: IIncrementalEngine): IncrementalModelChecker =
            instances.getOrPut(engine) { IncrementalModelChecker(engine) }
    }
}
