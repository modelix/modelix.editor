package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLoggingConfiguration
import io.github.oshai.kotlinlogging.Level
import io.ktor.client.HttpClient
import io.ktor.client.engine.js.Js
import io.ktor.client.plugins.websocket.WebSockets
import io.ktor.http.URLBuilder
import io.ktor.http.URLProtocol
import io.ktor.util.PlatformUtils
import kotlinx.browser.document
import kotlinx.rpc.krpc.ktor.client.installKrpc
import kotlinx.rpc.krpc.serialization.json.json
import org.modelix.model.api.NodeReference
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.HTMLElement

@OptIn(ExperimentalJsExport::class)
@JsExport
object ClientSideEditorsAPI {
    private lateinit var client: ModelixSSRClient

    fun init() {
        console.log("Platform Browser: " + PlatformUtils.IS_BROWSER)
        console.log("ClientSideEditorsAPI.init()")
        println("ClientSideEditorsAPI.init()")
        KotlinLoggingConfiguration.logLevel = Level.TRACE
        val currentUrl = document.location!!
        val wsUrl =
            URLBuilder()
                .apply {
                    protocol = if (currentUrl.protocol.lowercase().trimEnd(':') == "http") URLProtocol.WS else URLProtocol.WSS
                    host = currentUrl.hostname
                    port = 43593 // currentUrl.port.toIntOrNull() ?: io.ktor.http.DEFAULT_PORT
                    pathSegments = listOf("rpc")
                }.buildString()
        console.log("Text editor URL: $wsUrl")
        initWithUrl(wsUrl)
    }

    fun initWithUrl(url: String) {
        println("ClientSideEditorsAPI.initWithUrl($url)")
        val httpClient =
            HttpClient(Js) {
                install(WebSockets)
                installKrpc {
                    serialization { json() }
                }
            }
        client = ModelixSSRClient(httpClient, url)
    }

    /**
     * @param navigateToExternalNode called when a Cmd/Ctrl+click on a reference points to a node outside the opened
     *   root node. It receives the serialized reference of the node to navigate to and of the root node that has to
     *   be opened to show it, and returns whether it navigated there. The editor opens that root node itself if the
     *   host application doesn't handle it.
     * @param selectedNode the serialized reference of a node inside the opened root node to put the selection on.
     */
    fun createEditor(
        rootNodeReference: String,
        existingContainerElement: HTMLDivElement? = null,
        navigateToExternalNode: ((targetNode: String, rootNode: String) -> Boolean)? = null,
        selectedNode: String? = null,
    ): HTMLElement =
        client.createEditor(
            rootNodeReference = NodeReference(rootNodeReference),
            existingContainerElement = existingContainerElement,
            navigateToExternalNode =
                navigateToExternalNode?.let { handler ->
                    { targetNode, rootNode -> handler(targetNode.serialize(), rootNode.serialize()) }
                },
            selectedNode = selectedNode?.let { NodeReference(it) },
        )
}
