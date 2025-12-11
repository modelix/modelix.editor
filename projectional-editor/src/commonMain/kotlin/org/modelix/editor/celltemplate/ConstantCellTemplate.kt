package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellCreationContext
import org.modelix.editor.ChildNodeCellReference
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.ConstantCompletionToken
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
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

class ConstantCellTemplate(concept: IConcept, val text: String) : CellTemplate(concept), IGrammarSymbol {

    override fun toParserSymbol(): ISymbol = ConstantSymbol(text)

    override fun toCompletionToken(): ICompletionTokenOrList? {
        return ConstantCompletionToken(text)
    }

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is Token && it.symbol == symbol } ?: return
    }

    override fun createCell(context: CellCreationContext, node: INode) = TextCellSpec(text, "")

    override fun getInstantiationActions(location: INonExistingNode, parameters: CodeCompletionParameters): List<IActionOrProvider>? {
        return listOf(InstantiateNodeCompletionAction(text, concept, location))
    }

    override fun createWrapperAction(nodeToWrap: INode, wrappingLink: IChildLink): List<ICodeCompletionAction> {
        return listOf(SideTransformWrapper(nodeToWrap.toNonExisting(), wrappingLink))
    }

    override fun getSymbolTransformationAction(node: INode, optionalCell: TemplateCellReference): IActionOrProvider? {
        return ForceShowOptionalCellAction(optionalCell)
            .withCaretPolicy {
                when (it) {
                    is CaretPositionPolicy -> it.avoid(createCellReference(node))
                    else -> it
                }
            }
            .withMatchingText(text)
    }

    inner class SideTransformWrapper(val nodeToWrap: INonExistingNode, val wrappingLink: IChildLink) :
        ICodeCompletionAction {
        override fun getMatchingText(): String = text
        override fun getDescription(): String = concept.getShortName()
        override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
            val wrapper = nodeToWrap.getParent()!!.getOrCreateNode(null).asWritableNode()
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
            val otherDepth = shadowed.nodeToWrap.ancestors(true).takeWhile { it != commonAncestor }.count()
            if (ownDepth > otherDepth) return true
            return false
        }

        fun getTemplate() = this@ConstantCellTemplate
    }
}
