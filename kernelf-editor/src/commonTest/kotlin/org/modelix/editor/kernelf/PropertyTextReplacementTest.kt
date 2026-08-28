package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.simpleTypes.C_NumberRangeSpec
import org.iets3.core.expr.simpleTypes._C_UntypedImpl_NumberRangeSpec
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellTreeState
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
import kotlin.test.assertNotNull

/**
 * A notation can write a property differently from how the model holds it: `readReplace` maps the stored value to
 * the text shown, `writeReplace` maps typed text back to a value.
 *
 * `NumberRangeSpec` in kernelf asks for the write half - typing `inf` stores the symbol, and a comma decimal
 * separator is stored as a dot - and both halves were unimplemented stubs, so the notation silently did nothing.
 */
class PropertyTextReplacementTest {
    private val max: IProperty = _C_UntypedImpl_NumberRangeSpec.max
    private val min: IProperty = _C_UntypedImpl_NumberRangeSpec.min

    private lateinit var rangeSpec: INode
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl
    private lateinit var branch: IBranch

    @Test
    fun typedTextIsStoredAsTheValueTheNotationAsksFor() =
        runRangeSpecTest {
            typeOver(max, "inf")

            assertEquals("∞", branch.computeRead { rangeSpec.getPropertyValue("max") })
        }

    @Test
    fun aDecimalCommaIsStoredAsADot() =
        runRangeSpecTest {
            typeOver(max, "1,5")

            assertEquals("1.5", branch.computeRead { rangeSpec.getPropertyValue("max") })
        }

    @Test
    fun textThatNeedsNoTranslationIsStoredAsItIs() =
        runRangeSpecTest {
            typeOver(max, "42")

            assertEquals("42", branch.computeRead { rangeSpec.getPropertyValue("max") })
        }

    @Test
    fun aValidatorJudgesTheValueTheNotationStores() =
        runRangeSpecTest {
            // `min` validates with `it.toDoubleOrNull() != null` and translates a decimal comma beside it. MPS's
            // PropertyAccessor validates fromPresentation(text), so the translation runs first and "1,5" is judged
            // as the "1.5" it becomes.
            typeOver(min, "1,5")

            assertEquals("1.5", branch.computeRead { rangeSpec.getPropertyValue("min") })
        }

    @Test
    fun aValueTheValidatorRejectsIsNotStored() =
        runRangeSpecTest {
            // "-inf" becomes the symbol, which `min`'s own validator still does not accept, so nothing is written.
            typeOver(min, "-inf")

            assertEquals("0", branch.computeRead { rangeSpec.getPropertyValue("min") })
        }

    @Test
    fun theStoredValueIsWhatTheEditorShows() =
        runRangeSpecTest {
            typeOver(max, "inf")

            assertEquals("∞", editor.resolvePropertyCell(max, rangeSpec)?.getVisibleText())
        }

    /** What the editor does when the caret is on the cell and the text is replaced. */
    private suspend fun typeOver(
        property: IProperty,
        text: String,
    ) {
        val cell = assertNotNull(editor.resolvePropertyCell(property, rangeSpec), "cell for ${property.getSimpleName()}")
        val backendCell = service.getEditorBackend(editor.editorId).tree.getCell(cell.getId())
        val action = assertNotNull(backendCell.getProperty(CellActionProperties.replaceText), "replaceText action")
        branch.runWrite {
            action.replaceText(CellTreeState(), 0..0, text, text)
        }
        editor.flushAndUpdateSelection { null }
    }

    private fun runRangeSpecTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            branch =
                ModelFacade
                    .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                    .withIncrementalComputationSupport()
            branch.runWrite {
                rangeSpec = PArea(branch).getRoot().addNewChild("root", -1, C_NumberRangeSpec.untyped())
                rangeSpec.setPropertyValue("min", "0")
                rangeSpec.setPropertyValue("max", "1")
            }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, rangeSpec.asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(rangeSpec.reference)
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
