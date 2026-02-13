package org.modelix.scopes

import org.modelix.aspects.ILanguageAspect
import org.modelix.aspects.ILanguageAspectFactory
import org.modelix.aspects.LanguageAspectsBuilder
import org.modelix.aspects.getInstance
import org.modelix.editor.INonExistingNode
import org.modelix.editor.toNonExisting
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.ITypedReferenceLink
import org.modelix.model.api.ILanguage
import org.modelix.model.api.IReferenceLink

class ScopeAspect(
    val language: ILanguage,
) : ILanguageAspect {
    private val scopes: MutableMap<IReferenceLink, IScope> = HashMap()

    fun getScope(link: IReferenceLink): IScope? {
        // TODO allow to override the scope for a link in sub-concepts
        return scopes[link]
    }

    fun registerScope(
        link: IReferenceLink,
        scope: IScope,
    ) {
        require(link.getConcept().language == language) { "$link doesn't belong to $language" }
        scopes[link] = scope
    }

    companion object : ILanguageAspectFactory<ScopeAspect> {
        private val scopeProviders = HashSet<IScopeProvider>()

        override fun createInstance(language: ILanguage): ScopeAspect = ScopeAspect(language)

        fun getScope(
            sourceNode: INonExistingNode,
            link: IReferenceLink,
        ): IScope =
            scopeProviders.asSequence().mapNotNull { it.getScope(sourceNode, link) }.firstOrNull()
                ?: ScopeAspect.getInstance(link.getConcept().language!!).getScope(link)
                ?: EmptyScope()

        fun registerScopeProvider(provider: IScopeProvider) {
            scopeProviders.add(provider)
        }

        fun unregisterScopeProvider(provider: IScopeProvider) {
            scopeProviders.remove(provider)
        }
    }
}

interface IScopeProvider {
    fun getScope(
        sourceNode: INonExistingNode,
        link: IReferenceLink,
    ): IScope?
}

fun LanguageAspectsBuilder<*>.scope(
    link: ITypedReferenceLink<*>,
    scope: IScope,
) = aspects.getAspect(language, ScopeAspect).registerScope(link.untyped(), scope)

fun <TargetT : ITypedNode> LanguageAspectsBuilder<*>.scope(
    link: ITypedReferenceLink<TargetT>,
    scopeFunction: (INonExistingNode) -> List<TargetT>,
) = scope(link, ScopeFunction(scopeFunction))

class ScopeFunction<TargetT : ITypedNode>(
    val function: (INonExistingNode) -> List<TargetT>,
) : IScope {
    override fun getVisibleElements(
        node: INonExistingNode,
        link: IReferenceLink,
    ): List<INonExistingNode> = function(node).map { it.unwrap().toNonExisting() }
}
