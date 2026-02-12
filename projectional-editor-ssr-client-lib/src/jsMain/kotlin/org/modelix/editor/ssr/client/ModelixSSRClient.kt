package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KLogger
import io.github.oshai.kotlinlogging.KotlinLogging
import io.ktor.client.HttpClient
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.rpc.krpc.ktor.client.rpc
import kotlinx.rpc.krpc.ktor.client.rpcConfig
import kotlinx.rpc.krpc.serialization.json.json
import kotlinx.rpc.withService
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.model.api.INodeReference
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.HTMLElement

private val LOG = KotlinLogging.logger { }

class ModelixSSRClient(
    private val httpClient: HttpClient,
    private val url: String,
) {
    private val coroutineScope = CoroutineScope(Dispatchers.Default)

    private val rpcClient =
        httpClient.rpc(urlString = url) {
            rpcConfig {
                serialization {
                    json()
                }
            }
        }
    private val editors = ClientSideEditors(rpcClient.withService<TextEditorService>(), coroutineScope)

    fun dispose() {
        coroutineScope.cancel("Disposed")
    }

    fun createEditor(
        rootNodeReference: INodeReference,
        existingContainerElement: HTMLDivElement? = null,
    ): HTMLElement = editors.createEditor(rootNodeReference, existingContainerElement)
}

inline fun <R> KLogger.logExceptions(body: () -> R): R {
    try {
        return body()
    } catch (ex: Throwable) {
        error(ex) { "Uncaught exception" }
        throw ex
    }
}

fun CoroutineScope.launchLogging(body: suspend CoroutineScope.() -> Unit): Job =
    launch {
        LOG.logExceptions { body() }
    }
