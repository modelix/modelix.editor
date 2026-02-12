package org.modelix.parser

data class RuleItem(
    val positionInRule: PositionInRule,
) {
    constructor(rule: ProductionRule, cursor: Int) : this(PositionInRule(cursor, rule))

    val rule: ProductionRule get() = positionInRule.rule
    val cursor: Int get() = positionInRule.position

    fun nextSymbol(): ISymbol? = rule.symbols.getOrNull(cursor)

    fun nextNextSymbol(): ISymbol? = rule.symbols.getOrNull(cursor + 1)

    fun forward(): RuleItem? {
        check(!isReadyForReduce())
        return if (cursor < rule.symbols.size) RuleItem(rule, cursor + 1) else null
    }

    fun isReadyForReduce() = nextSymbol() == null

    fun size() = rule.symbols.size

    override fun toString(): String =
        rule.head.toString() +
            " -> " +
            rule.symbols.take(cursor).joinToString(" ") +
            " # " +
            rule.symbols.drop(cursor).joinToString(" ")

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || this::class != other::class) return false

        other as RuleItem

        if (positionInRule != other.positionInRule) return false

        return true
    }

    private val cachedHashCode = arrayOf(positionInRule).contentHashCode()

    override fun hashCode(): Int = cachedHashCode
}

data class PositionInRule(
    val position: Int,
    val rule: ProductionRule,
)
