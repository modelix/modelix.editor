package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.coroutines.CoroutineScope
import org.modelix.editor.JsEditorComponent
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.model.api.INodeReference
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.HTMLElement

private val LOG = KotlinLogging.logger { }

class ClientSideEditors(val service: TextEditorService, val coroutineScope: CoroutineScope) {

    private val editors: MutableMap<String, ClientSideEditor> = HashMap()
    private var nextEditorId: Long = 1000

    fun createEditor(rootNodeReference: INodeReference, existingContainerElement: HTMLDivElement? = null): HTMLElement {
        val editorElementId = "modelix-editor-" + nextEditorId++.toString()
        LOG.trace { "Trying to create new editor $editorElementId" }

        val editorComponent = JsEditorComponent(service)
        editorComponent.openNode(rootNodeReference)

        val editorSession = ClientSideEditor(
            editorElementId = editorElementId,
            existingContainerElement = existingContainerElement,
            editorComponent = editorComponent
        )
        LOG.info { "Creating editor ${editorSession.editorElementId}" }
        editors[editorSession.editorElementId] = editorSession
        return editorSession.containerElement
    }
}
