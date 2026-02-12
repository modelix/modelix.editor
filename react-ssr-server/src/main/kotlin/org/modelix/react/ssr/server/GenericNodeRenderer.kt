package org.modelix.react.ssr.server

import kotlinx.coroutines.CoroutineScope
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.booleanOrNull
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.model.api.NodeReference
import org.modelix.model.api.toSerialized

abstract class GenericNodeRenderer(
    val incremenentalEngine: IIncrementalEngine,
    private val nodeRef: RendererCall,
    val coroutineScope: CoroutineScope,
) : RendererBase() {
    init {
        registerMessageHandler("changeProperty") { message ->
            val serializedNodeRef = message.getStringProperty("node")!!
            val propertyRef = message.getStringProperty("property")!!
            val value = message.getStringProperty("value")
            runWrite {
                val node = resolveNode(NodeReference(serializedNodeRef)) ?: return@runWrite
                val property = node.concept?.getAllProperties()?.find { it.getUID() == propertyRef } ?: return@runWrite
                node.setPropertyValue(property, value)
            }
        }
    }

    abstract override fun <R> runRead(body: () -> R): R

    abstract fun resolveNode(nodeRef: NodeReference): INode?

    override fun doRender(): ViewModel =
        try {
            runRead {
                when (nodeRef) {
                    is NodeRefRendererCall -> {
                        val node = requireNotNull(resolveNode(nodeRef.node.toSerialized())) { "Node not found: $nodeRef" }
                        renderNodeEditor(NodeRendererCall(node.asReadableNode()))
                    }

                    else -> {
                        renderNodeEditor(nodeRef)
                    }
                }
            }
        } catch (ex: Exception) {
            renderError("Failed loading $nodeRef: " + ex.message + "\n" + ex.stackTraceToString())
        }

    fun renderError(message: String): ViewModel =
        buildViewModel {
            component("mui.Alert") {
                property("severity", "error")
                component("html.pre") {
                    text(message)
                }
            }
        }

    open fun renderNodeEditor(node: RendererCall): ViewModel =
        buildViewModel {
            child(renderNode(node))
        }

    fun renderNode(node: RendererCall): ComponentOrText = renderNodeIncremental(node)

    private val renderNodeIncremental =
        incremenentalEngine.incrementalFunction("renderNode") { _, call: RendererCall ->
            if (call !is NodeRendererCall) return@incrementalFunction ComponentOrText(text = "renderer not found for $call")
            val node = call.node.asLegacyNode()
            val text =
                (node.concept?.getShortName().toString()) +
                    " [" +
                    node.getAllProperties().joinToString(", ") { "${it.first.getSimpleName()}=${it.second}" } +
                    "]"

            val nodeId = node.reference.serialize()
            val stateId = "accordion-expanded-" + nodeId
            val isExpanded = (allStates[stateId] as? JsonPrimitive)?.booleanOrNull ?: false

            return@incrementalFunction buildComponent("mui.Accordion") {
                key(nodeId)

                messageSendingHandler("onChange", "changeState") {
                    inputParameter("event")
                    inputParameter("isExpanded")
                    constantParameter("key", stateId)
                    codeParameter("value", """isExpanded""")
                }

                component("mui.AccordionSummary") {
                    componentProperty("expandIcon", "mui.icons.ExpandMore") {}
                    text(text)
                }
                component("mui.AccordionDetails") {
                    if (isExpanded) {
                        renderProperties(node)

                        for (link in node.concept!!.getAllReferenceLinks()) {
                            fun createEntry(target: INode): JsonObject {
                                val label =
                                    target.getAllProperties().find { it.first.getSimpleName() == "name" }?.second
                                        ?: target.reference.serialize()
                                return buildJsonObject {
                                    property("label", label)
                                    property("target", target.reference.serialize())
                                }
                            }
                            val target = node.getReferenceTarget(link)
                            val entries = listOfNotNull(target).map { createEntry(it) }
                            component("modelix.ReferenceTargetChooser") {
                                property("linkName", link.getSimpleName())
                                target?.let { property("selected", createEntry(it)) }
                                property("entries", JsonArray(entries))
                            }
                        }

                        for (child in node.allChildren) {
                            child(renderNode(NodeRendererCall(child.asReadableNode())))
                        }
                    } else {
                        component("mui.Stack") {
                            property("spacing", 1)
                            component("mui.Skeleton") {
                                property("variant", "rectangular")
                                property("width", 300)
                                property("height", 50)
                            }
                            component("mui.Skeleton") {
                                property("variant", "rectangular")
                                property("width", 300)
                                property("height", 50)
                            }
                        }
                    }
                }
            }.let { ComponentOrText(component = it) }
        }

    private fun ComponentBuilder.renderProperties(node: INode) {
        component("mui.Paper") {
            component("mui.TableContainer") {
                component("mui.Table") {
                    component("mui.TableBody") {
                        for (property in node.getPropertyLinks()) {
                            renderProperty(node, property)
                        }
                    }
                }
            }
        }
    }

    private fun ComponentBuilder.renderProperty(
        node: INode,
        property: IProperty,
    ) {
        val value = node.getPropertyValue(property)
        component("mui.TableRow") {
            key(property.getUID())
            component("mui.TableCell") {
                text(property.getSimpleName())
            }
            component("mui.TableCell") {
                component("mui.TextField") {
                    property("label", property.getSimpleName())
                    property("value", value ?: "")
                    jsonObjectProperty("sx") {
                        property("minWidth", "300px")
                    }

                    messageSendingHandler("onChange", "changeProperty") {
                        inputParameter("event")
                        constantParameter("node", node.reference.serialize())
                        constantParameter("property", property.getUID())
                        codeParameter("value", """event.target.value""")
                    }
                }
            }
        }
    }
}
