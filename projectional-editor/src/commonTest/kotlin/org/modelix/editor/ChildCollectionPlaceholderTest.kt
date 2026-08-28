package org.modelix.editor

import org.modelix.editor.celltemplate.ChildCellTemplate
import org.modelix.model.api.SimpleChildLink
import org.modelix.model.api.meta.NullConcept
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

/**
 * The placeholder of an empty child link. Without a notation saying otherwise it is `<no [link name]>`;
 * a notation can replace it, and an empty replacement renders nothing while staying a caret target.
 */
class ChildCollectionPlaceholderTest {
    private fun template() =
        ChildCellTemplate(
            NullConcept,
            SimpleChildLink(simpleName = "attrValues", isMultiple = true, isOptional = true, targetConcept = NullConcept),
        )

    @Test
    fun withoutANotationTheDefaultPlaceholderIsUsed() {
        assertNull(template().placeholderText)
    }

    @Test
    fun theNotationCanReplaceThePlaceholder() {
        val template = template()

        // What a `placeholder text:` in a ChildrenCollectionCell of the MPS notation language ends up calling.
        ChildCellTemplateBuilder(template, NullConcept, INodeConverter.Untyped).placeholderText("...")

        assertEquals("...", template.placeholderText)
    }

    @Test
    fun anEmptyPlaceholderIsDistinctFromNoneAtAll() {
        val template = template()

        // A notation whose placeholder expression evaluates to the empty string: nothing is shown, but the
        // cell is still there to put the caret in.
        ChildCellTemplateBuilder(template, NullConcept, INodeConverter.Untyped).placeholderText("")

        assertEquals("", template.placeholderText)
    }

    @Test
    fun aPlaceholderExpressionThatYieldsNothingFallsBackToTheDefault() {
        val template = template()
        val builder = ChildCellTemplateBuilder(template, NullConcept, INodeConverter.Untyped)

        builder.placeholderText("...")
        builder.placeholderText(null)

        assertNull(template.placeholderText)
    }
}
