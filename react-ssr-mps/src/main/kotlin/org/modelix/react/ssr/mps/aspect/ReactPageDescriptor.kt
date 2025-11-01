package org.modelix.react.ssr.mps.aspect

import org.modelix.model.api.IReadableNode
import org.modelix.react.ssr.server.RendererCall

interface IReactPageDescriptor {
    fun getPath(): PagePath
    fun getRoot(repository: IReadableNode, pathParameterValues: Map<String, String>): RendererCall
}

class PagePath(val parts: List<PagePathPart>) {
    override fun toString(): String = parts.joinToString("/")
    fun match(actualParts: List<String>): Map<String, String>? {
        if (actualParts.size != parts.size) return null
        val assignedValues = HashMap<String, String>()
        for ((part, actualPart) in parts.zip(actualParts)) {
            if (!part.matches(actualPart, assignedValues)) return null
        }
        return assignedValues
    }
}

sealed class PagePathPart {
    abstract fun matches(actualPart: String, assignedValues: MutableMap<String, String>): Boolean
}
data class StaticPagePathPart(val value: String) : PagePathPart() {
    override fun toString(): String = value
    override fun matches(actualPart: String, assignedValues: MutableMap<String, String>): Boolean = value == actualPart
}
data class VariablePagePathPart(val name: String) : PagePathPart() {
    override fun toString(): String = "{$name}"
    override fun matches(actualPart: String, assignedValues: MutableMap<String, String>): Boolean {
        assignedValues[name] = actualPart
        return true
    }
}
