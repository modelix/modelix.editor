package org.modelix.react.ssr.mps

import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.model.SNodeReference
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.api.IReadableNode
import org.modelix.model.mpsadapters.toMPS
import org.modelix.model.mpsadapters.toModelix
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import org.modelix.mps.multiplatform.model.MPSNodeReference
import org.modelix.react.ssr.server.ComponentBuilder
import org.modelix.react.ssr.server.ComponentConstructorRef
import org.modelix.react.ssr.server.ComponentOrText
import org.modelix.react.ssr.server.IComponentOrList
import org.modelix.react.ssr.server.ICustomHandlerBuilder
import org.modelix.react.ssr.server.IJsonArray
import org.modelix.react.ssr.server.IJsonObject
import org.modelix.react.ssr.server.JsonArrayBuilder
import org.modelix.react.ssr.server.JsonObjectBuilder
import org.modelix.react.ssr.server.MessageSendingHandlerBuilder
import org.modelix.react.ssr.server.ReturnValueWithCustomHandlers

object ReactFacade {
    @JvmStatic
    fun buildJsonArray(body: JsonArrayBuilder.() -> Unit): IJsonArray =
        org.modelix.react.ssr.server
            .buildJsonArray(body)

    @JvmStatic
    fun buildJsonObject(body: JsonObjectBuilder.() -> Unit): IJsonObject =
        org.modelix.react.ssr.server
            .buildJsonObject(body)

    @JvmStatic
    fun buildComponent(
        type: String,
        body: ComponentBuilder.() -> Unit,
    ) = ComponentOrText(
        component =
            org.modelix.react.ssr.server
                .buildComponent(type, body)
    )

    @JvmStatic
    fun createComponent(vararg parameters: Any?) = IComponentOrList.Companion.create(parameters)

    @JvmStatic
    fun createComponent(text: String) = ComponentOrText(text = text)

    @JvmStatic
    fun createComponentConstructor(type: String) = ComponentConstructorRef(type)

    @JvmStatic
    fun <R> functionWithCustomHandlers(body: ICustomHandlerBuilder.() -> R): ReturnValueWithCustomHandlers<R> =
        org.modelix.react.ssr.server
            .functionWithCustomHandlers(body)

    @JvmStatic
    fun buildMessageSendingHandler(
        messageId: String,
        body: MessageSendingHandlerBuilder.() -> Unit,
    ): String =
        org.modelix.react.ssr.server
            .buildMessageSendingHandler(messageId, body)

    @JvmStatic
    fun toModelix(node: SNode?) = ModelixNodeAsMPSNode.toModelixNode(node)

    @JvmStatic
    fun toModelix(nodeRef: SNodeReference): INodeReference = nodeRef.toModelix()

    @JvmStatic
    fun toMPS(nodeRef: INodeReference): SNodeReference = MPSNodeReference.convert(nodeRef).toMPS()

    @JvmStatic
    fun toMPS(node: INode?) = ModelixNodeAsMPSNode.toMPSNode(node)

    @JvmStatic
    fun toMPS(node: IReadableNode?) = ModelixNodeAsMPSNode.toMPSNode(node)
}
