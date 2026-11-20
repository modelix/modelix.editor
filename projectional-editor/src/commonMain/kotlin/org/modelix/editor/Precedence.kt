package org.modelix.editor

/**
 * How tightly a notation binds what is written next to it: `*` binds tighter than `+`.
 *
 * It decides which node an operator wraps that is typed behind (or in front of) a node that is itself the operand of
 * other operators. Typing `+ 3` behind the `2` of `1 * 2` wraps all of `1 * 2`, because `*` binds tighter, while
 * typing `* 3` behind the `2` of `1 + 2` wraps only the `2`. That is the tree that the text means, so the editor
 * builds what it shows.
 *
 * A higher [level] binds tighter. Operators of the same level are grouped from the left - `1 - 2 - 3` is
 * `(1 - 2) - 3` - unless they are [rightAssociative], like the assignments in `a = b = c`.
 *
 * A notation without a precedence doesn't take part. An operator without one wraps the innermost node it can, and
 * one with a precedence doesn't wrap a node whose notation has none.
 */
data class Precedence(
    val level: Int,
    val rightAssociative: Boolean = false,
) {
    /**
     * Whether an operator with this precedence typed next to an operand of [operandsParent] takes [operandsParent] as
     * its operand, instead of the operand of [operandsParent]. That's the case if [operandsParent] binds tighter.
     */
    fun takesWhole(operandsParent: Precedence): Boolean =
        operandsParent.level > level || (operandsParent.level == level && !rightAssociative)
}
