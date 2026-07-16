package org.modelix.react.ssr.mps

import jetbrains.mps.errors.item.NodeReportItem
import jetbrains.mps.errors.messageTargets.MessageTarget
import jetbrains.mps.errors.messageTargets.NodeMessageTarget
import jetbrains.mps.errors.messageTargets.PropertyMessageTarget
import jetbrains.mps.errors.messageTargets.ReferenceMessageTarget
import org.jetbrains.mps.openapi.language.SConceptFeature
import org.jetbrains.mps.openapi.model.SNode
import org.modelix.model.api.INode
import org.modelix.mps.editor.common.IncrementalModelChecker
import org.modelix.react.ssr.server.IRenderer

@Suppress("unused")
object ModelCheckerIntegration {
    private fun getChecker(): IncrementalModelChecker = IncrementalModelChecker.getInstance(IRenderer.contextIncrementalEngine.getValue())

    @JvmStatic
    fun getAllMessages(node: INode): List<NodeReportItem> = getChecker().getAllMessages(node)

    @JvmStatic
    fun getAllMessages(node: SNode): List<NodeReportItem> = getChecker().getAllMessages(node)

    @JvmStatic
    fun getNodeMessages(node: SNode): List<NodeReportItem> = getMessages(node, NodeMessageTarget())

    @JvmStatic
    fun getMessages(
        node: SNode,
        feature: SConceptFeature?,
    ): List<NodeReportItem> = getChecker().getMessages(node, feature)

    @JvmStatic
    fun getMessages(
        node: SNode,
        target: MessageTarget,
    ): List<NodeReportItem> = getChecker().getMessages(node, target)

    @JvmStatic
    @Deprecated("Provide an SConceptFeature")
    fun getMessages(
        node: SNode,
        onlyGlobal: Boolean,
        featureName: String?,
    ): String {
        fun roleName(t: MessageTarget): String? {
            if (t is PropertyMessageTarget) {
                return t.role
            }
            if (t is ReferenceMessageTarget) {
                return t.role
            }
            return null
        }

        var messages = getAllMessages(node)
        if (onlyGlobal) {
            messages = messages.filter { roleName(it.messageTarget) == null }
        } else if (!featureName.isNullOrBlank()) {
            messages = messages.filter { featureName.equals(roleName(it.messageTarget)) }
        }
        val str = messages.joinToString(" # ") { it.severity.toString() + ": " + it.message.split(":")[1] }
        return str
    }
}
