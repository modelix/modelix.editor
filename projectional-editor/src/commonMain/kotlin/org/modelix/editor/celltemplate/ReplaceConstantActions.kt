package org.modelix.editor.celltemplate

import org.modelix.constraints.ConstraintsAspect
import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.EditorEngine
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.NonExistingChild
import org.modelix.editor.getContainmentLinkDefinition
import org.modelix.editor.replacement
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.toNonExisting
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.getInstantiatableSubConcepts
import org.modelix.model.api.index
import org.modelix.model.api.remove

/**
 * Typing a different keyword or operator over the one of [node] turns it into the concept that writes that one
 * instead, keeping everything else: `a + b` becomes `a - b`.
 *
 * A concept qualifies if its notation is written like the one of [node], with the same children, properties and
 * references in the same order, and only the constant at the position of [constantText] differs. That is what all
 * binary operations of baseLanguage share. Nothing has to be declared for it.
 */
class ReplaceConstantProvider(
    val node: INode,
    val constantText: String,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        val engine = parameters.editor.engine
        val concept = node.concept ?: return emptyList()
        val link = node.asWritableNode().getContainmentLinkDefinition() ?: return emptyList()
        val parent = node.parent ?: return emptyList()
        val symbols = engine.grammarSymbols(concept)
        val position = symbols.indexOfFirst { it is ConstantCellTemplate && it.text == constantText }
        if (position == -1) return emptyList()

        val location = NonExistingChild(parent.toNonExisting(), link as? IChildLink ?: return emptyList(), node.index())
        return link.targetConcept
            .getInstantiatableSubConcepts()
            .asSequence()
            .filter { it != concept }
            .mapNotNull { candidate ->
                val candidateSymbols = engine.grammarSymbols(candidate)
                if (candidateSymbols.size != symbols.size) return@mapNotNull null
                val candidateConstant = candidateSymbols[position] as? ConstantCellTemplate ?: return@mapNotNull null
                if (candidateConstant.text == constantText) return@mapNotNull null
                val sameOtherwise = symbols.indices.all { it == position || symbols[it].isWrittenLike(candidateSymbols[it]) }
                if (!sameOtherwise) return@mapNotNull null
                if (!runCatching { ConstraintsAspect.canCreate(location.replacement(candidate)) }.getOrElse { true }) {
                    return@mapNotNull null
                }
                ReplaceConstantAction(node, candidate, candidateConstant)
            }.toList()
    }

    private fun EditorEngine.grammarSymbols(concept: IConcept): List<IGrammarSymbol> =
        runCatching { createCellModelExcludingDefault(concept)?.getGrammarSymbols()?.toList() }.getOrNull() ?: emptyList()

    private fun IGrammarSymbol.isWrittenLike(other: IGrammarSymbol): Boolean =
        when (this) {
            is ConstantCellTemplate -> other is ConstantCellTemplate && other.text == text
            is ChildCellTemplate -> other is ChildCellTemplate && other.link.toReference().matches(link.toReference())
            is PropertyCellTemplate -> other is PropertyCellTemplate && other.property.toReference().matches(property.toReference())
            is ReferenceCellTemplate -> other is ReferenceCellTemplate && other.link.toReference().matches(link.toReference())
            else -> false
        }
}

class ReplaceConstantAction(
    val node: INode,
    val newConcept: IConcept,
    val newConstant: ConstantCellTemplate,
) : ICodeCompletionAction {
    override fun getMatchingText(): String = newConstant.text

    override fun getDescription(): String = newConcept.getShortName()

    override fun execute(editor: BackendEditorComponent): CaretPositionPolicy {
        val newNode =
            editor.runWrite {
                val parent = checkNotNull(node.parent)
                val link = checkNotNull(node.getContainmentLink())
                val newNode = parent.addNewChild(link, node.index(), newConcept)
                for (child in node.allChildren.toList()) {
                    newNode.moveChild(checkNotNull(child.getContainmentLink()), -1, child)
                }
                for (property in node.getPropertyLinks()) {
                    node.getPropertyValue(property)?.let { newNode.setPropertyValue(property, it) }
                }
                for (reference in node.getReferenceLinks()) {
                    node.getReferenceTarget(reference)?.let { newNode.setReferenceTarget(reference, it) }
                }
                node.remove()
                newNode
            }
        return CaretPositionPolicy(newConstant.createCellReference(newNode))
    }
}
