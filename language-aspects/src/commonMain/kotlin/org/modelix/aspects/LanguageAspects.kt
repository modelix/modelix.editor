package org.modelix.aspects

import org.modelix.model.api.ContextValue
import org.modelix.model.api.ILanguage

class LanguageAspects {
    private val aspects: MutableMap<String, MutableMap<ILanguageAspectFactory<*>, ILanguageAspect>> = HashMap()

    fun <T : ILanguageAspect> getAspect(language: ILanguage, factory: ILanguageAspectFactory<T>): T {
        return aspects.getOrPut(language.getUID(), { HashMap() }).getOrPut(factory, { factory.createInstance(language) }) as T
    }

    fun getAspects(language: ILanguage): List<ILanguageAspect> = aspects[language.getUID()]?.values?.toList() ?: emptyList()

    companion object {
        private val contextInstance: ContextValue<LanguageAspects> = ContextValue(LanguageAspects())
        fun getInstanceFromContext(): LanguageAspects = contextInstance.getValue()
            ?: throw IllegalStateException("No instance available")
        fun <T> runWithInstance(instance: LanguageAspects, body: () -> T): T {
            return contextInstance.computeWith(instance, body)
        }
    }
}