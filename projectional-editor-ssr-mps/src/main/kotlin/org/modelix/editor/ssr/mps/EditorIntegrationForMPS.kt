package org.modelix.editor.ssr.mps

import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.constraints.ConstraintsAspect
import org.modelix.editor.EditorEngine
import org.modelix.model.api.ILanguageRepository
import org.modelix.model.mpsadapters.MPSChangeTranslator
import org.modelix.model.mpsadapters.MPSLanguageRepository
import org.modelix.scopes.ScopeAspect

class EditorIntegrationForMPS(
    val editorEngine: EditorEngine,
) {
    private var aspectsFromMPS: LanguageAspectsFromMPSModules? = null
    private var mpsChangeTranslator: MPSChangeTranslator? = null
    private var mpsLanguageRepository: MPSLanguageRepository? = null

    fun init(repository: SRepository) {
        mpsLanguageRepository = MPSLanguageRepository(repository)
        ILanguageRepository.register(mpsLanguageRepository!!)
        mpsChangeTranslator = MPSChangeTranslator()
        mpsChangeTranslator!!.start(repository)
        aspectsFromMPS = LanguageAspectsFromMPSModules(repository)
        ScopeAspect.registerScopeProvider(MPSScopeProvider)
        ConstraintsAspect.checkers.add(MPSConstraints)
        editorEngine.addRegistry(aspectsFromMPS!!)
    }

    fun dispose() {
        mpsLanguageRepository?.let { ILanguageRepository.unregister(it) }
        mpsLanguageRepository = null

        ScopeAspect.unregisterScopeProvider(MPSScopeProvider)
        ConstraintsAspect.checkers.remove(MPSConstraints)
    }
}
