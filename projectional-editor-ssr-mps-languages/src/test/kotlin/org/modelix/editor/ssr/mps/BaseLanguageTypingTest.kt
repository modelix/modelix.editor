package org.modelix.editor.ssr.mps

import org.modelix.editor.CaretSelection
import org.modelix.editor.KnownKeys
import org.modelix.editor.descendantsAndSelf
import org.modelix.editor.layoutable
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.model.api.INode
import org.modelix.model.api.IPropertyReference
import org.modelix.model.api.getDescendants

/**
 * Typing baseLanguage code the way it's written in a text editor, key by key, and editing it again.
 *
 * None of this is declared in the notations of baseLanguage. All of it is derived from them: the caret goes where
 * typing continues, constants that are already there are typed over, a side transform only applies to text that
 * doesn't belong to the cell anymore, and deleting undoes what typing did.
 */
@Suppress("ktlint:standard:wrapping", "ktlint:standard:function-naming")
class BaseLanguageTypingTest : BaseLanguageTestBase() {
    /**
     * Types [text] into the empty body of `method1` and checks the statements that result.
     */
    private suspend fun typeIntoBody(
        text: String,
        expectedStatements: String,
        final: Boolean = true,
    ) {
        placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
        typeText(text)
        assertBody(expectedStatements, final)
    }

    /**
     * The body of `method1` as it is shown, and with [final] also after resetting the state of the editor, which
     * proves that the model holds it. That hides again the optional parts of the notation that are only shown
     * because the user started to fill them in, like the `= <no initializer>` that typing `=` shows.
     */
    private suspend fun assertBody(
        expectedStatements: String,
        final: Boolean = true,
    ) {
        val indented = expectedStatements.trimIndent().lines().joinToString("\n") { "    $it" }
        val expected = "public class Class1 {\n  public void method1() {\n$indented\n  }\n}"
        if (final) assertFinalEditorText(expected) else assertEditorText(expected)
    }

    private fun selectTextOfCell(text: String) {
        val cell = editor.getRootCell().descendantsAndSelf().first { it.getVisibleText() == text }
        editor.doChangeSelection(CaretSelection(editor, cell.layoutable()!!, 0, text.length))
    }

    // Typing continues where the created nodes still need input.

    fun `test typing a declaration in one go`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int abc", "int abc;")
        }

    fun `test typing a declaration with an initializer`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int abc = 10;", "int abc = 10;")
        }

    fun `test typing a declaration of a class type`() =
        kotlinx.coroutines.test.runTest {
            // ClassifierType and InferredClassifierType write java.lang.String the same way. The general concept wins.
            typeIntoBody("String s", "String s;")
        }

    fun `test a keyword that is the start of another one is not applied too early`() =
        kotlinx.coroutines.test.runTest {
            // `do` is a complete do-while loop, but it may still become a `double`.
            typeIntoBody("double d=1.5", "double d = 1.5;")
        }

    fun `test spaces between tokens are ignored`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("return 1;", "return 1;")
        }

    // A typed character that starts a new token completes what was typed before.

    fun `test typing an assignment to a variable`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x", "int x;")
            pressEnter()
            typeText("x=x+1;")
            assertBody("""
                int x;
                x = x + 1;
            """)
        }

    fun `test typing a reference to a variable`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int a=1;", "int a = 1;")
            pressEnter()
            typeText("int b=a+1;")
            assertBody("""
                int a = 1;
                int b = a + 1;
            """)
        }

    fun `test typing a boolean expression`() =
        kotlinx.coroutines.test.runTest {
            // The `f` of `false` must not be taken as the start of an operator behind it.
            typeIntoBody("boolean b=true&&false||1<=2", "boolean b = true && false || 1 <= 2;")
        }

    fun `test typing operators that share their first character`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("boolean b=1==2", "boolean b = 1 == 2;")
        }

    fun `test typing a parenthesized expression`() =
        kotlinx.coroutines.test.runTest {
            // `(` can start a cast as well, but a type can't start with `1`.
            typeIntoBody("int x=(1+2)*3;", "int x = (1 + 2) * 3;")
        }

    fun `test typing a floating point number`() =
        kotlinx.coroutines.test.runTest {
            // `1.` is still a number, it's not the `.` of a method call on `1`.
            typeIntoBody("double d=1.5;", "double d = 1.5;")
        }

    // Constants that are already there are typed over.

    fun `test typing the brackets of an if statement`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("if(true){int a", """
                if (true) {
                  int a;
                }
            """)
        }

    fun `test typing a while loop`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("while(true){break", """
                while (true) {
                  break;
                }
            """)
        }

    fun `test typing a ternary operator`() =
        kotlinx.coroutines.test.runTest {
            // The `:` is the one of the ternary that is already there, not a new ternary around `1`.
            typeIntoBody("int x=true?1:2;", "int x = true ? 1 : 2;")
        }

    fun `test typing an else branch`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("if(true)", """
                if (true) {

                }
            """)
            placeCaretIntoCellWithText("}", 1)
            typeText("else {int a")
            assertBody("""
                if (true) {

                } else {
                  int a;
                }
            """)
        }

    fun `test typing an else if branch`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("if(true)", """
                if (true) {

                }
            """)
            placeCaretIntoCellWithText("}", 1)
            typeText("else if(false)")
            assertBody("""
                if (true) {

                } else if (false) {

                }
            """)
        }

    // Deleting undoes what typing did.

    fun `test deleting the last digit of a number leaves the empty slot`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1", "int x = 1;", final = false)
            pressKey(KnownKeys.Backspace)
            assertBody("int x = <no initializer>;", final = false)
            assertCaretPosition("|<no initializer>")
            // Typing goes on in the slot.
            typeText("5")
            assertBody("int x = 5;")
        }

    fun `test deleting in an empty initializer removes it`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=", "int x = <no initializer>;", final = false)
            pressKey(KnownKeys.Backspace)
            assertBody("int x;", final = false)
            assertCaretPosition("x|")
        }

    fun `test deleting the name of a variable shows that it is missing`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x", "int x;")
            pressKey(KnownKeys.Backspace)
            assertBody("int <no name>;")
        }

    fun `test deleting in the empty operand of a binary operation removes the operation`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1+2", "int x = 1 + 2;")
            pressKey(KnownKeys.Backspace)
            assertBody("int x = 1 + <no rightExpression>;")
            pressKey(KnownKeys.Backspace)
            assertBody("int x = 1;")
            assertCaretPosition("1|")
        }

    fun `test deleting in the empty operand of a unary operation removes it`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("boolean b=!", "boolean b = !<no expression>;", final = false)
            pressKey(KnownKeys.Backspace)
            assertBody("boolean b = <no initializer>;", final = false)
        }

    fun `test deleting a return statement`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("return 1", "return 1;")
            pressKey(KnownKeys.Backspace)
            pressKey(KnownKeys.Backspace)
            assertBody("")
        }

    // Typing a different operator over the one that is there keeps the operands.

    fun `test replacing an operator by typing over it`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1+2", "int x = 1 + 2;")
            selectTextOfCell("+")
            typeText("*")
            assertBody("int x = 1 * 2;")
        }

    fun `test replacing an operator after deleting it`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1+2", "int x = 1 + 2;")
            placeCaretIntoCellWithText("+", 1)
            pressKey(KnownKeys.Backspace)
            typeText("-")
            assertBody("int x = 1 - 2;")
        }

    // Operators wrap the nodes their precedence takes. The text looks the same either way, so the tree is checked.

    /**
     * The tree of the initializer of the last variable declared in `method1`, like `Plus(Mul(1, 2), 3)`.
     */
    private fun lastInitializer(): String =
        readAction {
            fun describe(node: INode): String {
                val name =
                    node.concept
                        ?.getShortName()
                        ?.removeSuffix("Expression")
                        ?.removeSuffix("Constant") ?: "?"
                val value = node.asWritableNode().getPropertyValue(IPropertyReference.fromName("value"))
                val children = node.allChildren.toList()
                return when {
                    children.isNotEmpty() -> name + children.joinToString(", ", "(", ")") { describe(it) }
                    name == "Boolean" -> value ?: "false"
                    value != null -> value
                    else -> name
                }
            }
            val declaration =
                methodBodyNode
                    .asLegacyNode()
                    .getDescendants(false)
                    .last { it.concept?.getShortName() == "LocalVariableDeclaration" }
            describe(declaration.allChildren.last())
        }

    fun `test an operator that binds looser wraps the operator in front of it`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1*2+3", "int x = 1 * 2 + 3;")
            assertEquals("Plus(Mul(1, 2), 3)", lastInitializer())
        }

    fun `test an operator that binds tighter wraps only the last operand`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1+2*3", "int x = 1 + 2 * 3;")
            assertEquals("Plus(1, Mul(2, 3))", lastInitializer())
        }

    fun `test operators of the same precedence are grouped from the left`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=1-2+3", "int x = 1 - 2 + 3;")
            assertEquals("Plus(Minus(1, 2), 3)", lastInitializer())
        }

    fun `test a chain of precedences`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("boolean b=1+2*3<4||!true&&false", "boolean b = 1 + 2 * 3 < 4 || !true && false;")
            assertEquals("Or(LessThan(Plus(1, Mul(2, 3)), 4), And(Not(true), false))", lastInitializer())
        }

    fun `test the branches of a ternary operator`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=true?1+2:3*4", "int x = true ? 1 + 2 : 3 * 4;")
            assertEquals("TernaryOperator(true, Plus(1, 2), Mul(3, 4))", lastInitializer())
        }

    fun `test parentheses keep what they contain together`() =
        kotlinx.coroutines.test.runTest {
            typeIntoBody("int x=(1+2)*3", "int x = (1 + 2) * 3;")
            assertEquals("Mul(Parenthesized(Plus(1, 2)), 3)", lastInitializer())
        }
}
