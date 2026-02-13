package org.modelix.editor

import org.modelix.editor.text.shared.celltree.IMutableCellTree
import kotlin.random.Random

object EditorTestUtils {
    val noSpace = Any()
    val newLine = Any()
    val indentChildren = Any()

    fun buildCells(
        template: Any,
        tree: IMutableCellTree,
    ): MutableCell =
        when (template) {
            is IMutableCellTree.MutableCell -> {
                template
            }

            noSpace -> {
                tree.createCell().apply { setProperty(CommonCellProperties.noSpace, true) }
            }

            newLine -> {
                tree.createCell().apply { setProperty(CommonCellProperties.onNewLine, true) }
            }

            is String -> {
                tree.createCell().apply {
                    setProperty(CommonCellProperties.type, ECellType.TEXT)
                    setProperty(TextCellProperties.text, template)
                    setProperty(TextCellProperties.placeholderText, "")
                }
            }

            is List<*> -> {
                tree.createCell().apply {
                    template.forEach { child ->
                        when (child) {
                            indentChildren -> setProperty(CommonCellProperties.indentChildren, true)
                            is ECellLayout -> setProperty(CommonCellProperties.layout, child)
                            else -> buildCells(child!!, tree).moveCell(this, getChildren().size)
                        }
                    }
                }
            }

            else -> {
                throw IllegalArgumentException("Unsupported: $template")
            }
        }

    fun buildRandomCells(
        rand: Random,
        cellsPerLevel: Int,
        levels: Int,
        tree: IMutableCellTree,
    ): MutableCell = buildCells(buildRandomTemplate(rand, cellsPerLevel, levels), tree)

    fun buildRandomTemplate(
        rand: Random,
        cellsPerLevel: Int,
        levels: Int,
    ): Any =
        (1..cellsPerLevel).map {
            when (rand.nextInt(10)) {
                0 -> {
                    noSpace
                }

                1 -> {
                    newLine
                }

                2 -> {
                    indentChildren
                }

                else -> {
                    if (levels == 0) {
                        rand.nextInt(1000, 10000).toString()
                    } else {
                        buildRandomTemplate(rand, cellsPerLevel, levels - 1)
                    }
                }
            }
        }
}
