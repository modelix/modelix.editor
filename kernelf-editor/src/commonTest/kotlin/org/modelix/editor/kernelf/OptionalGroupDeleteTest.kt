package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.simpleTypes.C_StringType
import org.iets3.core.expr.toplevel.C_Function
import org.iets3.core.expr.toplevel.C_Library
import org.modelix.editor.Cell
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.descendants
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.untyped
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.INode
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * Deleting an optional part of a notation deletes it as a whole.
 *
 * The `Function` editor writes its return type as `optional { ":".constant(); concept.type.cell() }`. The group is
 * only shown while the type is there, so deleting the type is what makes the ':' go away - which means deleting the
 * ':' has to delete the type. MPS says this per cell with an "auto-deletable" flag; here it is what an optional
 * group already means, so a notation declares nothing for it.
 *
 * Without a delete action on the group, the nearest one above the caret would be the enclosing node's, and
 * backspacing the ':' would delete the whole function.
 */
class OptionalGroupDeleteTest {
    private lateinit var library: INode
    private lateinit var function: INode
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl
    private lateinit var branch: IBranch

    @Test
    fun theOptionalPartIsShownExactlyWhileTheFeatureItEditsIsSet() =
        runFunctionTest {
            assertNotNull(colonCell(), "The ':' should be shown while the return type is set")

            branch.runWrite { function.getChildren("type").toList().forEach { function.removeChild(it) } }
            editor.flushAndUpdateSelection { null }

            assertNull(colonCell(), "The ':' should disappear together with the type it belongs to")
        }

    @Test
    fun deletingTheColonDeletesTheTypeItBelongsTo() =
        runFunctionTest {
            val colon = assertNotNull(colonCell())

            service.executeDelete(editor.editorId, colon.getId())
            editor.flushAndUpdateSelection { null }

            branch.computeRead {
                assertTrue(
                    function.getChildren("type").none(),
                    "Deleting the ':' should delete the optional part as a whole",
                )
            }
        }

    @Test
    fun deletingTheColonDoesNotDeleteTheFunction() =
        runFunctionTest {
            val colon = assertNotNull(colonCell())

            service.executeDelete(editor.editorId, colon.getId())
            editor.flushAndUpdateSelection { null }

            branch.computeRead {
                assertEquals(
                    listOf(function.reference),
                    library.getChildren("contents").map { it.reference }.toList(),
                    "Only the optional part should be deleted, not the node the caret happens to be inside",
                )
            }
        }

    private fun colonCell(): Cell? = editor.getRootCell().descendants().firstOrNull { it.getVisibleText() == ":" }

    private fun runFunctionTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            branch =
                ModelFacade
                    .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                    .withIncrementalComputationSupport()
            branch.runWrite {
                library = PArea(branch).getRoot().addNewChild("root", -1, C_Library.untyped())
                function = library.addNewChild("contents", -1, C_Function.untyped())
                function.setPropertyValue("name", "f")
                function.addNewChild("type", -1, C_StringType.untyped())
            }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, library.asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(library.reference)
            editor.flushAndUpdateSelection { null }
            try {
                body()
            } finally {
                editor.dispose()
                service.dispose()
                KernelfLanguages.languages.forEach { it.unregister() }
            }
        }
}
