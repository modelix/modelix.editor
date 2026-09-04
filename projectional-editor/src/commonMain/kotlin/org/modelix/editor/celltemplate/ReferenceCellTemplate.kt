package org.modelix.editor.celltemplate

import org.modelix.checks.CheckMessageTarget
import org.modelix.checks.addCheckMessages
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
import org.modelix.model.api.BuiltinLanguages
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
    var presentation: INode.() -> String?,
) : CellTemplate(concept),
    IGrammarSymbol {
    /**
     * How the target is written when the text depends not only on the target but on where it is referenced from.
     * MPS calls this the referent presentation and passes the reference node as context; almost no concept uses it
     * (a nested class shown relative to the referencing class, a constructor - see `NodePresentationUtil`), so it
     * stays off by default and [presentation] is the answer for everything else.
     *
     * Only the rendered cell consults it, because only there is the reference node known. Completion keeps using
     * [presentation], which needs no reference node and often has none yet.
     */
    var presentationWithContext: ((referenceNode: INode, targetNode: INode) -> String?)? = null

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
        // The two reasons for the cell having no text of its own are told apart: a reference without a target is
        // `<no [link name]>`, a target that renders as nothing is `<unnamed [link name]>`. One text for both would
        // let an unset reference pass for a target whose presentation is empty.
        val data =
            when (val targetNode = getTargetNode(node)) {
                null -> {
                    TextCellSpec("", "<no ${link.getSimpleName()}>")
                }

                else -> {
                    val contextual = presentationWithContext
                    val text = if (contextual != null) contextual(node, targetNode) else presentation(targetNode)
                    TextCellSpec(text ?: "", "<unnamed ${link.getSimpleName()}>").apply {
                        // Lets the frontend navigate to the target of the reference (Cmd/Ctrl+click), like MPS does.
                        properties[CommonCellProperties.referenceTarget] = targetNode.reference
                    }
                }
            }
        data.cellReferences += ReferencedNodeCellReference(node.reference, link.toReference())
        data.properties[CommonCellProperties.tabTarget] = true
        data.properties[CellActionProperties.substitute] =
            ReferenceTargetActionProvider(ExistingNode(node), link, { it.getNode()?.let(presentation) ?: "" }).after {
                context.cellTreeState.substitutionPlaceholderPositions.remove(createCellReference(node))
            }
        val target = CheckMessageTarget.ReferenceTarget(link.getSimpleName())
        data.properties.addCheckMessages(context.editorEngine.getCheckMessages(node).filter { it.target == target })
        return data
    }

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

/**
 * How a reference cell renders its target unless the notation says otherwise: the target's name.
 *
 * A notation names the presentation only where it is not the obvious one - a qualified name, a concept name, a
 * property other than `name`. `null` for a target that has no name at all, which the cell shows as `<unnamed ...>`.
 *
 * A notation written in the MPS notation language gets the answer from MPS instead, because there is a better one
 * there: its generator emits `NodePresentationUtil.presentation`, what MPS's own `ref. presentation` cell shows
 * (`IReferentPresentationProvider.DEFAULT_PRESENTATION`). That is the name too wherever a node has one, but it also
 * honours a concept's declared presentation and `ISmartReferent`, and it answers `<no name>[Concept]` rather than
 * nothing for an unnamed target. It is handed the referencing node through [presentationWithContext], so a nested
 * class is written relative to where it is referenced from, the way MPS writes it. Nothing outside MPS can call it,
 * which is why this is what the rest of the notations get.
 */
fun INode.defaultReferencePresentation(): String? = getPropertyValue(BuiltinLanguages.jetbrains_mps_lang_core.INamedConcept.name)
