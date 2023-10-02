package org.modelix.aspects

import org.modelix.model.api.ILanguage

fun <LanguageT : ILanguage> languageAspects(language: LanguageT, body: LanguageAspectsBuilder<LanguageT>.()->Unit): LanguageAspectsBuilder<LanguageT> {
    return LanguageAspectsBuilder(LanguageAspects.getInstanceFromContext(), language).also(body)
}

class LanguageAspectsBuilder<LanguageT : ILanguage>(val aspects: LanguageAspects, val language: LanguageT) {
    fun <T : ILanguageAspect> getAspect(factory: ILanguageAspectFactory<T>): T {
        return aspects.getAspect(language, factory)
    }
}