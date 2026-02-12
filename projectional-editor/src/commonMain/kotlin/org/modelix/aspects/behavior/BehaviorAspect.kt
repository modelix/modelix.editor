package org.modelix.aspects.behavior

import org.modelix.aspects.ILanguageAspect
import org.modelix.aspects.ILanguageAspectFactory
import org.modelix.model.api.ILanguage

class BehaviorAspect : ILanguageAspect {
    companion object : ILanguageAspectFactory<BehaviorAspect> {
        override fun createInstance(language: ILanguage): BehaviorAspect = BehaviorAspect()
    }
}
