package org.modelix.parser

import io.github.oshai.kotlinlogging.KotlinLogging
import org.modelix.model.api.IConcept
import org.modelix.model.api.getAllConcepts
import kotlin.collections.plusAssign

private val LOG = KotlinLogging.logger { }

class Grammar {
    private val rules = ArrayList<ProductionRule>()
    private val existingLists = HashSet<ListSymbol>()
    private val existingOptionals = HashSet<OptionalSymbol>()
    private val loadedSubConceptRules = HashSet<IConcept>()
    private val follows: Map<INonTerminalSymbol, Set<ITerminalSymbol>>
    val knownConstants: Set<String>

    constructor(startConcept: IConcept, rawRules: List<ProductionRule>, forCodeCompletion: Boolean = false) {
        rawRules.forEach { addRule(it) }
        // if (forCodeCompletion) modifyForCodeCompletion()
        addGoal(startConcept)
        follows = computeFollows()
        knownConstants =
            rules
                .asSequence()
                .flatMap { it.symbols }
                .filterIsInstance<ConstantSymbol>()
                .map { it.text }
                .toSet()
    }

    private fun modifyForCodeCompletion() {
        for (rule in rules.toList()) {
            // complete end of the rule
            for (i in (1 until rule.symbols.size)) {
                val existingSymbols = rule.symbols.take(i)
                // if (!existingSymbols.any { it is ConstantSymbol }) continue
                val nextSymbol = rule.symbols[i]
                rules += ProductionRule(rule.head, existingSymbols + ConstantSymbol.CARET)
            }

            // complete beginning of the rule
            for (i in (1 until rule.symbols.size)) {
                val existingSymbols = rule.symbols.drop(i)
                if (!existingSymbols.any { it is ConstantSymbol }) continue
                rules += ProductionRule(rule.head, listOf(ConstantSymbol.CARET) + existingSymbols)
            }
        }
    }

    fun getGoalRule() = getRulesForNonTerminal(GoalSymbol).single()

    private fun addGoal(startConcept: IConcept) {
        addGoal(SubConceptsSymbol(startConcept))
    }

    private fun addGoal(goal: INonTerminalSymbol) {
        addRule(ProductionRule(GoalSymbol, listOf(goal, EndOfInputSymbol)))
    }

    private fun addRule(rule: ProductionRule) {
        require(rule.head !is SubConceptsSymbol) { "${rule.head} is only allowed on the right hand side of a rule. Invalid rule: $rule" }
        if (rule.symbols
                .asSequence()
                .flatMap { it.leafSymbols() }
                .filterIsInstance<ConstantSymbol>()
                .any { it.text.isBlank() }
        ) {
            LOG.warn { "Ignoring rule with empty constant: $rule" }
            return
        }
        rules += rule
        loadRulesFromSymbols(rule.symbols)
        (rule.head as? ExactConceptSymbol)?.let { loadSubConceptRules(it.concept) }
    }

    private fun loadRulesFromSymbols(symbols: List<ISymbol>) {
        symbols.filterIsInstance<ListSymbol>().forEach { addListRules(it) }
        symbols.filterIsInstance<OptionalSymbol>().forEach { addOptionalRules(it) }
    }

    private fun addListRules(listSymbol: ListSymbol) {
        if (existingLists.contains(listSymbol)) return
        existingLists.add(listSymbol)
        rules += ProductionRule(listSymbol, listSymbol.item)
        rules += ProductionRule(listSymbol, listOfNotNull(listSymbol.item, listSymbol.separator, listSymbol))
        loadRulesFromSymbols(listOfNotNull(listSymbol.item, listSymbol.separator))
    }

    private fun addOptionalRules(optionalSymbol: OptionalSymbol) {
        if (existingOptionals.contains(optionalSymbol)) return
        existingOptionals.add(optionalSymbol)
        rules += ProductionRule(optionalSymbol, optionalSymbol.children)
        rules += ProductionRule(optionalSymbol, emptyList())
        loadRulesFromSymbols(optionalSymbol.children)
    }

    private fun loadSubConceptRules(subConcept: IConcept) {
        if (loadedSubConceptRules.contains(subConcept)) return
        loadedSubConceptRules.add(subConcept)

        for (superConcept in subConcept.getAllConcepts()) {
            rules += ProductionRule(SubConceptsSymbol(superConcept), ExactConceptSymbol(subConcept))
        }
    }

    fun getPossibleFollowingTerminals(nonTerminal: INonTerminalSymbol): Set<ITerminalSymbol> = follows[nonTerminal] ?: emptySet()

    private val possibleFirstTokensCache = HashMap<INonTerminalSymbol, Set<ITerminalSymbol>>()

    fun getPossibleFirstTerminalSymbols(nonTerminal: INonTerminalSymbol): Set<ITerminalSymbol> =
        possibleFirstTokensCache.getOrPut(nonTerminal) {
            LinkedHashSet<ISymbol>()
                .also { collectPossibleFirstSymbols(nonTerminal, HashSet(), it, HashSet()) }
                .filterIsInstance<ITerminalSymbol>()
                .toSet()
        }

    private val possibleFirstRulesCache = HashMap<INonTerminalSymbol, Set<ProductionRule>>()

    fun getPossibleFirstRules(nonTerminal: INonTerminalSymbol): Set<ProductionRule> =
        possibleFirstRulesCache.getOrPut(nonTerminal) {
            LinkedHashSet<ProductionRule>().also { collectPossibleFirstSymbols(nonTerminal, HashSet(), HashSet(), it) }
        }

    private fun computeFollows(): Map<INonTerminalSymbol, Set<ITerminalSymbol>> {
        val result = HashMap<INonTerminalSymbol, MutableSet<ITerminalSymbol>>()
        var notDone: Boolean

        do {
            notDone = false

            for (rule in rules) {
                for ((index, symbol) in rule.symbols.withIndex()) {
                    if (symbol !is INonTerminalSymbol) continue

                    val symbolFollows = result.getOrPut(symbol) { HashSet<ITerminalSymbol>() }
                    val afterSymbolFirsts = getSequenceFirsts(rule.symbols.drop(index + 1))

                    for (first in afterSymbolFirsts) {
                        if (first == EmptySymbol) {
                            val nonTerminalFollows: MutableSet<ITerminalSymbol>? = result[rule.head]
                            if (nonTerminalFollows != null) {
                                val oldSize = symbolFollows.size
                                symbolFollows.addAll(nonTerminalFollows)
                                val anyElementsAdded = symbolFollows.size != oldSize
                                notDone = notDone || anyElementsAdded
                            }
                        } else {
                            if (!symbolFollows.contains(first)) {
                                symbolFollows.add(first)
                                notDone = true
                            }
                        }
                    }
                }
            }
        } while (notDone)

        return result
    }

    private fun getSequenceFirsts(symbols: List<ISymbol>): Set<ITerminalSymbol> {
        val result = HashSet<ITerminalSymbol>()
        var epsilonInSymbolFirsts = true
        for (symbol in symbols) {
            epsilonInSymbolFirsts = false
            when (symbol) {
                is ITerminalSymbol -> {
                    result.add(symbol)
                    break
                }

                is INonTerminalSymbol -> {
                    val firsts = getPossibleFirstTerminalSymbols(symbol)
                    epsilonInSymbolFirsts = epsilonInSymbolFirsts || firsts.contains(EmptySymbol)
                    result += firsts

                    epsilonInSymbolFirsts = epsilonInSymbolFirsts || firsts.isEmpty()

                    if (!epsilonInSymbolFirsts) break
                }
            }
        }

        if (epsilonInSymbolFirsts) {
            result += EmptySymbol
        }

        return result
    }

    fun collectPossibleFirstSymbols(
        nonTerminal: INonTerminalSymbol,
        visited: MutableSet<INonTerminalSymbol>,
        firstSymbols: MutableSet<ISymbol>,
        firstRules: MutableSet<ProductionRule>,
    ) {
        if (visited.contains(nonTerminal)) return
        visited.add(nonTerminal)

        fun collectFromSymbolList(symbols: List<ISymbol>) {
            for (firstSymbol in symbols) {
                when (firstSymbol) {
                    is ITerminalSymbol -> {
                        firstSymbols.add(firstSymbol)
                        return
                    }

                    is INonTerminalSymbol -> {
                        val newSymbols = LinkedHashSet<ISymbol>()
                        collectPossibleFirstSymbols(firstSymbol, visited, newSymbols, firstRules)
                        firstSymbols += newSymbols - EmptySymbol
                        if (!newSymbols.contains(EmptySymbol)) return
                    }
                }
            }
            firstSymbols += EmptySymbol
        }

        for (rule in getRulesForNonTerminal(nonTerminal)) {
            firstRules.add(rule)
            collectFromSymbolList(rule.symbols)
        }
    }

    private val getRulesForNonTerminalCache = HashMap<INonTerminalSymbol, List<ProductionRule>>()

    fun getRulesForNonTerminal(nonTerminal: INonTerminalSymbol): List<ProductionRule> =
        getRulesForNonTerminalCache.getOrPut(nonTerminal) {
            rules.filter {
                it.head == nonTerminal
            }
        }

    private val getRulesContainingNonTerminalCache = HashMap<INonTerminalSymbol, List<ProductionRule>>()

    fun getRulesContainingNonTerminal(nonTerminal: INonTerminalSymbol): List<ProductionRule> =
        getRulesContainingNonTerminalCache.getOrPut(nonTerminal) {
            rules.filter {
                it.symbols.any { it == nonTerminal }
            }
        }
}
