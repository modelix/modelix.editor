package org.modelix.editor.ssr.mps

import com.intellij.openapi.application.ApplicationManager
import io.github.oshai.kotlinlogging.KotlinLogging
import jetbrains.mps.classloading.DeployListener
import jetbrains.mps.ide.MPSCoreComponents
import jetbrains.mps.module.ReloadableModule
import org.jetbrains.mps.openapi.module.SRepository
import org.jetbrains.mps.openapi.util.ProgressMonitor
import org.modelix.aspects.ILanguageAspect
import org.modelix.editor.ConceptEditor
import org.modelix.editor.EditorAspect
import org.modelix.editor.IConceptEditorRegistry
import org.modelix.model.api.IConceptReference

private val LOG = KotlinLogging.logger { }

class LanguageAspectsFromMPSModules(
    val repository: SRepository,
) : IConceptEditorRegistry {
    private var loadedAspects: Map<ILanguageAspectsDescriptor, List<ILanguageAspect>> = emptyMap()
    private var conceptEditors: Map<IConceptReference, List<ConceptEditor>> = emptyMap()
    private var needsUpdate = true
    private val classLoaderManager = ApplicationManager.getApplication().getComponent(MPSCoreComponents::class.java).classLoaderManager
    private val deployListener =
        object : DeployListener {
            override fun onLoaded(
                loadedModules: MutableSet<ReloadableModule>,
                monitor: ProgressMonitor,
            ) {
                needsUpdate = true
            }

            override fun onUnloaded(
                unloadedModules: MutableSet<ReloadableModule>,
                monitor: ProgressMonitor,
            ) {
                needsUpdate = true
            }

            override fun onUnloaded(
                callback: DeployListener.ResourceTrackerCallback,
                monitor: ProgressMonitor,
            ) {
                needsUpdate = true
            }
        }

    init {
        classLoaderManager.addListener(deployListener)
    }

    fun dispose() {
        classLoaderManager.removeListener(deployListener)
    }

    private fun updateDescriptors() {
        needsUpdate = false
        val oldAspects = loadedAspects
        val newDescriptors =
            repository.modules
                .filterIsInstance<ReloadableModule>()
                .mapNotNull { module ->
                    try {
                        val moduleName = module.moduleName ?: return@mapNotNull null
                        val descriptorClass =
                            try {
                                module.getOwnClass(moduleName + ".modelix.AspectsDescriptor")
                            } catch (ex: ClassNotFoundException) {
                                return@mapNotNull null
                            }
                        descriptorClass.getField("INSTANCE").get(null) as ILanguageAspectsDescriptor
                    } catch (ex: Exception) {
                        LOG.error(ex) { "Failed to load descriptor from ${module.moduleName}" }
                        null
                    }
                }.toSet()
        if (oldAspects.keys == newDescriptors) return // nothing changed

        val newAspects =
            newDescriptors.associateWith { descriptor ->
                oldAspects[descriptor] ?: descriptor.createAspects()
            }
        loadedAspects = newAspects

        conceptEditors =
            newAspects.values
                .asSequence()
                .flatten()
                .filterIsInstance<EditorAspect>()
                .flatMap { it.conceptEditors }
                .filter { it.declaredConcept != null }
                .groupBy { it.declaredConcept!!.getReference() }
    }

    override fun getConceptEditors(concept: IConceptReference): List<ConceptEditor> {
        if (needsUpdate) updateDescriptors()
        return conceptEditors[concept] ?: emptyList()
    }
}
