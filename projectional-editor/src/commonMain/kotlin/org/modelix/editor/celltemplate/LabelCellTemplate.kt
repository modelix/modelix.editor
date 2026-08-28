package org.modelix.editor.celltemplate

import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpec
import org.modelix.editor.CellSpecBase
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
 *
 * It carries additional information about the code rather than code, like an inline hint in IntelliJ, and is styled
 * to read that way: grey, in the embedder's UI font, a step smaller than the editor. The proportional font is what
 * separates a label from the text at a glance - and it also means a label does not occupy whole character cells, so
 * whatever follows it on the same line no longer lines up with the lines above and below it.
 *
 * These are defaults on the template, so anything the notation sets on the label cell itself is applied after them
 * and wins.
 *
 * A null [text] renders nothing at all. That is how a notation makes a label conditional: the label is the one cell
 * an arbitrary condition is safe on, because it is not part of the grammar, so there is no substitution or side
 * transformation to derive for it. A notation writes the condition into the expression that computes the text and
 * yields null where MPS would have hidden the cell behind a rendering condition.
 */
class LabelCellTemplate(
    concept: IConcept,
    val text: String?,
) : CellTemplate(concept) {
    init {
        properties[CommonCellProperties.textColor] = DEFAULT_TEXT_COLOR
        properties[CommonCellProperties.fontFamily] = DEFAULT_FONT_FAMILY
        properties[CommonCellProperties.fontSize] = DEFAULT_FONT_SIZE
    }

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase = text?.let { TextCellSpec(it, "") } ?: CellSpec()

    override fun getInstantiationActions(
        location: INonExistingNode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider>? = emptyList()

    companion object {
        const val DEFAULT_TEXT_COLOR = "LightGray"

        /** The UI font of whatever embeds the editor, so that a label is visibly not code. */
        const val DEFAULT_FONT_FAMILY = "system-ui, sans-serif"

        /** Relative, so a label stays one step below the editor's font size instead of a fixed number of pixels. */
        const val DEFAULT_FONT_SIZE = "smaller"
    }
}
