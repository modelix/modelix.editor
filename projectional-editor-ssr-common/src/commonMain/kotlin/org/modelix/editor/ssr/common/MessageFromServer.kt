package org.modelix.editor.ssr.common

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
class MessageFromServer(
    /**
     * Multiple editor components can use the same websocket connection. This ID distinguishes them.
     *
     * @see MessageFromClient.editorId
     */
    val editorId: String? = null,
    /**
     * The server is responsible for computing the resulting DOM tree and sending incremental updates to the client.
     */
    val domUpdate: DomTreeUpdate? = null,
    /**
     * An exception was thrown on the server side.
     */
    val error: String? = null,
) {
    fun toJson() = Json.encodeToString(this)

    companion object {
        fun fromJson(msg: String) = Json.decodeFromString<MessageFromServer>(msg)
    }
}

@Serializable
data class DomTreeUpdate(
    val elements: List<HTMLElementUpdateData> = emptyList(),
)

@Serializable
sealed interface INodeUpdateData

@Serializable
sealed interface IElementUpdateData : INodeUpdateData {
    val id: String?
}

@Serializable
@SerialName("Text")
data class TextNodeUpdateData(
    val text: String,
) : INodeUpdateData

@Serializable
@SerialName("HTMLElement")
data class HTMLElementUpdateData(
    override val id: String? = null,
    val tagName: String,
    val attributes: Map<String, String> = emptyMap(),
    val children: List<INodeUpdateData>,
) : IElementUpdateData

@Serializable
@SerialName("ref")
data class ElementReference(
    override val id: String,
) : IElementUpdateData
