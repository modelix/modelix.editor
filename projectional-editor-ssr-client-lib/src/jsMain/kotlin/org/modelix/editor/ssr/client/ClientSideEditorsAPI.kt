package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLoggingConfiguration
import io.github.oshai.kotlinlogging.Level
import io.ktor.client.HttpClient
import io.ktor.client.engine.js.Js
import io.ktor.client.plugins.websocket.WebSockets
import io.ktor.http.DEFAULT_PORT
import io.ktor.http.URLBuilder
import io.ktor.http.URLProtocol
import io.ktor.http.encodedPath
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
    private const val TEXT_EDITOR_PORT = 43593
    private val PROXY_PORT_PATH = Regex("^(.*?/port/)[0-9]+/")

    private lateinit var client: ModelixSSRClient

    fun init() {
        console.log("Platform Browser: " + PlatformUtils.IS_BROWSER)
        console.log("ClientSideEditorsAPI.init()")
        println("ClientSideEditorsAPI.init()")
        KotlinLoggingConfiguration.logLevel = Level.TRACE
        val currentUrl = document.location!!
        // Behind the proxy of a workspace instance, which forwards `.../port/<port>/...` to that port of the instance,
        // other ports aren't reachable directly. The text editor server is then addressed by its port in the path.
        val proxyPathPrefix = PROXY_PORT_PATH.find(currentUrl.pathname)?.groupValues?.get(1)
        val wsUrl =
            URLBuilder()
                .apply {
                    protocol = if (currentUrl.protocol.lowercase().trimEnd(':') == "http") URLProtocol.WS else URLProtocol.WSS
                    host = currentUrl.hostname
                    if (proxyPathPrefix == null) {
                        port = TEXT_EDITOR_PORT
                        encodedPath = "/rpc"
                    } else {
                        port = currentUrl.port.toIntOrNull() ?: DEFAULT_PORT
                        encodedPath = "$proxyPathPrefix$TEXT_EDITOR_PORT/rpc"
                    }
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
