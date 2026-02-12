package org.modelix.editor.celltemplate

import org.modelix.editor.EditorEngine
import org.modelix.model.api.IConcept
import org.modelix.model.api.getInstantiatableSubConcepts
import org.modelix.model.api.runSynchronized
import org.modelix.parser.ExactConceptSymbol
import org.modelix.parser.Grammar
import org.modelix.parser.IDisambiguator
import org.modelix.parser.LRParser
import org.modelix.parser.LRTable
import org.modelix.parser.ProductionRule
import org.modelix.parser.createParseTable

class ParserForEditor(
    val engine: EditorEngine,
) {
    private var parseTables = HashMap<Pair<IConcept, Boolean>, LRTable>()

    private fun getParseTable(
        startConcept: IConcept,
        forCodeCompletion: Boolean,
    ): LRTable =
        runSynchronized(parseTables) {
            parseTables.getOrPut(startConcept to forCodeCompletion) {
                val rules = ArrayList<ProductionRule>()
                loadRulesFromSubconcepts(rules, startConcept, HashSet(), engine)
                Grammar(startConcept, rules, forCodeCompletion = forCodeCompletion).createParseTable()
            }
        }

    fun getParser(
        startConcept: IConcept,
        forCodeCompletion: Boolean,
        disambiguator: IDisambiguator = IDisambiguator.default(),
    ): LRParser = LRParser(getParseTable(startConcept, forCodeCompletion), disambiguator)

    private fun loadRulesFromSubconcepts(
        rules: MutableList<ProductionRule>,
        concept: IConcept,
        visited: MutableSet<IConcept>,
        engine: EditorEngine,
    ) {
        if (visited.contains(concept)) return
        for (subConcept in concept.getInstantiatableSubConcepts()) {
            loadRules(rules, subConcept, visited, engine)
        }
        visited.add(concept)
    }

    private fun loadRules(
        rules: MutableList<ProductionRule>,
        concept: IConcept,
        visited: MutableSet<IConcept>,
        engine: EditorEngine,
    ) {
        if (visited.contains(concept)) return
        visited.add(concept)

        val cellModel = engine.createCellModelExcludingDefault(concept) ?: return

        val symbols = cellModel.getGrammarSymbols().map { it.toParserSymbol() }.toList()
        if (symbols.isNotEmpty()) {
            val rule = ProductionRule(ExactConceptSymbol(concept), symbols)
            rules.add(rule)
        }

        val childConcepts =
            cellModel
                .getGrammarSymbols()
                .leafSymbols()
                .filterIsInstance<ChildCellTemplate>()
                .map { it.link.targetConcept }
        for (childConcept in childConcepts) {
            loadRulesFromSubconcepts(rules, childConcept, visited, engine)
        }
    }
}
