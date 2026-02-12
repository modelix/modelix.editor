package org.modelix.parser

class Scanner(
    private val input: CharSequence,
    private var position: Int = 0,
    private var knownConstants: Set<String> = emptySet(),
) {
    private val whitespaceRegex = Regex("\\s+")
    private val expectedNextTerminals: MutableSet<ITerminalSymbol> = HashSet()

    override fun toString(): String {
        val x = 20
        val before = input.substring(maxOf(0, position - x), position)
        val after = input.substring(position, minOf(input.length, position + x))
        return "$before^$after"
    }

    fun next(): List<IToken> {
        var nextTokens: List<IToken> = matchNextTokens()
        if (nextTokens.size == 1 && nextTokens.first() is WhitespaceToken) {
            position += nextTokens.first().textLength()
            nextTokens = matchNextTokens()
        }
        check(nextTokens.isNotEmpty()) { "None of the terminals matches the input: $this" }
        expectedNextTerminals.clear()
        position += nextTokens.first().textLength()
        return nextTokens
    }

    private fun matchNextTokens(): List<IToken> {
        if (isAtEnd()) return listOf(EndOfInputToken)
        check(expectedNextTerminals.isNotEmpty()) { "Possible terminal symbols unknown" }
        return expectedNextTerminals
            .asSequence()
            .map { matchInput(it) }
            .plus(matchRegex(whitespaceRegex) { WhitespaceToken(it, position) })
            .filterNotNull()
            .groupBy { it.textLength() }
            .maxByOrNull { it.key }
            ?.value
            ?.distinct()
            ?: emptyList()
    }

    fun isAtEnd() = !hasMore()

    fun hasMore() = this.position < this.input.length

    fun copy() = Scanner(input, position, knownConstants)

    fun addKnownConstants(constants: Iterable<String>) {
        knownConstants += constants
    }

    fun addPossibleNextTerminal(terminal: ITerminalSymbol) {
        expectedNextTerminals.add(terminal)
    }

    private fun matchInput(symbol: ITerminalSymbol): IToken? =
        when (symbol) {
            is ConstantSymbol -> {
                if (input.startsWith(symbol.text, position)) {
                    Token(symbol.text, position, symbol)
                } else {
                    null
                }
            }

            is RegexSymbol -> {
                matchRegex(symbol.regex) { Token(it, position, symbol) }
            }

            EndOfInputSymbol -> {
                if (isAtEnd()) EndOfInputToken else null
            }

            EmptySymbol -> {
                EmptyToken
            }

            else -> {
                throw UnsupportedOperationException("Unknown symbol: $symbol")
            }
        }

    private fun matchRegex(
        regex: Regex?,
        createToken: (String) -> IToken,
    ): IToken? =
        if (regex != null) {
            val match = regex.matchAt(input, position)
            if (match != null) {
                check(match.range.first == position)
                createToken(match.value)
            } else {
                null
            }
        } else {
            val nextConstants = findNextConstants()
            val nextConstantPos = nextConstants.firstOrNull()?.second
            if (nextConstantPos != null && nextConstantPos > position) {
                createToken(input.substring(position, nextConstantPos))
            } else {
                null
            }
        }

    private fun findNextConstants(): List<Pair<String, Int>> =
        knownConstants
            .asSequence()
            .plus(" ")
            .map { it to input.indexOf(it, position) }
            .filter { it.second != -1 }
            .toList()
            .sortedBy { it.second }
}
