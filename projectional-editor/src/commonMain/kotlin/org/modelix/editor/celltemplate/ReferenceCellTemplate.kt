package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpecBase
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ExistingNode
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.ReferenceCompletionToken
import org.modelix.editor.ReferenceTargetActionProvider
import org.modelix.editor.ReferencedNodeCellReference
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.TextCellSpec
import org.modelix.editor.after
import org.modelix.editor.replacement
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.toNonExisting
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IReferenceLink
import org.modelix.parser.ISymbol
import org.modelix.parser.ReferenceSymbol
import org.modelix.parser.Token
import org.modelix.scopes.ScopeAspect

class ReferenceCellTemplate(
    concept: IConcept,
    val link: IReferenceLink,
    val presentation: INode.() -> String?,
) : CellTemplate(concept),
    IGrammarSymbol {
    override fun toParserSymbol(): ISymbol = ReferenceSymbol(link)

    override fun toCompletionToken(): ICompletionTokenOrList? = ReferenceCompletionToken(link)

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is Token && it.symbol == symbol } ?: return
        // TODO builder.currentNode().setReferenceTarget(link, TODO())
    }

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase {
        val data = TextCellSpec(getText(node), "<no ${link.getSimpleName()}>")
        data.cellReferences += ReferencedNodeCellReference(node.reference, link.toReference())
        data.properties[CommonCellProperties.tabTarget] = true
        data.properties[CellActionProperties.substitute] =
            ReferenceTargetActionProvider(ExistingNode(node), link, { it.getNode()?.let(presentation) ?: "" }).after {
                context.cellTreeState.substitutionPlaceholderPositions.remove(createCellReference(node))
            }
        return data
    }

    private fun getText(node: INode): String = getTargetNode(node)?.let(presentation) ?: ""

    private fun getTargetNode(sourceNode: INode): INode? = sourceNode.getReferenceTarget(link)

    override fun getInstantiationActions(
        location: INonExistingNode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider> = listOf(WrapReferenceTargetProvider(location.replacement(concept)))

    override fun getSymbolTransformationAction(
        node: INode,
        optionalCell: TemplateCellReference,
    ): IActionOrProvider? = WrapReferenceTargetProvider(node.toNonExisting())

    inner class WrapReferenceTargetProvider(
        val sourceNode: INonExistingNode,
    ) : ICodeCompletionActionProvider {
        override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
            val scope = ScopeAspect.getScope(sourceNode, link)
            val targets = scope.getVisibleElements(sourceNode, link)
            return targets.map { target ->
                val text =
                    when (target) {
                        is ExistingNode -> presentation(target.getNode()) ?: ""
                        else -> "<create new target node>"
                    }
                WrapReferenceTarget(sourceNode, target, text)
            }
        }
    }

    inner class WrapReferenceTarget(
        val location: INonExistingNode,
        val target: INonExistingNode,
        val presentation: String,
    ) : ICodeCompletionAction {
        override fun getMatchingText(): String = presentation

        override fun getDescription(): String = concept.getShortName()

        override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
            val sourceNode = location.getOrCreateNode(concept)
            sourceNode.setReferenceTarget(link, target.getOrCreateNode())
            return CaretPositionPolicy(createCellReference(sourceNode))
        }
    }
}
