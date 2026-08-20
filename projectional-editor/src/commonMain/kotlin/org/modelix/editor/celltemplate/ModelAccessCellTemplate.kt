package org.modelix.editor.celltemplate

import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpecBase
import org.modelix.editor.CellTreeState
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.INonExistingNode
import org.modelix.editor.ITextChangeAction
import org.modelix.editor.TextCellSpec
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode

/**
 * Text computed from the model rather than stored in one place, the equivalent of MPS's model accessor
 * cell. The [getter] is evaluated whenever the cell is created, so the template holding one is not
 * reusable across nodes - it is registered from inside a `withUntypedNode` block, which is what binds
 * it to a node.
 *
 * It is not part of the grammar: the text can be anything, so nothing can be parsed back out of it.
 * Without a [setter] the cell is read-only.
 */
class ModelAccessCellTemplate(
    concept: IConcept,
    val getter: () -> String?,
    val setter: ((String?) -> Unit)?,
) : CellTemplate(concept) {
    var placeholderText: String = "<no text>"

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase {
        val value = getter()
        val data = TextCellSpec(value ?: "", if (value == null) placeholderText else "")
        if (setter != null) {
            data.properties[CellActionProperties.replaceText] = ChangeTextAction()
            data.properties[CommonCellProperties.tabTarget] = true
        }
        return data
    }

    override fun getInstantiationActions(
        location: INonExistingNode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider>? = emptyList()

    inner class ChangeTextAction : ITextChangeAction {
        override fun isValid(value: String?): Boolean = true

        override fun replaceText(
            editor: CellTreeState,
            range: IntRange,
            replacement: String,
            newText: String,
        ): Boolean {
            setter?.invoke(newText) ?: return false
            return true
        }
    }
}
