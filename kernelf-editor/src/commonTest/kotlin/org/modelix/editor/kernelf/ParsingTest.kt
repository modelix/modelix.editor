package org.modelix.editor.kernelf

import org.iets3.core.expr.base.L_org_iets3_core_expr_base
import org.modelix.editor.EditorEngine
import org.modelix.editor.celltemplate.ParseContext
import org.modelix.editor.token.UnclassifiedToken
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertTrue

class ParsingTest {

    lateinit var engine: EditorEngine

    @BeforeTest
    fun beforeTest() {
        KernelfLanguages.registerAll()

        engine = EditorEngine(IncrementalEngine())
        KernelfEditor.register(engine)
    }

    @AfterTest
    fun afterTest() {
        KernelfLanguages.languages.forEach { it.unregister() }
    }

    @Test fun test() = runExpressionTest("1+2")
    @Test fun test2() = runExpressionTest("1 + 2")
    @Test fun test3() = runExpressionTest("11 + 22")
    @Test fun test4() = runExpressionTest("11 + 22 * 33")
    @Test fun test5() = runExpressionTest("(11 + 22) * 33")
    @Test fun test6() = runExpressionTest("(11+22)*33")
    @Test fun test7() = runExpressionTest("( 11+22 )*33")
    @Test fun test8() = runExpressionTest("(11+22)*-33")
    @Test fun test9() = runExpressionTest("(11 + 22) * -33")
    @Test fun test10() = runExpressionTest("(11 + 22) *- 33")
    @Test fun test11() = runExpressionTest("123.456 + true")
    @Test fun test12() = runExpressionTest(""""abc" + "def"""")
    @Test fun test13() = runExpressionTest(""""abc\" + \"def"""")
    @Test fun test14() = runExpressionTest(""""abc" + " """")
    @Test fun test15() = runExpressionTest(""""abc" + """"")
    @Test fun test16() = runExpressionTest("""isSome(10)""")
    @Test fun test17() = runExpressionTest("""if 10 > 20 then 1.5""")
    @Test fun test18() = runExpressionTest("""if 10 > 20 then 1.5 else 900""")

    private fun runExpressionTest(inputString: String) {
        val input = UnclassifiedToken(inputString)
        val outputConcept = L_org_iets3_core_expr_base.Expression.untyped()
        val context = ParseContext(engine)
        fun computeResult() = engine.parse(input, outputConcept, context).toList()

        val result = computeResult()
        // println(measureTime { computeResult() })
        result.forEach(::println)
        assertTrue(result.isNotEmpty())
    }
}
