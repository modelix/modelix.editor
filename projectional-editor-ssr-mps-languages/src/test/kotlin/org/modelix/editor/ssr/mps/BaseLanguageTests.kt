package org.modelix.editor.ssr.mps

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.runBlocking
import org.modelix.editor.CaretSelection
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICodeCompletionActionProvider
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.KnownKeys
import org.modelix.editor.NodeCellReference
import org.modelix.editor.ancestors
import org.modelix.editor.applyShadowing
import org.modelix.editor.celltemplate.ParserForEditor
import org.modelix.editor.descendantsAndSelf
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getMaxCaretPos
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.lastLeaf
import org.modelix.editor.layoutable
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.incremental.IncrementalEngine
import org.modelix.model.api.INode
import org.modelix.model.mpsadapters.MPSArea
import org.modelix.model.mpsadapters.MPSWritableNode

/**
 * Test editor for MPS baseLanguage ClassConcept
 */
@Suppress("ktlint:standard:wrapping", "ktlint:standard:trailing-comma-on-call-site")
class BaseLanguageTests : TestBase("SimpleProject") {
    lateinit var editor: FrontendEditorComponent
    lateinit var service: TextEditorServiceImpl
    lateinit var mpsIntegration: EditorIntegrationForMPS
    lateinit var editorEngine: EditorEngine
    lateinit var incrementalEngine: IncrementalEngine
    lateinit var classNode: MPSWritableNode
    lateinit var coroutineScope: CoroutineScope

    private fun getBackend() = service.getAllEditorBackends().single()

    override fun setUp() {
        super.setUp()

        readAction {
            val solution = mpsProject.projectModules.first { it.moduleName == "Solution1" }
            val model = solution.models.first()
            classNode = model.rootNodes.first().let { MPSWritableNode(it) }
        }

        incrementalEngine = IncrementalEngine()
        editorEngine = EditorEngine(incrementalEngine)
        mpsIntegration = EditorIntegrationForMPS(editorEngine)
        mpsIntegration.init(mpsProject.repository)
        coroutineScope = CoroutineScope(Dispatchers.Default)
        service = TextEditorServiceImpl(editorEngine, MPSArea(mpsProject.repository).asModel(), coroutineScope)
        runBlocking {
            editor = FrontendEditorComponent(service).also {
                it.openNode(classNode.getNodeReference()).await()
            }
            editor.flush()
        }
    }

    override fun tearDown() {
        editor.dispose()
        mpsIntegration.dispose()
        editorEngine.dispose()
        incrementalEngine.dispose()
        super.tearDown()
    }

    private fun ICellTree.Cell.backend() = service.getEditorBackend(editor.editorId).tree.getCell(getId())

    fun assertFinalEditorText(expected: String) {
        assertEditorText(expected)

        // Reset all editor state to ensure the typed text triggered a model transformation.
        runBlocking { editor.resetState() }
        assertEditorText(expected)
    }

    fun assertCaretPosition(cellTextWithCaret: String) {
        val selection = checkNotNull(editor.getSelection()) { "No active selection" }
        if (selection !is CaretSelection) error("Not a caret selection: $selection")
        assertEquals(cellTextWithCaret, selection.toString())
    }

    fun assertEditorText(expected: String) {
        assertEquals(expected.trimIndent(), editor.getRootCell().layout.toString())
    }

    fun placeCaretAtEnd(node: INode) {
        val cell = editor.resolveCell(NodeCellReference(node.reference)).first()
        val lastLeafCell = cell.lastLeaf()
        editor.changeSelection(CaretSelection(lastLeafCell.layoutable()!!, lastLeafCell.getMaxCaretPos()))
    }

    fun placeCaretIntoCellWithText(text: String, position: Int = -1) {
        val cell = editor.getRootCell().descendantsAndSelf().first { it.getVisibleText() == text }
        editor.changeSelection(CaretSelection(cell.layoutable()!!, if (position == -1) cell.getMaxCaretPos() else position))
    }

    fun pressEnter() = pressKey(KnownKeys.Enter)

    fun pressKey(key: KnownKeys) {
        runBlocking { editor.processKeyEvent(JSKeyboardEvent(JSKeyboardEventType.KEYDOWN, key)) }
    }

    fun typeText(text: CharSequence) {
        for (c in text) {
            runBlocking {
                editor.processKeyEvent(
                    JSKeyboardEvent(
                        eventType = JSKeyboardEventType.KEYDOWN,
                        typedText = c.toString(),
                        knownKey = null,
                        rawKey = c.toString(),
                    ),
                )
            }
        }
    }

    fun getCodeCompletionEntries(pattern: String): List<ICodeCompletionAction> {
        return readAction {
            val selection = editor.getSelection() as CaretSelection
            val actionProviders: Sequence<ICodeCompletionActionProvider> = selection.layoutable.cell.backend().getSubstituteActions()
            val actions = actionProviders.flatMap { it.flattenApplicableActions(CodeCompletionParameters(getBackend(), pattern)) }.toList()
            val matchingActions = actions.filter {
                val matchingText = it.getCompletionPattern()
                matchingText.isNotEmpty() && matchingText.startsWith(pattern)
            }
            val shadowedActions = matchingActions.applyShadowing()
            val sortedActions = shadowedActions.sortedBy { it.getCompletionPattern().lowercase() }
            sortedActions
        }
    }

    fun `test initial editor`() {
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                <no statement>
              }
            }
        """)
    }

    fun `test inserting new line into class`() {
        val lastMember = readAction { classNode.getAllChildren().last { it.getContainmentLink().getSimpleName() == "member" } }
        placeCaretAtEnd(lastMember.asLegacyNode())
        pressEnter()
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                <no statement>
              }
              
            }
        """)
    }

    fun `test creating LocalVariableDeclarationStatement by typing a type`() {
        placeCaretIntoCellWithText("<no statement>")
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
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int <no name>;
              }
            }
        """)
    }

    fun `test naming LocalVariableDeclaration`() {
        placeCaretIntoCellWithText("<no statement>")
        typeText("int ")
        pressKey(KnownKeys.Tab)
        typeText("abc")
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc;
              }
            }
        """)
    }

    fun `test showing initializer of LocalVariableDeclaration using side transformation`() {
        placeCaretIntoCellWithText("<no statement>")
        typeText("int ")
        pressKey(KnownKeys.Tab)
        typeText("abc")
        typeText("=")
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = <no initializer>;
              }
            }
        """)
        assertCaretPosition("|<no initializer>")
    }

    fun `test showing initializer of LocalVariableDeclaration using TAB`() {
        placeCaretIntoCellWithText("<no statement>")
        typeText("int ")
        pressKey(KnownKeys.Tab)
        typeText("abc")
        pressKey(KnownKeys.Tab)
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = <no initializer>;
              }
            }
        """)
        assertCaretPosition("|<no initializer>")
    }

    fun `test previous optional is hidden when TABing to next`() {
        placeCaretIntoCellWithText("<no statement>")
        typeText("int ")
        pressKey(KnownKeys.Tab)
        typeText("abc")
        pressKey(KnownKeys.Enter)
        typeText("int ")
        pressKey(KnownKeys.Tab)
        typeText("def")
        placeCaretIntoCellWithText("abc")

        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc;
                int def;
              }
            }
        """)

        pressKey(KnownKeys.Tab)
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
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
              public void method1(<no parameter>) {
                int abc;
                int def = <no initializer>;
              }
            }
        """)
        assertCaretPosition("|<no initializer>")
    }

    fun `test adding initializer to LocalVariableDeclaration`() {
        placeCaretIntoCellWithText("<no statement>")
        typeText("int ")
        pressKey(KnownKeys.Tab)
        typeText("abc")
        typeText("=")
        typeText("10")
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = 10;
              }
            }
        """)
    }

    fun `test adding second parameter to InstanceMethodDeclaration by pressing ENTER`() {
        placeCaretIntoCellWithText("<no parameter>")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        pressKey(KnownKeys.Enter)
        assertEditorText("""
            public class Class1 {
              public void method1(int p1, <choose parameter>) {
                <no statement>
              }
            }
        """)
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p2")
        assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1, int p2) {
                <no statement>
              }
            }
        """)
    }

    fun `test adding second parameter to InstanceMethodDeclaration by typing separator after last`() {
        placeCaretIntoCellWithText("<no parameter>")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        typeText(",")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p2")
        assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1, int p2) {
                <no statement>
              }
            }
        """)
        assertCaretPosition("p2|")
    }

    fun `test adding second parameter to InstanceMethodDeclaration by typing separator after first`() {
        placeCaretIntoCellWithText("<no parameter>")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        typeText(",")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p2")
        placeCaretIntoCellWithText("p1")
        typeText(",")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p3")
        assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1, int p3, int p2) {
                <no statement>
              }
            }
        """)
        assertCaretPosition("p3|")
    }

/*    fun `test adding second parameter to InstanceMethodDeclaration by typing separator before last`() {
        placeCaretIntoCellWithText("<no parameter>")
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
                <no statement>
              }
            }
        """)
    }*/

    fun `test deleting parameter using BACKSPACE`() {
        placeCaretIntoCellWithText("<no parameter>")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        assertEditorText("""
            public class Class1 {
              public void method1(int p1) {
                <no statement>
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
              public void method1(<no parameter>) {
                <no statement>
              }
            }
        """)
        assertCaretPosition("|<no parameter>")
    }

    fun `test deleting parameter using DELETE`() {
        placeCaretIntoCellWithText("<no parameter>")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        assertEditorText("""
            public class Class1 {
              public void method1(int p1) {
                <no statement>
              }
            }
        """)
        pressKey(KnownKeys.Delete)
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                <no statement>
              }
            }
        """)
        assertCaretPosition("|<no parameter>")
    }

    fun `test deleting placeholder`() {
        placeCaretIntoCellWithText("<no parameter>")
        typeText("int")
        pressKey(KnownKeys.Tab)
        typeText("p1")
        pressKey(KnownKeys.Enter)
        assertEditorText("""
            public class Class1 {
              public void method1(int p1, <choose parameter>) {
                <no statement>
              }
            }
        """)
        pressKey(KnownKeys.Backspace)
        assertFinalEditorText("""
            public class Class1 {
              public void method1(int p1) {
                <no statement>
              }
            }
        """)
        assertCaretPosition("p1|")
    }

    fun `test typing plus expression`() {
        placeCaretIntoCellWithText("<no statement>")
        typeText("int ")
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int <no name>;
              }
            }
        """)
        pressKey(KnownKeys.Tab)
        typeText("abc")
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc;
              }
            }
        """)
        typeText("=")
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = <no initializer>;
              }
            }
        """)
        typeText("10")
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = 10;
              }
            }
        """)
        typeText("+")
        typeText("20")
        assertEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = 10 + 20;
              }
            }
        """)
        assertFinalEditorText("""
            public class Class1 {
              public void method1(<no parameter>) {
                int abc = 10 + 20;
              }
            }
        """)
    }

    private fun runParsingTest(input: String) = runParsingTest(input, false)
    private fun runCompletionTest(input: String) = runParsingTest(input, true)
    private fun runParsingTest(input: String, completion: Boolean) {
        readAction {
            println("Running test ...")
            placeCaretIntoCellWithText("<no statement>")

            val layoutable = (editor.getSelection() as CaretSelection).layoutable
            val node = layoutable.cell.backend().ancestors(true)
                .mapNotNull { it.getProperty(CommonCellProperties.node) }.first()

            val parser = ParserForEditor(editorEngine).getParser(node.expectedConcept()!!, forCodeCompletion = completion)
            val parseTree = parser.parse(input)
            println(parseTree)
        }
    }
    private fun runClassParsingTest(input: String, completion: Boolean) {
        println("Running test ...")
        placeCaretIntoCellWithText("class")

        val layoutable = (editor.getSelection() as CaretSelection).layoutable
        val node = layoutable.cell.backend().ancestors(true)
            .mapNotNull { it.getProperty(CommonCellProperties.node) }.first()
        val concept = node.getNode()!!.concept!!
        val parser = ParserForEditor(editorEngine).getParser(concept, forCodeCompletion = completion)
        val parseTree = parser.parse(input)
        println(parseTree)
    }

    fun `test statement parsing 1`() = runParsingTest("int a;")
    fun `test statement parsing 2`() = runParsingTest("int a = 10 + 20;")
    fun `test statement parsing 3`() = runParsingTest("return 10;")

    fun `test statement parsing 4`() = runParsingTest("""for ( int i = 0 ; i < 10 ; i++ ) { return i ; }""")
    fun `test statement parsing 5`() = runParsingTest("""System.out.println("Hello");""")
    fun `disabled test statement parsing 6`() = runParsingTest("""System.out.println("Hello World!");""")

    fun `test class parsing 1`() = runClassParsingTest("""
        class Math {
            public static int plus(int a, int b) {
                return a + b;
            }
        }
    """, false)

    fun `test completion 1`() = runParsingTest("""intᚹ""")
    fun `test completion 2`() = runParsingTest("""int aᚹ""")
}
