package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLogging
import io.ktor.client.HttpClient
import io.ktor.client.plugins.websocket.DefaultClientWebSocketSession
import io.ktor.client.plugins.websocket.webSocket
import io.ktor.websocket.Frame
import io.ktor.websocket.readText
import io.ktor.websocket.send
import kotlinx.browser.document
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.html.dom.append
import kotlinx.html.dom.create
import kotlinx.html.id
import kotlinx.html.js.div
import org.modelix.editor.JSKeyboardEventType
import org.modelix.editor.JSMouseEventType
import org.modelix.editor.convert
import org.modelix.editor.getAbsoluteBounds
import org.modelix.editor.getAbsoluteInnerBounds
import org.modelix.editor.relativeTo
import org.modelix.editor.ssr.common.DomTreeUpdate
import org.modelix.editor.ssr.common.ElementReference
import org.modelix.editor.ssr.common.HTMLElementBoundsUpdate
import org.modelix.editor.ssr.common.HTMLElementUpdateData
import org.modelix.editor.ssr.common.IElementUpdateData
import org.modelix.editor.ssr.common.INodeUpdateData
import org.modelix.editor.ssr.common.MessageFromClient
import org.modelix.editor.ssr.common.MessageFromServer
import org.modelix.editor.ssr.common.TextNodeUpdateData
import org.modelix.model.api.INodeReference
import org.w3c.dom.Element
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.HTMLElement
import org.w3c.dom.Node
import org.w3c.dom.asList
import org.w3c.dom.get

class ModelixSSRClient(
    private val httpClient: HttpClient,
    private val url: String,
) {
    companion object {
        private val LOG = KotlinLogging.logger {}
    }

    private val coroutineScope = CoroutineScope(Dispatchers.Default)
    private var nextEditorId: Long = 1000
    private var websocketSession: DefaultClientWebSocketSession? = null
    private val editors: MutableMap<String, EditorSession> = HashMap()

    fun sendMessage(msg: MessageFromClient) {
        websocketSession?.outgoing?.trySend(Frame.Text(msg.toJson()))
    }

    private fun MessageFromClient.send() = sendMessage(this)

    fun dispose() {
        coroutineScope.cancel("Disposed")
    }

    fun connect(callback: suspend () -> Unit = {}) {
        coroutineScope.launchLogging {
            httpClient.webSocket(urlString = url) {
                websocketSession = this
                callback()
                for (wsMessage in incoming) {
                    try {
                        when (wsMessage) {
                            is Frame.Text -> {
                                processMessage(MessageFromServer.fromJson(wsMessage.readText()))
                            }

                            else -> {}
                        }
                    } catch (ex: Throwable) {
                        LOG.error(ex) { "Failed to process message: $wsMessage" }
                    }
                }
            }
        }
    }

    fun createEditor(
        rootNodeReference: INodeReference,
        existingContainerElement: HTMLDivElement? = null,
    ): HTMLElement {
        val editorId = "modelix-editor-" + nextEditorId++.toString()
        LOG.trace { "Trying to create new editor $editorId" }
        val ws = checkNotNull(websocketSession) { "Not connected" }
        val editorSession = EditorSession(editorId, rootNodeReference, existingContainerElement)
        LOG.info { "Creating editor ${editorSession.editorId}" }
        editors[editorSession.editorId] = editorSession
        ws.launch {
            try {
                ws.send(
                    MessageFromClient(
                        editorId = editorSession.editorId,
                        rootNodeReference = rootNodeReference.serialize(),
                    ).toJson(),
                )
            } catch (ex: Throwable) {
                LOG.error(ex) { "Failed to initialized editor ${editorSession.editorId}" }
            }
        }
        return editorSession.containerElement
    }

    private fun processMessage(msg: MessageFromServer) {
        msg.error?.let { LOG.error { it } }
        msg.editorId?.let { editorId ->
            val editor = checkNotNull(editors[editorId]) { "Unknown editor ID: $editorId" }
            msg.domUpdate?.let { editor.applyUpdate(it) }
        }
    }

    private inner class EditorSession(
        val editorId: String,
        rootNodeReference: INodeReference,
        existingContainerElement: HTMLDivElement? = null,
    ) {
        val containerElement: HTMLDivElement =
            (existingContainerElement ?: document.create.div("modelix-text-editor")).also {
                it.tabIndex = -1 // allows setting the keyboard focus
            }
        val editorElement: HTMLDivElement =
            containerElement.append.div {
                id = editorId
                +"Loading ..."
            }
        private val elementMap: MutableMap<String, Element> = HashMap<String, Element>().also { it[editorId] = editorElement }
        private val pendingUpdates: MutableMap<String, IElementUpdateData> = HashMap()
        private val possiblyDetachedElements: MutableSet<String> = HashSet<String>()
        private var boundsOnServer: Map<String, HTMLElementBoundsUpdate> = emptyMap()

        init {
            containerElement.onclick = { event ->
                MessageFromClient(
                    editorId = editorId,
                    mouseEvent = event.convert(JSMouseEventType.CLICK, containerElement),
                ).withBounds().send()
            }
            containerElement.onkeydown = { event ->
                MessageFromClient(
                    editorId = editorId,
                    keyboardEvent = event.convert(JSKeyboardEventType.KEYDOWN),
                ).withBounds().send()
                event.preventDefault()
            }
            containerElement.onkeyup = { event ->
                MessageFromClient(
                    editorId = editorId,
                    keyboardEvent = event.convert(JSKeyboardEventType.KEYUP),
                ).withBounds().send()
                event.preventDefault()
            }
        }

        fun computeBoundsUpdate(): Map<String, HTMLElementBoundsUpdate>? {
            // TODO performance
            val origin = containerElement.getAbsoluteBounds()
            val latest =
                elementMap.entries.associate {
                    val outer = it.value.getAbsoluteBounds().relativeTo(origin)
                    val inner =
                        it.value
                            .getAbsoluteInnerBounds()
                            .relativeTo(origin)
                            .takeIf { it != outer }
                    it.key to HTMLElementBoundsUpdate(outer = outer, inner = inner)
                }
            val changesOnly = latest.filter { boundsOnServer[it.key] != it.value }
            boundsOnServer = latest
            return changesOnly.takeIf { it.isNotEmpty() }
        }

        fun sendBoundsUpdate() {
            val update = computeBoundsUpdate() ?: return
            MessageFromClient(editorId = editorId, boundUpdates = update).send()
        }

        private fun MessageFromClient.withBounds(): MessageFromClient {
            require(boundUpdates == null) { "Already contains bound update data" }
            return copy(boundUpdates = computeBoundsUpdate())
        }

        fun dispose() {
            containerElement.remove()
            MessageFromClient(editorId = editorId, dispose = true).send()
        }

        fun applyUpdate(update: DomTreeUpdate) {
            if (update.elements.isEmpty()) return
            LOG.trace { "($editorId) Updating DOM" }
            // this map allows updating nodes in a different order to resolve references during syncChildren
            pendingUpdates.putAll(
                update.elements.associateBy {
                    requireNotNull(it.id) { "Elements in DomTreeUpdate.elements are expected to have an ID" }
                },
            )

            for (elementUpdate in update.elements) {
                if (!pendingUpdates.containsKey(elementUpdate.id)) continue
                updateNode(elementUpdate)
            }

            possiblyDetachedElements.forEach { id ->
                val element = elementMap[id] ?: return@forEach
                if (element.parentNode == null) {
//                    elementMap.remove(id)
                }
            }
            possiblyDetachedElements.clear()

            sendBoundsUpdate()
        }

        private fun updateNode(data: INodeUpdateData): Node =
            when (data) {
                is TextNodeUpdateData -> {
                    document.createTextNode(data.text)
                }

                is HTMLElementUpdateData -> {
                    pendingUpdates.remove(data.id)
                    val element =
                        elementMap[data.id]?.takeIf { it.tagName.lowercase() == data.tagName.lowercase() }
                            ?: document.createElement(data.tagName).also { element ->
                                data.id?.let { elementId ->
                                    element.id = elementId
                                    elementMap[elementId] = element
                                }
                                syncAttributes(element, data)
                                syncChildren(element, data)
                            }
                    syncAttributes(element, data)
                    syncChildren(element, data)
                    element
                }

                is ElementReference -> {
                    pendingUpdates[data.id]?.let { updateNode(it) }
                        ?: elementMap[data.id]
                        ?: throw NoSuchElementException("$editorId: element not found: ${data.id}")
                }
            }

        private fun syncAttributes(
            element: Element,
            updateData: HTMLElementUpdateData,
        ) {
            val attributesToRemove = element.getAttributeNames().toMutableSet()
            for (attributeData in updateData.attributes) {
                if (element.getAttribute(attributeData.key) != attributeData.value) {
                    element.setAttribute(attributeData.key, attributeData.value)
                }
                attributesToRemove.remove(attributeData.key)
            }
            updateData.id?.let { id ->
                element.setAttribute("id", id)
                attributesToRemove.remove("id")
            }
            attributesToRemove.forEach(element::removeAttribute)
        }

        private fun syncChildren(
            element: Element,
            updateData: HTMLElementUpdateData,
        ) {
            val existingChildren: () -> List<Node> = { element.childNodes.asList() }
            val expectedChildren: List<Node> = updateData.children.map { updateNode(it) }
            if (existingChildren() == expectedChildren) return

            (existingChildren() - expectedChildren.toSet()).forEach {
                element.removeChild(it)
                (it as? Element)?.id?.let { possiblyDetachedElements.add(it) }
            }
            if (existingChildren() == expectedChildren) return

            for ((index, expected) in expectedChildren.withIndex()) {
                val existing = if (index < element.childNodes.length) element.childNodes[index] else null
                if (existing == null) {
                    element.appendChild(expected)
                } else if (existing != expected) {
                    element.insertBefore(expected, existing)
                }
            }
        }
    }
}
