package org.modelix.react.ssr.server

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.encodeToJsonElement
import org.intellij.lang.annotations.Language
import java.util.concurrent.atomic.AtomicLong

fun buildViewModel(body: ViewModelBuilder.() -> Unit): ViewModel = ViewModelBuilder().apply(body).build()

fun buildComponent(
    type: String,
    body: ComponentBuilder.() -> Unit,
): Component = ComponentBuilder(type).apply(body).build()

abstract class ComponentContainerBuilder {
    private val children: MutableList<ComponentOrText> = ArrayList()

    fun component(
        type: String,
        body: ComponentBuilder.() -> Unit,
    ) {
        children +=
            ComponentOrText(
                component = ComponentBuilder(type).apply(body).build()
            )
    }

    fun component(component: Component) {
        children += ComponentOrText(component = component)
    }

    fun child(child: ComponentOrText) {
        children += child
    }

    fun child(children: Iterable<ComponentOrText>) {
        this.children += children
    }

    fun child(children: IComponentOrList) {
        this.children += children.flatten()
    }

    fun text(text: String) {
        children += ComponentOrText(text = text)
    }

    fun buildComponents(): List<ComponentOrText> = children
}

class ViewModelBuilder : ComponentContainerBuilder() {
    fun build(): ViewModel = ViewModel(buildComponents())
}

class ComponentBuilder(
    private val type: String,
    private val propertiesBuilder: JsonObjectBuilder = JsonObjectBuilder(),
) : ComponentContainerBuilder(),
    IJsonObjectBuilder by propertiesBuilder,
    ICustomHandlerBuilder {
    var key: String? = null
    private val customHandlers: MutableMap<String, ICustomMessageHandler> = HashMap()

    fun build(): Component =
        Component(
            type = type,
            key = key,
            properties = propertiesBuilder.build().takeIf { it.isNotEmpty() },
            children = buildComponents().takeIf { it.isNotEmpty() },
            customMessageHandlers = customHandlers.takeIf { it.isNotEmpty() }
        )

    fun key(vararg parts: String) {
        this.key = parts.joinToString("-")
    }

    fun customHandler(
        name: String,
        builderBody: CustomHandlerBuilder.() -> Unit,
        serverSideHandler: ICustomMessageHandler,
    ) {
        val code = buildCustomHandler(builderBody, serverSideHandler)
        jsCodeProperty(name, code.jsCode)
    }

    override fun buildCustomHandler(
        builderBody: CustomHandlerBuilder.() -> Unit,
        serverSideHandler: ICustomMessageHandler,
    ): JsCode {
        val builder = CustomHandlerBuilder().also(builderBody)
        val code = builder.build()
        customHandlers[builder.handlerId] = serverSideHandler
        return code
    }

    override fun registerHandlers(h: Map<String, ICustomMessageHandler>) {
        this.customHandlers += h
    }
}

interface ICustomHandlerBuilder {
    fun buildCustomHandler(
        builderBody: CustomHandlerBuilder.() -> Unit,
        serverSideHandler: ICustomMessageHandler,
    ): JsCode

    fun registerHandlers(h: Map<String, ICustomMessageHandler>)

    fun <R> registerHandlers(returnValue: ReturnValueWithCustomHandlers<R>): R {
        registerHandlers(returnValue.handlers)
        return returnValue.value
    }
}

data class ReturnValueWithCustomHandlers<R>(
    val value: R,
    val handlers: Map<String, ICustomMessageHandler>,
)

fun <R> functionWithCustomHandlers(body: ICustomHandlerBuilder.() -> R): ReturnValueWithCustomHandlers<R> {
    var handlers: Map<String, ICustomMessageHandler> = emptyMap()
    val builder =
        object : ICustomHandlerBuilder {
            override fun buildCustomHandler(
                builderBody: CustomHandlerBuilder.() -> Unit,
                serverSideHandler: ICustomMessageHandler,
            ): JsCode {
                val builder = CustomHandlerBuilder().also(builderBody)
                val code = builder.build()
                handlers += builder.handlerId to serverSideHandler
                return code
            }

            override fun registerHandlers(h: Map<String, ICustomMessageHandler>) {
                handlers += h
            }
        }
    return ReturnValueWithCustomHandlers(body(builder), handlers)
}

interface IJsonObjectBuilder {
    fun property(
        name: String,
        value: String?,
    )

    fun property(
        name: String,
        value: Number?,
    )

    fun property(
        name: String,
        value: Boolean?,
    )

    fun property(
        name: String,
        value: JsonElement,
    )

    fun property(
        name: String,
        value: ComponentOrText,
    )

    fun property(
        name: String,
        value: Component,
    )

    fun property(
        name: String,
        value: JsCode,
    )

    fun jsonObjectProperty(
        name: String,
        body: IJsonObjectBuilder.() -> Unit,
    )

    fun componentProperty(
        name: String,
        type: String,
        body: ComponentBuilder.() -> Unit,
    )

    fun jsCodeProperty(
        name: String,
        @Language("JavaScript") code: String,
    )

    fun messageSendingHandler(
        name: String,
        messageId: String,
        body: MessageSendingHandlerBuilder.() -> Unit,
    )
}

fun buildJsonObject(body: JsonObjectBuilder.() -> Unit): JsonObject = JsonObjectBuilder().apply(body).build()

class JsonObjectBuilder : IJsonObjectBuilder {
    private val properties: MutableMap<String, JsonElement> = LinkedHashMap()

    override fun property(
        name: String,
        value: String?,
    ) {
        properties[name] = JsonPrimitive(value)
    }

    override fun property(
        name: String,
        value: Number?,
    ) {
        properties[name] = JsonPrimitive(value)
    }

    override fun property(
        name: String,
        value: Boolean?,
    ) {
        properties[name] = JsonPrimitive(value)
    }

    override fun property(
        name: String,
        value: JsonElement,
    ) {
        properties[name] = value
    }

    override fun property(
        name: String,
        value: Component,
    ) {
        properties[name] = Json.encodeToJsonElement(value)
    }

    override fun property(
        name: String,
        value: ComponentOrText,
    ) {
        value.component?.let { properties[name] = Json.encodeToJsonElement(it) }
        value.text?.let { properties[name] = JsonPrimitive(it) }
    }

    override fun property(
        name: String,
        value: JsCode,
    ) {
        properties[name] = Json.encodeToJsonElement(value)
    }

    override fun jsonObjectProperty(
        name: String,
        body: IJsonObjectBuilder.() -> Unit,
    ) {
        property(name, buildJsonObject(body))
    }

    override fun componentProperty(
        name: String,
        type: String,
        body: ComponentBuilder.() -> Unit,
    ) {
        val comp = ComponentBuilder(type).apply(body).build()
        properties[name] = Json.encodeToJsonElement(comp)
    }

    override fun jsCodeProperty(
        name: String,
        @Language("JavaScript") code: String,
    ) {
        properties[name] = Json.encodeToJsonElement(JsCode(code))
    }

    override fun messageSendingHandler(
        name: String,
        messageId: String,
        body: MessageSendingHandlerBuilder.() -> Unit,
    ) {
        jsCodeProperty(name, buildMessageSendingHandler(messageId, body))
    }

    fun build(): JsonObject = JsonObject(properties)
}

fun buildJsonArray(body: JsonArrayBuilder.() -> Unit): JsonArray = JsonArrayBuilder().apply(body).build()

class JsonArrayBuilder {
    private val elements: MutableList<JsonElement> = ArrayList()

    fun element(value: String) {
        elements.add(JsonPrimitive(value))
    }

    fun element(value: Number) {
        elements.add(JsonPrimitive(value))
    }

    fun element(value: Boolean) {
        elements.add(JsonPrimitive(value))
    }

    fun element(value: JsonElement) {
        elements.add(value)
    }

    fun jsonObject(body: JsonObjectBuilder.() -> Unit) {
        elements.add(buildJsonObject(body))
    }

    fun build(): JsonArray = JsonArray(elements)
}

fun buildMessageSendingHandler(
    messageId: String,
    body: MessageSendingHandlerBuilder.() -> Unit,
): String = MessageSendingHandlerBuilder(messageId).apply(body).build()

class MessageSendingHandlerBuilder(
    val messageId: String,
) {
    private val functionParameters: MutableList<String> = ArrayList()
    private val messageParameters: MutableMap<String, String> = LinkedHashMap()

    fun inputParameter(name: String) {
        functionParameters += name
    }

    fun constantParameter(
        name: String,
        value: JsonElement,
    ) {
        messageParameters[name] = Json.encodeToString(value)
    }

    fun constantParameter(
        name: String,
        value: String,
    ) {
        constantParameter(name, JsonPrimitive(value))
    }

    fun codeParameter(
        name: String,
        @Language("JavaScript") expression: String,
    ) {
        messageParameters[name] = expression
    }

    fun build(): String =
        """
            (${functionParameters.joinToString(",")}) => window.modelix.sendMessage({
                ${MessageFromClient::messageId.name}: "$messageId", 
                ${MessageFromClient::parameters.name}: {
                    ${
            messageParameters.entries.joinToString(", ") {
                it.key + ": " + it.value
            }
        }
                }
            })
        """
}

private val customHandlerIdSequence = AtomicLong(0)

class CustomHandlerBuilder {
    var handlerId: String = customHandlerIdSequence.incrementAndGet().toString(16)
    private val clientSideParameters: MutableList<String> = ArrayList()
    private val serverSideParameters: MutableMap<String, String> = LinkedHashMap()

    fun id(id: String) {
        handlerId = id
    }

    fun clientSideParameter(name: String) {
        clientSideParameters += name
    }

    fun serverSideParameter(
        name: String,
        @Language("JavaScript") valueJsCode: String,
    ) {
        serverSideParameters[name] = valueJsCode
    }

    fun build(): JsCode =
        JsCode(
            """
            (${clientSideParameters.joinToString(",")}) => window.modelix.sendMessage({
                ${MessageFromClient::messageId.name}: "callCustomHandler",
                ${MessageFromClient::parameters.name}: {
                    customHandlerId: "$handlerId",
                    customParameters: {
                        ${
                serverSideParameters.entries.joinToString(", ") {
                    it.key + ": " + it.value
                }
            }
                    }
                }
            })
        """
        )
}
