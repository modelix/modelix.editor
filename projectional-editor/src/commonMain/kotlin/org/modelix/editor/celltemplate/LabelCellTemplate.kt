package org.modelix.editor.celltemplate

import org.modelix.editor.CellCreationContext
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.INonExistingNode
import org.modelix.editor.TextCellSpec
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode

/**
 * A label is some text shown in the editor that has no effect on its behavior.
 * It is not part of the grammar of the language.
 * It is ignored when generating transformation action.
 * A constant is part of the grammar.
 */
class LabelCellTemplate(concept: IConcept, val text: String) :
    CellTemplate(concept) {
    override fun createCell(context: CellCreationContext, node: INode): TextCellSpec {
        return TextCellSpec(text, "").also {
            if (!it.properties.isSet(CommonCellProperties.textColor)) {
                it.properties[CommonCellProperties.textColor] = "LightGray"
            }
        }
    }
    override fun getInstantiationActions(location: INonExistingNode, parameters: CodeCompletionParameters): List<IActionOrProvider>? {
        return emptyList()
    }
}
