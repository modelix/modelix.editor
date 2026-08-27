package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.toplevel.C_Constant
import org.iets3.core.expr.toplevel.C_ConstantRef
import org.iets3.core.expr.toplevel.C_Library
import org.iets3.core.expr.toplevel.N_Constant
import org.iets3.core.expr.toplevel.N_ConstantRef
import org.iets3.core.expr.toplevel.N_Library
import org.modelix.editor.CaretSelection
import org.modelix.editor.Cell
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.ancestors
import org.modelix.editor.descendants
import org.modelix.editor.resolveNodeCell
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.setNew
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.ModelFacade
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.IBranch
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Cmd/Ctrl+click on a reference cell navigates to the target of the reference, like MPS does.
 *
 * The cell that shows the reference carries the target ([CommonCellProperties.referenceTarget]), which the frontend
 * uses to move the selection into the cells of the referenced node. A target outside the opened root node has no
 * cell yet, so the editor first switches to the root node that contains it.
 */
class ReferenceNavigationTest {
    private lateinit var branch: IBranch
    private lateinit var targetLibrary: N_Library
    private lateinit var constant: N_Constant
    private lateinit var constantRef: N_ConstantRef
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl

    @Test
    fun theReferenceCellKnowsItsTarget() =
        runNavigationTest {
            assertEquals(
                constant.untypedReference(),
                referenceCell().getProperty(CommonCellProperties.referenceTarget),
            )
        }

    @Test
    fun navigatingMovesTheSelectionIntoTheReferencedNode() =
        runNavigationTest {
            assertTrue(editor.navigateToReferenceTarget(referenceCell()))

            val selectedCell = (editor.getSelection() as CaretSelection).layoutable.cell
            val constantCell =
                checkNotNull(editor.resolveNodeCell(constant.untyped())) { "No cell found for the constant" }
            assertTrue(
                selectedCell.ancestors(true).contains(constantCell),
                "The selection is outside the referenced constant: " + editor.getSelection(),
            )
            assertEquals("answer", (editor.getSelection() as CaretSelection).layoutable.toText())
        }

    @Test
    fun aCellThatShowsNoReferenceHasNoTarget() =
        runNavigationTest {
            val cellsWithTarget =
                editor
                    .getRootCell()
                    .descendants()
                    .filter { it.getProperty(CommonCellProperties.referenceTarget) != null }
                    .toList()
            assertEquals(listOf(referenceCell()), cellsWithTarget)
        }

    /**
     * The target is in a different root node, which the editor doesn't show. Like MPS, the editor opens the root node
     * that contains the target and selects it there.
     */
    @Test
    fun navigatingOpensTheRootNodeThatContainsTheTarget() =
        runNavigationTest(targetInOwnRootNode = true) {
            // Before the navigation the target is not part of the opened root node.
            assertEquals(null, editor.resolveNodeCell(constant.untyped()))

            assertTrue(editor.navigateToReferenceTarget(referenceCell()))

            val constantCell =
                assertNotNull(editor.resolveNodeCell(constant.untyped()), "The target's root node was not opened")
            val selectedCell = (editor.getSelection() as CaretSelection).layoutable.cell
            assertTrue(
                selectedCell.ancestors(true).contains(constantCell),
                "The selection is outside the referenced constant: " + editor.getSelection(),
            )
            assertEquals("answer", (editor.getSelection() as CaretSelection).layoutable.toText())
        }

    /**
     * A host application that shows more than the editor alone opens the target itself, e.g. in a new browser tab.
     * It gets the node to navigate to and the root node it is in.
     */
    @Test
    fun aTargetInAnotherRootNodeIsOfferedToTheHost() =
        runNavigationTest(targetInOwnRootNode = true) {
            val navigatedTo = ArrayList<Pair<INodeReference, INodeReference>>()
            editor.navigateToExternalNode = { targetNode, rootNode ->
                navigatedTo.add(targetNode to rootNode)
                true
            }

            assertTrue(editor.navigateToReferenceTarget(referenceCell()))

            assertEquals(
                listOf(constant.untypedReference() to targetLibrary.untypedReference()),
                navigatedTo.toList(),
            )
            // The host navigated, so the editor kept showing its own root node.
            assertEquals(null, editor.resolveNodeCell(constant.untyped()))
        }

    /**
     * The cell that shows the `constant` reference of [constantRef]. It is the only cell of the editor that knows a
     * reference target.
     */
    private fun referenceCell(): Cell =
        editor
            .getRootCell()
            .descendants()
            .single { it.getProperty(CommonCellProperties.referenceTarget) != null }

    /**
     * Builds a model with a constant `answer` and a constant `alias` whose value is a reference to `answer`, opens an
     * editor on the root node that contains `alias` and runs [body].
     *
     * With [targetInOwnRootNode] the two constants are put into separate root nodes of the same model, so that the
     * target of the reference is outside the opened root node.
     */
    private fun runNavigationTest(
        targetInOwnRootNode: Boolean = false,
        body: suspend () -> Unit,
    ) = runTest {
        KernelfLanguages.registerAll()
        branch =
            ModelFacade
                .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                .withIncrementalComputationSupport()
        val editedLibrary =
            branch.computeWrite {
                val model = newModel()
                targetLibrary = model.newLibrary()
                constant =
                    targetLibrary.contents.addNew(C_Constant).apply {
                        name = "answer"
                        value.setNew(C_NumberLiteral) { value = "42" }
                    }
                val referencingLibrary = if (targetInOwnRootNode) model.newLibrary() else targetLibrary
                referencingLibrary.contents.addNew(C_Constant).apply {
                    name = "alias"
                    constantRef = value.setNew(C_ConstantRef) { constant = this@ReferenceNavigationTest.constant }
                }
                referencingLibrary
            }

        val engine = EditorEngine(IncrementalEngine())
        KernelfEditor.register(engine)
        service = TextEditorServiceImpl(engine, editedLibrary.untyped().asWritableNode().getModel(), backgroundScope)
        editor = FrontendEditorComponent(service)
        editor.editNode(editedLibrary.untypedReference())
        editor.flush()
        try {
            body()
        } finally {
            editor.dispose()
            service.dispose()
            KernelfLanguages.languages.forEach { it.unregister() }
        }
    }

    /**
     * A model node, so that the libraries are proper root nodes and the editor can find the root node of a node.
     */
    private fun newModel(): INode =
        PArea(branch)
            .getRoot()
            .addNewChild(BuiltinLanguages.MPSRepositoryConcepts.Repository.modules, -1, BuiltinLanguages.MPSRepositoryConcepts.Module)
            .addNewChild(BuiltinLanguages.MPSRepositoryConcepts.Module.models, -1, BuiltinLanguages.MPSRepositoryConcepts.Model)

    private fun INode.newLibrary(): N_Library =
        addNewChild(BuiltinLanguages.MPSRepositoryConcepts.Model.rootNodes, -1, C_Library.untyped())
            .typed<N_Library>()
}
