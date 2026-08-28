package org.modelix.editor.celltemplate

import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICellAction
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.model.api.INode

/**
 * Deletes an optional part of a notation as a whole.
 *
 * An optional group is shown while the feature it edits is set, so deleting that feature is what makes the group
 * disappear - including the punctuation and keywords around it. That is what MPS expresses per cell as an
 * "auto-deletable" flag: here it is not a flag but what an optional group already means, so nothing has to be
 * declared for it in the notation.
 *
 * The action sits on the group, so it is only reached when the caret is on the group's own decoration. Deleting the
 * content itself is handled nearer the caret by that node's own delete action, and the group then disappears on its
 * own because its condition no longer holds.
 */
class ClearOptionalCellAction(
    private val conditionSymbol: IGrammarConditionSymbol,
    private val node: INode,
    private val optionalCell: TemplateCellReference,
) : ICellAction {
    override fun isApplicable(): Boolean = true

    override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? {
        editor.runWrite {
            conditionSymbol.setSymbolConditionFalse(node)
        }
        // A group that was revealed with ForceShowOptionalCellAction would otherwise stay visible although its
        // condition is false again.
        editor.state.forceShowOptionals.remove(optionalCell)
        return null // The frontend updates the caret position using SavedCaretPosition
    }
}
