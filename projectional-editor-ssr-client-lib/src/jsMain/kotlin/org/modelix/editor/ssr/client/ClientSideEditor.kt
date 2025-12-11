package org.modelix.editor.ssr.client

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.browser.document
import kotlinx.html.dom.append
import kotlinx.html.dom.create
import kotlinx.html.id
import kotlinx.html.js.div
import org.modelix.editor.JsEditorComponent
import org.w3c.dom.HTMLDivElement

private val LOG = KotlinLogging.logger {}

class ClientSideEditor(
    val editorElementId: String,
    existingContainerElement: HTMLDivElement? = null,
    val editorComponent: JsEditorComponent,
) {
    val containerElement: HTMLDivElement = (existingContainerElement ?: document.create.div("modelix-text-editor")).also {
        it.tabIndex = -1 // allows setting the keyboard focus
    }
    val editorElement: HTMLDivElement = containerElement.append.div {
        id = editorElementId
        +"Loading ..."
    }

    fun dispose() {
        // TODO call this method somewhere
        containerElement.remove()
        editorComponent.dispose()
    }
}
