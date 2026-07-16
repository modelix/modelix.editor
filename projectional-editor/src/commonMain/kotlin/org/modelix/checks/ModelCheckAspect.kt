package org.modelix.checks

import org.modelix.editor.CellProperties
import org.modelix.editor.CommonCellProperties
import org.modelix.incremental.IIncrementalEngine
import org.modelix.model.api.INode

/**
 * Extension point for language checkers (typesystem, constraints, ...) whose messages are shown in the editor.
 */
object ModelCheckAspect {
    private val LOG =
        io.github.oshai.kotlinlogging.KotlinLogging
            .logger {}

    val checkers: MutableSet<IModelChecker> = HashSet()

    fun getMessages(
        engine: IIncrementalEngine,
        node: INode,
    ): List<CheckMessage> =
        checkers.flatMap { checker ->
            runCatching { checker.getMessages(engine, node) }
                .getOrElse { ex ->
                    LOG.error(ex) { "Model checker $checker failed for $node" }
                    // Surface the failure in the editor instead of silently dropping all messages.
                    listOf(CheckMessage("Model checker failed: $ex", CheckSeverity.ERROR, CheckMessageTarget.WholeNode))
                }
        }
}

interface IModelChecker {
    /**
     * Returns the messages for the given node only. Implementations are expected to cache expensive computations
     * in the provided incremental engine.
     */
    fun getMessages(
        engine: IIncrementalEngine,
        node: INode,
    ): List<CheckMessage>
}

data class CheckMessage(
    val message: String,
    val severity: CheckSeverity,
    val target: CheckMessageTarget = CheckMessageTarget.WholeNode,
)

enum class CheckSeverity {
    WARNING,
    ERROR,
}

fun CellProperties.addCheckMessage(message: CheckMessage) {
    val key =
        when (message.severity) {
            CheckSeverity.ERROR -> CommonCellProperties.errorMessage
            CheckSeverity.WARNING -> CommonCellProperties.warningMessage
        }
    this[key] = listOfNotNull(this[key], message.message).joinToString("\n")
}

fun CellProperties.addCheckMessages(messages: Iterable<CheckMessage>) = messages.forEach { addCheckMessage(it) }

sealed interface CheckMessageTarget {
    /**
     * The message applies to the node as a whole.
     */
    object WholeNode : CheckMessageTarget

    /**
     * The message applies to the value of a property of the node.
     */
    data class PropertyTarget(
        val role: String,
    ) : CheckMessageTarget

    /**
     * The message applies to the target of a reference of the node.
     */
    data class ReferenceTarget(
        val role: String,
    ) : CheckMessageTarget
}
