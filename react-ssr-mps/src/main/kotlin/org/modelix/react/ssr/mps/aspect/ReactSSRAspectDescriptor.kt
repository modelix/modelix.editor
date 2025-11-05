package org.modelix.react.ssr.mps.aspect

import com.intellij.openapi.Disposable
import com.intellij.openapi.util.Disposer
import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.incremental.IIncrementalEngine
import org.modelix.model.api.ConceptReference
import org.modelix.model.api.INode
import org.modelix.model.mpsadapters.computeRead
import org.modelix.react.ssr.server.ConceptRendererSignature
import org.modelix.react.ssr.server.IComponentOrList
import org.modelix.react.ssr.server.NodeRendererCall
import org.modelix.react.ssr.server.RendererCall
import org.modelix.react.ssr.server.RendererSignature

class ReactSSRAspectDescriptors : Disposable {
    private val descriptorCache: DescriptorCache<IReactSSRAspectDescriptor> = DescriptorCache(IReactSSRAspectDescriptor::class.java).also { Disposer.register(this, it) }

    override fun dispose() {}

    fun findDescriptors(repository: SRepository): List<IReactSSRAspectDescriptor> {
        return repository.computeRead { repository.modules.mapNotNull { descriptorCache.getDescriptor(it, "modelix.ReactDescriptor") } }
    }
}

data class CompositeReactSSRAspectDescriptor(val descriptors: Set<IReactSSRAspectDescriptor>) : IReactSSRAspectDescriptor {
    override fun getRenderersForConcept(concept: ConceptReference): List<IReactNodeRenderer> {
        return descriptors.flatMap { it.getRenderersForConcept(concept) }
    }

    override fun getRenderers(signature: RendererSignature): List<IReactNodeRenderer> {
        return descriptors.flatMap { it.getRenderers(signature) }
    }

    override fun getPages(): List<IReactPageDescriptor> = descriptors.flatMap { it.getPages() }
}

interface IReactSSRAspectDescriptor {
    /**
     * Only for the exact concept, not for super concepts.
     */
    fun getRenderersForConcept(concept: ConceptReference): List<IReactNodeRenderer>
    fun getRenderers(signature: RendererSignature): List<IReactNodeRenderer>

    fun getPages(): List<IReactPageDescriptor>
}

abstract class ReactSSRAspectDescriptorBase : IReactSSRAspectDescriptor {
    private val renderers: MutableMap<RendererSignature, List<IReactNodeRenderer>> = HashMap()
    private val pages: MutableList<IReactPageDescriptor> = ArrayList()
    override fun getRenderersForConcept(concept: ConceptReference): List<IReactNodeRenderer> {
        return getRenderers(ConceptRendererSignature(concept))
    }
    override fun getRenderers(signature: RendererSignature): List<IReactNodeRenderer> {
        return renderers[signature] ?: emptyList()
    }

    protected fun addRenderer(concept: ConceptReference, renderer: IReactNodeRenderer) {
        addRenderer(ConceptRendererSignature(concept), renderer)
    }

    protected fun addRenderer(signature: RendererSignature, renderer: IReactNodeRenderer) {
        renderers[signature] = (renderers[signature] ?: emptyList()) + renderer
    }

    override fun getPages(): List<IReactPageDescriptor> {
        return pages
    }

    protected fun addPage(page: IReactPageDescriptor) {
        pages.add(page)
    }
}

interface IReactNodeRenderer {
    fun isApplicable(node: INode): Boolean
    fun render(node: INode, context: IRenderContext): IComponentOrList
    fun render(call: RendererCall, context: IRenderContext): IComponentOrList
}

interface IRenderContext {
    fun getIncrementalEngine(): IIncrementalEngine
    fun renderNode(node: INode): IComponentOrList = callRenderer(NodeRendererCall(node.asReadableNode()))
    fun callRenderer(call: RendererCall): IComponentOrList
    fun getState(id: String, defaultValue: String?): String?
    fun setState(id: String, value: String?): String?
    fun getState(id: String, defaultValue: Boolean): Boolean
    fun setState(id: String, value: Boolean): Boolean
}
