package org.modelix.editor

import org.modelix.constraints.ConstraintsAspect
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.model.api.IReferenceLink
import org.modelix.model.api.getAllSubConcepts
import org.modelix.scopes.ScopeAspect

data class ReplaceNodeActionProvider(
    val location: INonExistingNode,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        val engine = parameters.editor.engine
        val expectedConcept = location.expectedConcept() ?: return emptyList()
        val allowedConcepts =
            expectedConcept
                .getAllSubConcepts(true)
                .filterNot { it.isAbstract() }
                .filter { concept ->
                    val newNode = location.replacement(concept)
                    ConstraintsAspect.canCreate(newNode)
                }
        val cellModels =
            allowedConcepts.map { concept ->
                engine.createCellModel(concept)
            }
        return cellModels.flatMap {
            it.getInstantiationActions(location, parameters) ?: emptyList()
        }
//        return cellModels.flatMap { cm ->
//            (cm.getInstantiationActions(location, parameters) ?: emptyList()).map { it.asProvider().withDescription {
//                cm.getGrammarSymbols().map { it.toParserSymbol() }.joinToString(" ")
//            } }
//        }
    }
}

data class ReferenceTargetActionProvider(
    val sourceNode: INonExistingNode,
    val link: IReferenceLink,
    val presentation: (INonExistingNode) -> String,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        val scope = ScopeAspect.getScope(sourceNode, link)
        val targetNodes = scope.getVisibleElements(sourceNode, link)
        return targetNodes.map {
            ChangeReferenceTargetAction(sourceNode, link, it, presentation(it))
        }
    }
}

class ChangeReferenceTargetAction(
    val sourceLocation: INonExistingNode,
    val link: IReferenceLink,
    val targetNode: INonExistingNode,
    val presentation: String,
) : ICodeCompletionAction {
    override fun getMatchingText(): String = presentation

    override fun getDescription(): String = "set reference '" + link.getSimpleName() + "'"

    override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
        val sourceNode = sourceLocation.getOrCreateNode(null)
        sourceNode.setReferenceTarget(link, targetNode.getOrCreateNode())
        return CaretPositionPolicy(ReferencedNodeCellReference(sourceNode.reference, link.toReference()))
    }
}
