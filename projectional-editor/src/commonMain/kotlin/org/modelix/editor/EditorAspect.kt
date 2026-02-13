package org.modelix.editor

import org.modelix.aspects.ILanguageAspect
import org.modelix.aspects.ILanguageAspectFactory
import org.modelix.editor.celltemplate.NotationRootCellTemplate
import org.modelix.metamodel.IConceptOfTypedNode
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.typed
import org.modelix.model.api.IConcept
import org.modelix.model.api.IConceptReference
import org.modelix.model.api.ILanguage
import org.modelix.model.api.INode

class EditorAspect : ILanguageAspect {
    val conceptEditors: MutableList<ConceptEditor> = ArrayList()

    fun <NodeT : ITypedNode, ConceptT : IConceptOfTypedNode<NodeT>> conceptEditor(
        concept: ConceptT,
        applicableToSubConcepts: Boolean = false,
        body: NotationRootCellTemplateBuilder<NodeT, ConceptT>.() -> Unit,
    ): ConceptEditor =
        ConceptEditor(concept.untyped(), applicableToSubConcepts = applicableToSubConcepts) { subConcept ->
            val typedSubconcept = subConcept.typed() as ConceptT
            NotationRootCellTemplateBuilder(
                NotationRootCellTemplate(subConcept),
                typedSubconcept,
                INodeConverter.Typed<NodeT>(typedSubconcept)
            ).also(body)
                .template as NotationRootCellTemplate
        }.also(conceptEditors::add)

    fun conceptEditor(
        concept: IConcept,
        applicableToSubConcepts: Boolean = false,
        body: NotationRootCellTemplateBuilder<INode, IConcept>.() -> Unit,
    ): ConceptEditor =
        ConceptEditor(concept, applicableToSubConcepts = applicableToSubConcepts) { subConcept ->
            NotationRootCellTemplateBuilder(NotationRootCellTemplate(subConcept), subConcept, INodeConverter.Untyped)
                .also(body)
                .template as NotationRootCellTemplate
        }.also(conceptEditors::add)

    fun register(editorEngine: EditorEngine) {
        editorEngine.registerEditors(this)
    }

    companion object : ILanguageAspectFactory<EditorAspect> {
        override fun createInstance(language: ILanguage): EditorAspect = EditorAspect()
    }
}

interface IConceptEditorRegistry {
    fun getConceptEditors(concept: IConceptReference): List<ConceptEditor>
}
