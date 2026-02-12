package org.modelix.parser

import kotlin.math.min

class EmptyGSS<E : IGSSElement> : IGSStack<E> {
    override val containsMerges: Boolean get() = false

    override fun peek(): E = throw NoSuchElementException("Empty stack")

    override fun push(element: E): IGSStack<E> = RegularGSSNode(element, this)

    override fun pop(): Pair<E, List<IGSStack<E>>> = throw NoSuchElementException("Empty stack")

    override fun pop(n: Int): List<Pair<List<E>, IGSStack<E>>> = throw NoSuchElementException("Empty stack")

    override fun elementAt(n: Int): E = throw NoSuchElementException("Empty stack")

    override fun toString(): String = ""

    override fun tryMerge(other: IGSStack<E>): IGSStack<E>? = if (other is EmptyGSS) this else null

    override fun withoutMerges(): List<IGSStack<E>> = listOf(this)

    override fun getSize(): IntRange = 0..0
}

class RegularGSSNode<E : IGSSElement>(
    private val element: E,
    private val previous: IGSStack<E>,
) : IGSStack<E> {
    override val containsMerges: Boolean = previous.containsMerges

    override fun peek(): E = element

    override fun push(element: E): IGSStack<E> = RegularGSSNode(element, this)

    override fun pop(): Pair<E, List<IGSStack<E>>> = element to listOf(previous)

    override fun pop(n: Int): List<Pair<List<E>, IGSStack<E>>> =
        when (n) {
            0 -> {
                listOf(emptyList<E>() to this)
            }

            1 -> {
                listOf(listOf(element) to previous)
            }

            else -> {
                previous.pop(n - 1).map { popped: Pair<List<E>, IGSStack<E>> ->
                    listOf(element) + popped.first to popped.second
                }
            }
        }

    override fun elementAt(n: Int): E = if (n == 0) element else previous.elementAt(n - 1)

    override fun tryMerge(other: IGSStack<E>): IGSStack<E>? {
        return when (other) {
            this -> {
                this
            }

            is RegularGSSNode -> {
                if (element == other.element) {
                    val mergedPrev = other.previous.tryMerge(previous)
                    if (mergedPrev == null) {
                        MergeGSSNode<E>(element, listOf(previous, other.previous))
                    } else {
                        RegularGSSNode(element, mergedPrev)
                    }
                } else if (previous == other.previous) {
                    val mergedEl = (element.merge(other.element) ?: return null) as E
                    RegularGSSNode(mergedEl, previous)
                } else {
                    null
                }
            }

            is MergeGSSNode -> {
                if (element == other.peek()) {
                    MergeGSSNode<E>(element, listOf(previous) + other.pop().second)
                } else {
                    null
                }
            }

            else -> {
                null
            }
        }
    }

    override fun withoutMerges(): List<IGSStack<E>> =
        if (containsMerges) {
            previous.withoutMerges().map {
                RegularGSSNode(element, it)
            }
        } else {
            listOf(this)
        }

    override fun getSize(): IntRange = previous.getSize().let { (it.first + 1)..(it.last + 1) }

    override fun toString(): String = "$previous | $element"
}

class MergeGSSNode<E : IGSSElement>(
    private val element: E,
    private val previous: List<IGSStack<E>>,
) : IGSStack<E> {
    override val containsMerges: Boolean get() = true

    override fun peek(): E = element

    override fun push(element: E): IGSStack<E> = RegularGSSNode(element, this)

    override fun pop(): Pair<E, List<IGSStack<E>>> = element to previous

    override fun pop(n: Int): List<Pair<List<E>, IGSStack<E>>> =
        when (n) {
            0 -> {
                listOf(emptyList<E>() to this)
            }

            1 -> {
                previous.map { listOf(element) to it }
            }

            else -> {
                previous.flatMap { prev ->
                    prev.pop(n - 1).map { popped: Pair<List<E>, IGSStack<E>> ->
                        listOf(element) + popped.first to popped.second
                    }
                }
            }
        }

    override fun elementAt(n: Int): E = if (n == 0) element else error("Stack is merged and has multiple values")

    override fun tryMerge(other: IGSStack<E>): IGSStack<E>? {
        if (other == this) return this
        if (other is MergeGSSNode && element == other.element) return MergeGSSNode<E>(element, previous + other.previous)
        if (other is RegularGSSNode && element == other.peek()) return MergeGSSNode<E>(element, previous + other.pop().second)
        return null
    }

    override fun withoutMerges(): List<IGSStack<E>> = previous.flatMap { it.withoutMerges() }.map { RegularGSSNode(element, it) }

    override fun getSize(): IntRange =
        previous
            .map { it.getSize() }
            .reduce { acc, it -> min(acc.first, it.first)..min(acc.last, it.last) }
            .let { (it.first + 1)..(it.last + 1) }

    override fun toString(): String = "merge/${previous.size} | $element"
}

fun <T : IGSSElement> Iterable<IGSStack<T>>.push(element: T): IGSStack<T> = MergeGSSNode(element, toList())

interface IGSStack<E : IGSSElement> {
    fun push(element: E): IGSStack<E>

    fun pop(): Pair<E, List<IGSStack<E>>>

    fun pop(n: Int): List<Pair<List<E>, IGSStack<E>>>

    fun peek(): E

    fun elementAt(n: Int): E

    fun getSize(): IntRange

    val containsMerges: Boolean

    fun tryMerge(other: IGSStack<E>): IGSStack<E>?

    fun withoutMerges(): List<IGSStack<E>>
}

fun <T : IGSSElement> IGSStack<T>.toLists(): List<List<T>> {
    if (this is EmptyGSS) return listOf(emptyList())
    val popped = pop()
    return popped.second.flatMap { it.toLists() }.map { it + popped.first }
}

interface IGSSElement {
    fun merge(other: IGSSElement): IGSSElement?
}
