import io.github.oshai.kotlinlogging.KotlinLogging
import io.github.oshai.kotlinlogging.KotlinLoggingConfiguration
import io.github.oshai.kotlinlogging.Level
import io.ktor.http.DEFAULT_PORT
import io.ktor.http.URLBuilder
import io.ktor.http.URLProtocol
import kotlinx.browser.document
import org.modelix.editor.ssr.client.ClientSideEditorsAPI
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.asList
import org.w3c.dom.get

private val LOG = KotlinLogging.logger { }

fun main() {
    KotlinLoggingConfiguration.logLevel = Level.TRACE
    LOG.info { "App started" }

    // The RPC endpoint is served by the same server as this page.
    val currentUrl = document.location!!
    val wsUrl =
        URLBuilder()
            .apply {
                protocol = if (currentUrl.protocol.lowercase().trimEnd(':') == "http") URLProtocol.WS else URLProtocol.WSS
                host = currentUrl.hostname
                port = currentUrl.port.toIntOrNull() ?: DEFAULT_PORT
                pathSegments = listOf("rpc")
            }.buildString()
    ClientSideEditorsAPI.initWithUrl(wsUrl)

    for (editorElement in document.getElementsByClassName("modelix-text-editor").asList().filterIsInstance<HTMLDivElement>()) {
        val ref = editorElement.attributes["nodeRef"]?.value ?: continue
        ClientSideEditorsAPI.createEditor(ref, editorElement)
        LOG.trace { "Editor created for $ref" }
    }
}
