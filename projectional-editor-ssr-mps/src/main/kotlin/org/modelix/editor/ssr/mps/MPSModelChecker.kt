package org.modelix.editor.ssr.mps

import jetbrains.mps.errors.MessageStatus
import jetbrains.mps.errors.item.NodeReportItem
import jetbrains.mps.errors.messageTargets.PropertyMessageTarget
import jetbrains.mps.errors.messageTargets.ReferenceMessageTarget
import org.modelix.checks.CheckMessage
import org.modelix.checks.CheckMessageTarget
import org.modelix.checks.CheckSeverity
import org.modelix.checks.IModelChecker
import org.modelix.incremental.IIncrementalEngine
import org.modelix.model.api.INode
import org.modelix.mps.editor.common.IncrementalModelChecker

/**
 * Makes the messages of the MPS model checkers available to the editor.
 */
object MPSModelChecker : IModelChecker {
    override fun getMessages(
        engine: IIncrementalEngine,
        node: INode,
    ): List<CheckMessage> = IncrementalModelChecker.getInstance(engine).getAllMessages(node).mapNotNull { it.toCheckMessage() }

    private fun NodeReportItem.toCheckMessage(): CheckMessage? {
        val severity =
            when (severity) {
                MessageStatus.ERROR -> CheckSeverity.ERROR
                MessageStatus.WARNING -> CheckSeverity.WARNING
                else -> return null
            }
        val target =
            when (val messageTarget = messageTarget) {
                is PropertyMessageTarget -> CheckMessageTarget.PropertyTarget(messageTarget.role)
                is ReferenceMessageTarget -> CheckMessageTarget.ReferenceTarget(messageTarget.role)
                else -> CheckMessageTarget.WholeNode
            }
        return CheckMessage(message, severity, target)
    }
}
