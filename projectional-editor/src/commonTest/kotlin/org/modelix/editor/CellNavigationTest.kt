package org.modelix.editor

import org.modelix.editor.text.frontend.text
import org.modelix.editor.text.shared.celltree.BackendCellTree
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import kotlin.test.Test
import kotlin.test.assertEquals

class CellNavigationTest {
    private val rootCell = BackendCellTree().run {
        cell("root") {
            cell("1") {
                cell("11") {
                    cell("111")
                    cell("112")
                }
                cell("12") {
                    cell("121")
                    cell("122")
                }
            }
            cell("2") {
                cell("21") {
                    cell("211")
                    cell("212")
                }
                cell("22") {
                    cell("221")
                    cell("222")
                }
            }
        }
    }

    @Test
    fun order_of_previousCells() {
        assertEquals(
            listOf(
                "221",
                "22",
                "21",
                "212",
                "211",
                "2",
                "1",
                "12",
                "122",
                "121",
                "11",
                "112",
                "111",
                "root",
            ),
            rootCell.lastLeaf().previousCells().map { it.text }.toList(),
        )
    }

    @Test
    fun order_of_nextCells() {
        assertEquals("111", rootCell.firstLeaf().text)
        assertEquals(
            listOf(
                "112",
                "11",
                "12",
                "121",
                "122",
                "1",
                "2",
                "21",
                "211",
                "212",
                "22",
                "221",
                "222",
                "root",
            ),
            rootCell.firstLeaf().nextCells().map { it.text }.toList(),
        )
    }

    private fun IMutableCellTree.cell(text: String, body: IMutableCellTree.MutableCell.() -> Unit): Cell {
        return this.createCell().also { it.setProperty(TextCellProperties.text, text) }.also(body)
    }

    private fun IMutableCellTree.MutableCell.cell(text: String, body: IMutableCellTree.MutableCell.() -> Unit = {}): Cell {
        return this.addNewChild().also { it.setProperty(TextCellProperties.text, text) }.also(body)
    }
}
