package org.modelix.editor.ssr.mps

import com.intellij.ide.plugins.PluginManager
import jetbrains.mps.classloading.ModuleClassLoader
import jetbrains.mps.module.ReloadableModuleBase

/**
 * Check that the environment is initialized properly and all plugins and modules are loaded properly.
 */
@Suppress("ktlint:standard:function-naming")
class TestFrameworkSetupTest : TestBase("SimpleProject") {
    fun `test plugins loaded`() {
        // IDEA plugins
        assertContainsElements(
            PluginManager.getPlugins().map { it.pluginId.idString }.sorted(),
            "org.modelix.mps.editor.languages",
            "org.modelix.mps.editor",
        )

        // MPS modules inside those IDEA plugins
        readAction {
            assertContainsElements(
                mpsProject.repository.modules
                    .map { it.moduleName ?: "" }
                    .sorted(),
                "org.modelix.mps.editor.ssr.stubs",
                "org.modelix.mps.notation.impl.baseLanguage",
            )
        }
    }

    fun `test module is valid for classloading`() {
        readAction {
            val module =
                mpsProject.repository.modules.filterIsInstance<ReloadableModuleBase>().first {
                    it.moduleName ==
                        "org.modelix.mps.notation.impl.baseLanguage"
                }
            assertInstanceOf(module.classLoader, ModuleClassLoader::class.java)
        }
    }
}
