package org.modelix.editor.celltemplate

import org.modelix.model.api.INode

interface IGrammarConditionSymbol : IGrammarSymbol {
    fun getSymbolConditionState(node: INode): Boolean

    fun setSymbolConditionFalse(node: INode)
}
