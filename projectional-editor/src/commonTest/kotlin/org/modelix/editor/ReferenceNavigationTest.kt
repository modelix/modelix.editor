package org.modelix.editor

import kotlinx.coroutines.test.runTest
import kotlinx.serialization.json.Json
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.shared.NullTextEditorService
import org.modelix.editor.text.shared.celltree.CellInstanceId
import org.modelix.editor.text.shared.celltree.CellPropertyChangeOp
import org.modelix.editor.text.shared.celltree.CellTreeOp
import org.modelix.model.api.INodeReference
import org.modelix.model.api.NodeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * Cmd/Ctrl+click on a reference cell navigates to the target of the reference, like MPS does. The cell that shows the
 * reference carries the target as a property ([CommonCellProperties.referenceTarget]), the cells of the target node
 * are found through their [NodeCellReference].
 */
class ReferenceNavigationTest {
    private val targetNodeRef: INodeReference = NodeReference("target-node")

    @Test
    fun navigatesToTheCellOfTheTargetNode() =
        runTest {
            val editor = editorWithReferenceTo(targetNodeRef)

            assertTrue(editor.navigateToReferenceTarget(editor.findCell("reference")))

            assertEquals("target", editor.selectedText())
        }

    @Test
    fun aCellThatShowsNoReferenceIsNotNavigatable() =
        runTest {
            val editor = editorWithReferenceTo(targetNodeRef)

            assertFalse(editor.navigateToReferenceTarget(editor.findCell("plain")))

            assertNull(editor.getSelection())
        }

    @Test
    fun aTargetOutsideTheOpenedRootNodeIsDelegatedToTheHost() =
        runTest {
            // The reference points to a node that has no cell, e.g. because it is in a different root node.
            val editor = editorWithReferenceTo(NodeReference("node-without-cell"))
            val navigatedTo = ArrayList<INodeReference>()
            editor.navigateToExternalNode = {
                navigatedTo.add(it)
                true
            }

            assertTrue(editor.navigateToReferenceTarget(editor.findCell("reference")))

            assertEquals(listOf<INodeReference>(NodeReference("node-without-cell")), navigatedTo.toList())
            assertNull(editor.getSelection())
        }

    @Test
    fun withoutAHostThereIsNoNavigationToATargetWithoutACell() =
        runTest {
            val editor = editorWithReferenceTo(NodeReference("node-without-cell"))

            assertFalse(editor.navigateToReferenceTarget(editor.findCell("reference")))
        }

    @Test
    fun onlyTheModifierClickNavigates() {
        val click = { modifiers: Modifiers ->
            JSMouseEvent(JSMouseEventType.CLICK, x = 0.0, y = 0.0, modifiers = modifiers, button = 0, buttons = 1)
                .isNavigationClick()
        }

        assertTrue(click(Modifiers.META)) // macOS
        assertTrue(click(Modifiers.CTRL)) // Windows/Linux
        assertFalse(click(Modifiers.NONE))
        assertFalse(click(Modifiers.SHIFT))
        assertFalse(click(Modifiers.CTRL_SHIFT))
        assertFalse(click(Modifiers.ALT_META))

        // A right click opens a context menu instead of navigating.
        assertFalse(
            JSMouseEvent(JSMouseEventType.CLICK, x = 0.0, y = 0.0, modifiers = Modifiers.META, button = 2, buttons = 2)
                .isNavigationClick(),
        )
    }

    @Test
    fun theTargetIsTransferredToTheFrontend() {
        val key = CommonCellProperties.referenceTarget
        val op: CellTreeOp = CellPropertyChangeOp(CellInstanceId(7), key.name, key.toSerializableValue(targetNodeRef))

        val restored = Json.decodeFromString(CellTreeOp.serializer(), Json.encodeToString(CellTreeOp.serializer(), op))

        assertEquals(targetNodeRef, key.fromSerializableValue((restored as CellPropertyChangeOp).value?.value))
    }

    /**
     * An editor showing a cell 'reference' that points to [target], a cell 'target' that belongs to the node
     * `target-node`, and a cell 'plain' that is not involved in any reference.
     */
    private fun editorWithReferenceTo(target: INodeReference): FrontendEditorComponent {
        val editor = FrontendEditorComponent(NullTextEditorService())
        val rootCell = EditorTestUtils.buildCells(listOf("reference", "plain", "target"), editor.getCellTree())
        rootCell.moveCell(editor.getRootCell(), 0)

        val referenceCell = rootCell.getChildren().single { it.getVisibleText() == "reference" }
        referenceCell.setProperty(CommonCellProperties.referenceTarget, target)

        val targetCell = rootCell.getChildren().single { it.getVisibleText() == "target" }
        targetCell.setProperty(CommonCellProperties.cellReferences, listOf(NodeCellReference(targetNodeRef)))

        return editor
    }

    private fun FrontendEditorComponent.findCell(text: String): Cell = getRootCell().descendants().single { it.getVisibleText() == text }

    private fun FrontendEditorComponent.selectedText(): String? = (getSelection() as? CaretSelection)?.layoutable?.toText()
}
