package org.modelix.react.ssr.server

import org.modelix.model.api.ConceptReference
import org.modelix.model.api.INodeReference
import org.modelix.model.api.IReadableNode
import org.modelix.model.api.NodeReference

sealed class RendererSignature

data class ConceptRendererSignature(
    val concept: ConceptReference,
) : RendererSignature()

data class NamedRendererSignature(
    val id: String,
) : RendererSignature()

sealed class RendererCall

data class NodeRefRendererCall(
    val node: INodeReference,
) : RendererCall() {
    constructor(nodeRef: String) : this(NodeReference(nodeRef))
}

data class NodeRendererCall(
    val node: IReadableNode,
) : RendererCall()

data class NamedRendererCall(
    val id: String,
    val parameterValues: List<Any?>,
) : RendererCall()
