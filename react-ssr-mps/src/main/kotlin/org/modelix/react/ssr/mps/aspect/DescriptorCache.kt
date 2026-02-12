package org.modelix.react.ssr.mps.aspect

import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import jetbrains.mps.classloading.ClassLoaderManager
import jetbrains.mps.classloading.DeployListener
import jetbrains.mps.classloading.ModuleClassNotFoundException
import jetbrains.mps.ide.MPSCoreComponents
import jetbrains.mps.logging.Logger
import jetbrains.mps.module.ModuleClassLoaderIsNullException
import jetbrains.mps.module.ReloadableModule
import org.jetbrains.mps.openapi.module.SModule
import org.jetbrains.mps.openapi.util.ProgressMonitor
import org.modelix.incremental.DependencyTracking
import org.modelix.incremental.IStateVariableGroup
import org.modelix.incremental.IStateVariableReference

class DescriptorCache<E : Any>(
    val descriptorClass: Class<E>,
) : Disposable,
    IStateVariableReference<Unit> {
    private var loadedDescriptors: MutableMap<Pair<SModule, String>, E?> = HashMap()

    private var deployListener: DeployListener? = null

    override fun getGroup(): IStateVariableGroup? = null

    override fun read() {}

    fun invalidate() {
        if (LOG.isDebugLevel) {
            LOG.debug("Invalidate Descriptors")
        }
        loadedDescriptors.clear()
        DependencyTracking.modified(this)
    }

    override fun dispose() {
        if (deployListener != null) {
            val classLoaderManager =
                ApplicationManager
                    .getApplication()
                    .getComponent(
                        MPSCoreComponents::class.java
                    ).classLoaderManager
            classLoaderManager.removeListener(deployListener!!)
        }
        loadedDescriptors = HashMap()
    }

    fun getDescriptor(
        module: SModule,
        modelAndClassName: String,
    ): E? {
        DependencyTracking.accessed(this)
        val descriptor = getDescriptor1(module, modelAndClassName)
        if (descriptor != null) {
            if (deployListener == null) {
                deployListener =
                    object : DeployListener {
                        override fun onUnloaded(
                            modules: Set<ReloadableModule>,
                            p1: ProgressMonitor,
                        ) {
                            invalidate()
                        }

                        override fun onLoaded(
                            modules: Set<ReloadableModule>,
                            p1: ProgressMonitor,
                        ) {
                            invalidate()
                        }
                    }.also {
                        // The non deprecated API doesn't work when executing tests from the command line, because getApplication returns NULL.
                        val classLoaderManager = ClassLoaderManager.getInstance()
                        classLoaderManager.addListener(it)
                    }
            }
        }
        return descriptor
    }

    private fun getDescriptor1(
        module: SModule,
        modelAndClassName: String,
    ): E? {
        if (module !is ReloadableModule) return null
        return loadedDescriptors.getOrPut(module to modelAndClassName) { getDescriptor0(module, modelAndClassName) }
    }

    private fun getDescriptor0(
        module: ReloadableModule,
        modelAndClassName: String,
    ): E? {
        val className = module.moduleName + "." + modelAndClassName
        try {
            val cls = module.getOwnClass(className)
            val instanceField = cls.getDeclaredField("INSTANCE")
            val descriptor = instanceField.get(null)?.takeIf { descriptorClass.isInstance(it) } as E?
            LOG.debug("Loaded descriptor $className")
            return descriptor
        } catch (e: ModuleClassNotFoundException) {
            return null
        } catch (ex: IllegalStateException) {
            // Module is not part of the repository anymore
            return null
        } catch (e: ModuleClassLoaderIsNullException) {
            return null
        } catch (e: ClassNotFoundException) {
            return null
        } catch (e: NoClassDefFoundError) {
            if (LOG.isErrorLevel) {
                LOG.error("Failed to load class $className", e)
            }
            return null
        } catch (e: Exception) {
            if (LOG.isErrorLevel) {
                LOG.error("", e)
            }
            return null
        }
    }

    companion object {
        private val LOG: Logger = Logger.getLogger(DescriptorCache::class.java)
    }
}
