package kernelf

import org.modelix.editor.kernelf.KernelfAPI
import java.io.File
import kotlin.test.Test

class EditorToText {
    @Test
    fun toText() {
        val jsonFile = File("models/test.in.expr.os.strings@tests.json")
        val model = KernelfAPI.loadModelFromJson(jsonFile.readText())
        val testSuites = KernelfAPI.findTestSuites(model)
        val modelAsText = KernelfAPI.renderTypedNodeAsHtmlText(testSuites.first())
        println(modelAsText)
    }
}
