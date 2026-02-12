package org.modelix.parser

import org.modelix.model.api.IConcept
import org.modelix.model.api.IProperty
import org.modelix.model.api.IReferenceLink
import org.modelix.model.api.IRole

interface ISymbol {
    fun leafSymbols(): Sequence<ISymbol> = sequenceOf(this)

    fun matches(token: IParseTreeNode): Boolean
}

interface ITerminalSymbol : ISymbol

interface INonTerminalSymbol : ISymbol

data class OptionalSymbol(
    val children: List<ISymbol>,
) : INonTerminalSymbol {
    constructor(vararg symbol: ISymbol) : this(symbol.toList())

    override fun leafSymbols(): Sequence<ISymbol> = children.asSequence().flatMap { it.leafSymbols() }

    override fun matches(token: IParseTreeNode): Boolean = token is ParseTreeNode && token.rule.head == this

    override fun toString(): String = "optional(${children.joinToString(" ")})"
}

data class ConstantSymbol(
    val text: String,
) : ITerminalSymbol {
    override fun toString(): String = "constant[$text]"

    override fun matches(token: IParseTreeNode): Boolean =
        token is IToken && (token.symbol == null || token.symbol == this) && token.text == text

    companion object {
        val CARET = ConstantSymbol("\u16B9") // ᚹ
    }
}

data class ExactConceptSymbol(
    val concept: IConcept,
) : INonTerminalSymbol {
    override fun toString(): String = concept.getShortName()

    override fun matches(token: IParseTreeNode): Boolean = token is INonTerminalToken && token.getNonTerminalSymbol() == this
}

data class SubConceptsSymbol(
    val concept: IConcept,
) : INonTerminalSymbol {
    override fun toString(): String = concept.getShortName() + "+"

    override fun matches(token: IParseTreeNode): Boolean = token is INonTerminalToken && token.getNonTerminalSymbol() == this
}

open class RegexSymbol(
    val regex: Regex?,
) : ITerminalSymbol {
    override fun matches(token: IParseTreeNode): Boolean =
        token is IToken && (token.symbol == null || token.symbol == this) && (regex == null || token.text.matches(regex))

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || this::class != other::class) return false

        other as RegexSymbol

        return regex == other.regex
    }

    override fun hashCode(): Int = regex?.pattern.hashCode()

    override fun toString(): String = "regex/${regex?.pattern}/"

    companion object {
        val defaultIdentifierPattern = Regex("""[_a-zA-Z][_a-zA-Z0-9]*""")
        val defaultStringLiteralRegex = Regex("""([^"\\]|\\.)*""")
        val defaultPropertyPattern = Regex("""\w+""")
    }
}

abstract class RoleSymbol(
    regex: Regex?,
) : RegexSymbol(regex) {
    abstract val role: IRole

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || this::class != other::class) return false

        other as RoleSymbol

        if (role != other.role) return false
        if (regex?.pattern != other.regex?.pattern) return false

        return true
    }

    override fun hashCode(): Int = 31 * role.hashCode() + regex?.pattern.hashCode()
}

class ReferenceSymbol(
    override val role: IReferenceLink,
    regex: Regex? = defaultIdentifierPattern,
) : RoleSymbol(regex) {
    override fun toString() = "reference[${role.getSimpleName()}, ${regex?.pattern}]"
}

class PropertySymbol(
    override val role: IProperty,
    regex: Regex? = defaultPropertyPattern,
) : RoleSymbol(regex) {
    override fun toString() = "property[${role.getSimpleName()}, ${regex?.pattern}]"
}

object EndOfInputSymbol : ITerminalSymbol {
    override fun matches(token: IParseTreeNode): Boolean = token == EndOfInputToken

    override fun toString(): String = "$"
}

object EmptySymbol : ITerminalSymbol {
    override fun matches(token: IParseTreeNode): Boolean = token == EmptyToken

    override fun toString(): String = "ε"
}

class ProductionRule(
    val head: INonTerminalSymbol,
    val symbols: List<ISymbol>,
) {
    constructor(head: INonTerminalSymbol, vararg symbols: ISymbol) : this(head, symbols.toList())

    init {
        require(!symbols.contains(EmptySymbol)) {
            "Symbol list should be empty instead"
        }
    }

    override fun toString(): String = "$head -> ${symbols.ifEmpty { listOf(EmptySymbol) }.joinToString(" ")}"

    fun isGoal() = head == GoalSymbol

    fun isEmpty() = symbols.isEmpty()
}

object GoalSymbol : INonTerminalSymbol {
    override fun toString(): String = "goal"

    override fun matches(token: IParseTreeNode): Boolean = false
}

data class ListSymbol(
    val item: ISymbol,
    val separator: ITerminalSymbol?,
) : INonTerminalSymbol {
    override fun toString(): String = "list<$item>"

    override fun matches(token: IParseTreeNode): Boolean = token is INonTerminalToken && token.getNonTerminalSymbol() == this
}
