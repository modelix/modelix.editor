package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
import org.modelix.editor.celltemplate.getAddAttributeContextAction
import org.modelix.editor.text.shared.ActionIcon
import org.modelix.model.api.INode
import kotlin.coroutines.CoroutineContext
import kotlin.coroutines.EmptyCoroutineContext

private val LOG = KotlinLogging.logger { }

/**
 * Context actions are what is offered in a menu for the selection instead of being reached by typing, like the
 * intentions of MPS. They are the place for everything a projectional editor has no natural gesture for.
 *
 * The menu is opened with Alt+Enter and shows the context actions of the node the selected cell belongs to, so that
 * selecting a parent node (Cmd+Up) offers the actions of that one. A context action is an [ICodeCompletionAction] whose
 * [ICodeCompletionAction.getMatchingText] is what the menu shows, and a cell offers them through
 * [CellActionProperties.contextActions]. The menu lists them by their [ICodeCompletionAction.getGroup], each with its
 * [ICodeCompletionAction.getIcon].
 */
fun Cell.getContextActions(): ICodeCompletionActionProvider? =
    ancestors(true).firstNotNullOfOrNull { it.getProperty(CellActionProperties.contextActions) }

/**
 * Extension point for context actions that don't come from the notations, like the intentions of MPS languages.
 */
object ContextActionsAspect {
    val providers: MutableSet<IContextActionsProvider> = LinkedHashSet()

    /**
     * Where the context actions are collected, for providers that can only run on a particular thread. The MPS
     * intentions need an MPS editor, which can only be created on the UI thread.
     */
    var loadingContext: CoroutineContext = EmptyCoroutineContext

    fun getContextActions(
        node: INode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider> =
        providers.toList().flatMap { provider ->
            // One failing provider shouldn't take the actions of the others with it.
            runCatching { provider.getContextActions(node, parameters) }
                .getOrElse { ex ->
                    LOG.error(ex) { "Context actions provider $provider failed for $node" }
                    emptyList()
                }
        }
}

interface IContextActionsProvider {
    /**
     * The context actions for [node], the node the selection belongs to.
     */
    fun getContextActions(
        node: INode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider>
}

/**
 * The context actions of [node], which are set on its cell.
 */
class NodeContextActions(
    val node: INode,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> =
        getAddAttributeActions(parameters.editor.engine) + ContextActionsAspect.getContextActions(node, parameters)

    /**
     * Same placement as the side transforms: a new attribute goes directly outside of the selected attribute, and
     * inside all existing ones if the node itself is selected.
     */
    private fun getAddAttributeActions(engine: EditorEngine): List<IActionOrProvider> {
        val attributedNode = node.getAttributedNode().takeIf { node.concept?.isNodeAttribute() == true }
        val target = attributedNode ?: node
        val index =
            if (attributedNode != null) {
                attributedNode.getAttributes().indexOfFirst { it.reference == node.reference }
            } else {
                engine.getIndexInsideNodeAttributes(node)
            }
        return engine
            .getNodeAttributeTemplates()
            .mapNotNull {
                it
                    .getAddAttributeContextAction(
                        target,
                        index
                    )?.withIcon(ActionIcon.NODE_ATTRIBUTE)
                    ?.inGroup(NODE_ATTRIBUTES_GROUP)
            }
    }

    companion object {
        /**
         * The group of the actions that are generated for the notations of node attributes, which keeps them apart
         * from the actions a language defines itself.
         */
        const val NODE_ATTRIBUTES_GROUP = "Node Attributes"
    }
}
