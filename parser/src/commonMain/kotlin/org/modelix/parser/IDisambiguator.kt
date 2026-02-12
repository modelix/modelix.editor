package org.modelix.parser

interface IDisambiguator {
    fun chooseActionIndex(actions: List<LRAction>): Int

    fun withLastDisambiguator(newLast: IDisambiguator): IDisambiguator

    companion object {
        fun default() = ChooseFirstDisambiguator() // PreferReduceDisambiguator(ChooseFirstDisambiguator())
    }
}

fun IDisambiguator.chooseActionIndexIfNecessary(actions: List<LRAction>): Int = if (actions.size == 1) 0 else chooseActionIndex(actions)

fun IDisambiguator.chooseAction(actions: List<LRAction>): LRAction =
    if (actions.size == 1) actions[0] else actions[chooseActionIndex(actions)]

class DepthFirstSearchDisambiguator : IDisambiguator {
    private val nextIndices = mutableListOf<Int>()
    private val isDone = mutableListOf<Boolean>()
    private var currentDepth = 0

    override fun chooseActionIndex(actions: List<LRAction>): Int {
        if (currentDepth > nextIndices.lastIndex) {
            nextIndices.add(0)
            isDone.add(false)
        }
        val result = nextIndices[currentDepth]
        isDone[currentDepth] = result >= actions.lastIndex
        currentDepth++
        return result
    }

    fun next(): Boolean {
        if (isDone.isEmpty()) return false
        while (isDone.last()) {
            nextIndices.removeLast()
            isDone.removeLast()
            if (nextIndices.isEmpty()) return false
        }
        nextIndices[nextIndices.lastIndex]++
        currentDepth = 0
        return true
    }

    override fun withLastDisambiguator(newLast: IDisambiguator): IDisambiguator = newLast
}

class BreadthFirstSearchDisambiguator : IDisambiguator {
    private val root = SearchTree()
    private var currentPath = mutableListOf(root)

    override fun chooseActionIndex(actions: List<LRAction>): Int = currentPath.last().chooseActionIndex(actions)

    fun next(): Boolean {
        currentPath.reversed().forEach { it.updateDoneState() }
        currentPath.clear()
        currentPath.add(root)
        return !root.isDone
    }

    override fun withLastDisambiguator(newLast: IDisambiguator): IDisambiguator = newLast

    private inner class SearchTree {
        val subtrees = ArrayList<SearchTree>()
        var isDone: Boolean = false
        var lastIndex = -1
        var nextIndex = 0

        fun chooseActionIndex(actions: List<LRAction>): Int {
            while (subtrees.size < actions.size) subtrees.add(SearchTree())
            for (i in actions.indices.reversed()) {
                if (subtrees.getOrNull(nextIndex)?.isDone == true) {
                    check(i != 0) { "Shouldn't be called when already done" }
                    nextIndex = (nextIndex + 1) % actions.size
                }
            }

            val result = nextIndex
            lastIndex = result
            check(result <= actions.lastIndex) {
                println("aaa")
            }
            nextIndex = (nextIndex + 1) % actions.size

            currentPath.add(subtrees[result])
            return result
        }

        fun updateDoneState() {
            isDone = !subtrees.any { !it.isDone }
        }
    }
}

class ChooseFirstDisambiguator : IDisambiguator {
    override fun chooseActionIndex(actions: List<LRAction>): Int = 0

    override fun withLastDisambiguator(newLast: IDisambiguator): IDisambiguator = newLast
}

class PreferShiftDisambiguator(
    val next: IDisambiguator,
) : IDisambiguator {
    override fun chooseActionIndex(actions: List<LRAction>): Int {
        if (actions.size == 2) {
            if (actions[0] is ShiftAction && actions[1] is ReduceAction) return 0
            if (actions[1] is ShiftAction && actions[0] is ReduceAction) return 1
        }
        return next.chooseActionIndex(actions)
    }

    override fun withLastDisambiguator(newLast: IDisambiguator): IDisambiguator =
        PreferShiftDisambiguator(next.withLastDisambiguator(newLast))
}

class PreferReduceDisambiguator(
    val next: IDisambiguator,
) : IDisambiguator {
    override fun chooseActionIndex(actions: List<LRAction>): Int {
        if (actions.size == 2) {
            if (actions[0] is ShiftAction && actions[1] is ReduceAction) return 1
            if (actions[1] is ShiftAction && actions[0] is ReduceAction) return 0
        }
        return next.chooseActionIndex(actions)
    }

    override fun withLastDisambiguator(newLast: IDisambiguator): IDisambiguator =
        PreferReduceDisambiguator(next.withLastDisambiguator(newLast))
}
