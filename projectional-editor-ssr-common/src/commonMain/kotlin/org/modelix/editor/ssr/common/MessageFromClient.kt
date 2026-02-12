package org.modelix.editor.ssr.common

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.modelix.editor.Bounds
import org.modelix.editor.JSKeyboardEvent
import org.modelix.editor.JSMouseEvent

@Serializable
data class MessageFromClient(
    /**
     * Allows using the same websocket connection for multiple editors. The client is responsible for choosing an ID
     * when creating a new editor component.
     */
    val editorId: String? = null,
    /**
     * The node to open in the editor. The first message containing a new `editorId` will instantiate
     * an editor component on the server side and should always specify the root node.
     */
    val rootNodeReference: String? = null,
    /**
     * When the editor component is not used anymore, the client can set this flag to free resources on the server and
     * stop getting updates for it.
     */
    val dispose: Boolean = false,
    /**
     * The user pressed a key on the client side that should be processed by the editor component.
     */
    val keyboardEvent: JSKeyboardEvent? = null,
    val mouseEvent: JSMouseEvent? = null,
    val boundUpdates: Map<String, HTMLElementBoundsUpdate>? = null,
) {
    fun toJson() = Json.encodeToString(this)

    companion object {
        fun fromJson(msg: String) = Json.decodeFromString<MessageFromClient>(msg)
    }
}

@Serializable
data class HTMLElementBoundsUpdate(
    val outer: Bounds,
    val inner: Bounds? = null,
)
