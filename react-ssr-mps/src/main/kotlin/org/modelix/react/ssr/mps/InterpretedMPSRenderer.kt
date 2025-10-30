package org.modelix.react.ssr.mps

import com.intellij.openapi.application.EDT
import jetbrains.mps.baseLanguage.N_BooleanConstant
import jetbrains.mps.baseLanguage.N_Expression
import jetbrains.mps.baseLanguage.N_IntegerConstant
import jetbrains.mps.baseLanguage.N_StringLiteral
import jetbrains.mps.lang.core.N_BaseConcept
import jetbrains.mps.lang.structure.N_AbstractConceptDeclaration
import jetbrains.mps.smodel.adapter.MetaAdapterByDeclaration
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonNull
import kotlinx.serialization.json.JsonPrimitive
import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.metamodel.untypedConcept
import org.modelix.model.api.ConceptReference
import org.modelix.model.api.INode
import org.modelix.model.api.NodeReference
import org.modelix.model.api.getAllConcepts
import org.modelix.model.mpsadapters.MPSArea
import org.modelix.model.mpsadapters.MPSChildLink
import org.modelix.model.mpsadapters.MPSConcept
import org.modelix.model.mpsadapters.MPSWritableNode
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import org.modelix.mps.react.N_ChildrenComponent
import org.modelix.mps.react.N_ComponentNodeExpression
import org.modelix.mps.react.N_ComponentPropertyValue
import org.modelix.mps.react.N_ConceptRenderer
import org.modelix.mps.react.N_GenericReactComponent
import org.modelix.mps.react.N_IJsonValue
import org.modelix.mps.react.N_IReactComponent
import org.modelix.mps.react.N_JsFunctionPropertyValue
import org.modelix.mps.react.N_JsonArray
import org.modelix.mps.react.N_JsonObjectValue
import org.modelix.mps.react.N_PrimitivePropertyValue
import org.modelix.mps.react.N_ReactModule
import org.modelix.mps.react.N_TextComponent
import org.modelix.react.ssr.server.Component
import org.modelix.react.ssr.server.ComponentOrText
import org.modelix.react.ssr.server.GenericNodeRenderer
import org.modelix.react.ssr.server.IComponentOrList
import org.modelix.react.ssr.server.JsCode
import org.modelix.react.ssr.server.NodeRendererCall
import org.modelix.react.ssr.server.RendererCall
import org.modelix.react.ssr.server.ViewModel
import org.modelix.react.ssr.server.buildComponent
import org.modelix.react.ssr.server.buildJsonObject
import org.modelix.react.ssr.server.buildViewModel

class InterpretedMPSRenderer(
    incrementalEngine: IIncrementalEngine,
    val repository: () -> SRepository,
    nodeRef: RendererCall,
    coroutineScope: CoroutineScope,
) : GenericNodeRenderer(incrementalEngine, nodeRef, coroutineScope) {
    override fun resolveNode(nodeRef: NodeReference): INode? {
        return MPSArea(repository()).resolveNode(nodeRef)
    }

    override suspend fun <R> runWrite(body: () -> R): R {
        var result: R? = null
        withContext(Dispatchers.EDT) {
            repository().modelAccess.executeCommand {
                result = body()
            }
        }
        return result as R
    }

    override fun <R> runRead(body: () -> R): R {
        return repository().modelAccess.computeRead {
            body()
        }
    }

    override fun renderNodeEditor(node: RendererCall): ViewModel {
        return buildViewModel {
            child(renderMPSNode(node))
        }
    }

    private val findConceptComponents: () -> Map<ConceptReference, N_ConceptRenderer> = incremenentalEngine.incrementalFunction("findConceptComponents") { _ ->
        repository().modules.asSequence()
            .flatMap { it.models }
            .flatMap { it.rootNodes }
            .map { ModelixNodeAsMPSNode.toModelixNode(it).typed<N_BaseConcept>() }
            .filterIsInstance<N_ReactModule>()
            .flatMap { it.content }
            .filterIsInstance<N_ConceptRenderer>()
            .associateBy { it.concept.asConceptReference() }
    }

    private fun renderMPSNode(node: RendererCall): IComponentOrList = renderMPSNodeIncremental(node)
    private val renderMPSNodeIncremental: (RendererCall) -> IComponentOrList = incremenentalEngine.incrementalFunction("renderMPSNode") { _, call: RendererCall ->
        val node = (call as NodeRendererCall).node.asLegacyNode()
        val allComponents = findConceptComponents()

        val renderers = node.concept!!.getAllConcepts().asSequence().mapNotNull {
            allComponents[it.getReference() as ConceptReference]
        }
        val renderer = renderers.firstOrNull() // TODO resolve conflict if multiple renderers are applicable
            ?: return@incrementalFunction renderNode(call)

        val rootComponents = checkNotNull(renderer.components) { "No root component found" }
        IComponentOrList.fromSequence(rootComponents.asSequence().map { renderComponent(node, it) })
    }

    private fun renderComponent(node: INode, component: N_IReactComponent): List<IComponentOrList> = renderComponentIncremental(node, component)
    private val renderComponentIncremental: (INode, N_IReactComponent) -> List<IComponentOrList> = incremenentalEngine.incrementalFunction("renderComponent") { _, node: INode, component: N_IReactComponent ->
        try {
            when (component) {
                is N_ChildrenComponent -> {
                    val link = MPSChildLink(MetaAdapterByDeclaration.getContainmentLink((component.link.untyped().asWritableNode() as MPSWritableNode).node))
                    node.getChildren(link).map { renderMPSNode(NodeRendererCall(it.asReadableNode())) }
                }
                is N_TextComponent -> {
                    listOf(ComponentOrText(text = evaluateExpression(node, component.value.get())?.toString()))
                }
                is N_GenericReactComponent -> {
                    listOf(
                        ComponentOrText(
                            component = buildComponent(component.componentType) {
                                for (property in component.properties) {
                                    val value = property.value.get()
                                    when (value) {
                                        is N_PrimitivePropertyValue -> {
                                            val evaluatedValue = evaluateExpression(node, value.value.get())
                                            when (evaluatedValue) {
                                                null -> {}
                                                is String -> property(property.propertyName, evaluatedValue)
                                                is Number -> property(property.propertyName, evaluatedValue)
                                                is Boolean -> property(property.propertyName, evaluatedValue)
                                                is Component -> property(property.propertyName, evaluatedValue)
                                                is ComponentOrText -> property(property.propertyName, evaluatedValue)
                                                is JsonElement -> property(property.propertyName, evaluatedValue)
                                                is JsCode -> property(property.propertyName, evaluatedValue)
                                                else -> property(property.propertyName, evaluatedValue.toString())
                                            }
                                        }
                                        is N_ComponentPropertyValue -> {
                                            value.component.get()?.let { renderComponent(node, it).firstOrNull() }?.let {
                                                property(property.propertyName, it.flatten().single())
                                            }
                                        }
                                        is N_JsFunctionPropertyValue -> {}
                                        is N_IJsonValue -> {
                                            property(property.propertyName, createJsonElement(node, value))
                                        }
                                        else -> {}
                                    }
                                }

                                for (child in component.children) {
                                    child(IComponentOrList.create(renderComponent(node, child)))
                                }
                            }
                        )
                    )
                }
                else -> listOf(ComponentOrText(text = "Unknown component type: ${component.untypedConcept().getLongName()}"))
            }
        } catch (ex: Exception) {
            listOf(ComponentOrText(text = ex.message))
        }
    }

    fun createJsonElement(contextNode: INode, value: N_IJsonValue?): JsonElement = createJsonElementIncremental(contextNode, value)
    val createJsonElementIncremental: (contextNode: INode, value: N_IJsonValue?) -> JsonElement = incrementalEngine.incrementalFunction("createJsonElementIncremental") { _, contextNode, value ->
        when (value) {
            null -> JsonNull
            is N_JsonObjectValue -> {
                buildJsonObject {
                    for (member in value.members) {
                        property(member.key, createJsonElement(contextNode, member.value.get()))
                    }
                }
            }
            is N_JsonArray -> {
                JsonArray(value.elements.map { createJsonElement(contextNode, it) })
            }
            is N_PrimitivePropertyValue -> {
                val evaluatedPrimitive = evaluateExpression(contextNode, value.value.get())
                when (evaluatedPrimitive) {
                    is String -> JsonPrimitive(evaluatedPrimitive)
                    is Number -> JsonPrimitive(evaluatedPrimitive)
                    is Boolean -> JsonPrimitive(evaluatedPrimitive)
                    else -> error("Unknown json primitive type: $evaluatedPrimitive")
                }
            }
            else -> error("Unknown json element type: $value")
        }
    }

    fun evaluateExpression(contextNode: INode, expression: N_Expression?): Any? = evaluateExpressionIncremental(contextNode, expression)
    private val evaluateExpressionIncremental: (INode, N_Expression?) -> Any? = incrementalEngine.incrementalFunction("evaluateExpression") { _, contextNode: INode, expression: N_Expression? ->
        when (expression) {
            null -> null
            is N_StringLiteral -> expression.value
            is N_IntegerConstant -> expression.value
            is N_BooleanConstant -> expression.value
            is N_ComponentNodeExpression -> contextNode
            else -> null
        }
    }
}

fun N_AbstractConceptDeclaration.asConceptReference(): ConceptReference {
    return MPSConcept(MetaAdapterByDeclaration.getConcept((this.untyped().asWritableNode() as MPSWritableNode).node)).getReference()
}
