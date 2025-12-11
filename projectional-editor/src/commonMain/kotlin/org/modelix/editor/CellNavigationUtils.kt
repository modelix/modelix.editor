package org.modelix.editor

fun Cell.nextCells(): Sequence<Cell> {
    return nextSiblings().flatMap { it.descendantsAndSelf() } + (getParent()?.let { sequenceOf(it) + it.nextCells() } ?: emptySequence())
}

fun Cell.previousCells(): Sequence<Cell> {
    return previousSiblings().flatMap { it.descendantsAndSelf(iterateBackwards = true) } + (getParent()?.let { sequenceOf(it) + it.previousCells() } ?: emptySequence())
}

fun Cell.previousLeafs(includeSelf: Boolean = false): Sequence<Cell> {
    return generateSequence(this) { it.previousLeaf() }.drop(if (includeSelf) 0 else 1)
}

fun Cell.nextLeafs(includeSelf: Boolean = false): Sequence<Cell> {
    return generateSequence(this) { it.nextLeaf() }.drop(if (includeSelf) 0 else 1)
}

fun Cell.previousLeaf(condition: (Cell) -> Boolean): Cell? {
    return previousLeafs(false).find(condition)
}

fun Cell.nextLeaf(condition: (Cell) -> Boolean): Cell? {
    return nextLeafs(false).find(condition)
}

fun Cell.previousLeaf(): Cell? {
    val sibling = previousSibling() ?: return getParent()?.previousLeaf()
    return sibling.lastLeaf()
}

fun Cell.nextLeaf(): Cell? {
    val sibling = nextSibling() ?: return getParent()?.nextLeaf()
    return sibling.firstLeaf()
}

fun Cell.firstLeaf(): Cell {
    val children = this.getChildren()
    return if (children.isEmpty()) this else children.first().firstLeaf()
}

fun Cell.lastLeaf(): Cell {
    val children = this.getChildren()
    return if (children.isEmpty()) this else children.last().lastLeaf()
}

fun Cell.previousSibling(): Cell? {
    return previousSiblings().firstOrNull()
}

fun Cell.nextSibling(): Cell? {
    return nextSiblings().firstOrNull()
}

fun Cell.previousSiblings(): Sequence<Cell> {
    val parent = this.getParent() ?: return emptySequence()
    return parent.getChildren().asReversed().asSequence().dropWhile { it != this }.drop(1)
}

fun Cell.nextSiblings(): Sequence<Cell> {
    val parent = this.getParent() ?: return emptySequence()
    return parent.getChildren().asSequence().dropWhile { it != this }.drop(1)
}

fun Cell.descendants(iterateBackwards: Boolean = false): Sequence<Cell> {
    return getChildren()
        .let { if (iterateBackwards) it.asReversed() else it }
        .asSequence()
        .flatMap { it.descendantsAndSelf(iterateBackwards) }
}

fun Cell.descendantsAndSelf(iterateBackwards: Boolean = false): Sequence<Cell> = sequenceOf(this) + descendants(iterateBackwards)
fun Cell.ancestors(includeSelf: Boolean = false) = generateSequence(if (includeSelf) this else this.getParent()) { it.getParent() }

fun Cell.commonAncestor(other: Cell): Cell = (ancestors(true) - other.ancestors(true).toSet()).last().getParent()!!

fun Cell.isLeaf() = this.getChildren().isEmpty()
fun Cell.isFirstChild() = previousSibling() == null
fun Cell.isLastChild() = nextSibling() == null

fun Cell.leftAlignedHierarchy() = firstLeaf().ancestors(true).takeWhilePrevious { it.isFirstChild() }
fun Cell.rightAlignedHierarchy() = lastLeaf().ancestors(true).takeWhilePrevious { it.isLastChild() }
fun Cell.centerAlignedHierarchy() = leftAlignedHierarchy().toList().intersect(rightAlignedHierarchy().toSet())

/**
 * Takes all the elements that match the predicate and one more.
 */
fun <T> Sequence<T>.takeWhilePrevious(predicate: (previous: T) -> Boolean): Sequence<T> {
    var previous: T? = null
    var isFirst = true
    return takeWhile { current ->
        val matches = if (isFirst) true else predicate(previous as T)
        previous = current
        isFirst = false
        matches
    }
}

fun <T> Sequence<T>.takeUnlessPrevious(predicate: (previous: T) -> Boolean): Sequence<T> = takeWhilePrevious { !predicate(it) }
