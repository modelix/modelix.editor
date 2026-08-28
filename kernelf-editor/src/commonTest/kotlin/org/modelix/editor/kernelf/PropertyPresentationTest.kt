package org.modelix.editor.kernelf

import kotlinx.coroutines.test.runTest
import org.iets3.core.expr.simpleTypes.C_NumberLiteral
import org.iets3.core.expr.simpleTypes._C_UntypedImpl_NumberLiteral
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
import org.modelix.presentation.IPropertyPresentation
import org.modelix.presentation.PropertyPresentationAspect
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull

/**
 * A language can define how a property value is written, where the model holds it in another form. The editor asks
 * [PropertyPresentationAspect] on the way out and on the way in, the way MPS's `PropertyAccessor` calls
 * `getPresentation` and `fromPresentation`.
 *
 * The provider here stands in for the MPS one, which needs a running MPS: for an MPS enumeration it turns the
 * stored `gZ5fh_4/error` into `error` and back, through `SDataType.fromString` / `toString`.
 */
class PropertyPresentationTest {
    private val value: IProperty = _C_UntypedImpl_NumberLiteral.value

    private lateinit var literal: INode
    private lateinit var editor: FrontendEditorComponent
    private lateinit var service: TextEditorServiceImpl
    private lateinit var branch: IBranch

    /** Stores a number with a marker the reader never sees, standing in for an enum's `<memberId>/<name>`. */
    private object MarkerPresentation : IPropertyPresentation {
        override fun toPresentation(
            property: IProperty,
            storedValue: String,
        ): String? = storedValue.takeIf { property.getSimpleName() == "value" && it.startsWith("#") }?.drop(1)

        override fun fromPresentation(
            property: IProperty,
            text: String,
        ): String? = "#$text".takeIf { property.getSimpleName() == "value" && text.toIntOrNull() != null }
    }

    @Test
    fun theStoredValueIsShownInTheFormTheLanguageDefines() =
        runPresentationTest {
            branch.runWrite { literal.setPropertyValue("value", "#42") }
            editor.flushAndUpdateSelection { null }

            assertEquals("42", editor.resolvePropertyCell(value, literal)?.getVisibleText())
        }

    @Test
    fun typedTextIsStoredInTheFormTheLanguageDefines() =
        runPresentationTest {
            typeOver("7")

            assertEquals("#7", branch.computeRead { literal.getPropertyValue("value") })
        }

    @Test
    fun aValueTheProviderDoesNotRecogniseIsLeftAsItIs() =
        runPresentationTest {
            // Every prefix of a value looks like this while it is being typed, so it has to survive unconverted.
            branch.runWrite { literal.setPropertyValue("value", "42") }
            editor.flushAndUpdateSelection { null }

            assertEquals("42", editor.resolvePropertyCell(value, literal)?.getVisibleText())
        }

    private suspend fun typeOver(text: String) {
        val cell = assertNotNull(editor.resolvePropertyCell(value, literal), "cell for the value property")
        val backendCell = service.getEditorBackend(editor.editorId).tree.getCell(cell.getId())
        val action = assertNotNull(backendCell.getProperty(CellActionProperties.replaceText), "replaceText action")
        branch.runWrite { action.replaceText(CellTreeState(), 0..0, text, text) }
        editor.flushAndUpdateSelection { null }
    }

    private fun runPresentationTest(body: suspend () -> Unit) =
        runTest {
            KernelfLanguages.registerAll()
            PropertyPresentationAspect.providers.add(MarkerPresentation)
            branch =
                ModelFacade
                    .toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
                    .withIncrementalComputationSupport()
            branch.runWrite {
                literal = PArea(branch).getRoot().addNewChild("root", -1, C_NumberLiteral.untyped())
                literal.setPropertyValue("value", "#1")
            }

            val engine = EditorEngine(IncrementalEngine())
            KernelfEditor.register(engine)
            service = TextEditorServiceImpl(engine, literal.asWritableNode().getModel(), backgroundScope)
            editor = FrontendEditorComponent(service)
            editor.editNode(literal.reference)
            editor.flushAndUpdateSelection { null }
            try {
                body()
            } finally {
                editor.dispose()
                service.dispose()
                PropertyPresentationAspect.providers.remove(MarkerPresentation)
                KernelfLanguages.languages.forEach { it.unregister() }
            }
        }
}
