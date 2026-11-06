package org.modelix.editor

import org.modelix.editor.celltemplate.getAddAttributeContextAction
import org.modelix.model.api.INode

/**
 * Context actions are what is offered in a menu for the selection instead of being reached by typing, like the
 * intentions of MPS. They are the place for everything a projectional editor has no natural gesture for.
 *
 * The menu is opened with Alt+Enter and shows the context actions of the node the selected cell belongs to, so that
 * selecting a parent node (Cmd+Up) offers the actions of that one. A context action is an [ICodeCompletionAction] whose
 * [ICodeCompletionAction.getMatchingText] is what the menu shows, and a cell offers them through
 * [CellActionProperties.contextActions].
 */
fun Cell.getContextActions(): ICodeCompletionActionProvider? =
    ancestors(true).firstNotNullOfOrNull { it.getProperty(CellActionProperties.contextActions) }

/**
 * The context actions of [node], which are set on its cell.
 */
class NodeContextActions(
    val node: INode,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> =
        getAddAttributeActions(parameters.editor.engine)

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
        return engine.getNodeAttributeTemplates().mapNotNull { it.getAddAttributeContextAction(target, index) }
    }
}
