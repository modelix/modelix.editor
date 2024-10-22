package org.modelix.editor

import org.modelix.editor.celltemplate.NotationRootCellTemplate
import org.modelix.metamodel.NullConcept
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty

class ConceptEditor(
    val declaredConcept: IConcept?,
    val applicableToSubConcepts: Boolean,
    val templateBuilder: (subConcept: IConcept) -> NotationRootCellTemplate,
) {
    fun isApplicable(context: CellCreationContext, node: INode): Boolean {
        return apply(node.concept ?: NullConcept).condition?.invoke(node) != false
    }

    fun apply(subConcept: IConcept): NotationRootCellTemplate {
        return templateBuilder(subConcept)
            .also { it.setReference(RooCellTemplateReference(this, subConcept.getReference())) }
    }

    fun applyIfApplicable(context: CellCreationContext, node: INode): CellData? {
        // TODO evaluate .withNode blocks during creation of the template
        return apply(node.concept ?: NullConcept)
            .takeIf { it.condition?.invoke(node) != false }
            ?.apply(context, node)
    }

    fun apply(context: CellCreationContext, node: INode): CellData {
        // TODO evaluate .withNode blocks during creation of the template
        return apply(node.concept ?: NullConcept).apply(context, node)
    }
}

val defaultConceptEditor = ConceptEditor(null as IConcept?, applicableToSubConcepts = true) { subConcept ->
    NotationRootCellTemplateBuilder(NotationRootCellTemplate(subConcept), subConcept, INodeConverter.Untyped).apply {
        subConcept.getShortName().constant()
        curlyBrackets {
            for (property in subConcept.getAllProperties()) {
                newLine()
                label(property.getSimpleName() + ":")
                property.cell()
            }
            for (link in subConcept.getAllReferenceLinks()) {
                newLine()
                label(link.getSimpleName() + ":")
                link.cell(presentation = {
                    getPropertyValue(IProperty.fromName("name")) ?: reference.serialize()
                })
            }
            for (link in subConcept.getAllChildLinks()) {
                newLine()
                label(link.getSimpleName() + ":")
                if (link.isMultiple) {
                    newLine()
                    indented {
                        link.vertical()
                    }
                } else {
                    link.cell()
                }
            }
        }
    }.template as NotationRootCellTemplate
}
