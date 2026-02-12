package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.INonExistingNode
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.model.api.IConcept

class InstantiateNodeCompletionAction(
    private val matchingText: String,
    val concept: IConcept,
    val location: INonExistingNode,
) : ICodeCompletionAction {
    private val description =
        let {
            fun wrapperText(
                innerText: String,
                wrapper: INonExistingNode?,
            ): String =
                if (wrapper != null && wrapper.getNode() == null) {
                    wrapperText("${wrapper.expectedConcept()?.getShortName()}[$innerText]", wrapper.getParent())
                } else {
                    innerText
                }
            wrapperText(concept.getShortName(), location.getParent())
        }

    override fun getMatchingText(): String = matchingText

    override fun getDescription(): String = description

    override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
        val newNode =
            location.getExistingAncestor()!!.getArea().executeWrite {
                location.replaceNode(concept)
            }
        return CaretPositionPolicy(newNode)
    }

    override fun shadowedBy(shadowing: ICodeCompletionAction): Boolean =
        when (shadowing) {
            is InstantiateNodeCompletionAction -> {
                // Avoid showing the same entry twice, once with and once without a wrapper.
                shadowing.concept == concept && shadowing.location.nodeCreationDepth() < location.nodeCreationDepth()
            }

            else -> {
                false
            }
        }

    override fun shadows(shadowed: ICodeCompletionAction): Boolean =
        when (shadowed) {
            is InstantiateNodeCompletionAction -> {
                // Avoid showing the same entry twice, once with and once without a wrapper.
                shadowed.concept == concept && shadowed.location.nodeCreationDepth() > location.nodeCreationDepth()
            }

            else -> {
                false
            }
        }
}
