import io.github.oshai.kotlinlogging.KotlinLogging
import io.github.oshai.kotlinlogging.KotlinLoggingConfiguration
import io.github.oshai.kotlinlogging.Level
import kotlinx.browser.document
import org.modelix.editor.ssr.client.ClientSideEditorsAPI
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.asList
import org.w3c.dom.get
import org.w3c.dom.url.URL

private val LOG = KotlinLogging.logger { }

fun main() {
    KotlinLoggingConfiguration.logLevel = Level.TRACE
    LOG.info { "App started" }

    // The RPC endpoint is served by the same server as this page. It's resolved against the base URL of the page,
    // which points to the root of the server, because the server may be behind a proxy that adds a path prefix.
    val wsUrl = URL("rpc", document.baseURI)
    wsUrl.protocol = if (wsUrl.protocol == "https:") "wss:" else "ws:"
    ClientSideEditorsAPI.initWithUrl(wsUrl.href)

    for (editorElement in document.getElementsByClassName("modelix-text-editor").asList().filterIsInstance<HTMLDivElement>()) {
        val ref = editorElement.attributes["nodeRef"]?.value ?: continue
        ClientSideEditorsAPI.createEditor(ref, editorElement)
        LOG.trace { "Editor created for $ref" }
    }
}
