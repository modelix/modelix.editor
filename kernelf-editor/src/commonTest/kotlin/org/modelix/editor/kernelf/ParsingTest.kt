package org.modelix.editor.kernelf

import org.iets3.core.expr.base.L_org_iets3_core_expr_base
import org.modelix.editor.EditorEngine
import org.modelix.editor.celltemplate.ParserForEditor
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.parser.IParseTreeNode
import kotlin.test.Ignore
import kotlin.test.Test
import kotlin.test.assertTrue
import kotlin.time.measureTime

class ParsingTest {
    @Test fun test() = runParsingTest("1+2")

    @Test fun test2() = runParsingTest("1 + 2")

    @Test fun test3() = runParsingTest("11 + 22")

    @Test fun test4() = runParsingTest("11 + 22 * 33")

    @Test fun test5() = runParsingTest("(11 + 22) * 33")

    @Test fun test6() = runParsingTest("(11+22)*33")

    @Test fun test7() = runParsingTest("( 11+22 )*33")

    @Test fun test8() = runParsingTest("(11+22)*-33")

    @Test fun test9() = runParsingTest("(11 + 22) * -33")

    @Test fun test10() = runParsingTest("(11 + 22) *- 33")

    @Test fun test11() = runParsingTest("123.456 + true")

    @Test fun string4() = runParsingTest(""""abc" + "def"""")

    @Test fun string3() = runParsingTest(""""abc\" + \"def"""")

    @Ignore
    @Test fun string1() = runParsingTest(""""abc" + " """")

    @Test fun string2() = runParsingTest(""""abc" + """"")

    @Test fun test16() = runParsingTest("""isSome(10)""")

    @Test fun if1() = runParsingTest("""if true then 15""")

    @Test fun if2() = runParsingTest("""if 10 > 20 then 15""")

    @Test fun if3() = runParsingTest("""if 10 > 20 then 15 else 900""")

    @Test fun if4() = runParsingTest("""if 10 > 20 then 15 + 20 + 25 else 900 * 800""")

    @Test fun list3() = runParsingTest("""list(10, 20, 30)""")

    @Test fun list1() = runParsingTest("""list(10)""")

    @Test fun listWithType3() = runParsingTest("""list<number>(10, 20, 30)""")

    @Test fun list2() = runParsingTest("""list(10, 20)""")

    @Test fun tuple2() = runParsingTest("""[10, 20]""")

    @Test fun tuple3() = runParsingTest("""[10, 20, 30]""")

    @Test fun test25() = runParsingTest("""val abc: opt<number> = none + 10""")

    @Test fun test26() = runParsingTest("""val abc: (number, string => number) = 10""")

    @Test fun completion1() = runCompletionTest("""1 + ᚹ""")

    @Test fun completion2() = runCompletionTest("""if ᚹ""")

    @Test fun completion3() = runCompletionTest("""list(10,ᚹ""")

    @Test fun completion4() = runCompletionTest("""val abc:ᚹ""")

    @Test fun completion5() = runCompletionTest("""if 10 >ᚹ""")

    @Test fun completion6() = runCompletionTest("""if {ᚹ""")

    @Test fun completion7() = runCompletionTest("""list(ᚹ*10)""")

    @Ignore
    @Test fun completion8a() = runCompletionTest("""ᚹ*10""")

    @Ignore
    @Test fun completion8b() = runCompletionTest("""ᚹ * 10""")

    @Test fun completion9() = runCompletionTest("""10 + ᚹ * 20""")

    @Test fun completion10() = runCompletionTest("""10+ᚹ*20""")

    @Test fun completion11() = runCompletionTest("""(1 ᚹ""")

    @Test fun completion12() = runCompletionTest("""(1 * ᚹ""")

    private fun runCompletionTest(inputString: String) = runTest(inputString, true)

    private fun runParsingTest(inputString: String) = runTest(inputString, false)

    private fun runTest(
        inputString: String,
        complete: Boolean = false,
    ) {
        KernelfLanguages.registerAll()

        val engine = EditorEngine(IncrementalEngine())
        KernelfEditor.register(engine)

        val startConcept = L_org_iets3_core_expr_base.Expression.untyped()
        val parser = ParserForEditor(engine).getParser(startConcept, forCodeCompletion = complete)

        KernelfLanguages.languages.forEach { it.unregister() }

        val parseTrees: List<IParseTreeNode>
        val time =
            measureTime {
                parseTrees = parser.parseForest(inputString, complete).toList()
            }
        // repeat(100) { parser.parseForest(inputString, complete).toList() }
        println(time)
        assertTrue(parseTrees.isNotEmpty())
        println(parseTrees.joinToString("\n---\n"))
    }
}
