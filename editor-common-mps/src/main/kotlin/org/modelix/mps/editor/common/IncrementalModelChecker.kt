package org.modelix.mps.editor.common

import jetbrains.mps.checkers.ConstraintsChecker
import jetbrains.mps.errors.item.IssueKindReportItem
import jetbrains.mps.errors.item.NodeReportItem
import jetbrains.mps.errors.item.NodeReportItemBase
import jetbrains.mps.errors.item.TypesystemReportItemAdapter
import jetbrains.mps.errors.messageTargets.MessageTarget
import jetbrains.mps.progress.EmptyProgressMonitor
import jetbrains.mps.smodel.MPSModuleRepository
import jetbrains.mps.typechecking.TypecheckingFacade
import jetbrains.mps.typechecking.TypecheckingSession
import jetbrains.mps.typesystem.LegacyTypecheckingQueries
import jetbrains.mps.typesystem.inference.TypeCheckingContext
import org.jetbrains.mps.openapi.language.SConceptFeature
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.util.Consumer
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.mpsadapters.toModelix
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode

/**
 * Runs the MPS model checkers (typesystem, non-typesystem, constraints) on the root node of a given node and caches
 * the results in the provided incremental engine, so they are automatically re-executed on model changes.
 *
 * The typesystem and non-typesystem rules are cached per root node, because type inference is root-wide.
 * The constraints are cached per node, so a model change only re-executes them for the nodes whose input changed.
 */
class IncrementalModelChecker(
    private val engine: IIncrementalEngine,
) {
    private val constraintsChecker = ConstraintsChecker(null)

    private val fCheckTypesystemForRoot =
        incrementalFunction<List<NodeReportItem>, INode>("checkTypesystemForRoot") { context, node ->
            runTypesystemChecks(ModelixNodeAsMPSNode.toMPSNode(node))
        }

    /**
     * [ConstraintsChecker] checks a single node at a time, which allows caching its messages per node.
     */
    private val fCheckNodeConstraints =
        incrementalFunction<List<NodeReportItem>, INode>("checkNodeConstraints") { context, node ->
            runConstraintsCheck(ModelixNodeAsMPSNode.toMPSNode(node))
        }

    /**
     * Aggregates the constraint messages of a subtree. After a model change only the aggregations on the path
     * between the changed node and the root are recomputed; the results of the sibling subtrees and of all
     * unaffected node checks are reused from the cache.
     */
    private val fCheckSubtreeConstraints =
        incrementalFunction<List<NodeReportItem>, INode>("checkSubtreeConstraints") { context, node ->
            val skipCondition = constraintsChecker.skipCondition()
            val mpsNode = ModelixNodeAsMPSNode.toMPSNode(node)
            if (skipCondition.skipSubtree(mpsNode)) {
                emptyList()
            } else {
                val ownMessages = if (skipCondition.skipSingleNode(mpsNode)) emptyList() else checkNodeConstraints(node)
                ownMessages + node.allChildren.flatMap { checkSubtreeConstraints(it) }
            }
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
        val messages = checkTypesystemForRoot(rootNode) + checkSubtreeConstraints(rootNode)
        return messages.groupBy { it.node.toModelix() }
    }

    private fun checkTypesystemForRoot(root: INode): List<NodeReportItem> = fCheckTypesystemForRoot(root).bind(engine).invoke()

    private fun checkNodeConstraints(node: INode): List<NodeReportItem> = fCheckNodeConstraints(node).bind(engine).invoke()

    private fun checkSubtreeConstraints(node: INode): List<NodeReportItem> = fCheckSubtreeConstraints(node).bind(engine).invoke()

    private fun getRootNode(node: INode): INode = fGetRootNode(node).bind(engine).invoke()

    /**
     * Checks the typesystem and the non-typesystem rules in a single typechecking session.
     * [jetbrains.mps.typesystemEngine.checker.TypesystemChecker] and
     * [jetbrains.mps.typesystemEngine.checker.NonTypesystemChecker] each create their own isolated session,
     * which would infer the types of all nodes under the root twice.
     */
    private fun runTypesystemChecks(root: SNode): List<NodeReportItem> {
        val items = ArrayList<NodeReportItem>()

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

        TypecheckingFacade
            .getFromContext()
            .runIsolated(TypecheckingSession.Flags.forRoot(root).incremental()) { session ->
                val queries = session.getQueries(root) ?: return@runIsolated
                val legacyQueries = session.getQueries(LegacyTypecheckingQueries::class.java) ?: return@runIsolated

                // Checks the typesystem rules and reports the type errors. This also computes the types that the
                // non-typesystem rules below may access.
                runSafely("TypesystemChecker") {
                    queries.checkRecursively(root) { items.add(it) }
                }

                runSafely("NonTypesystemChecker") {
                    val typeCheckingContext = legacyQueries.typeCheckingContext
                    try {
                        typeCheckingContext.setNonTypesystemComputationMode(TypeCheckingContext.NonTypesystemComputationMode.NORMAL)
                        typeCheckingContext.baseNodeTypesComponent.applyNonTypesystemRulesToRoot(typeCheckingContext)
                    } finally {
                        typeCheckingContext.setNonTypesystemComputationMode(TypeCheckingContext.NonTypesystemComputationMode.OFF)
                    }
                    typeCheckingContext
                        .getNodesWithErrors(false)
                        .flatMap { it.o2 }
                        .forEach { items.add(TypesystemReportItemAdapter(it)) }
                }
            }
        return items
    }

    private fun runConstraintsCheck(node: SNode): List<NodeReportItem> {
        val items = ArrayList<NodeReportItem>()

        @Suppress("removal")
        val repository = MPSModuleRepository.getInstance()
        try {
            constraintsChecker.check(node, repository, Consumer { items.add(it) }, EmptyProgressMonitor())
        } catch (ex: Throwable) {
            // A failing check should not discard the messages of the other nodes.
            // Its failure is shown in the editor as an error on the checked node.
            LOG.error(ex) { "ConstraintsChecker failed for $node" }
            items.add(
                NodeReportItemBase.error(
                    "ConstraintsChecker failed: $ex",
                    node.reference,
                    IssueKindReportItem.ENVIRONMENT_PROBLEM.deriveItemKind(),
                ),
            )
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
