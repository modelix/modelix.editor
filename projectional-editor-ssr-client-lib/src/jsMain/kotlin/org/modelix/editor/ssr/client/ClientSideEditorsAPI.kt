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
        val wsUrl = URLBuilder().apply {
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
        val httpClient = HttpClient(Js) {
            install(WebSockets)
        }
        client = ModelixSSRClient(httpClient, url)
    }

    fun createEditor(rootNodeReference: String, existingContainerElement: HTMLDivElement? = null): HTMLElement {
        return client.createEditor(NodeReference(rootNodeReference), existingContainerElement)
    }
}
