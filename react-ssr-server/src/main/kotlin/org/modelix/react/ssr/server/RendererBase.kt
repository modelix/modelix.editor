package org.modelix.react.ssr.server

import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import org.modelix.incremental.TrackableMap

abstract class RendererBase : IRenderer {
    protected val allStates = TrackableMap<String, JsonElement>()
    private val messageHandlers: MutableMap<String, suspend (MessageFromClient) -> Unit> = HashMap()
    protected var lastViewModel: ViewModel? = null

    init {
        registerMessageHandler("callCustomHandler") { message ->
            val viewModel = lastViewModel ?: return@registerMessageHandler
            val handlerId = message.getStringProperty("customHandlerId") ?: return@registerMessageHandler
            val parameters = (message.parameters?.get("customParameters") as? JsonObject) ?: JsonObject(emptyMap())
            val handler = viewModel.findHandler(handlerId) ?: return@registerMessageHandler
            runWrite {
                handler.handle(JsonObjectAsCustomMessageHandlerParameters(parameters))
            }
        }
        registerMessageHandler("changeState") { message ->
            allStates[message.getStringProperty("key")!!] = message.parameters!!["value"]!!
        }
    }

    abstract suspend fun <R> runWrite(body: () -> R): R

    fun registerMessageHandler(
        id: String,
        impl: suspend (MessageFromClient) -> Unit,
    ) {
        messageHandlers[id] = impl
    }

    override suspend fun messageReceived(message: MessageFromClient) {
        messageHandlers[message.messageId]?.invoke(message)
    }

    final override fun render(): ViewModel = doRender().also { lastViewModel = it }

    protected abstract fun doRender(): ViewModel
}
