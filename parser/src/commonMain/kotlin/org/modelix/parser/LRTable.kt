package org.modelix.parser

import kotlin.math.min

class LRTable {
    val states: MutableList<LRState> = ArrayList()
    var knownConstants: Set<String> = emptySet()

    fun getDistanceToAccept(
        action: LRAction,
        pathLength: Int = 0,
    ): Int =
        when (action) {
            AcceptAction -> 0
            is GotoAction -> 1 + getDistanceToAccept(states[action.nextState], pathLength + 1)
            is ReduceAction -> -action.rule.symbols.size
            is CompletionAction -> -action.item.cursor
            is ShiftAction -> 1 + getDistanceToAccept(states[action.nextState], pathLength + 1)
            is SkipAction -> error("Not expected to appear in the parse table")
        }

    fun getDistanceToAccept(
        state: LRState,
        pathLength: Int,
    ): Int {
        if (state.distanceToAccept == -1) {
            if (pathLength > 100) return Int.MAX_VALUE / 2
            state.distanceToAccept = Int.MAX_VALUE / 2 // also avoid endless recursion
            state.visitActions {
                state.distanceToAccept = min(state.distanceToAccept, getDistanceToAccept(it, pathLength + 1))
            }
//            state.distanceToAccept = state.getAllActions().minOf { getDistanceToAccept(it, pathLength + 1) }
        }
        return state.distanceToAccept
    }

    fun load(closureTable: LRClosureTable) {
        knownConstants = closureTable.grammar.knownConstants
        for (kernel in closureTable.kernels) {
            val state = LRState()
            state.kernel = kernel
            states.add(state)

            for (key in kernel.keys) {
                val nextStateIndex = kernel.gotos[key]!!
                val action =
                    if (key is INonTerminalSymbol) {
                        GotoAction(nextStateIndex)
                    } else {
                        ShiftAction(nextStateIndex, key as ITerminalSymbol)
                    }
                state.addAction(key, action)
            }

            for (item in kernel.closure.values) {
                if (item.rule.isGoal()) {
                    if (item.isReadyForReduce()) {
                        state.addAction(EndOfInputSymbol, AcceptAction)
                    }
                    state.addAction(ConstantSymbol.CARET, AcceptAction)
                } else {
                    if (item.isReadyForReduce()) {
                        for (lookahead in closureTable.grammar.getPossibleFollowingTerminals(item.rule.head)) {
                            state.addAction(lookahead, ReduceAction(item.rule))
                        }
                    }

                    if (item.cursor > 0) {
                        state.addAction(ConstantSymbol.CARET, CompletionAction(item))
                    }
                }
            }
        }
    }
}

private val emptyActionsArray: Array<out LRAction> = emptyArray()

class LRState {
    var kernel: LRClosureTable.Kernel? = null
    var distanceToAccept: Int = -1

    private var actions: Map<ISymbol, Array<out LRAction>>? = null

    fun addAction(
        symbol: ISymbol,
        action: LRAction,
    ) {
        val oldMap = actions
        if (oldMap == null) {
            actions = SingleEntryMap(symbol, arrayOf(action))
        } else {
            val newMap: MutableMap<ISymbol, Array<out LRAction>>
            if (oldMap is SingleEntryMap) {
                newMap = HashMap(6)
                newMap[oldMap.key] = oldMap.value
            } else {
                newMap = oldMap as MutableMap<ISymbol, Array<out LRAction>>
            }
            val newActions: Array<LRAction> = (getActions(symbol) as Array<LRAction>) + action
            newMap[symbol] = newActions
            actions = newMap
        }
    }

    fun getActions(symbol: ISymbol): Array<out LRAction> = actions?.get(symbol) ?: emptyActionsArray

    /**
     * Better performance than building a sequence.
     */
    fun visitActions(visitor: (LRAction) -> Unit) {
        if (actions == null) return
        if (actions is SingleEntryMap) visitActionsInArray((actions as SingleEntryMap).value, visitor)
    }

    private fun visitActionsInArray(
        value: Any,
        visitor: (LRAction) -> Unit,
    ) {
        when (value) {
            null -> {}

            is LRAction -> {
                visitor(value)
            }

            else -> {
                for (action in (value as Array<LRAction>)) {
                    visitor(action)
                }
            }
        }
    }

    fun getSymbols(): Sequence<ISymbol> = actions?.keys?.asSequence() ?: emptySequence()

    fun getSymbolsAndActions(): Sequence<Pair<ISymbol, Array<out LRAction>>> =
        actions?.asSequence()?.map {
            it.key to it.value
        } ?: emptySequence()
}

sealed class LRAction

data class ShiftAction(
    val nextState: Int,
    val symbol: ITerminalSymbol,
) : LRAction()

data class ReduceAction(
    val rule: ProductionRule,
) : LRAction()

data class CompletionAction(
    val item: RuleItem,
) : LRAction()

data class GotoAction(
    val nextState: Int,
) : LRAction()

data object SkipAction : LRAction()

data object AcceptAction : LRAction()

private class SingleEntryMap<K, V>(
    override val key: K,
    override val value: V,
) : Map<K, V>,
    Map.Entry<K, V> {
    override val entries: Set<Map.Entry<K, V>>
        get() = SingleEntrySet(this)
    override val keys: Set<K>
        get() = SingleEntrySet(key)
    override val size: Int
        get() = 1
    override val values: Collection<V>
        get() = listOf(value)

    override fun containsKey(key: K): Boolean = this.key == key

    override fun containsValue(value: V): Boolean = throw UnsupportedOperationException()

    override fun get(key: K): V? = if (key == this.key) value else null

    override fun isEmpty(): Boolean = false
}

private class SingleEntrySet<E>(
    val value: E,
) : Set<E> {
    override fun contains(element: E): Boolean = element == value

    override val size: Int
        get() = 1

    override fun containsAll(elements: Collection<E>): Boolean {
        TODO("Not yet implemented")
    }

    override fun isEmpty(): Boolean = false

    override fun iterator(): Iterator<E> = listOf(value).iterator()
}
