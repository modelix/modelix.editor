package org.modelix.editor

import org.modelix.aspects.LanguageAspectsBuilder
import org.modelix.metamodel.IConceptOfTypedNode
import org.modelix.metamodel.ITypedNode
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import kotlin.jvm.JvmOverloads

@JvmOverloads
fun <NodeT : ITypedNode, ConceptT : IConceptOfTypedNode<NodeT>> LanguageAspectsBuilder<*>.editor(
    concept: ConceptT,
    applicableToSubConcepts: Boolean = false,
    body: NotationRootCellTemplateBuilder<NodeT, ConceptT>.() -> Unit,
): ConceptEditor = aspects.getAspect(language, EditorAspect).conceptEditor(concept, applicableToSubConcepts = applicableToSubConcepts, body)

@JvmOverloads
fun LanguageAspectsBuilder<*>.editor(
    concept: IConcept,
    applicableToSubConcepts: Boolean = false,
    body: NotationRootCellTemplateBuilder<INode, IConcept>.() -> Unit,
): ConceptEditor = aspects.getAspect(language, EditorAspect).conceptEditor(concept, applicableToSubConcepts = applicableToSubConcepts, body)

interface ModelAccessBuilder {
    fun get(body: () -> String?)

    fun set(body: (String?) -> Unit)
}
