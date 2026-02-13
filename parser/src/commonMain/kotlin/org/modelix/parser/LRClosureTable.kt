package org.modelix.parser

class LRClosureTable(
    val grammar: Grammar,
) {
    val kernels = KernelsList()

    fun load() {
        kernels.newKernel(mutableSetOf(RuleItem(grammar.getGoalRule(), 0)))

        var i = 0
        while (i < kernels.size()) {
            val kernel = kernels.getByIndex(i)
            updateClosure(kernel)
            addGotos(kernel)
            i++
        }
    }

    private fun updateClosure(kernel: Kernel) {
        var oldSize: Int = -1

        while (kernel.closure.size > oldSize) {
            oldSize = kernel.closure.size

            kernel.closure.values
                .asSequence()
                .map {
                    Pair(
                        it.nextSymbol() as? INonTerminalSymbol,
                        it.nextNextSymbol(),
                    )
                }.filter { it.first != null }
                .groupBy { it.first }
                .forEach { group ->
                    val rules = grammar.getPossibleFirstRules(group.key!!)
                    for (rule in rules) {
                        val positionInRule = PositionInRule(0, rule)
                        val existing = kernel.closure[positionInRule]
                        kernel.closure[positionInRule] =
                            if (existing == null) {
                                RuleItem(positionInRule)
                            } else {
                                RuleItem(existing.positionInRule)
                            }
                    }
                }
        }
    }

    private fun addGotos(kernel: Kernel) {
        val newKernels = LinkedHashMap<ISymbol, Set<RuleItem>>()

        for (item in kernel.closure.values) {
            if (item.isReadyForReduce()) continue
            val newItem = item.forward() ?: continue
            val symbolAfterDot = item.nextSymbol()!!
            kernel.keys.add(symbolAfterDot)
            newKernels[symbolAfterDot] = (newKernels[symbolAfterDot]?.asSequence() ?: emptySequence()).plus(newItem).toSet()
        }

        for (key in kernel.keys) {
            val newItems = newKernels[key]!!
            var targetKernel = kernels.getByItems(newItems)
            if (targetKernel == null) {
                val newKernel = kernels.newKernel(newItems)
                targetKernel = newKernel
            }
            kernel.gotos[key] = targetKernel.index
        }
    }

    inner class KernelsList : Iterable<Kernel> {
        private val kernelsList = ArrayList<Kernel>()
        private val kernelsMap: MutableMap<Set<RuleItem>, Kernel> = HashMap()

        override fun iterator(): Iterator<Kernel> = kernelsList.iterator()

        fun newKernel(items: Set<RuleItem>): Kernel {
            val kernel = Kernel(kernelsList.size, items)
            kernelsList.add(kernel)
            kernelsMap[items] = kernel
            return kernel
        }

        fun size() = kernelsList.size

        fun getByIndex(index: Int) = kernelsList[index]

        fun getByItems(items: Set<RuleItem>) = kernelsMap[items]
    }

    class Kernel(
        val index: Int,
        var items: Set<RuleItem>,
    ) {
        var closure: MutableMap<PositionInRule, RuleItem> = items.associateBy { it.positionInRule }.toMutableMap()
        val gotos: MutableMap<ISymbol, Int> = HashMap()
        val keys: MutableSet<ISymbol> = HashSet()
    }
}

fun <T> List<T>.iterateGrowingList(): Iterator<T> = GrowingListIterator<T>(this)

class GrowingListIterator<E>(
    private val list: List<E>,
) : Iterator<E> {
    private var i = 0

    override fun hasNext(): Boolean = i < list.size

    override fun next(): E = list[i++]
}
