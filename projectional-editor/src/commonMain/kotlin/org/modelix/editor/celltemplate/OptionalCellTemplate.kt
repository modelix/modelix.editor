package org.modelix.editor.celltemplate

import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellData
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.asProvider
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.parser.INonTerminalToken
import org.modelix.parser.OptionalSymbol
import org.modelix.parser.ParseTreeNode

class OptionalCellTemplate(concept: IConcept) : CellTemplate(concept), IOptionalSymbol {

    override fun toParserSymbol(): OptionalSymbol {
        return OptionalSymbol(getChildSymbols().map { it.toParserSymbol() }.toList())
    }

    override fun toCompletionToken(): ICompletionTokenOrList? {
        return null
    }

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is INonTerminalToken && it.getNonTerminalSymbol() == symbol } ?: return
        when (token) {
            is ParseTreeNode -> {
                builder.consumeTokens(token.children)
            }
            else -> TODO()
        }
    }

    override fun createCell(context: CellCreationContext, node: INode): CellData {
        return CellData()
    }

    override fun applyChildren(context: CellCreationContext, node: INode, cell: CellData): List<CellData> {
        fun forceShow() = context.editorState.forceShowOptionals[createCellReference(node)] == true

        val symbols = getChildren().asSequence().flatMap { it.getGrammarSymbols() }
        val conditionSymbol = symbols.filterIsInstance<IGrammarConditionSymbol>().firstOrNull()
        val transformationSymbol = symbols.firstOrNull()

        if (conditionSymbol == null) return emptyList()
        val conditionState = conditionSymbol.getSymbolConditionState(node)
        if (conditionState || forceShow()) {
            if (!conditionState) {
                cell.properties[CommonCellProperties.isForceShown] = true
            }
            return super.applyChildren(context, node, cell)
        } else {
            if (transformationSymbol == null) return emptyList()
            val symbolTransformationAction = transformationSymbol.getSymbolTransformationAction(node, createCellReference(node))
            if (symbolTransformationAction != null) {
                cell.properties[CellActionProperties.transformBefore] = symbolTransformationAction.asProvider()
            }
            cell.properties[CellActionProperties.show] = ForceShowOptionalCellAction(createCellReference(node))
            return emptyList()
        }
    }

    override fun getInstantiationActions(location: INonExistingNode, parameters: CodeCompletionParameters): List<IActionOrProvider>? {
        return null // skip optional. Don't search in children.
    }

    override fun getChildSymbols(): Sequence<IGrammarSymbol> {
        return getChildren().asSequence().flatMap { it.getGrammarSymbols() }
    }

    override fun getSymbolTransformationAction(node: INode, optionalCell: TemplateCellReference): IActionOrProvider? {
        return null
    }
}
