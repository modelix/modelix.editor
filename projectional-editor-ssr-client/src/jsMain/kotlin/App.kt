import io.github.oshai.kotlinlogging.KotlinLogging
import io.github.oshai.kotlinlogging.KotlinLoggingConfiguration
import io.github.oshai.kotlinlogging.Level
import io.ktor.client.HttpClient
import io.ktor.client.plugins.websocket.WebSockets
import io.ktor.http.DEFAULT_PORT
import io.ktor.http.URLBuilder
import io.ktor.http.URLProtocol
import kotlinx.browser.document
import org.modelix.editor.ssr.client.ModelixSSRClient
import org.modelix.model.api.NodeReference
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.asList
import org.w3c.dom.get

private val LOG = KotlinLogging.logger { }

fun main() {
    KotlinLoggingConfiguration.logLevel = Level.TRACE
    LOG.info { "App started" }

    val httpClient =
        HttpClient {
            install(WebSockets)
        }

    LOG.trace { "Coroutine in GlobalScope started" }
    val currentUrl = document.location!!
    val wsUrl =
        URLBuilder()
            .apply {
                protocol = if (currentUrl.protocol.lowercase().trimEnd(':') == "http") URLProtocol.WS else URLProtocol.WSS
                host = currentUrl.hostname
                port = currentUrl.port.toIntOrNull() ?: DEFAULT_PORT
                pathSegments = listOf("ws")
            }.buildString()
    val client = ModelixSSRClient(httpClient, wsUrl)
    client.connect {
        LOG.trace { "Connected" }

        for (editorElement in document.getElementsByClassName("modelix-text-editor").asList().filterIsInstance<HTMLDivElement>()) {
            val ref = editorElement.attributes["nodeRef"]?.value ?: continue
            val editorDom = client.createEditor(NodeReference(ref), editorElement)
            LOG.trace { "Editor created for $ref" }
        }
    }
}
