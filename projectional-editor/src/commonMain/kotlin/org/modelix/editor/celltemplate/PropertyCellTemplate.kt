package org.modelix.editor.celltemplate

import org.modelix.constraints.ConstraintsAspect
import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpecBase
import org.modelix.editor.CellTreeState
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.ITextChangeAction
import org.modelix.editor.PropertyCellReference
import org.modelix.editor.PropertyCompletionToken
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.TextCellSpec
import org.modelix.editor.replacement
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.toNonExisting
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.parser.ISymbol
import org.modelix.parser.PropertySymbol
import org.modelix.parser.RegexSymbol
import org.modelix.parser.Token

open class PropertyCellTemplate(concept: IConcept, val property: IProperty) :
    CellTemplate(concept), IGrammarConditionSymbol {
    var placeholderText: String = "<no ${property.getSimpleName()}>"
    var validator: ((String) -> Boolean)? = null
    var regex: Regex? = null

    override fun toParserSymbol(): ISymbol {
        return PropertySymbol(property, regex ?: RegexSymbol.defaultPropertyPattern)
    }

    override fun toCompletionToken(): ICompletionTokenOrList? {
        return PropertyCompletionToken(property)
    }

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is Token && it.symbol == symbol } ?: return
        builder.currentNode().setPropertyValue(property, (token as Token).text)
    }

    override fun createCell(context: CellCreationContext, node: INode): CellSpecBase {
        val value = node.getPropertyValue(property)
        val data = TextCellSpec(value ?: "", if (value == null) placeholderText else "")
        data.properties[CellActionProperties.replaceText] = ChangePropertyAction(node)
        data.properties[CommonCellProperties.tabTarget] = true
        data.cellReferences += PropertyCellReference(property.toReference(), node.reference)
        return data
    }

    override fun getInstantiationActions(location: INonExistingNode, parameters: CodeCompletionParameters): List<IActionOrProvider>? {
        return listOf(WrapPropertyValueProvider(location))
    }

    private fun validateValue(node: INonExistingNode, value: String): Boolean {
        return validator?.invoke(value)
            ?: regex?.matches(value)
            ?: ConstraintsAspect.checkPropertyValue(node, property, value).isEmpty()
    }

    override fun getSymbolConditionState(node: INode): Boolean {
        return node.getPropertyValue(property) != null
    }

    override fun setSymbolConditionFalse(node: INode) {
        return node.setPropertyValue(property, null)
    }

    override fun getSymbolTransformationAction(node: INode, optionalCell: TemplateCellReference): IActionOrProvider? {
        return WrapPropertyValueProvider(node.toNonExisting())
    }

    inner class WrapPropertyValueProvider(val location: INonExistingNode) : ICodeCompletionActionProvider {
        override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
            return if (parameters.pattern.isNotBlank() && validateValue(location.replacement(concept), parameters.pattern)) {
                listOf(WrapPropertyValue(location, parameters.pattern))
            } else {
                emptyList()
            }
        }
    }

    inner class WrapPropertyValue(val location: INonExistingNode, val value: String) : ICodeCompletionAction {
        override fun getMatchingText(): String {
            return value
        }

        override fun getDescription(): String {
            return concept.getShortName()
        }

        override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
            val node = location.getOrCreateNode(concept)
            node.setPropertyValue(property, value)
            return CaretPositionPolicy(createCellReference(node))
        }
    }

    inner class ChangePropertyAction(val node: INode) : ITextChangeAction {
        override fun isValid(value: String?): Boolean {
            if (value == null) return true
            return validateValue(node.toNonExisting(), value)
        }

        override fun replaceText(editor: CellTreeState, range: IntRange, replacement: String, newText: String): Boolean {
            node.getArea().executeWrite {
                node.setPropertyValue(property, newText)
            }
            return true
        }
    }
}
