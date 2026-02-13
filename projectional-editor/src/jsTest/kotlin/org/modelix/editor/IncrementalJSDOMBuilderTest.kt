package org.modelix.editor

import kotlinx.html.TagConsumer
import org.modelix.editor.text.frontend.FrontendCellTree
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.frontend.layout
import org.modelix.editor.text.frontend.text
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import kotlin.random.Random
import kotlin.test.Ignore
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class IncrementalJSDOMBuilderTest {
    init {
        if (js("typeof document === 'undefined'")) {
            // there is no document on nodejs
            js("require('jsdom-global')()")
        }
    }

    @Test
    fun test() {
        val generatedHtmlMap = GeneratedHtmlMap()

        val tree = FrontendCellTree()
        lateinit var textCellToChange: IMutableCellTree.MutableCell
        val rootCell =
            tree.createCell().apply {
                cell("a")
                addNewChild().apply {
                    cell("b").also { textCellToChange = it }
                    addNewChild().also {
                        it.setProperty(CommonCellProperties.onNewLine, true)
                    }
                    cell("c")
                }
                cell("d")
            }

        var domBuilder: TagConsumer<IVirtualDom.HTMLElement> = IncrementalVirtualDOMBuilder(JSDom(), null, generatedHtmlMap)
        val dom = rootCell.layout.toHtml(domBuilder)
        val elements1: List<IVirtualDom.Node> = listOf(dom) + dom.descendants()
        println("cell: " + rootCell)
        println("html: " + dom.unwrap().outerHTML)

        val newText = "X"
        textCellToChange.text = newText
        domBuilder = IncrementalVirtualDOMBuilder(JSDom(), dom, generatedHtmlMap)
        val dom2 = rootCell.layout.toHtml(domBuilder)
        val elements2: List<IVirtualDom.Node> = listOf(dom2) + dom2.descendants()
        println("cell: " + rootCell)
        println("html: " + dom2.unwrap().outerHTML)
        assertEquals(elements1.size, elements2.size)

        val expectedChanges =
            elements1.indices.joinToString("") {
                val element2 = elements2[it]
                if (element2 is IVirtualDom.Text && element2.textContent == newText) "C" else "-"
            }
        println("expected changes: " + expectedChanges)
        assertTrue(expectedChanges.contains("C"))
        val actualChanges = elements1.indices.joinToString("") { if (elements1[it] == elements2[it]) "-" else "C" }
        println("actual changes: " + actualChanges)
        assertEquals(expectedChanges, actualChanges)
    }

    @Test fun runRandomTest_4_3() = runRandomTests(567454, 4, 3)

    @Test fun runRandomTest_1_1() = runRandomTests(567454, 1, 1)

    @Test fun runRandomTest_1_2() = runRandomTests(567454, 1, 2)

    @Test fun runRandomTest_1_3() = runRandomTests(567454, 1, 3)

    @Test fun runRandomTest_2_1() = runRandomTests(567454, 2, 1)

    @Test fun runRandomTest_2_2() = runRandomTests(567454, 2, 2)

    @Test fun runRandomTest_2_3() = runRandomTests(567454, 2, 3)

    @Test fun runRandomTest_3_1() = runRandomTests(567454, 3, 1)

    @Test fun runRandomTest_3_2() = runRandomTests(567454, 3, 2)

    @Test fun runRandomTest_3_3() = runRandomTests(567454, 3, 3)

    @Test fun runRandomTest_5_4_567462() = runRandomTests(567462, 5, 4)

    @Ignore
    @Test fun runRandomTest_5_4() {
        for (seed in 1..10) {
            println("test ${567454 + seed}, 5, 4")
            runRandomTests(567454 + seed, 5, 4)
        }
    }

    fun runRandomTests(
        seed: Int,
        cellsPerLevel: Int,
        levels: Int,
    ) {
        val rand = Random(seed)
        runRandomTest(rand, cellsPerLevel, levels) { cell ->
            val randomLeafCell =
                cell
                    .descendants()
                    .filter { it.getVisibleText().isNotEmpty() }
                    .shuffled(rand)
                    .firstOrNull()
                    ?: cell
                        .descendants()
                        .filter { it.getChildren().isEmpty() }
                        .shuffled(rand)
                        .first()
            println("replace $randomLeafCell")
            (randomLeafCell as IMutableCellTree.MutableCell).text = "replacement"
            randomLeafCell
        }
        runRandomTest(rand, cellsPerLevel, levels) { cell ->
            val randomCell =
                cell.descendants().shuffled(rand).firstOrNull()
                    ?: cell
                        .descendants()
                        .filter { it.getChildren().isEmpty() }
                        .shuffled(rand)
                        .first()
            randomCell as MutableCell
            println("insertBefore $randomCell")
            randomCell.getParent()!!.addNewChild(randomCell.index()).also {
                it.text = "insertion"
            }
        }
    }

    fun runRandomTest(
        rand: Random,
        cellsPerLevel: Int,
        levels: Int,
        modify: (MutableCell) -> MutableCell,
    ) {
        val generatedHtmlMap = GeneratedHtmlMap()
        val tree = FrontendCellTree()
        val cell = EditorTestUtils.buildRandomCells(rand, cellsPerLevel, levels, tree)
        val dom = cell.layout.toHtml(IncrementalVirtualDOMBuilder(JSDom(), null, generatedHtmlMap))
        val html = dom.unwrap().outerHTML
        println("old html: " + html)
        println("old cells: $cell")
        val newCell = modify(cell)
        println("new cells: $newCell")
        val dom2incremental = newCell.layout.toHtml(IncrementalVirtualDOMBuilder(JSDom(), dom, generatedHtmlMap))
        val html2incremental = dom2incremental.unwrap().outerHTML

        newCell.descendantsAndSelf().forEach { (it as FrontendCellTree.FrontendCellImpl).clearCachedLayout() }
        val dom2nonIncremental = newCell.layout.toHtml(IncrementalVirtualDOMBuilder(JSDom(), null, generatedHtmlMap))
        val html2nonIncremental = dom2nonIncremental.unwrap().outerHTML
        assertEquals(html2nonIncremental, html2incremental)
    }

    private fun IMutableCellTree.cell(
        text: String,
        body: IMutableCellTree.MutableCell.() -> Unit,
    ): IMutableCellTree.MutableCell =
        this
            .createCell()
            .also {
                it.setProperty(TextCellProperties.text, text)
            }.also(body)

    private fun IMutableCellTree.MutableCell.cell(
        text: String,
        body: IMutableCellTree.MutableCell.() -> Unit = {
        },
    ): IMutableCellTree.MutableCell =
        this
            .addNewChild()
            .also {
                it.type = ECellType.TEXT
                it.text = text
            }.also(body)
}
