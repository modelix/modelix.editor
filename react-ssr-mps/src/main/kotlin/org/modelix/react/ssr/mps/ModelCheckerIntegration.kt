package org.modelix.react.ssr.mps

import jetbrains.mps.checkers.ConstraintsChecker
import jetbrains.mps.errors.item.NodeReportItem
import jetbrains.mps.errors.messageTargets.MessageTarget
import jetbrains.mps.errors.messageTargets.NodeMessageTarget
import jetbrains.mps.progress.EmptyProgressMonitor
import jetbrains.mps.smodel.MPSModuleRepository
import jetbrains.mps.typesystemEngine.checker.NonTypesystemChecker
import jetbrains.mps.typesystemEngine.checker.TypesystemChecker
import org.jetbrains.mps.openapi.language.SConceptFeature
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.util.Consumer
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.mpsadapters.MPSNodeReference
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import org.modelix.react.ssr.server.IRenderer

object ModelCheckerIntegration {

    private val fCheckRootNode = incrementalFunction<List<NodeReportItem>, INode>("checkRootNode") { context, node ->
        runCheck(ModelixNodeAsMPSNode.toMPSNode(node))
    }

    private val fGetRootNode = incrementalFunction<INode, INode>("getRootNode") { context, node ->
        if (node.getContainmentLink()?.getUID() == BuiltinLanguages.MPSRepositoryConcepts.Model.rootNodes.getUID()) {
            node
        } else {
            getRootNode(node.parent ?: return@incrementalFunction node)
        }
    }

    @JvmStatic
    fun getAllMessages(node: INode): List<NodeReportItem> {
        return checkRoot(getRootNode(node))[node.reference] ?: emptyList()
    }

    @JvmStatic
    fun getAllMessages(node: SNode): List<NodeReportItem> {
        return getAllMessages(ModelixNodeAsMPSNode.toModelixNode(node))
    }

    @JvmStatic
    fun getNodeMessages(node: SNode): List<NodeReportItem> {
        return getMessages(node, NodeMessageTarget())
    }

    @JvmStatic
    fun getMessages(node: SNode, feature: SConceptFeature?): List<NodeReportItem> {
        return getMessages(node, NodeReportItem.conceptFeatureToMessageTarget(feature))
    }

    @JvmStatic
    fun getMessages(node: SNode, target: MessageTarget): List<NodeReportItem> {
        return getAllMessages(node).filter { it.messageTarget.sameAs(target) }
    }

    private fun checkRoot(rootNode: INode): Map<INodeReference, List<NodeReportItem>> {
        val messages: List<NodeReportItem> = fCheckRootNode(rootNode).bind(IRenderer.contextIncrementalEngine.getValue()).invoke()
        return messages.groupBy { MPSNodeReference(it.node) }
    }

    private fun getRootNode(node: INode): INode {
        return fGetRootNode(node).bind(IRenderer.contextIncrementalEngine.getValue()).invoke()
    }

    private fun runCheck(root: SNode): List<NodeReportItem> {
        val items = ArrayList<NodeReportItem>()
        val consumer: Consumer<NodeReportItem> = object : Consumer<NodeReportItem> {
            override fun consume(item: NodeReportItem) {
                items.add(item)
            }
        }

        @Suppress("removal")
        val repository = MPSModuleRepository.getInstance()
        TypesystemChecker().check(root, repository, consumer, EmptyProgressMonitor())
        NonTypesystemChecker().check(root, repository, consumer, EmptyProgressMonitor())
        ConstraintsChecker(null).asRootChecker().check(root, repository, consumer, EmptyProgressMonitor())
        return items
    }
}
