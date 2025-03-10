package org.modelix.editor.kernelf

import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.simpleTypes.N_NumberLiteral
import org.iets3.core.expr.tests.N_TestSuite
import org.modelix.editor.CaretSelection
import org.modelix.editor.Cell
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.EditorComponent
import org.modelix.editor.EditorEngine
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.celltemplate.descendants
import org.modelix.editor.celltemplate.firstLeaf
import org.modelix.editor.commonAncestor
import org.modelix.editor.descendants
import org.modelix.editor.firstLeaf
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.getVisibleText
import org.modelix.editor.isVisible
import org.modelix.editor.layoutable
import org.modelix.editor.previousLeaf
import org.modelix.editor.resolvePropertyCell
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.ModelData
import org.modelix.metamodel.descendants
import org.modelix.metamodel.ofType
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.PBranch
import org.modelix.model.area.getArea
import org.modelix.model.client.IdGenerator
import org.modelix.model.repositoryconcepts.N_Module
import org.modelix.model.repositoryconcepts.models
import org.modelix.model.repositoryconcepts.rootNodes
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class CodeCompletionTest {
    lateinit var numberLiteral: N_NumberLiteral
    lateinit var editor: EditorComponent
    lateinit var branch: IBranch
    lateinit var testSuite: N_TestSuite

    @BeforeTest
    fun beforeTest() {
        KernelfLanguages.registerAll()
        branch = PBranch(ModelFacade.newLocalTree(useRoleIds = false), IdGenerator.getInstance(56754)).withIncrementalComputationSupport()
        ModelData.fromJson(modelJson).load(branch)

        val engine = EditorEngine(IncrementalEngine())
        KernelfEditor.register(engine)
        testSuite = branch.computeRead { branch.getArea().getRoot().allChildren.ofType<N_Module>().models.rootNodes.ofType<N_TestSuite>().first() }
        editor = engine.editNode(testSuite)
        numberLiteral = branch.computeRead { testSuite.descendants<N_NumberLiteral>().first() }
        editor.selectAfterUpdate {
            val cell = editor.resolvePropertyCell(C_NumberLiteral.value, numberLiteral)
            CaretSelection(cell!!.layoutable()!!, 0)
        }
        editor.update()
    }

    @AfterTest
    fun afterTest() {
        KernelfLanguages.languages.forEach { it.unregister() }
    }

    @Test
    fun printModel() {
        println(editor.getRootCell().layout.toString())
    }

    @Test
    fun printActions() {
        val actions = getSubstituteActions(getNumberLiteralCell())
        val parameters = CodeCompletionParameters(editor, "")
        actions.forEach { println(it.getCompletionPattern() + " | " + it.getDescription()) }
    }

    @Test
    fun notEmpty() {
        val actions = getSubstituteActions(getNumberLiteralCell())
        assertTrue(actions.isNotEmpty())
    }

    @Test
    fun actionsOnNameProperty() {
        val namePropertyCell = editor.getRootCell().descendants().find { it.getVisibleText() == "stringTests" }!!
        editor.changeSelection(CaretSelection(namePropertyCell.layoutable()!!, 0))

        val firstLeaf = namePropertyCell.firstLeaf()
        assertEquals("stringTests", firstLeaf.getVisibleText())
        val previousLeaf = namePropertyCell.previousLeaf { it.isVisible() }!!
        assertEquals("test case", previousLeaf.getVisibleText())
        val commonAncestor = previousLeaf.commonAncestor(firstLeaf)
        assertEquals(namePropertyCell.parent, commonAncestor)

        val actions = getSubstituteActions(namePropertyCell)
        assertEquals(emptyList(), actions)
    }

    @Test
    fun noDuplicates() {
        val parameters = CodeCompletionParameters(editor, "")
        val actions = getSubstituteActions(getNumberLiteralCell())
        val knownDuplicates = setOf(
            "it",
            "ParamRef { <shortDescription> <virtualPackage> <param> <smodelAttribute> }",
            "StripUnitExpression { <shortDescription> <virtualPackage> <expr> <smodelAttribute> }",
            "ValExpression { <shortDescription> <virtualPackage> <smodelAttribute> }"
        )
        val actualDuplicates = actions.groupBy { it.getCompletionPattern() }.filter { it.value.size > 1 }.map { it.key }
        val unexpectedDuplicates = actualDuplicates - knownDuplicates
        val missingDuplicates = knownDuplicates - actualDuplicates
        assertTrue(unexpectedDuplicates.isEmpty(), "Duplicate entries found: " + unexpectedDuplicates)
        assertTrue(missingDuplicates.isEmpty(), "These entries aren't duplicates anymore: " + missingDuplicates)
    }

    private fun getNumberLiteralCell() = editor.resolvePropertyCell(C_NumberLiteral.value, numberLiteral)!!

    private fun getSubstituteActions(cell: Cell): List<ICodeCompletionAction> {
        val parameters = CodeCompletionParameters(editor, "")
        return branch.computeRead {
            cell.getSubstituteActions().flatMap { it.flattenApplicableActions(parameters) }
                .sortedBy { it.getCompletionPattern() }.toList()
        }
    }
}
