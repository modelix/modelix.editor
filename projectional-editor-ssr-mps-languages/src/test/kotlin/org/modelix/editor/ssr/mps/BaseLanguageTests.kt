package org.modelix.editor.ssr.mps

import com.intellij.openapi.application.ApplicationManager
import org.modelix.checks.CheckMessage
import org.modelix.checks.CheckSeverity
import org.modelix.editor.CaretSelection
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ContextActionsAspect
import org.modelix.editor.ContextActionsMenu
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.IContextActionsProvider
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KnownKeys
import org.modelix.editor.Modifiers
import org.modelix.editor.NodeCellReference
import org.modelix.editor.NodeContextActions
import org.modelix.editor.ReferencedNodeCellReference
import org.modelix.editor.descendantsAndSelf
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.layoutable
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.shared.ActionIcon
import org.modelix.editor.text.shared.CompletionMenuEntryData
import org.modelix.incremental.IncrementalEngine
import org.modelix.model.api.ConceptReference
import org.modelix.model.api.IChildLinkReference
import org.modelix.model.api.INode
import org.modelix.model.api.IPropertyReference
import org.modelix.model.api.IReferenceLinkReference
import org.modelix.model.api.IWritableNode
import org.modelix.model.api.getDescendants
import org.modelix.model.mpsadapters.MPSWritableNode
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import org.modelix.mps.editor.common.IncrementalModelChecker

/**
 * Test editor for MPS baseLanguage ClassConcept
 */
@Suppress("ktlint:standard:wrapping", "ktlint:standard:trailing-comma-on-call-site", "ktlint:standard:function-naming")
class BaseLanguageTests : BaseLanguageTestBase() {
    fun `test initial editor`() =
        kotlinx.coroutines.test.runTest {
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {

              }
            }
        """)
        }

    fun `test inserting new line into class`() =
        kotlinx.coroutines.test.runTest {
            val lastMember = readAction { classNode.getAllChildren().last { it.getContainmentLink().getSimpleName() == "member" } }
            placeCaretAtEnd(lastMember.asLegacyNode())
            pressEnter()
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {

              }
              
            }
        """)
        }

    fun `test creating LocalVariableDeclarationStatement by typing a type`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            val actions = getCodeCompletionEntries("int")
            assertEquals(
                listOf(
                    "int <name>; | LocalVariableDeclarationStatement[LocalVariableDeclaration[IntegerType]]",
                    "int.class; | ExpressionStatement[PrimitiveClassExpression[IntegerType]]",
                    "int[].class; | ExpressionStatement[ArrayClassExpression[ArrayType[IntegerType]]]",
                ),
                actions.map { it.getCompletionPattern() + " | " + it.getDescription() },
            )
            typeText("int ")
            editor.flush()
            // Nothing is left to type in `int`, so typing goes on with the name.
            assertCaretPosition("|<no name>")
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {
                int <no name>;
              }
            }
        """)
        }

    fun `test naming LocalVariableDeclaration`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            typeText("abc")
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {
                int abc;
              }
            }
        """)
        }

    fun `test showing initializer of LocalVariableDeclaration using side transformation`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            typeText("abc")
            typeText("=")
            assertEditorText("""
            public class Class1 {
              public void method1() {
                int abc = <no initializer>;
              }
            }
        """)
            assertCaretPosition("|<no initializer>")
        }

    fun `test showing initializer of LocalVariableDeclaration using TAB`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            typeText("abc")
            pressKey(KnownKeys.Tab)
            assertEditorText("""
            public class Class1 {
              public void method1() {
                int abc = <no initializer>;
              }
            }
        """)
            assertCaretPosition("|<no initializer>")
        }

    fun `test previous optional is hidden when TABing to next`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            typeText("abc")
            pressKey(KnownKeys.Enter)
            typeText("int ")
            typeText("def")
            placeCaretIntoCellWithText("abc")

            assertEditorText("""
            public class Class1 {
              public void method1() {
                int abc;
                int def;
              }
            }
        """)

            pressKey(KnownKeys.Tab)
            assertEditorText("""
            public class Class1 {
              public void method1() {
                int abc = <no initializer>;
                int def;
              }
            }
        """)
            assertCaretPosition("|<no initializer>")

            pressKey(KnownKeys.Tab)
            assertCaretPosition("|def")
            pressKey(KnownKeys.Tab)
            assertEditorText("""
            public class Class1 {
              public void method1() {
                int abc;
                int def = <no initializer>;
              }
            }
        """)
            assertCaretPosition("|<no initializer>")
        }

    fun `test adding initializer to LocalVariableDeclaration`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            typeText("abc")
            typeText("=")
            typeText("10")
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {
                int abc = 10;
              }
            }
        """)
        }

    fun `test adding second parameter to InstanceMethodDeclaration by pressing ENTER`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodNode, "parameter")
            typeText("int")
            typeText("p1")
            pressKey(KnownKeys.Enter)
            assertEditorText("""
            public class Class1 {
              public void method1(int p1, <choose parameter>) {

              }
            }
        """)
            typeText("int")
            typeText("p2")
            assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1, int p2) {

              }
            }
        """)
        }

    fun `test adding second parameter to InstanceMethodDeclaration by typing separator after last`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodNode, "parameter")
            typeText("int")
            typeText("p1")
            typeText(",")
            typeText("int")
            typeText("p2")
            assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1, int p2) {

              }
            }
        """)
            assertCaretPosition("p2|")
        }

    fun `test adding second parameter to InstanceMethodDeclaration by typing separator after first`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodNode, "parameter")
            typeText("int")
            typeText("p1")
            typeText(",")
            typeText("int")
            typeText("p2")
            placeCaretIntoCellWithText("p1")
            typeText(",")
            typeText("int")
            typeText("p3")
            assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1, int p3, int p2) {

              }
            }
        """)
            assertCaretPosition("p3|")
        }

/*    fun `test adding second parameter to InstanceMethodDeclaration by typing separator before last`() {
        placeCaretIntoPlaceholderOf(methodNode, "parameter")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        typeText(",")
        typeText("string")
        pressKey(KnownKeys.Tab)
        typeText("p2")
        placeCaretIntoCellWithText("string", 0)
        typeText(",")
        typeText("long")
        pressKey(KnownKeys.Tab)
        typeText("p3")
        assertFinalEditorText("""
            class Class1 {
              public void method1(int p1, long p3, int p2) {

              }
            }
        """)
    }*/

    fun `test deleting parameter using BACKSPACE`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodNode, "parameter")
            typeText("int")
            typeText("p1")
            assertEditorText("""
            public class Class1 {
              public void method1(int p1) {

              }
            }
        """)
            assertCaretPosition("p1|")
            pressKey(KnownKeys.ArrowLeft)
            assertCaretPosition("p|1")
            pressKey(KnownKeys.ArrowLeft)
            assertCaretPosition("|p1")
            pressKey(KnownKeys.Backspace)
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {

              }
            }
        """)
            assertCaretPosition("|")
        }

    fun `test deleting parameter using DELETE`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodNode, "parameter")
            typeText("int")
            typeText("p1")
            assertEditorText("""
            public class Class1 {
              public void method1(int p1) {

              }
            }
        """)
            pressKey(KnownKeys.Delete)
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {

              }
            }
        """)
            assertCaretPosition("|")
        }

    fun `test deleting placeholder`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodNode, "parameter")
            typeText("int")
            typeText("p1")
            pressKey(KnownKeys.Enter)
            assertEditorText("""
            public class Class1 {
              public void method1(int p1, <choose parameter>) {

              }
            }
        """)
            pressKey(KnownKeys.Backspace)
            assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1) {

              }
            }
        """)
            assertCaretPosition("p1|")
        }

    fun `test typing plus expression`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            assertEditorText("""
                public class Class1 {
                  public void method1() {
                    int <no name>;
                  }
                }
            """)
            assertCaretPosition("|<no name>")
            typeText("abc")
            assertEditorText("""
                public class Class1 {
                  public void method1() {
                    int abc;
                  }
                }
            """)
            typeText("=")
            assertEditorText("""
                public class Class1 {
                  public void method1() {
                    int abc = <no initializer>;
                  }
                }
            """)
            typeText("10")
            assertEditorText("""
                public class Class1 {
                  public void method1() {
                    int abc = 10;
                  }
                }
            """)
            typeText("+")
            typeText("25")
            assertEditorText("""
                public class Class1 {
                  public void method1() {
                    int abc = 10 + 25;
                  }
                }
            """)
            assertFinalEditorText("""
                public class Class1 {
                  public void method1() {
                    int abc = 10 + 25;
                  }
                }
            """)
        }

    private fun errorMessages(): List<CheckMessage> =
        readAction {
            classNode
                .asLegacyNode()
                .getDescendants(true)
                .flatMap { MPSModelChecker.getMessages(incrementalEngine, it) }
                .filter { it.severity == CheckSeverity.ERROR }
                .toList()
        }

    fun `test model checker reports typesystem error and updates on model changes`() =
        kotlinx.coroutines.test.runTest {
            // MPS rules compare nodes by reference identity (e.g. `it != classifier` in
            // check_DuplicateClassifierNames_NonTypesystemRule), so the wrappers around the checked nodes must be
            // canonical instances and navigation via the model must not leak unwrapped nodes.
            // Otherwise false positives are reported here.
            assertEquals(emptyList<CheckMessage>(), errorMessages())

            // `return 10;` inside the void method is a typesystem error
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("return")
            typeText("10")
            assertEditorText("""
            public class Class1 {
              public void method1() {
                return 10;
              }
            }
        """)

            val newErrors = errorMessages()
            newErrors.forEach { println("reported: ${it.severity}: ${it.message}") }
            assertNotEmpty(newErrors)
            assertTrue(
                "Unexpected error messages: $newErrors",
                newErrors.none { it.message.contains("failed:") },
            )

            // deleting the return statement should also remove the error message
            pressKey(KnownKeys.Delete)
            assertEditorText("""
            public class Class1 {
              public void method1() {
                return <no expression>;
              }
            }
        """)
            placeCaretIntoCellWithText("return")
            pressKey(KnownKeys.Delete)
            assertEditorText("""
            public class Class1 {
              public void method1() {

              }
            }
        """)
            assertEquals(emptyList<CheckMessage>(), errorMessages())
        }

    fun `test model check messages are shown in the editor after the check finished in the background`() =
        kotlinx.coroutines.test.runTest {
            assertEquals(emptyList<String>(), awaitErrorMessagesInEditor(present = false))

            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("return")
            typeText("10")
            assertNotEmpty(awaitErrorMessagesInEditor(present = true))

            pressKey(KnownKeys.Delete)
            placeCaretIntoCellWithText("return")
            pressKey(KnownKeys.Delete)
            assertEditorText("""
            public class Class1 {
              public void method1() {

              }
            }
        """)
            assertEquals(emptyList<String>(), awaitErrorMessagesInEditor(present = false))
        }

    fun `test a cancelled model check is executed again after retrying it`() {
        val engine = IncrementalEngine()
        try {
            val checker = IncrementalModelChecker(engine)
            val root = classNode.asLegacyNode()
            assertNull(readAction { checker.runCancellable({ true }) { checkNotNull(checker.getMessagesOfRoot(root)) } })
            // Without retrying, the cancelled checks would still be cached as failed.
            assertNull(readAction { checker.runCancellable({ false }) { checkNotNull(checker.getMessagesOfRoot(root)) } })

            checker.retryCancelledChecks()
            assertNotNull(readAction { checker.runCancellable({ false }) { checkNotNull(checker.getMessagesOfRoot(root)) } })
        } finally {
            engine.dispose()
        }
    }

    /**
     * The model checker publishes its messages asynchronously, so they are only shown eventually.
     */
    private suspend fun awaitErrorMessagesInEditor(present: Boolean): List<String> {
        val deadline = System.currentTimeMillis() + 30_000
        while (true) {
            editor.flush()
            val messages =
                editor
                    .getRootCell()
                    .descendantsAndSelf()
                    .mapNotNull { it.getProperty(CommonCellProperties.errorMessage) }
                    .toList()
            if (messages.isNotEmpty() == present || System.currentTimeMillis() > deadline) return messages
            // Not delay(), because runTest skips it in virtual time.
            Thread.sleep(100)
        }
    }

    /**
     * MPS holds an enumeration value as `<memberId>/<name>` and its editor shows the name, converting in
     * `PropertyAccessor` rather than in the model - so that persistence and synchronisation keep seeing the stored
     * form. `TrimOperation.trimKind` is the one enumeration-typed property in baseLanguage, and this is the whole
     * round trip through the real MPS conversion: `SDataType.fromString` to the value and `getPresentation` to the
     * text on the way out, `fromPresentation` and `SDataType.toString` on the way back.
     */
    fun `test an enumeration property is shown by name and stored by id`() =
        kotlinx.coroutines.test.runTest {
            val trimOperation =
                writeAction {
                    val statement =
                        methodBodyNode.addNewChild(
                            IChildLinkReference.fromName("statement"),
                            -1,
                            ConceptReference(BL + "1068580123155")
                        )
                    val dotExpression =
                        statement.addNewChild(
                            IChildLinkReference.fromName("expression"),
                            -1,
                            ConceptReference(BL + "1197027756228")
                        )
                    dotExpression
                        .addNewChild(
                            IChildLinkReference.fromName("operand"),
                            -1,
                            ConceptReference(BL + "1070475926800")
                        ).setPropertyValue(IPropertyReference.fromName("value"), "abc")
                    dotExpression.addNewChild(
                        IChildLinkReference.fromName("operation"),
                        -1,
                        ConceptReference(BL + "1225271546410")
                    )
                }
            assertEditorText("""
            public class Class1 {
              public void method1() {
                "abc".trim(<no trimKind>);
              }
            }
        """)

            placeCaretIntoCellWithText("<no trimKind>")
            typeText("leading")

            // The editor shows the member's name. assertFinalEditorText resets the editor state first, so this is
            // what the conversion makes of the stored value, not the text that was typed.
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {
                "abc".trim(leading);
              }
            }
        """)

            // The model holds the form MPS persists, which is not the form that was typed or shown.
            val stored = readAction { trimOperation.getPropertyValue(TRIM_KIND) }
            assertNotNull("trimKind was not written", stored)
            assertTrue("Expected a '<memberId>/<name>' value, was '" + stored + "'", stored!!.contains("/"))
            assertEquals("leading", stored.substringAfter("/"))
        }

    /**
     * A reference cell that says nothing about how to write its target writes what MPS itself writes there: the
     * presentation of the target node. That is `IReferentPresentationProvider.DEFAULT_PRESENTATION`, the same value
     * MPS's own `ref. presentation` cell shows - the name wherever a node has one, but also a concept's declared
     * presentation, an `ISmartReferent`'s own text, and `<no name>[Concept]` for a target that has neither.
     *
     * `ClassifierType` is written as a bare `ReferenceCell` in the derived notation, so the `Class1` below is
     * entirely the default: the notation names no `render target:` expression at all.
     */
    fun `test a reference without a render target is written as the presentation of its target`() =
        kotlinx.coroutines.test.runTest {
            writeAction {
                val statement =
                    methodBodyNode.addNewChild(
                        IChildLinkReference.fromName("statement"),
                        -1,
                        ConceptReference(BL + "1068581242864")
                    )
                val declaration =
                    statement.addNewChild(
                        IChildLinkReference.fromName("localVariableDeclaration"),
                        -1,
                        ConceptReference(BL + "1068581242863")
                    )
                declaration.setPropertyValue(IPropertyReference.fromName("name"), "c")
                declaration
                    .addNewChild(
                        IChildLinkReference.fromName("type"),
                        -1,
                        ConceptReference(BL + "1107535904670")
                    ).setReferenceTarget(IReferenceLinkReference.fromName("classifier"), classNode)
            }

            assertEditorText("""
            public class Class1 {
              public void method1() {
                Class1 c;
              }
            }
        """)
        }

    /**
     * The presentation of a target is asked for on the tracked wrapper of the node, not the node itself: MPS's
     * `getPresentation` behavior, which reads the name the way MPS code does - honouring a property getter in the
     * constraints, as an optionally named concept has. A target whose name is not stored used to be written as the
     * `toString()` of the modelix node (`MPSWritableNode(node=...)`), and naming it later has to update the cell,
     * which it only does if the reads the behavior makes are dependency tracked.
     */
    fun `test a reference to an unnamed target is written as its presentation and follows its name`() =
        kotlinx.coroutines.test.runTest {
            lateinit var declaration: IWritableNode
            lateinit var variableReference: IWritableNode
            writeAction {
                declaration =
                    methodBodyNode
                        .addNewChild(
                            IChildLinkReference.fromName("statement"),
                            -1,
                            ConceptReference(BL + "1068581242864")
                        ).addNewChild(
                            IChildLinkReference.fromName("localVariableDeclaration"),
                            -1,
                            ConceptReference(BL + "1068581242863")
                        )
                variableReference =
                    methodBodyNode
                        .addNewChild(
                            IChildLinkReference.fromName("statement"),
                            -1,
                            ConceptReference(BL + "1068580123155")
                        ).addNewChild(
                            IChildLinkReference.fromName("expression"),
                            -1,
                            ConceptReference(BL + "1068498886296")
                        )
                variableReference.setReferenceTarget(IReferenceLinkReference.fromName("variableDeclaration"), declaration)
            }
            editor.flush()
            // What MPS writes for an unnamed node: the alias of LocalVariableDeclaration is `<type> <var>`.
            assertEquals("<no name>[<type> <var>]", referenceCellText(variableReference, "variableDeclaration"))

            writeAction { declaration.setPropertyValue(IPropertyReference.fromName("name"), "x") }
            editor.flush()
            assertEquals("x", referenceCellText(variableReference, "variableDeclaration"))
        }

    /**
     * The text of the cell that shows [node]'s reference in [linkName].
     */
    private fun referenceCellText(
        node: IWritableNode,
        linkName: String,
    ): String? {
        val link = readAction { checkNotNull(node.tryGetConcept()).getAllReferenceLinks().first { it.getSimpleName() == linkName } }
        return editor.resolveCell(ReferencedNodeCellReference(node.getNodeReference(), link.toReference())).firstOrNull()?.getVisibleText()
    }

    /**
     * MPS writes a reference to a nested class relative to where it is referenced from: inside `Class1`, the nested
     * `Inner` is written `Inner`, while from anywhere else it is `Class1.Inner`. `Classifier.getPresentation` is the
     * one referent presentation in baseLanguage that does anything with its context, so this is what proves the
     * notation hands the referencing node to it instead of a null - with a null it reads `Class1.Inner`.
     */
    fun `test a nested class is written relative to where it is referenced`() =
        kotlinx.coroutines.test.runTest {
            val classifierType =
                writeAction {
                    val inner =
                        classNode.addNewChild(
                            IChildLinkReference.fromName("member"),
                            -1,
                            ConceptReference(BL + "1068390468198")
                        )
                    inner.setPropertyValue(IPropertyReference.fromName("name"), "Inner")
                    val statement =
                        methodBodyNode.addNewChild(
                            IChildLinkReference.fromName("statement"),
                            -1,
                            ConceptReference(BL + "1068581242864")
                        )
                    val declaration =
                        statement.addNewChild(
                            IChildLinkReference.fromName("localVariableDeclaration"),
                            -1,
                            ConceptReference(BL + "1068581242863")
                        )
                    declaration.setPropertyValue(IPropertyReference.fromName("name"), "x")
                    declaration
                        .addNewChild(
                            IChildLinkReference.fromName("type"),
                            -1,
                            ConceptReference(BL + "1107535904670")
                        ).also { it.setReferenceTarget(IReferenceLinkReference.fromName("classifier"), inner) }
                }
            editor.flush()

            assertEquals("Inner", referenceCellText(classifierType, "classifier"))
        }

    fun `test node attribute wraps the node it is attached to`() =
        kotlinx.coroutines.test.runTest {
            writeAction {
                methodNode
                    .addNewChild(SMODEL_ATTRIBUTE, -1, REVIEW_MIGRATION)
                    .setPropertyValue(IPropertyReference.fromName("reasonShort"), "check")
            }
            assertFinalEditorText("""
            public class Class1 {
              @Review(check)
              public void method1() {

              }
            }
        """)
        }

    fun `test typing the notation of a node attribute in front of a node adds it`() =
        kotlinx.coroutines.test.runTest {
            // The method's `public`, not the class's: both start the cells of several nodes, and the attribute goes
            // to the outermost one, the method.
            val methodPublic =
                editor
                    .resolveCell(NodeCellReference(methodNode.getNodeReference()))
                    .single()
                    .descendantsAndSelf()
                    .first { it.getVisibleText() == "public" }
            editor.doChangeSelection(CaretSelection(methodPublic.layoutable()!!, 0))
            // Typed key by key, as in the browser: the first key opens the completion menu of the left transform.
            typeText("@Review")
            editor.flush()
            assertEquals(
                listOf("ReviewMigration"),
                readAction {
                    methodNode.getAllChildren().filter { it.getContainmentLink().getSimpleName() == "smodelAttribute" }.map {
                        it
                            .getConceptReference()
                            .getUID()
                    }
                }.map { if (it == REVIEW_MIGRATION.getUID()) "ReviewMigration" else it },
            )
            assertFinalEditorText("""
            public class Class1 {
              @Review
              public void method1() {

              }
            }
        """)
        }

    fun `test the context actions menu adds a node attribute to the selected node`() =
        kotlinx.coroutines.test.runTest {
            placeCaretIntoCellWithText("method1", 0)
            editor.processKeyEvent(
                JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, null, KnownKeys.Enter, KnownKeys.Enter.name, Modifiers.ALT),
            )
            editor.flush()
            typeText("review")
            pressEnter()
            editor.flush()
            assertFinalEditorText("""
            public class Class1 {
              @Review
              public void method1() {

              }
            }
        """)
        }

    private suspend fun openContextActions(cellText: String) {
        placeCaretIntoCellWithText(cellText, 0)
        editor.processKeyEvent(
            JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, null, KnownKeys.Enter, KnownKeys.Enter.name, Modifiers.ALT),
        )
        editor.flush()
    }

    private fun contextActions(): List<CompletionMenuEntryData> =
        assertInstanceOf(editor.getActionMenu(), ContextActionsMenu::class.java).getVisibleEntries()

    fun `test the context actions menu offers the intentions of the MPS languages`() =
        kotlinx.coroutines.test.runTest {
            openContextActions("method1")
            val entries = contextActions()

            val makeFinal = entries.single { it.matchingText == "Make 'method1' Final" }
            assertEquals(ActionIcon.INTENTION, makeFinal.icon)
            // The intentions of baseLanguage have no section, so they are listed first, without a heading.
            assertNull(makeFinal.group)
            val firstAttributeAction = entries.indexOfFirst { it.group == NodeContextActions.NODE_ATTRIBUTES_GROUP }
            assertTrue(entries.toString(), firstAttributeAction > entries.indexOf(makeFinal))
            assertTrue(
                entries.toString(),
                entries.drop(firstAttributeAction).all { it.group == NodeContextActions.NODE_ATTRIBUTES_GROUP },
            )
            assertTrue(entries.toString(), entries.drop(firstAttributeAction).any { it.matchingText.contains("Review") })
        }

    fun `test the context actions are collected on the UI thread where MPS editors can be created`() =
        kotlinx.coroutines.test.runTest {
            // MPS 2024.1 only allows creating an editor component on the UI thread. This platform doesn't check it.
            val threads = mutableListOf<Boolean>()
            val provider =
                object : IContextActionsProvider {
                    override fun getContextActions(
                        node: INode,
                        parameters: CodeCompletionParameters,
                    ): List<IActionOrProvider> {
                        threads.add(ApplicationManager.getApplication().isDispatchThread)
                        return emptyList()
                    }
                }
            ContextActionsAspect.providers.add(provider)
            try {
                openContextActions("method1")
            } finally {
                ContextActionsAspect.providers.remove(provider)
            }

            assertEquals(listOf(true), threads)
            assertTrue(contextActions().toString(), contextActions().any { it.matchingText == "Make 'method1' Final" })
        }

    fun `test a context action executes an MPS intention`() =
        kotlinx.coroutines.test.runTest {
            openContextActions("method1")
            typeText("final")
            pressEnter()
            editor.flush()

            assertNull(editor.getActionMenu())
            assertEquals("true", readAction { methodNode.getPropertyValue(IS_FINAL) })
        }

    fun `test the context actions menu offers the quick fixes of the checker messages`() =
        kotlinx.coroutines.test.runTest {
            // The initializer of an int variable can't be a boolean, which MPS can fix by adding a cast.
            placeCaretIntoPlaceholderOf(methodBodyNode, "statement")
            typeText("int ")
            typeText("abc")
            typeText("=")
            typeText("true")
            assertNotEmpty(awaitErrorMessagesInEditor(present = true))

            openContextActions("true")
            // The quick fixes of an error are error intentions in MPS, which have the red bulb.
            val quickFixes = contextActions().filter { it.icon == ActionIcon.ERROR_INTENTION }.map { it.matchingText }
            assertEquals(listOf("Cast the initializer to int", "Change type of abc to boolean"), quickFixes)

            typeText("Cast the initializer")
            pressEnter()
            editor.flush()

            assertNull(editor.getActionMenu())
            // The quick fix moves the initializer into the cast. It must be the MPS node, not the wrapper the checker
            // reported the error for.
            readAction {
                val variable =
                    checkNotNull(
                        methodBodyNode.asLegacyNode().getDescendants(false).firstOrNull {
                            it.concept?.getShortName() ==
                                "LocalVariableDeclaration"
                        }
                    )
                val cast = checkNotNull(variable.toMPS()).getChildren().single { it.concept.name == "CastExpression" }
                assertTrue(cast.getChildren().none { it is ModelixNodeAsMPSNode })
            }
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {
                int abc = (int) true;
              }
            }
        """)
        }

    fun `test the section of an intention is taken from its description like the menu of MPS-extensions does`() {
        assertEquals("Refactoring" to "Extract Method", MPSIntentions.splitSection("Refactoring: Extract Method"))
        assertEquals(null to "Make 'method1' Final", MPSIntentions.splitSection("Make 'method1' Final"))
        assertEquals(null to "Without section", MPSIntentions.splitSection(": Without section"))
    }

    fun `test deleting the text of a node attribute removes it but keeps the node`() =
        kotlinx.coroutines.test.runTest {
            writeAction { methodNode.addNewChild(SMODEL_ATTRIBUTE, -1, REVIEW_MIGRATION) }
            editor.flush()
            placeCaretIntoCellWithText("@Review", 0)
            pressKey(KnownKeys.Backspace)
            assertFinalEditorText("""
            public class Class1 {
              public void method1() {

              }
            }
        """)
        }

    companion object {
        /** `jetbrains.mps.baseLanguage`, as modelix spells a concept reference: `mps:<languageId>/<conceptId>`. */
        private const val BL = "mps:f3061a53-9226-4cc5-a443-f952ceaf5816/"
        private val SMODEL_ATTRIBUTE = IChildLinkReference.fromName("smodelAttribute")
        private val REVIEW_MIGRATION = ConceptReference("mps:ceab5195-25ea-4f22-9b92-103b95ca8c0c/8703179436979359238")
        private val TRIM_KIND = IPropertyReference.fromName("trimKind")
        private val IS_FINAL = IPropertyReference.fromName("isFinal")
    }
}
