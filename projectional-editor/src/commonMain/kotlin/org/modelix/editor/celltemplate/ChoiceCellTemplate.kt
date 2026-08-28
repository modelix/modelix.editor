package org.modelix.editor.celltemplate

import org.modelix.checks.CheckMessageTarget
import org.modelix.checks.addCheckMessages
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpecBase
import org.modelix.editor.CellTreeState
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.ITextChangeAction
import org.modelix.editor.PropertyCellReference
import org.modelix.editor.TextCellSpec
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.parser.AlternationSymbol
import org.modelix.parser.ConstantSymbol
import org.modelix.parser.INonTerminalToken
import org.modelix.parser.ISymbol
import org.modelix.parser.ParseTreeNode

/**
 * One way of writing a [ChoiceCellTemplate]: the property value, and the text that stands for it.
 *
 * An empty [text] renders nothing, which is what a flag's unset state looks like.
 */
data class ChoiceAlternative(
    val value: String,
    val text: String,
)

/**
 * Renders a property that only accepts a closed set of values, with one piece of notation per value.
 *
 * This is the general form of [FlagCellTemplate], which is the special case of a boolean with nothing to show for
 * `false`. It is what MPS writes as a cell carrying a rendering condition whenever the condition only asks what a
 * property is set to - one bracket when a range excludes its lower bound and another when it does not, one word when
 * a flag is set and a different word when it is not.
 *
 * Unlike a condition, a choice stays invertible, which is what keeps the notation declarative: each alternative's
 * text is a way of writing that value, so what the editor has to do to reach any alternative is derived rather than
 * implemented. Typing an alternative's text sets the property to its value, and nothing else is accepted.
 */
class ChoiceCellTemplate(
    concept: IConcept,
    property: IProperty,
) : PropertyCellTemplate(concept, property),
    IGrammarSymbol {
    val alternatives: MutableList<ChoiceAlternative> = ArrayList()

    fun alternative(
        value: String,
        text: String,
    ) {
        require(alternatives.none { it.value == value }) {
            "Duplicate value in the alternatives of ${property.getSimpleName()}: $value"
        }
        require(text.isEmpty() || alternatives.none { it.text == text }) {
            "Two values of ${property.getSimpleName()} cannot be written the same way: $text"
        }
        alternatives += ChoiceAlternative(value, text)
    }

    /** How [value] is written, or null when the notation describes no such value. */
    fun textForValue(value: String?): String? = alternatives.firstOrNull { it.value == value }?.text

    /** The value [text] stands for, or null when it is not one of the alternatives. */
    fun valueForText(text: String?): String? = alternatives.firstOrNull { it.text == text }?.value

    /** Whether [text] is one of the ways this property may be written. Nothing else is accepted as input. */
    fun accepts(text: String?): Boolean = text == null || valueForText(text) != null

    /**
     * An alternative that renders nothing becomes an empty symbol sequence rather than a blank constant, which
     * [org.modelix.parser.Grammar] would drop together with the rule containing it.
     */
    override fun toParserSymbol(): ISymbol =
        AlternationSymbol(
            alternatives.map { if (it.text.isEmpty()) emptyList() else listOf(ConstantSymbol(it.text)) },
        )

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol() as AlternationSymbol
        val token = builder.consumeNextToken { it is INonTerminalToken && it.getNonTerminalSymbol() == symbol } ?: return
        val matchedRule = (token as? ParseTreeNode)?.rule ?: return
        val index = symbol.alternatives.indexOfFirst { it == matchedRule.symbols }
        if (index < 0) return
        builder.currentNode().setPropertyValue(property, alternatives[index].value)
    }

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase {
        val value = node.getPropertyValue(property)
        val alternative = textForValue(value)
        // A value that no alternative covers is shown as it is rather than hidden, so that a model the notation does
        // not describe is visible instead of silently rendering as one of the alternatives.
        val data =
            TextCellSpec(
                text = alternative ?: "",
                placeholderText = if (alternative != null) "" else (value ?: placeholderText),
            )
        data.properties[CellActionProperties.replaceText] = ChooseAlternativeAction(node)
        data.properties[CommonCellProperties.tabTarget] = true
        data.cellReferences += PropertyCellReference(property.toReference(), node.reference)
        val target = CheckMessageTarget.PropertyTarget(property.getSimpleName())
        data.properties.addCheckMessages(context.editorEngine.getCheckMessages(node).filter { it.target == target })
        return data
    }

    /**
     * Offering every alternative as a way of creating the node would list the same concept once per alternative, and
     * the value can always be changed after the node exists. [FlagCellTemplate] leaves it out for the same reason.
     */
    override fun getInstantiationActions(
        location: INonExistingNode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider>? = null

    /**
     * Only the texts of the alternatives are accepted. Text that is not one of them yet is held by [OverrideText],
     * which wraps this action, so an alternative longer than one character can still be typed one key at a time.
     */
    inner class ChooseAlternativeAction(
        val node: INode,
    ) : ITextChangeAction {
        override fun isValid(value: String?): Boolean = accepts(value)

        override fun replaceText(
            editor: CellTreeState,
            range: IntRange,
            replacement: String,
            newText: String,
        ): Boolean {
            val newValue = valueForText(newText) ?: return false
            node.getArea().executeWrite {
                node.setPropertyValue(property, newValue)
            }
            return true
        }
    }
}
