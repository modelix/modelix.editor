package org.modelix.editor

import kotlinx.serialization.Serializable
import org.modelix.model.api.ConceptReference

@Serializable
sealed interface ICellTemplateReference

@Serializable
data class RooCellTemplateReference(
    val conceptEditorId: Long,
    val subConcept: ConceptReference,
) : ICellTemplateReference

@Serializable
data class ChildCellTemplateReference(
    val parent: ICellTemplateReference,
    val index: Int,
) : ICellTemplateReference

@Serializable
data class SeparatorCellTemplateReference(
    val parent: ICellTemplateReference,
) : ICellTemplateReference
