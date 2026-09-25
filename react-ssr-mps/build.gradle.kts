import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.buildtools.KnownModuleIds
import org.modelix.buildtools.ModuleId
import org.modelix.buildtools.ModuleIdAndName
import org.modelix.buildtools.buildStubsSolutionJar
import org.modelix.copyMps
import org.modelix.excludeMPSLibraries
import org.modelix.mpsHomeDir
import org.modelix.mpsPluginsDir

plugins {
    kotlin("jvm")
    alias(libs.plugins.intellij)
    alias(libs.plugins.modelix.model.api.gen)
}

kotlin {
    jvmToolchain(17)
}

repositories {
    intellijPlatform {
        localPlatformArtifacts()
    }
}

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(project(":editor-common-mps"))
    implementation(project(":react-ssr-server"), excludeMPSLibraries)
    implementation(libs.slf4j.api, excludeMPSLibraries)

    intellijPlatform {
        local(copyMps())
        localPlugin(project(":editor-common-mps"))
    }
}

intellijPlatform {
    instrumentCode = false
    buildSearchableOptions = false
    autoReload = true
    pluginConfiguration {
        ideaVersion {
            sinceBuild = "241"
            untilBuild = "251.*"
        }
    }
}

kotlin {
    compilerOptions {
        // MPS 2024.1 bundles the Kotlin stdlib 1.9, and the plugins run with the stdlib bundled with MPS.
        apiVersion.set(KotlinVersion.KOTLIN_1_9)
    }
}

tasks {
    val pluginDir = mpsPluginsDir
    if (pluginDir != null) {
        val installMpsPlugin =
            register<Sync>("installMpsPlugin") {
                from(prepareSandbox.flatMap { it.pluginDirectory })
                into(pluginDir.resolve(project.name))
            }
        register("installMpsDevPlugins") {
            dependsOn(installMpsPlugin)
        }
    }

    withType(PrepareSandboxTask::class.java) {
        from(project.layout.projectDirectory.dir("src/main/resources/META-INF")) {
            exclude("plugin.xml")
            into(pluginName.map { "$it/META-INF" })
        }
        from(patchPluginXml.flatMap { it.outputFile }) {
            into(pluginName.map { "$it/META-INF" })
        }

        doLast {
            val jarsInBasePlugin =
                defaultDestinationDirectory
                    .get()
                    .asFile
                    .resolve(project(":editor-common-mps").name)
                    .resolve("lib")
                    .list()
                    ?.toHashSet()
                    ?: emptySet<String>()
            pluginDirectory.get().asFile.resolve("lib").listFiles()?.forEach {
                if (jarsInBasePlugin.contains(it.name)) it.delete()
            }

            val ownJar: File = pluginJar.get().asFile
            val runtimeJars = configurations.runtimeClasspath.get().files + ownJar
            buildStubsSolutionJar {
                solutionName("org.modelix.mps.react.ssr.stubs")
                solutionId("83a7cbdc-dd9d-4dad-be97-957aa1b07375")
                outputFolder(pluginDirectory.get().asFile.resolve("languages"))
                runtimeJars.filterNot { jarsInBasePlugin.contains(it.name) }.forEach {
                    javaJar(it.name)
//                    kotlinJar(it.name)
                }
                moduleDependency(ModuleIdAndName(ModuleId("208eaf68-fd3a-497a-a4b6-4923ff457c3b"), "org.modelix.mps.editor.common.stubs"))
                moduleDependency(KnownModuleIds.JDK)
                moduleDependency(KnownModuleIds.MPS_OpenAPI)
                moduleDependency(KnownModuleIds.MPS_IDEA)
//                moduleDependency(KnownModuleIds.jetbrains_mps_kotlin_stdlib)
//                moduleDependency(KnownModuleIds.jetbrains_mps_kotlin_stdlib_jvm)
//                moduleDependency(KnownModuleIds.jetbrains_mps_kotlin_stubs)
            }
        }
    }
}

group = "org.modelix.mps"

publishing {
    publications {
        create<MavenPublication>("maven") {
            artifactId = "react-ssr-plugin"
            artifact(tasks.buildPlugin) {
                extension = "zip"
            }
        }
    }
}

metamodel {
    mpsHeapSize = "2g"
    mpsHome = mpsHomeDir.get().asFile.absoluteFile
    modulesFrom(
        project(":mps")
            .layout.projectDirectory
            .dir("modules/org.modelix.mps.react")
            .asFile,
    )

    includeNamespace("org.modelix")
    includeLanguage("jetbrains.mps.baseLanguage")
    includeLanguage("jetbrains.mps.lang.structure")
    kotlinProject = project
    kotlinDir =
        project.layout.buildDirectory
            .dir("apigen/kotlin_gen")
            .get()
            .asFile
    registrationHelperName = "org.modelix.react.ApiGenLanguages"
    conceptPropertiesInterfaceName = "org.modelix.react.IConceptProperties"
}

sourceSets["main"].kotlin {
    srcDir(project.layout.buildDirectory.dir("apigen/kotlin_gen"))
}
