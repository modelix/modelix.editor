package org.modelix.editor

import org.modelix.editor.celltemplate.NotationRootCellTemplate
import org.modelix.editor.celltemplate.defaultReferencePresentation
import org.modelix.kotlin.utils.AtomicLong
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.meta.NullConcept
import org.modelix.model.api.upcast

class ConceptEditor(
    val declaredConcept: IConcept?,
    val applicableToSubConcepts: Boolean,
    val templateBuilder: (subConcept: IConcept) -> NotationRootCellTemplate,
) {
    companion object {
        private val idSequence = AtomicLong(0L)
    }

    val id: Long = idSequence.incrementAndGet()

    fun isApplicable(
        context: CellCreationContext,
        node: INode,
    ): Boolean = apply(node.concept ?: NullConcept).condition?.invoke(node) != false

    fun apply(subConcept: IConcept): NotationRootCellTemplate =
        templateBuilder(subConcept)
            .also { it.setReference(RooCellTemplateReference(id, subConcept.getReference().upcast())) }

    fun applyIfApplicable(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase? {
        // TODO evaluate .withNode blocks during creation of the template
        return apply(node.concept ?: NullConcept)
            .takeIf { it.condition?.invoke(node) != false }
            ?.apply(context, node)
    }

    fun apply(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase {
        // TODO evaluate .withNode blocks during creation of the template
        return apply(node.concept ?: NullConcept).apply(context, node)
    }
}

val defaultConceptEditor =
    ConceptEditor(null as IConcept?, applicableToSubConcepts = true) { subConcept ->
        NotationRootCellTemplateBuilder(NotationRootCellTemplate(subConcept), subConcept, INodeConverter.Untyped)
            .apply {
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
                        // Not the plain default: a concept without a notation is read to find out what is in the
                        // model, so an unnamed target is worth more as its node id than as a placeholder.
                        link.cell(presentation = { defaultReferencePresentation() ?: reference.serialize() })
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
