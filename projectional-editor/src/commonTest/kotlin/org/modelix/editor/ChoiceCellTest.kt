package org.modelix.editor

import org.modelix.editor.celltemplate.ChoiceAlternative
import org.modelix.editor.celltemplate.ChoiceCellTemplate
import org.modelix.editor.celltemplate.CollectionCellTemplate
import org.modelix.model.api.SimpleProperty
import org.modelix.model.api.meta.NullConcept
import org.modelix.parser.AlternationSymbol
import org.modelix.parser.ConstantSymbol
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * A property with a closed set of values, written one way per value. This is what replaces the cells MPS hides
 * behind a rendering condition whenever the condition only asks what a property is set to.
 *
 * The point of the construct is that it stays invertible: every alternative's text is a way of writing that value,
 * so the editor derives how to reach any of them instead of the notation having to say.
 */
class ChoiceCellTest {
    private val excludeMin = SimpleProperty("excludeMin")

    private fun choice(body: ChoiceCellTemplateBuilder<*, *>.() -> Unit): ChoiceCellTemplate {
        val template = ChoiceCellTemplate(NullConcept, excludeMin)
        ChoiceCellTemplateBuilder(template, NullConcept, INodeConverter.Untyped).also(body)
        return template
    }

    private fun brackets() =
        choice {
            alternative("true", "(")
            alternative("false", "[")
        }

    @Test
    fun eachValueIsWrittenItsOwnWay() {
        val template = brackets()

        assertEquals(listOf(ChoiceAlternative("true", "("), ChoiceAlternative("false", "[")), template.alternatives)
        assertEquals("(", template.textForValue("true"))
        assertEquals("[", template.textForValue("false"))
    }

    @Test
    fun aValueTheNotationDoesNotDescribeHasNoText() {
        assertNull(brackets().textForValue("maybe"))
        assertNull(brackets().textForValue(null))
    }

    @Test
    fun theTextOfAnAlternativeIsHowItsValueIsTyped() {
        val template = brackets()

        assertEquals("true", template.valueForText("("))
        assertEquals("false", template.valueForText("["))
        assertNull(template.valueForText("{"))
    }

    @Test
    fun onlyTheAlternativesAreAcceptedAsInput() {
        val template = brackets()

        assertTrue(template.accepts("("))
        assertTrue(template.accepts("["))
        assertTrue(template.accepts(null))
        assertFalse(template.accepts("{"))
        assertFalse(template.accepts("tru"))
    }

    @Test
    fun theGrammarGetsOneAlternativePerValue() {
        assertEquals(
            AlternationSymbol(listOf(listOf(ConstantSymbol("(")), listOf(ConstantSymbol("[")))),
            brackets().toParserSymbol(),
        )
    }

    @Test
    fun anAlternativeWithNoTextContributesAnEmptySymbolSequence() {
        // A flag is the degenerate choice: a word when set, nothing when not. A blank constant would make
        // org.modelix.parser.Grammar drop the whole rule, so the alternative has to be empty instead.
        val template =
            choice {
                alternative("true", "abstract")
                alternative("false", "")
            }

        assertEquals(
            AlternationSymbol(listOf(listOf(ConstantSymbol("abstract")), emptyList())),
            template.toParserSymbol(),
        )
    }

    @Test
    fun aValueCannotBeDeclaredTwice() {
        assertFailsWith<IllegalArgumentException> {
            choice {
                alternative("true", "(")
                alternative("true", "[")
            }
        }
    }

    @Test
    fun twoValuesCannotBeWrittenTheSameWay() {
        // Otherwise typing that text would be an ambiguous instruction about what the property should become.
        assertFailsWith<IllegalArgumentException> {
            choice {
                alternative("true", "(")
                alternative("false", "(")
            }
        }
    }

    @Test
    fun severalValuesMayRenderNothing() {
        // Only one of them can be reached by typing, but an enumeration whose members have no notation yet should
        // still build.
        val template =
            choice {
                alternative("a", "")
                alternative("b", "")
            }

        assertEquals(2, template.alternatives.size)
    }

    @Test
    fun aBooleanWrittenAsTwoWordsIsAChoiceOverTrueAndFalse() {
        val parent = CollectionCellTemplate(NullConcept)
        CellTemplateBuilder(parent, NullConcept, INodeConverter.Untyped).apply {
            excludeMin.booleanCell("excluded", "included")
        }

        val choiceCell = parent.getChildren().single() as ChoiceCellTemplate
        assertEquals(
            listOf(ChoiceAlternative("true", "excluded"), ChoiceAlternative("false", "included")),
            choiceCell.alternatives,
        )
    }
}
