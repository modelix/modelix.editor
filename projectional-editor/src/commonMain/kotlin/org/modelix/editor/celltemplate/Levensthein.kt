package org.modelix.editor.celltemplate

import kotlin.math.max
import kotlin.math.min

object Levenshtein {
    fun distance(
        source: CharSequence,
        target: CharSequence,
        deleteCost: Int,
        insertCost: Int,
        replaceCost: Int,
        swapCost: Int,
    ): Int {
        if (2 * swapCost < insertCost + deleteCost) {
            throw IllegalArgumentException("Unsupported cost assignment")
        } else if (source.isEmpty()) {
            return target.length * insertCost
        } else if (target.isEmpty()) {
            return source.length * deleteCost
        } else {
            val table: Array<IntArray> = Array(source.length) { IntArray(target.length) }
            val sourceIndexByCharacter: MutableMap<Char, Int> = HashMap()
            if (source[0] != target[0]) {
                table[0][0] = min(replaceCost, deleteCost + insertCost)
            }

            sourceIndexByCharacter[source[0]] = 0
            var maxSourceLetterMatchIndex: Int
            var j: Int
            var matchDistance: Int
            var i = 1
            while (i < source.length) {
                maxSourceLetterMatchIndex = table[i - 1][0] + deleteCost
                j = (i + 1) * deleteCost + insertCost
                matchDistance = i * deleteCost + (if (source[i] == target[0]) 0 else replaceCost)
                table[i][0] = min(min(maxSourceLetterMatchIndex, j), matchDistance)
                ++i
            }

            i = 1
            while (i < target.length) {
                maxSourceLetterMatchIndex = (i + 1) * insertCost + deleteCost
                j = table[0][i - 1] + insertCost
                matchDistance = i * insertCost + (if (source[0] == target[i]) 0 else replaceCost)
                table[0][i] = min(min(maxSourceLetterMatchIndex, j), matchDistance)
                ++i
            }

            i = 1
            while (i < source.length) {
                maxSourceLetterMatchIndex = if (source[i] == target[0]) 0 else -1

                j = 1
                while (j < target.length) {
                    val candidateSwapIndex = sourceIndexByCharacter[target[j]]
                    val jSwap = maxSourceLetterMatchIndex
                    val deleteDistance = table[i - 1][j] + deleteCost
                    val insertDistance = table[i][j - 1] + insertCost
                    var matchDistance = table[i - 1][j - 1]
                    if (source[i] != target[j]) {
                        matchDistance += replaceCost
                    } else {
                        maxSourceLetterMatchIndex = j
                    }

                    var swapDistance: Int
                    if (candidateSwapIndex != null && jSwap != -1) {
                        val iSwap = candidateSwapIndex
                        var preSwapCost =
                            if (iSwap == 0 && jSwap == 0) {
                                0
                            } else {
                                table[max(0, iSwap - 1)][max(0, jSwap - 1)]
                            }

                        swapDistance =
                            preSwapCost + (i - iSwap - 1) * deleteCost + (j - jSwap - 1) * insertCost + swapCost
                    } else {
                        swapDistance = Int.MAX_VALUE
                    }

                    table[i][j] = min(min(min(deleteDistance, insertDistance), matchDistance), swapDistance)
                    ++j
                }

                sourceIndexByCharacter[source[i]] = i
                ++i
            }

            return table[source.length - 1][target.length - 1]
        }
    }
}
