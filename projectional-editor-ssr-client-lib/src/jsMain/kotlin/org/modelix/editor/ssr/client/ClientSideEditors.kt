package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import org.modelix.editor.JsEditorComponent
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.model.api.INodeReference
import org.w3c.dom.HTMLDivElement
import org.w3c.dom.HTMLElement

private val LOG = KotlinLogging.logger { }

class ClientSideEditors(
    val service: TextEditorService,
    val coroutineScope: CoroutineScope,
) {
    private val editors: MutableMap<String, ClientSideEditor> = HashMap()
    private var nextEditorId: Long = 1000

    fun createEditor(
        rootNodeReference: INodeReference,
        existingContainerElement: HTMLDivElement? = null,
        navigateToExternalNode: ((targetNode: INodeReference, rootNode: INodeReference) -> Boolean)? = null,
        selectedNode: INodeReference? = null,
    ): HTMLElement {
        val editorElementId = "modelix-editor-" + nextEditorId++.toString()
        LOG.trace { "Trying to create new editor $editorElementId" }

        val editorComponent = JsEditorComponent(service, existingContainerElement)
        editorComponent.navigateToExternalNode = navigateToExternalNode
        val opened = editorComponent.openNode(rootNodeReference)
        if (selectedNode != null) {
            // A node the editor was opened for, e.g. because a Cmd/Ctrl+click on a reference in a different editor
            // opened this one. Only selected, never navigated to: opening yet another editor for it would be a loop.
            coroutineScope.launch {
                opened.await()
                editorComponent.flush()
                if (!editorComponent.selectNode(selectedNode)) {
                    // Expected when the page shows several editors: the node is in the root node of one of them.
                    LOG.debug { "No cell found for $selectedNode in $rootNodeReference" }
                }
            }
        }

        val editorSession =
            ClientSideEditor(
                editorElementId = editorElementId,
                existingContainerElement = existingContainerElement,
                editorComponent = editorComponent
            )
        LOG.info { "Creating editor ${editorSession.editorElementId}" }
        editors[editorSession.editorElementId] = editorSession
        return editorSession.containerElement
    }
}
