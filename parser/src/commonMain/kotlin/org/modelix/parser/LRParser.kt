package org.modelix.parser

interface IParser {
    fun parse(
        input: String,
        complete: Boolean,
    ): IParseTreeNode

    fun parse(input: String): IParseTreeNode = parse(input, complete = false)

    fun parseCompleting(input: String): IParseTreeNode = parse(input, complete = true)

    fun tryParse(
        input: String,
        complete: Boolean,
    ): IParseTreeNode?

    fun parseForest(input: String): Sequence<IParseTreeNode> = parseForest(input, false)

    fun parseForest(
        input: String,
        complete: Boolean,
    ): Sequence<IParseTreeNode>
}

class LRParser(
    val table: LRTable,
    private val defaultDisambiguator: IDisambiguator,
) : IParser {
    var stepLimit = 10_000
    private var disambiguator = defaultDisambiguator

    override fun parse(
        input: String,
        complete: Boolean,
    ): IParseTreeNode = tryParse(input, complete) ?: error("Invalid input: $input\nCurrent stack: ???")

    override fun tryParse(
        input: String,
        complete: Boolean,
    ): IParseTreeNode? = doParse(input, complete).firstOrNull()

    override fun parseForest(
        input: String,
        complete: Boolean,
    ): Sequence<IParseTreeNode> = doParse(input, complete).asSequence()

    private fun doParse(
        input: String,
        complete: Boolean,
    ): List<IParseTreeNode> {
        val acceptedForks = ArrayList<Fork>()

        fun List<Fork>.filterAccepted() =
            filter {
                if (it.accepted) {
                    acceptedForks.add(it)
                }
                !it.accepted
            }

        val scanner = Scanner(input)
        scanner.addKnownConstants(table.knownConstants)
        val initialStack: IGSStack<StackElement> = EmptyGSS<StackElement>().push(StackElement(0))
        var step: Int = 2
        var forks: List<Fork> = listOf(Fork(initialStack, null))

        // scan first token
        forks.forEach { it.loadNextTerminals(scanner) }
        var lookaheadTokens = scanner.next().toList()
        forks = forks.flatMap { it.forksForNextActions(lookaheadTokens) }

        fun List<Fork>.applyActions() = flatMap { it.applyAction(lookaheadTokens) }.filterAccepted().merge()

        while (step++ < stepLimit) {
            // run reductions
            while (step++ < stepLimit) {
                val readyToShift = forks.filter { it.readyToShift() }
                val notReadyToShift = forks.filter { !it.readyToShift() }
                if (notReadyToShift.isEmpty()) break
                forks = readyToShift +
                    notReadyToShift
                        .applyActions()
                        .flatMap { it.forksForNextActions(lookaheadTokens) }
            }
            if (forks.isEmpty()) break
            forks = forks.merge()

            // shift all forks
            check(forks.all { it.readyToShift() })
            forks = forks.applyActions()
            if (forks.isEmpty()) break

            // scan next token
            forks.forEach { it.loadNextTerminals(scanner) }
            lookaheadTokens = scanner.next().toList()
            forks = forks.flatMap { it.forksForNextActions(lookaheadTokens) }
        }
        return acceptedForks.flatMap { it.output!! }
    }

    private fun List<Fork>.merge() = mergeForks(this)

    private fun mergeForks(forks: List<Fork>): List<Fork> {
        if (forks.size < 2) return forks
        val mergedForks =
            forks.filter { !it.stack.peek().isState() } +
                forks
                    .filter { it.stack.peek().isState() }
                    .groupBy { it.stack.peek().getState() to it.actionToApply }
                    .map { group ->
                        if (group.value.size == 1) return@map group.value.first()

                        val mergedStack =
                            group.value
                                .map { it.stack }
                                .reduce { acc, it ->
                                    checkNotNull(acc.tryMerge(it)) { "Merge failed" }
                                }

                        Fork(
                            mergedStack,
                            group.key.second,
                        )
                    }
        // if (forks.size != mergedForks.size) println("forks ${forks.size} -> ${mergedForks.size}")
        check(mergedForks.size <= 1000) { "Too many forks" }
        return mergedForks
    }

    private inner class Fork(
        val stack: IGSStack<StackElement>,
        val actionToApply: LRAction?,
    ) {
        var accepted: Boolean = false
        var output: List<IParseTreeNode>? = null

        fun stateIndex(): Int = (stack.peek().takeIf { it.isState() } ?: stack.elementAt(1)).getState()

        fun state() = table.states[stateIndex()]

        fun readyToShift() = actionToApply is ShiftAction

        override fun toString(): String = "$stack || $actionToApply"

        fun forksForNextActions(lookaheadTokens: List<IToken>): List<Fork> {
            check(!accepted) { "Already accepted" }

            if (actionToApply != null) return listOf(this)

            val lastStackElement = stack.peek()
            if (lastStackElement.isNode()) {
                val tokenOnStack = lastStackElement.getToken()
                val actions: Array<out LRAction>? =
                    state().getSymbolsAndActions().firstOrNull { it.first.matches(tokenOnStack) }?.second
                return actions?.map { Fork(stack, it) } ?: emptyList()
            } else {
                val applicableActions =
                    state()
                        .getSymbolsAndActions()
                        .filter {
                            val symbol = it.first
                            symbol == EmptySymbol || lookaheadTokens.any { symbol.matches(it) }
                        }.flatMap { it.second.asSequence() }
                        .toSet()
                // TODO filter out reductions that don't match the actual content on the stack
                return applicableActions.map { Fork(stack, it) }
            }
        }

        fun loadNextTerminals(scanner: Scanner) {
            check(!accepted) { "Already accepted" }
            state().getSymbols().filterIsInstance<ITerminalSymbol>().forEach { scanner.addPossibleNextTerminal(it) }
        }

        fun applyAction(tokensForShift: List<IToken>): List<Fork> {
            check(!accepted) { "Already accepted" }
            return when (val action = actionToApply) {
                null -> {
                    error("No action applicable. Fork should have been discarded.")
                }

                is SkipAction -> {
                    listOf(Fork(stack, null))
                }

                is ShiftAction -> {
                    var newStack = stack
                    val matchingTokens = tokensForShift.filter { action.symbol.matches(it) }
                    val matchingToken =
                        when (matchingTokens.size) {
                            0 -> error("None of the tokens matches ${action.symbol}: $tokensForShift")
                            1 -> matchingTokens.single()
                            else -> error("Multiple of the tokens matches ${action.symbol}: $matchingTokens")
                        }
                    newStack = newStack.pushNode(matchingToken)
                    newStack = newStack.pushState(action.nextState)
                    listOf(Fork(newStack, null))
                }

                is CompletionAction -> {
                    reduceItem(action.item)
                }

                is ReduceAction -> {
                    reduceItem(RuleItem(action.rule, action.rule.symbols.size))
                }

                is GotoAction -> {
                    listOf(Fork(stack.pushState(action.nextState), null))
                }

                AcceptAction -> {
                    output = stack.withoutMerges().map { it.elementAt(it.getSize().first - 2).getToken() }
                    accepted = true
                    listOf(this)
                }
            }
        }

        private fun reduceItem(item: RuleItem): List<Fork> {
            // TODO check if the stack content actually matches the rule symbols
            if (item.rule.isGoal()) error("Should be an AcceptAction")

//                    if (reducesSinceLastShift.contains(rule.head to stack.getSize()) && rule.symbols.size == 1) {
//                        // Endless recursion
//                        return emptyList()
//                    }

            val removeCount = item.cursor * 2

            return stack.pop(removeCount).mapNotNull { popped: Pair<List<StackElement>, IGSStack<StackElement>> ->
                val removedTokens = popped.first.filter { it.isNode() }.map { it.getToken() }

                if (removedTokens.size == 1) {
                    val symbolToReduce: INonTerminalToken? = removedTokens.single() as? ParseTreeNode
                    val wrappers =
                        generateSequence(symbolToReduce) {
                            (it as? ParseTreeNode)?.children?.singleOrNull() as? INonTerminalToken
                        }.map { it.getNonTerminalSymbol() }
                    val isUnnecessaryWrapper = wrappers.contains(item.rule.head)
                    // if, after applying a series of wrappers, we end up with the same non-terminal that we
                    // already had on the stack, it means we could have just taken that one without wrapping it
                    if (isUnnecessaryWrapper) return@mapNotNull null
                }

                val newStack = popped.second.pushNode(ParseTreeNode(item.rule, removedTokens.reversed()))
                Fork(newStack, null)
            }
        }
    }

    private fun IGSStack<StackElement>.pushNode(node: IParseTreeNode): IGSStack<StackElement> {
        check(this.peek().isState()) { "Should be a state: $this" }
        return push(StackElement(node))
    }

    private fun IGSStack<StackElement>.pushState(state: Int): IGSStack<StackElement> {
        check(this.peek().isNode()) { "Should be a node: $this" }
        return push(StackElement(state))
    }

    private data class StackElement private constructor(
        private val node: IParseTreeNode? = null,
        private val state: Int? = null,
    ) : IGSSElement {
        constructor(token: IParseTreeNode) : this(token, null)
        constructor(state: Int) : this(null, state)

        fun isNode() = node != null

        fun isState() = state != null

        fun getToken() = checkNotNull(node) { "Not a token" }

        fun getState() = checkNotNull(state) { "Not a state" }

        override fun toString(): String = if (isNode()) getToken().toString() else "[" + getState().toString() + "]"

        override fun merge(other: IGSSElement): IGSSElement? {
            check(other is StackElement)
            if (this == other) return this
            if (isState() != other.isState()) return null
            if (isState()) return if (getState() == other.getState()) this else null

            val t1 = getToken()
            val t2 = other.getToken()
            if (t1 !is INonTerminalToken) return null
            if (t2 !is INonTerminalToken) return null
            if (t1.getNonTerminalSymbol() != t2.getNonTerminalSymbol()) return null
            return StackElement(AmbiguousNode.create(listOf(t1, t2)))
        }
    }
}

fun Grammar.createParser(disambiguator: IDisambiguator = IDisambiguator.default()): LRParser = LRParser(createParseTable(), disambiguator)

fun Grammar.createParseTable(): LRTable {
    val closureTable = LRClosureTable(grammar = this).also { it.load() }
    return LRTable().also { it.load(closureTable) }
}

inline fun <K, V : Any> Sequence<K>.associateWithNotNull(valueSelector: (K) -> V?): Map<K, V> =
    associateWith {
        valueSelector(it)
    }.filterValues { it != null } as Map<K, V>
