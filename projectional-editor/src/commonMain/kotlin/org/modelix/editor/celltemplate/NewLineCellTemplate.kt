package org.modelix.editor.celltemplate

import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpec
import org.modelix.editor.CellSpecBase
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.SpaceCompletionToken
import org.modelix.editor.SpaceTokenType
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode

class NewLineCellTemplate(
    concept: IConcept,
) : CellTemplate(concept) {
    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase = CellSpec().also { cell -> cell.properties[CommonCellProperties.onNewLine] = true }

    override fun toCompletionToken(): ICompletionTokenOrList? = SpaceCompletionToken(SpaceTokenType.MANDATORY)
}
