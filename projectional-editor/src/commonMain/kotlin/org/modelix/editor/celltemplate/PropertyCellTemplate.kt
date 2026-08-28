package org.modelix.editor.celltemplate

import org.modelix.checks.CheckMessageTarget
import org.modelix.checks.addCheckMessages
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
import org.modelix.presentation.PropertyPresentationAspect

open class PropertyCellTemplate(
    concept: IConcept,
    val property: IProperty,
) : CellTemplate(concept),
    IGrammarConditionSymbol {
    var placeholderText: String = "<no ${property.getSimpleName()}>"
    var validator: ((String) -> Boolean)? = null
    var regex: Regex? = null

    /**
     * Maps the stored property value to the text the editor shows, for a notation that writes a value differently
     * from how the model holds it - a decimal separator, a symbol standing for a keyword.
     *
     * A notation that sets nothing still gets the conversion its language defines, through
     * [PropertyPresentationAspect] - which is what turns an MPS enumeration's stored `gZ5fh_4/error` into `error`.
     */
    var readReplace: ((String) -> String)? = null

    /**
     * Maps typed text back to the value stored, the other half of [readReplace]. It is applied wherever text becomes
     * a property value: typing over the cell, creating the node by typing its value, and parsing.
     *
     * This runs before validation, so a notation validates the value it asks for rather than the keys that were
     * pressed. The language's own conversion ([PropertyPresentationAspect]) runs after, because validation is
     * defined on the presented form - `ConstraintsAspect.checkPropertyValue` converts to the stored form itself.
     */
    var writeReplace: ((String) -> String)? = null

    /**
     * Text as the notation asks for it to be held - the form everything downstream is defined on: what a validator
     * judges, what a constraint is checked against, and what the language then converts for storage.
     */
    private fun presentedValue(text: String): String = writeReplace?.invoke(text) ?: text

    /**
     * The stored value as the editor shows it: undo the language's conversion, then the notation's.
     */
    private fun displayedText(value: String?): String? =
        value?.let {
            val presented = PropertyPresentationAspect.toPresentation(property, it) ?: it
            readReplace?.invoke(presented) ?: presented
        }

    /**
     * Typed text as the model stores it. Text the language does not recognise as one of its values is stored as it
     * is - every prefix of a value looks like that while it is being typed.
     */
    private fun storedValue(text: String): String =
        presentedValue(text).let { PropertyPresentationAspect.fromPresentation(property, it) ?: it }

    override fun toParserSymbol(): ISymbol = PropertySymbol(property, regex ?: RegexSymbol.defaultPropertyPattern)

    override fun toCompletionToken(): ICompletionTokenOrList? = PropertyCompletionToken(property)

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is Token && it.symbol == symbol } ?: return
        builder.currentNode().setPropertyValue(property, storedValue((token as Token).text))
    }

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase {
        val value = displayedText(node.getPropertyValue(property))
        val data = TextCellSpec(value ?: "", if (value == null) placeholderText else "")
        data.properties[CellActionProperties.replaceText] = ChangePropertyAction(node)
        data.properties[CommonCellProperties.tabTarget] = true
        data.cellReferences += PropertyCellReference(property.toReference(), node.reference)
        val target = CheckMessageTarget.PropertyTarget(property.getSimpleName())
        data.properties.addCheckMessages(context.editorEngine.getCheckMessages(node).filter { it.target == target })
        return data
    }

    override fun getInstantiationActions(
        location: INonExistingNode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider>? = listOf(WrapPropertyValueProvider(location))

    private fun validateValue(
        node: INonExistingNode,
        value: String,
    ): Boolean =
        validator?.invoke(value)
            ?: regex?.matches(value)
            ?: ConstraintsAspect.checkPropertyValue(node, property, value).isEmpty()

    override fun getSymbolConditionState(node: INode): Boolean = node.getPropertyValue(property) != null

    override fun setSymbolConditionFalse(node: INode) = node.setPropertyValue(property, null)

    override fun getSymbolTransformationAction(
        node: INode,
        optionalCell: TemplateCellReference,
    ): IActionOrProvider? = WrapPropertyValueProvider(node.toNonExisting())

    inner class WrapPropertyValueProvider(
        val location: INonExistingNode,
    ) : ICodeCompletionActionProvider {
        override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> =
            if (parameters.pattern.isNotBlank() &&
                validateValue(location.replacement(concept), presentedValue(parameters.pattern))
            ) {
                listOf(WrapPropertyValue(location, parameters.pattern))
            } else {
                emptyList()
            }
    }

    inner class WrapPropertyValue(
        val location: INonExistingNode,
        val value: String,
    ) : ICodeCompletionAction {
        override fun getMatchingText(): String = value

        override fun getDescription(): String = concept.getShortName()

        override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
            val node = location.getOrCreateNode(concept)
            node.setPropertyValue(property, storedValue(value))
            return CaretPositionPolicy(createCellReference(node))
        }
    }

    inner class ChangePropertyAction(
        val node: INode,
    ) : ITextChangeAction {
        override fun isValid(value: String?): Boolean {
            if (value == null) return true
            return validateValue(node.toNonExisting(), presentedValue(value))
        }

        override fun replaceText(
            editor: CellTreeState,
            range: IntRange,
            replacement: String,
            newText: String,
        ): Boolean {
            node.getArea().executeWrite {
                node.setPropertyValue(property, storedValue(newText))
            }
            return true
        }
    }
}
