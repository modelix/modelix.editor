package org.modelix.editor

import org.modelix.editor.celltemplate.LabelCellTemplate
import org.modelix.model.api.meta.NullConcept
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * A label is a hint about the code rather than code, so it is styled apart from the text around it. The properties
 * that do it are the inheriting ones, which [FontStylePropertiesTest] covers on the rendering side.
 */
class LabelCellStyleTest {
    @Test
    fun aLabelIsGreyAndInASmallerProportionalFont() {
        val template = LabelCellTemplate(NullConcept, "parameter:")

        assertEquals("LightGray", template.properties[CommonCellProperties.textColor])
        assertEquals("system-ui, sans-serif", template.properties[CommonCellProperties.fontFamily])
        assertEquals("smaller", template.properties[CommonCellProperties.fontSize])
    }

    @Test
    fun whatTheNotationSetsOnTheLabelWinsOverTheDefault() {
        val template = LabelCellTemplate(NullConcept, "parameter:")

        // What a style item on a LabelCell of the MPS notation language ends up calling.
        CellTemplateBuilder(template, NullConcept, INodeConverter.Untyped).apply {
            textColor("#A81E1E")
            fontFamily("Fira Code, monospace")
            fontSize("14px")
        }

        assertEquals("#A81E1E", template.properties[CommonCellProperties.textColor])
        assertEquals("Fira Code, monospace", template.properties[CommonCellProperties.fontFamily])
        assertEquals("14px", template.properties[CommonCellProperties.fontSize])
    }
}
