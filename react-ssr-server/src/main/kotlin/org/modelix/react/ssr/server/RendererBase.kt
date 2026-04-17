package org.modelix.react.ssr.server

import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonNull
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.booleanOrNull
import kotlinx.serialization.json.doubleOrNull
import kotlinx.serialization.json.longOrNull
import org.modelix.incremental.TrackableMap

abstract class RendererBase(
    val session: RenderSession,
) : IRenderer {
    init {
        registerMessageHandler("callCustomHandler") { message ->
            val viewModel = session.lastViewModel ?: return@registerMessageHandler
            val handlerId = message.getStringProperty("customHandlerId") ?: return@registerMessageHandler
            val parameters = (message.parameters?.get("customParameters") as? JsonObject) ?: JsonObject(emptyMap())
            val handler = viewModel.findHandler(handlerId) ?: return@registerMessageHandler
            runWrite {
                handler.handle(JsonObjectAsCustomMessageHandlerParameters(parameters))
            }
        }
        registerMessageHandler("changeState") { message ->
            val key = message.getStringProperty("key")!!
            val jsonValue: JsonElement = message.parameters!!["value"]!!
            val value =
                when (jsonValue) {
                    is JsonArray -> {
                        jsonValue
                    }

                    is JsonObject -> {
                        jsonValue
                    }

                    is JsonPrimitive -> {
                        jsonValue.booleanOrNull
                            ?: jsonValue.doubleOrNull
                            ?: jsonValue.longOrNull
                            ?: jsonValue.content
                    }

                    JsonNull -> {
                        null
                    }
                }
            if (value == null) {
                session.allStates.remove(key)
            } else {
                session.allStates[key] = value
            }
        }
    }

    abstract suspend fun <R> runWrite(body: () -> R): R

    fun registerMessageHandler(
        id: String,
        impl: suspend (MessageFromClient) -> Unit,
    ) {
        session.messageHandlers[id] = impl
    }

    override suspend fun messageReceived(message: MessageFromClient) {
        val messageId = message.messageId ?: return
        session.messageHandlers[messageId]?.invoke(message)
    }

    final override fun render(): ViewModel = doRender().also { session.lastViewModel = it }

    protected abstract fun doRender(): ViewModel
}
