package org.modelix.react.ssr.mps

import com.intellij.openapi.Disposable
import com.intellij.openapi.application.EDT
import com.intellij.openapi.util.Disposer
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.booleanOrNull
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.TrackableValue
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.ConceptReference
import org.modelix.model.api.INode
import org.modelix.model.api.INodeResolutionScope
import org.modelix.model.api.NodeReference
import org.modelix.model.api.getAllConcepts
import org.modelix.model.mpsadapters.MPSArea
import org.modelix.model.mpsadapters.MPSRepositoryAsNode
import org.modelix.model.mpsadapters.computeRead
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import org.modelix.react.ssr.mps.aspect.CompositeReactSSRAspectDescriptor
import org.modelix.react.ssr.mps.aspect.IReactNodeRenderer
import org.modelix.react.ssr.mps.aspect.IReactSSRAspectDescriptor
import org.modelix.react.ssr.mps.aspect.IRenderContext
import org.modelix.react.ssr.mps.aspect.ReactSSRAspectDescriptors
import org.modelix.react.ssr.server.GenericNodeRenderer
import org.modelix.react.ssr.server.IComponentOrList
import org.modelix.react.ssr.server.IRenderer
import org.modelix.react.ssr.server.IRendererFactory
import org.modelix.react.ssr.server.MessageFromClient
import org.modelix.react.ssr.server.NamedRendererCall
import org.modelix.react.ssr.server.NamedRendererSignature
import org.modelix.react.ssr.server.NodeRefRendererCall
import org.modelix.react.ssr.server.NodeRendererCall
import org.modelix.react.ssr.server.RendererCall
import org.modelix.react.ssr.server.ViewModel
import org.modelix.react.ssr.server.buildViewModel

class MPSRendererFactory(val repository: () -> SRepository) : IRendererFactory, Disposable {
    val useInterpreter = TrackableValue<Boolean>(false)
    private val descriptors = ReactSSRAspectDescriptors().also { Disposer.register(this, it) }

    override fun dispose() {}

    override fun createRenderer(
        incrementalEngine: IIncrementalEngine,
        nodeRef: RendererCall,
        parameters: Map<String, List<String>>,
        coroutineScope: CoroutineScope,
    ): GenericNodeRenderer {
        return if (useInterpreter.getValue()) {
            InterpretedMPSRenderer(incrementalEngine, repository, nodeRef, coroutineScope)
        } else {
            CompiledMPSRenderer(incrementalEngine, repository, nodeRef, coroutineScope, descriptors)
        }
    }

    override fun createPageRenderer(
        incrementalEngine: IIncrementalEngine,
        pathParts: List<String>,
        parameters: Map<String, List<String>>,
        coroutineScope: CoroutineScope,
    ): IRenderer {
        // Don't do any model access here because it will result in deadlocks.
        return PageRenderer(incrementalEngine, pathParts, parameters, coroutineScope)
    }

    inner class PageRenderer(
        val incrementalEngine: IIncrementalEngine,
        val pathParts: List<String>,
        val parameters: Map<String, List<String>>,
        val coroutineScope: CoroutineScope,
    ) : IRenderer {
        override fun <R> runRead(body: () -> R): R {
            return repository().computeRead(body)
        }

        fun createRootRenderer(): IRenderer? {
            val repository = repository()
            val pages = descriptors.findDescriptors(repository).flatMap { it.getPages() }
            for (page in pages) {
                val match = page.getPath().match(pathParts) ?: continue
                return repository.modelAccess.computeRead {
                    INodeResolutionScope.runWithAdditionalScope(MPSArea(repository)) {
                        createRenderer(incrementalEngine, page.getRoot(MPSRepositoryAsNode(repository), match), parameters, coroutineScope)
                    }
                }
            }
            return null
        }

        override fun render(): ViewModel {
            val renderer = createRootRenderer()
            return if (renderer == null) {
                buildViewModel { text("Page not found: $pathParts") }
            } else {
                renderer.render()
            }
        }

        override suspend fun messageReceived(message: MessageFromClient) {
            createRootRenderer()?.messageReceived(message)
        }
    }
}

class CompiledMPSRenderer(
    val incrementalEngine: IIncrementalEngine,
    val repository: () -> SRepository,
    root: RendererCall,
    coroutineScope: CoroutineScope,
    val descriptors: ReactSSRAspectDescriptors,
) : GenericNodeRenderer(incrementalEngine, root, coroutineScope) {
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

    fun getDescriptor() = CompositeReactSSRAspectDescriptor(descriptors.findDescriptors(repository()).toSet())

    override fun renderNodeEditor(node: RendererCall): ViewModel {
        return buildViewModel {
            child(renderMPSNode(node, getDescriptor()))
        }
    }

    private fun resolveRenderers(call: RendererCall, descriptor: IReactSSRAspectDescriptor): List<IReactNodeRenderer> = when (call) {
        is NodeRendererCall -> {
            call.node.getConcept().getAllConcepts().flatMap {
                descriptor.getRenderersForConcept(it.getReference() as ConceptReference).filter { it.isApplicable(call.node.asLegacyNode()) }
            }
        }
        is NamedRendererCall -> {
            descriptor.getRenderers(NamedRendererSignature(call.id))
        }
        is NodeRefRendererCall -> {
            val node = MPSArea(repository()).asModel().resolveNode(call.node)
            resolveRenderers(NodeRendererCall(node), descriptor)
        }
    }

    private fun <T> ensureIsTracked(obj: T): T {
        return when (obj) {
            is NodeRendererCall -> obj.copy(node = ensureIsTracked(obj.node))
            is NamedRendererCall -> obj.copy(parameterValues = ensureIsTracked(obj.parameterValues))
            is SNode -> ModelixNodeAsMPSNode.ensureIsTracked(obj)
            is List<*> -> obj.map { ensureIsTracked(it) }
            else -> obj
        } as T
    }

    fun renderMPSNode(call: RendererCall, descriptor: IReactSSRAspectDescriptor): IComponentOrList = renderMPSNodeIncremental(call, descriptor)
    private val renderMPSNodeIncremental: (RendererCall, IReactSSRAspectDescriptor) -> IComponentOrList = incremenentalEngine.incrementalFunction("renderMPSNode") { _, call: RendererCall, descriptor: IReactSSRAspectDescriptor ->
        if (call is NodeRefRendererCall) {
            val node = MPSArea(repository()).asModel().resolveNode(call.node)
            return@incrementalFunction renderMPSNode(NodeRendererCall(node), descriptor)
        }

        val call = ensureIsTracked(call)

        val renderers = resolveRenderers(call, descriptor)
        val renderer = renderers.firstOrNull() // TODO resolve conflict if multiple renderers are applicable
            ?: return@incrementalFunction renderNode(call)
        val context = object : IRenderContext {
            override fun getIncrementalEngine(): IIncrementalEngine = incrementalEngine

            override fun callRenderer(call: RendererCall): IComponentOrList {
                return renderMPSNode(call, descriptor)
            }

            override fun getState(id: String, defaultValue: Boolean): Boolean {
                return (allStates[id] as? JsonPrimitive)?.booleanOrNull ?: defaultValue
            }

            override fun getState(id: String, defaultValue: String?): String? {
                return (allStates[id] as? JsonPrimitive)?.content ?: defaultValue
            }

            override fun setState(id: String, value: String?): String? {
                if (value == null) {
                    allStates.remove(id)
                } else {
                    allStates[id] = JsonPrimitive(value)
                }
                return value
            }

            override fun setState(id: String, value: Boolean): Boolean {
                allStates[id] = JsonPrimitive(value)
                return value
            }
        }
        renderer.render(call, context)
    }
}
