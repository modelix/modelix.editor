package org.modelix.editor

import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PrecedenceTest {
    private val plus = Precedence(11)
    private val times = Precedence(12)
    private val assignment = Precedence(1, rightAssociative = true)

    @Test
    fun anOperatorTakesTheWholeOfAnOperatorThatBindsTighter() {
        // `1 * 2` + 3
        assertTrue(plus.takesWhole(times))
        // 1 + `2` * 3
        assertFalse(times.takesWhole(plus))
    }

    @Test
    fun operatorsOfTheSameLevelAreGroupedFromTheLeft() {
        // `1 - 2` - 3
        assertTrue(plus.takesWhole(plus))
    }

    @Test
    fun rightAssociativeOperatorsAreGroupedFromTheRight() {
        // a = `b` = c
        assertFalse(assignment.takesWhole(assignment))
        // x = `1` + 2
        assertFalse(plus.takesWhole(assignment))
    }
}
