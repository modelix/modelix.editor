import kotlinx.browser.document
import kotlinx.html.dom.create
import kotlinx.html.js.div
import org.modelix.editor.CellTreeState
import org.modelix.editor.kernelf.KernelfAPI
import org.modelix.editor.kernelf.modelJson
import org.w3c.dom.Node
import org.w3c.dom.Text
import org.w3c.dom.asList
import kotlin.test.Test
import kotlin.test.assertEquals

fun Node.descendants(): Sequence<Node> = childNodes.asList().asSequence().flatMap { sequenceOf(it) + it.descendants() }

class IncrementalDomTest {
    init {
        if (js("typeof document === 'undefined'")) {
            // there is no document on nodejs
            js("require('jsdom-global')()")
        }
    }

    @Test
    fun test() {
        // val jsdom = JsDom.JSDOM("<!DOCTYPE html>")

        val model = KernelfAPI.loadModelFromJson(modelJson)
        val testSuites = KernelfAPI.findTestSuites(model)
        val containerElement = document.create.div()
        val cellTreeState = CellTreeState()
        KernelfApiJS.updateNodeAsDom(cellTreeState, testSuites.first().unwrap(), containerElement)
        val elements1 = containerElement.descendants().toList()
        testSuites.first().name = "changed"
        KernelfApiJS.updateNodeAsDom(cellTreeState, testSuites.first().unwrap(), containerElement)
        val elements2 = containerElement.descendants().toList()
        assertEquals(elements1.size, elements2.size)
        val expectedChanges = elements1.indices.joinToString {
            val element2 = elements2[it]
            if (element2 is Text && element2.textContent == "changed") "C" else "-"
        }
        val actualChanges = elements1.indices.joinToString { if (elements1[it] === elements2[it]) "-" else "C" }
        println(actualChanges)
        assertEquals(expectedChanges, actualChanges)
    }
}
