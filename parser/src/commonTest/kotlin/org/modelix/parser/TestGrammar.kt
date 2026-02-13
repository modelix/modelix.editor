package org.modelix.parser

import org.modelix.model.api.IConcept
import org.modelix.model.api.SimpleConcept

object TestGrammar {
    val expression = SimpleConcept("Expression")
    val plusExpression = SimpleConcept("PlusExpression", directSuperConcepts = listOf(expression))
    val mulExpression = SimpleConcept("MulExpression", directSuperConcepts = listOf(expression))
    val parensExpression = SimpleConcept("ParensExpression", directSuperConcepts = listOf(expression))
    val listLiteral = SimpleConcept("ListLiteral", directSuperConcepts = listOf(expression))
    val stringLiteral = SimpleConcept("StringLiteral", directSuperConcepts = listOf(expression))
    val integerLiteral = SimpleConcept("IntegerLiteral", directSuperConcepts = listOf(expression))
    val ternaryExpression = SimpleConcept("TernaryExpression", directSuperConcepts = listOf(expression))

    val statement = SimpleConcept("Statement")
    val localVariableDeclaration = SimpleConcept("LocalVariableDeclaration")
    val localVariableDeclarationStatement = SimpleConcept("LocalVariableDeclarationStatement", directSuperConcepts = listOf(statement))

    val type = SimpleConcept("Type")
    val integerType = SimpleConcept("IntegerType", directSuperConcepts = listOf(type))

    val rules = ArrayList<ProductionRule>()

    init {
        addRule(integerLiteral, RegexSymbol(Regex("""\d+""")))
        addRule(plusExpression, SubConceptsSymbol(expression), ConstantSymbol("+"), SubConceptsSymbol(expression))
        addRule(mulExpression, SubConceptsSymbol(expression), ConstantSymbol("*"), SubConceptsSymbol(expression))
        addRule(parensExpression, ConstantSymbol("("), SubConceptsSymbol(expression), ConstantSymbol(")"))
        addRule(
            listLiteral,
            ConstantSymbol("list"),
            ConstantSymbol("["),
            ListSymbol(SubConceptsSymbol(expression), ConstantSymbol(",")),
            ConstantSymbol("]")
        )
        addRule(stringLiteral, ConstantSymbol("\""), RegexSymbol(RegexSymbol.defaultStringLiteralRegex), ConstantSymbol("\""))
        addRule(
            ternaryExpression,
            SubConceptsSymbol(expression),
            ConstantSymbol("?"),
            SubConceptsSymbol(expression),
            ConstantSymbol(":"),
            SubConceptsSymbol(expression)
        )

        addRule(localVariableDeclarationStatement, SubConceptsSymbol(localVariableDeclaration), ConstantSymbol(";"))
        addRule(
            localVariableDeclaration,
            SubConceptsSymbol(type),
            RegexSymbol(RegexSymbol.defaultIdentifierPattern),
            OptionalSymbol(
                ConstantSymbol("="),
                SubConceptsSymbol(expression)
            )
        )

        addRule(integerType, ConstantSymbol("int"))
    }

    fun getParser(
        startConcept: IConcept,
        disambiguator: IDisambiguator = IDisambiguator.default(),
    ): LRParser {
        val grammar = Grammar(startConcept, rules)
        val closureTable = LRClosureTable(grammar)
        closureTable.load()
        val parsingTable = LRTable()
        parsingTable.load(closureTable)
        return LRParser(parsingTable, disambiguator)
    }

    fun addRule(
        concept: IConcept,
        vararg symbols: ISymbol,
    ) {
        rules.add(ProductionRule(ExactConceptSymbol(concept), symbols.toList()))
    }
}
