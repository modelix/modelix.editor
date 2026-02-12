package org.modelix.parser

import kotlin.test.Test
import kotlin.test.assertTrue
import kotlin.time.measureTime

class StatementsTest {
    @Test fun localVarDeclWithoutInitializer() =
        runTest(
            "int a;",
            """
            Statement+ { LocalVariableDeclarationStatement {
                LocalVariableDeclaration+ { LocalVariableDeclaration {
                    Type+ { IntegerType { ConstantToken(text=int) } }
                    PropertyToken(text=a)
                    optional(constant[=] Expression+) { EmptyToken }
                } }
                ConstantToken(text=;)
            } }
            """.trimIndent()
        )

    @Test fun localVarDeclWithInitializer() =
        runTest(
            "int a = 10 + 20;",
            """
            Statement+ { LocalVariableDeclarationStatement {
                LocalVariableDeclaration+ { LocalVariableDeclaration {
                    Type+ { IntegerType { ConstantToken(text=int) } }
                    PropertyToken(text=a)
                    optional(constant[=] Expression+) {
                        ConstantToken(text==)
                        Expression+ { PlusExpression {
                            Expression+ { IntegerLiteral { PropertyToken(text=10) } }
                            ConstantToken(text=+)
                            Expression+ { IntegerLiteral { PropertyToken(text=20) } }
                        } }
                    }
                } }
                ConstantToken(text=;)
            } }
            """.trimIndent()
        )

    fun runTest(
        input: String,
        expected: String,
    ) {
        val parser = TestGrammar.getParser(TestGrammar.statement)
        val parseTrees = parser.parseForest(input)
        println(measureTime { parser.parse(input) })

        println(parseTrees.joinToString("\n---\n"))
        assertTrue(parseTrees.count() > 0)
        // assertEquals(expected, parseTrees.joinToString("\n---\n"))
    }
}
