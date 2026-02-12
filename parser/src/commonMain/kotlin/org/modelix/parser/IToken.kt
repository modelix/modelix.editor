package org.modelix.parser

sealed interface IToken : IParseTreeNode {
    val text: String
    val symbol: ISymbol?

    fun textLength(): Int = text.length
}

data class Token(
    override val text: String,
    val startPos: Int,
    override val symbol: ISymbol?,
) : IToken

data class WhitespaceToken(
    override val text: String,
    val startPos: Int,
) : IToken {
    override val symbol: ISymbol? get() = null
}

data object EmptyToken : IToken {
    override val symbol: ISymbol? get() = null
    override val text: String = ""

    override fun textLength(): Int = 0
}

data object EndOfInputToken : IToken {
    override val symbol: ISymbol? get() = null
    override val text: String = ""

    override fun textLength(): Int = 0
}

sealed interface IParseTreeNode {
    fun childNodes(): Sequence<IParseTreeNode> = emptySequence()

    fun descendants(): Sequence<IParseTreeNode> = childNodes().flatMap { it.descendantsAndSelf() }

    fun descendantsAndSelf(): Sequence<IParseTreeNode> = sequenceOf(this) + descendants()
}

sealed interface INonTerminalToken : IParseTreeNode {
    fun getNonTerminalSymbol(): INonTerminalSymbol
}

class ParseTreeNode(
    val rule: ProductionRule,
    val children: List<IParseTreeNode>,
) : IParseTreeNode,
    INonTerminalToken {
    override fun toString(): String {
        if (children.size > 1) {
            return "${rule.head} {\n${children.joinToString("\n").prependIndent()}\n}"
        } else {
            return "${rule.head} { ${children.joinToString(" ")} }"
        }
    }

    override fun getNonTerminalSymbol(): INonTerminalSymbol = rule.head

    override fun childNodes(): Sequence<IParseTreeNode> = children.asSequence()
}

class AmbiguousNode(
    val symbol: INonTerminalSymbol,
    val trees: List<INonTerminalToken>,
) : IParseTreeNode,
    INonTerminalToken {
    override fun toString(): String = "ambiguous {\n${trees.joinToString("\n---\n").prependIndent()}\n}"

    override fun getNonTerminalSymbol(): INonTerminalSymbol = symbol

    fun flatten(): AmbiguousNode {
        val newChildren =
            trees.flatMap {
                if (it is AmbiguousNode && it.symbol == symbol) it.trees else listOf(it)
            }
        return if (newChildren.size == trees.size) this else AmbiguousNode(symbol, newChildren)
    }

    override fun childNodes(): Sequence<IParseTreeNode> = trees.asSequence()

    companion object {
        fun create(trees: List<INonTerminalToken>): INonTerminalToken? =
            when (trees.size) {
                0 -> {
                    null
                }

                1 -> {
                    trees.first()
                }

                else -> {
                    val symbol = trees.first().getNonTerminalSymbol()
                    check(trees.asSequence().drop(1).all { it.getNonTerminalSymbol() == symbol }) {
                        "Cannot merge trees for different non-terminal symbols: $trees"
                    }
                    AmbiguousNode(symbol, trees).flatten()
                }
            }
    }
}

class SPPF(
    val roots: List<IParseTreeNode>,
) {
    private var sequence = 0
    private val nonSharedNodes = LinkedHashSet<IParseTreeNode>()
    private val sharedNodes = LinkedHashSet<IParseTreeNode>()
    private val nodeIds = LinkedHashMap<IParseTreeNode, Int>()

    init {
        roots.forEach { load(it) }
    }

    private fun id(node: IParseTreeNode) = nodeIds.getOrPut(node) { sequence++ }

    private fun load(node: IParseTreeNode) {
        if (sharedNodes.contains(node)) return
        if (node is INonTerminalToken && nonSharedNodes.contains(node)) {
            nonSharedNodes.remove(node)
            sharedNodes.add(node)
            return
        } else {
            nonSharedNodes.add(node)
        }
        when (node) {
            is AmbiguousNode -> {
                node.trees.forEach { load(it) }
            }

            is ParseTreeNode -> {
                node.children.forEach { load(it) }
            }

            else -> {}
        }
    }

    override fun toString(): String =
        (sharedNodes + nonSharedNodes).joinToString("\n") {
            toString(it)
        }

    private fun toString(node: IParseTreeNode): String =
        when (node) {
            is AmbiguousNode -> {
                "n${id(node)} [label=\"${node.symbol}\", shape=diamond]\n" + node.trees.joinToString("\n") { "n${id(node)} -> n${id(it)}" }
            }

            is ParseTreeNode -> {
                "n${id(node)} [label=\"${node.rule.head}\", shape=box]\n" +
                    node.children.joinToString("\n") { "n${id(node)} -> n${id(it)}" }
            }

            else -> {
                "n${id(node)} [label=\"${node}\", shape=oval]"
            }
        }
}
