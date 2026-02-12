package org.modelix.aspects

import org.modelix.model.api.ILanguage

interface ILanguageAspect

interface ILanguageAspectFactory<AspectT : ILanguageAspect> {
    fun createInstance(language: ILanguage): AspectT
}

fun <AspectT : ILanguageAspect> ILanguageAspectFactory<AspectT>.getInstances(): List<AspectT> =
    LanguageAspects.getInstanceFromContext().getAllAspectInstances(this)

fun <AspectT : ILanguageAspect> ILanguageAspectFactory<AspectT>.getInstance(language: ILanguage): AspectT =
    LanguageAspects.getInstanceFromContext().getAspect(language, this)
