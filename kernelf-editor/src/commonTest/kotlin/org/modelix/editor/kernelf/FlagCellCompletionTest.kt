package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.toplevel.C_Library
import org.iets3.core.expr.toplevel.N_Library
import org.iets3.core.expr.toplevel._C_UntypedImpl_Library
import org.modelix.editor.CaretSelection
import org.modelix.editor.Cell
import org.modelix.editor.ChildNodeCellReference
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.flattenApplicableActions
import org.modelix.editor.getCompletionPattern
import org.modelix.editor.getSubstituteActions
import org.modelix.editor.layoutable
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedReference
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertTrue

/**
 * Regression test for [org.modelix.editor.celltemplate.FlagCellTemplate.getInstantiationActions].
 *
 * The editor of the `Function` concept (see Editor_org_iets3_core_expr_toplevel.kt) starts with a
 * flag cell (`flagCell("ext")`) followed by the `"fun"` keyword. The flag is optional, so it must
 * delegate to the next cell instead of producing its own instantiation action. Previously the flag
 * cell returned an empty (but non-null) list, which stopped the surrounding template from reaching
 * the `"fun"` keyword and therefore hid `Function` from the code completion menu.
 */
class FlagCellCompletionTest {
    lateinit var library: N_Library
    lateinit var editor: FrontendEditorComponent
    lateinit var service: TextEditorServiceImpl
    lateinit var branch: IBranch

    @Test
    fun functionAppearsInCompletionMenu() =
        runFlagTest {
            val placeholder = resolveContentsPlaceholder()
            val actions = getSubstituteActions(placeholder)

            val functionAction =
                actions.find { it.getMatchingText() == "fun" && it.getDescription() == "Function" }
            assertTrue(
                functionAction != null,
                "Expected a 'fun' completion that instantiates Function. Available actions:\n" +
                    actions.joinToString("\n") { it.getMatchingText() + " | " + it.getDescription() },
            )
        }

    private fun resolveContentsPlaceholder(): Cell {
        val reference =
            ChildNodeCellReference(
                library.untypedReference(),
                _C_UntypedImpl_Library.contents.toReference(),
            )
        return checkNotNull(editor.resolveCell(reference).firstOrNull()) {
            "Placeholder cell for the empty 'contents' list not found"
        }
    }

    private fun getSubstituteActions(cell: Cell): List<ICodeCompletionAction> {
        val backendCell = service.getEditorBackend(editor.editorId).tree.getCell(cell.getId())
        val parameters = CodeCompletionParameters(service.getEditorBackend(editor.editorId), "")
        return branch.computeRead {
            backendCell
                .getSubstituteActions()
                .flatMap { it.flattenApplicableActions(parameters) }
                .sortedBy { it.getCompletionPattern() }
                .toList()
        }
    }

    private fun runFlagTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            branch =
                ModelFacade
                    .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                    .withIncrementalComputationSupport()
            library =
                branch.computeWrite {
                    PArea(branch)
                        .getRoot()
                        .addNewChild("root", -1, C_Library.untyped())
                        .typed<N_Library>()
                }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, library.untyped().asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(library.untypedReference())
            editor.flushAndUpdateSelection {
                val placeholder = resolveContentsPlaceholder()
                CaretSelection(placeholder.layoutable()!!, 0)
            }
            try {
                body()
            } finally {
                editor.dispose()
                service.dispose()
                KernelfLanguages.languages.forEach { it.unregister() }
            }
        }
}
