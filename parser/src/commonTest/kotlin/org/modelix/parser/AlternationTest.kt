package org.modelix.parser

import org.modelix.model.api.IConcept
import org.modelix.model.api.SimpleConcept
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * [AlternationSymbol] is what a property with a closed set of values contributes to the grammar: the same position
 * written one way per value. It is the grammar side of
 * `org.modelix.editor.celltemplate.ChoiceCellTemplate`.
 */
class AlternationTest {
    private val rangeSpec = SimpleConcept("RangeSpec")
    private val classDeclaration = SimpleConcept("ClassDeclaration")

    private val lowerBracket = AlternationSymbol(listOf(listOf(ConstantSymbol("[")), listOf(ConstantSymbol("("))))
    private val upperBracket = AlternationSymbol(listOf(listOf(ConstantSymbol("]")), listOf(ConstantSymbol(")"))))

    /** A flag: one alternative writes a word, the other writes nothing. */
    private val abstractFlag = AlternationSymbol(listOf(listOf(ConstantSymbol("abstract")), emptyList()))

    private val rules =
        listOf(
            ProductionRule(
                ExactConceptSymbol(rangeSpec),
                listOf(
                    lowerBracket,
                    RegexSymbol(Regex("""\d+""")),
                    ConstantSymbol(".."),
                    RegexSymbol(Regex("""\d+""")),
                    upperBracket,
                ),
            ),
            ProductionRule(
                ExactConceptSymbol(classDeclaration),
                listOf(abstractFlag, ConstantSymbol("class"), RegexSymbol(RegexSymbol.defaultIdentifierPattern)),
            ),
        )

    private fun parser(startConcept: IConcept): LRParser {
        val grammar = Grammar(startConcept, rules)
        val closureTable = LRClosureTable(grammar)
        closureTable.load()
        val parsingTable = LRTable()
        parsingTable.load(closureTable)
        return LRParser(parsingTable, IDisambiguator.default())
    }

    private fun assertParses(
        startConcept: IConcept,
        input: String,
    ) {
        val parseTrees = parser(startConcept).parseForest(input)
        assertTrue(parseTrees.count() > 0, "Expected '$input' to parse")
    }

    /** The parser reports input it cannot derive either as an empty forest or by throwing. */
    private fun assertDoesNotParse(
        startConcept: IConcept,
        input: String,
    ) {
        val parseTrees = runCatching { parser(startConcept).parseForest(input).count() }.getOrElse { 0 }
        assertEquals(0, parseTrees, "Expected '$input' not to parse")
    }

    @Test
    fun theGrammarGetsOneRuleForEachAlternative() {
        val grammar = Grammar(rangeSpec, rules)

        assertEquals(
            listOf(listOf(ConstantSymbol("[")), listOf(ConstantSymbol("("))),
            grammar.getRulesForNonTerminal(lowerBracket).map { it.symbols },
        )
    }

    @Test
    fun anAlternativeThatRendersNothingBecomesAnEmptyRule() {
        val grammar = Grammar(classDeclaration, rules)

        assertEquals(
            listOf(listOf(ConstantSymbol("abstract")), emptyList()),
            grammar.getRulesForNonTerminal(abstractFlag).map { it.symbols },
        )
    }

    @Test
    fun everyCombinationOfAlternativesParses() {
        assertParses(rangeSpec, "[1..2]")
        assertParses(rangeSpec, "(1..2)")
        assertParses(rangeSpec, "[1..2)")
        assertParses(rangeSpec, "(1..2]")
    }

    @Test
    fun anAlternativeIsOnlyAcceptedWhereItsAlternationStands() {
        // The same tokens, but the closing bracket's alternatives in the opening position and the other way round.
        assertDoesNotParse(rangeSpec, "]1..2[")
    }

    @Test
    fun anAlternativeThatRendersNothingMakesTheWordOptional() {
        assertParses(classDeclaration, "abstract class Foo")
        assertParses(classDeclaration, "class Foo")
    }
}
