package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLogging
import io.ktor.client.HttpClient
import kotlinx.browser.document
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.html.dom.append
import kotlinx.html.dom.create
import kotlinx.html.id
import kotlinx.html.js.div
import kotlinx.rpc.krpc.ktor.client.KtorRpcClient
import kotlinx.rpc.krpc.ktor.client.rpc
import kotlinx.rpc.krpc.ktor.client.rpcConfig
import kotlinx.rpc.withService
import org.modelix.editor.FrontendEditorComponent
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.JSMouseEventType
import org.modelix.editor.convert
import org.modelix.editor.text.shared.EditorId
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.model.api.INodeReference
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.HTMLElement
import kotlin.js.json

class ModelixSSRClient(
    private val httpClient: HttpClient,
    private val url: String,
) {
    companion object {
        private val LOG = KotlinLogging.logger {}
    }

    private val coroutineScope = CoroutineScope(Dispatchers.Default)
    private var nextEditorId: Long = 1000
    private var editorService: TextEditorService? = null
    private val editors: MutableMap<EditorId, FrontendEditorComponent> = HashMap()

    fun dispose() {
        coroutineScope.cancel("Disposed")
    }

    fun connect(callback: suspend () -> Unit = {}) {
        coroutineScope.launchLogging {
            val rpcClient: KtorRpcClient =
                httpClient.rpc(urlString = url) {
                    rpcConfig {
                        serialization {
                            json()
                        }
                    }
                }
            editorService = rpcClient.withService<TextEditorService>()
            callback()
        }
    }

    fun createEditor(
        rootNodeReference: INodeReference,
        existingContainerElement: HTMLDivElement? = null,
    ): HTMLElement {
        val editorId = "modelix-editor-" + nextEditorId++.toString()
        LOG.trace { "Trying to create new editor $editorId" }
        val editorService = checkNotNull(editorService) { "Not connected" }

        val containerElement: HTMLDivElement =
            (existingContainerElement ?: document.create.div("modelix-text-editor")).also {
                it.tabIndex = -1 // allows setting the keyboard focus
            }
        val editorElement: HTMLDivElement =
            containerElement.append.div {
                id = editorId
                +"Loading ..."
            }

        val editorComponent = FrontendEditorComponent(editorService)

        containerElement.onclick = { event ->
            editorComponent.enqueueUIEvent(event.convert(JSMouseEventType.CLICK, containerElement))
        }
        containerElement.onkeydown = { event ->
            editorComponent.enqueueUIEvent(event.convert(JSKeyboardEventType.KEYDOWN))
            event.preventDefault()
        }
        containerElement.onkeyup = { event ->
            editorComponent.enqueueUIEvent(event.convert(JSKeyboardEventType.KEYUP))
            event.preventDefault()
        }

        editorComponent.openNode(rootNodeReference)
        LOG.info { "Creating editor ${editorComponent.editorId}" }
        editors[editorComponent.editorId] = editorComponent
        return containerElement
    }
}
