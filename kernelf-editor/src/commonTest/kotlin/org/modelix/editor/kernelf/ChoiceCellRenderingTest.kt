package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.base.C_RangeTarget
import org.iets3.core.expr.base._C_UntypedImpl_RangeTarget
import org.modelix.editor.EditorEngine
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.resolvePropertyCell
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.incremental.IncrementalEngine
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.untyped
import org.modelix.model.ModelFacade
import org.modelix.model.api.IBranch
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.model.area.PArea
import org.modelix.model.withIncrementalComputationSupport
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * A property with a closed set of values renders the notation of the value it is set to.
 *
 * `RangeTarget` is the case the port kept running into: MPS writes it with a cell per bracket, each carrying a
 * rendering condition on `lowerExcluding` / `upperExcluding`. The kernelf notation already asks for it with
 * `booleanCell("]", "[")`, which until now went through a property cell whose `readReplace`/`writeReplace` were
 * both unimplemented - so the editor showed the raw `true` / `false` instead of a bracket.
 *
 * Unlike a condition a choice stays invertible: each alternative's text is a way of writing that value, so the
 * editor derives how to reach either of them rather than the notation having to say.
 */
class ChoiceCellRenderingTest {
    private val lowerExcluding: IProperty = _C_UntypedImpl_RangeTarget.lowerExcluding
    private val upperExcluding: IProperty = _C_UntypedImpl_RangeTarget.upperExcluding

    private lateinit var rangeTarget: INode
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl
    private lateinit var branch: IBranch

    @Test
    fun anIncludedBoundIsWrittenWithTheBracketThatFacesIn() =
        runRangeTest {
            setBounds(lower = "false", upper = "false")

            assertEquals("[", renderedText(lowerExcluding))
            assertEquals("]", renderedText(upperExcluding))
        }

    @Test
    fun anExcludedBoundIsWrittenWithTheBracketThatFacesOut() =
        runRangeTest {
            setBounds(lower = "true", upper = "true")

            assertEquals("]", renderedText(lowerExcluding))
            assertEquals("[", renderedText(upperExcluding))
        }

    @Test
    fun eachBoundIsWrittenOnItsOwn() =
        runRangeTest {
            setBounds(lower = "true", upper = "false")

            assertEquals("]", renderedText(lowerExcluding))
            assertEquals("]", renderedText(upperExcluding))
        }

    @Test
    fun aValueTheNotationDoesNotDescribeIsShownAsItIs() =
        runRangeTest {
            // Not hidden, and not silently rendered as one of the alternatives: a model the notation does not
            // describe has to stay visible so that it can be corrected.
            setBounds(lower = "maybe", upper = "false")

            assertEquals("maybe", renderedText(lowerExcluding))
        }

    private suspend fun setBounds(
        lower: String,
        upper: String,
    ) {
        branch.runWrite {
            rangeTarget.setPropertyValue("lowerExcluding", lower)
            rangeTarget.setPropertyValue("upperExcluding", upper)
        }
        editor.flushAndUpdateSelection { null }
    }

    private fun renderedText(property: IProperty): String? = editor.resolvePropertyCell(property, rangeTarget)?.getVisibleText()

    private fun runRangeTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            branch =
                ModelFacade
                    .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                    .withIncrementalComputationSupport()
            branch.runWrite {
                rangeTarget = PArea(branch).getRoot().addNewChild("root", -1, C_RangeTarget.untyped())
            }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, rangeTarget.asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(rangeTarget.reference)
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
