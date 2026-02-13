package org.modelix.react.ssr.server

import kotlinx.serialization.Serializable
import kotlinx.serialization.Transient
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonPrimitive

@Serializable
data class MessageFromClient(
    val messageId: String,
    val parameters: Map<String, JsonElement>? = null,
) {
    fun getStringProperty(name: String): String? = parameters?.get(name)?.jsonPrimitive?.content
}

@Serializable
data class MessageFromServer(
    val viewModel: ViewModel,
)

interface IComponentContainer {
    val children: List<ComponentOrText>?
}

@Serializable
data class ViewModel(
    override val children: List<ComponentOrText>? = null,
) : IComponentContainer {
    fun findHandler(id: String): ICustomMessageHandler? {
        return (children ?: return null).firstNotNullOfOrNull { it.findHandler(id) }
    }
}

@Serializable
data class Component(
    val type: String,
    val key: String? = null,
    val properties: JsonObject? = null,
    override val children: List<ComponentOrText>? = null,
    @Transient
    val customMessageHandlers: Map<String, ICustomMessageHandler>? = null,
) : IComponentContainer {
    fun findHandler(id: String): ICustomMessageHandler? {
        customMessageHandlers?.get(id)?.let { return it }
        return (children ?: return null).firstNotNullOfOrNull { it.findHandler(id) }
    }
}

interface ICustomMessageHandler {
    fun handle(parameters: ICustomMessageHandlerParameters)
}

interface ICustomMessageHandlerParameters {
    fun getString(name: String): String?
}

class JsonObjectAsCustomMessageHandlerParameters(
    val obj: JsonObject,
) : ICustomMessageHandlerParameters {
    override fun getString(name: String): String? = obj.get(name)?.jsonPrimitive?.content
}

sealed interface IComponentOrList {
    fun flatten(): List<ComponentOrText>

    companion object {
        @JvmStatic
        fun create(vararg parameters: Any?): IComponentOrList = fromSequence(parameters.asSequence())

        @JvmStatic
        fun create(parameter: Any?): IComponentOrList =
            when (parameter) {
                null -> ComponentsList(emptyList())
                is String -> ComponentOrText(text = parameter)
                is Component -> ComponentOrText(component = parameter)
                is ComponentsList -> parameter
                is ComponentOrText -> parameter
                is Iterable<Any?> -> fromSequence(parameter.asSequence())
                is Sequence<Any?> -> fromSequence(parameter)
                else -> throw IllegalArgumentException("Unsupported: $parameter")
            }

        fun fromSequence(seq: Sequence<Any?>): IComponentOrList {
            val elements =
                seq
                    .map { create(it) }
                    .flatMap { it.flatten() }
                    .toList()
            return if (elements.size == 1) elements.single() else ComponentsList(elements)
        }
    }
}

data class ComponentsList(
    val components: List<ComponentOrText>,
) : IComponentOrList {
    override fun flatten(): List<ComponentOrText> = components
}

@Serializable
data class ComponentOrText(
    val component: Component? = null,
    val text: String? = null,
) : IComponentOrList {
    override fun flatten(): List<ComponentOrText> = listOf(this)

    fun findHandler(id: String): ICustomMessageHandler? = component?.findHandler(id)
}

@Serializable
data class JsCode(
    val jsCode: String,
)
