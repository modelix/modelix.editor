package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.ChildNodeCellReference
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ConstantCompletionToken
import org.modelix.editor.EditorEngine
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.Precedence
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.TextCellSpec
import org.modelix.editor.ancestors
import org.modelix.editor.commonAncestor
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.toNonExisting
import org.modelix.editor.withCaretPolicy
import org.modelix.editor.withMatchingText
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.upcast
import org.modelix.parser.ConstantSymbol
import org.modelix.parser.ISymbol
import org.modelix.parser.Token

class ConstantCellTemplate(
    concept: IConcept,
    val text: String,
) : CellTemplate(concept),
    IGrammarSymbol {
    override fun toParserSymbol(): ISymbol = ConstantSymbol(text)

    override fun toCompletionToken(): ICompletionTokenOrList? = ConstantCompletionToken(text)

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is Token && it.symbol == symbol } ?: return
    }

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ) = TextCellSpec(text, "").also {
        it.properties[CommonCellProperties.constant] = true
        it.properties[CellActionProperties.substitute] = ReplaceConstantProvider(node, text)
    }

    override fun getInstantiationActions(
        location: INonExistingNode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider>? = listOf(InstantiateNodeCompletionAction(text, concept, location))

    override fun createWrapperAction(
        nodeToWrap: INode,
        wrappingLink: IChildLink,
        precedence: Precedence?,
        engine: EditorEngine,
    ): List<ICodeCompletionAction> = listOf(SideTransformWrapper(nodeToWrap.toNonExisting(), wrappingLink, precedence, engine))

    override fun getSymbolTransformationAction(
        node: INode,
        optionalCell: TemplateCellReference,
    ): IActionOrProvider? =
        ForceShowOptionalCellAction(optionalCell)
            .withCaretPolicy {
                when (it) {
                    is CaretPositionPolicy -> it.avoid(createCellReference(node))
                    else -> it
                }
            }.withMatchingText(text)

    /**
     * Wraps [nodeToWrap] into the concept of this notation, which writes [text] next to it.
     *
     * Typed behind a node that is the last operand of other nodes, the same text can wrap each of them: `+` behind the
     * `2` of `1 * 2` can make `1 * (2 + <>)` or `(1 * 2) + <>`. The [precedence] of the wrapper decides, as in the
     * text: it takes the whole of each operator around the node that binds tighter. Without precedences, the
     * innermost node is wrapped.
     */
    inner class SideTransformWrapper(
        val nodeToWrap: INonExistingNode,
        val wrappingLink: IChildLink,
        val precedence: Precedence?,
        val engine: EditorEngine,
    ) : ICodeCompletionAction {
        override fun getMatchingText(): String = text

        override fun getDescription(): String = concept.getShortName()

        override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
            val wrapper =
                nodeToWrap
                    .getParent()!!
                    .getOrCreateNode(null)
                    .asWritableNode()
                    .addNewChild(nodeToWrap.getContainmentLink()?.toReference()!!, nodeToWrap.index(), concept.getReference().upcast())
            wrapper.moveChild(wrappingLink.toReference(), 0, nodeToWrap.getOrCreateNode(null).asWritableNode())
            return CaretPositionPolicy(wrapper.asLegacyNode())
                .avoid(ChildNodeCellReference(wrapper.getNodeReference(), wrappingLink.toReference()))
                .avoid(createCellReference(wrapper))
        }

        override fun shadows(shadowed: ICodeCompletionAction): Boolean {
            if (shadowed !is SideTransformWrapper) return false
            if (shadowed.getTemplate().concept != concept) return false
            val commonAncestor = nodeToWrap.commonAncestor(shadowed.nodeToWrap)
            val ownDepth = nodeToWrap.ancestors(true).takeWhile { it != commonAncestor }.count()
            val otherDepth =
                shadowed.nodeToWrap
                    .ancestors(true)
                    .takeWhile { it != commonAncestor }
                    .count()
            return when {
                ownDepth > otherDepth -> !wrapsOuterNode(inner = nodeToWrap, outer = shadowed.nodeToWrap)
                ownDepth < otherDepth -> wrapsOuterNode(inner = shadowed.nodeToWrap, outer = nodeToWrap)
                else -> false
            }
        }

        /**
         * Whether the text typed next to [inner] belongs around [outer], an ancestor of it: every node from the parent
         * of [inner] up to [outer] binds tighter than the wrapper, so it's an operand of the wrapper as a whole.
         */
        private fun wrapsOuterNode(
            inner: INonExistingNode,
            outer: INonExistingNode,
        ): Boolean {
            val precedence = precedence ?: return false
            val outerNode = outer.getNode() ?: return false
            var node = inner.getNode()?.parent
            while (node != null) {
                val operandsParent = engine.getPrecedence(node.concept) ?: return false
                if (!precedence.takesWhole(operandsParent)) return false
                if (node.reference.serialize() == outerNode.reference.serialize()) return true
                node = node.parent
            }
            return false
        }

        fun getTemplate() = this@ConstantCellTemplate
    }
}
