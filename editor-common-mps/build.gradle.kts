import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.buildtools.KnownModuleIds
import org.modelix.buildtools.buildStubsSolutionJar
import org.modelix.copyMps
import org.modelix.excludeMPSLibraries
import org.modelix.mpsPluginsDir

plugins {
    kotlin("jvm")
    alias(libs.plugins.intellij)
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
    compileOnly(coreLibs.kotlin.coroutines.core)
    compileOnly(coreLibs.kotlin.serialization.json)

    api(libs.ktor.server.core, excludeMPSLibraries)
    api(libs.ktor.server.netty, excludeMPSLibraries)
    api(libs.ktor.server.websockets, excludeMPSLibraries)
    api(libs.ktor.server.html.builder, excludeMPSLibraries)
    api(libs.kotlinx.rpc.krpc.ktor.server, excludeMPSLibraries)
    api(libs.kotlinx.rpc.krpc.serialization.json, excludeMPSLibraries)
    api(libs.kotlinx.rpc.core, excludeMPSLibraries)
    api(coreLibs.kotlin.serialization.core, excludeMPSLibraries)
    api(coreLibs.kotlin.serialization.json, excludeMPSLibraries)
    api(libs.kotlin.logging, excludeMPSLibraries)
    api(coreLibs.logback.classic, excludeMPSLibraries)
    api(libs.slf4j.api, excludeMPSLibraries)
    api(libs.kotlin.html)

    api(coreLibs.modelix.incremental, excludeMPSLibraries)
    api(libs.modelix.mps.model.adapters, excludeMPSLibraries)
    api(libs.modelix.model.api.gen.runtime, excludeMPSLibraries)
    api(project(":reverse-mpsadapters"), excludeMPSLibraries)

    intellijPlatform {
        local(copyMps())
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
            val ownJar: File = pluginJar.get().asFile
            val runtimeJars = configurations.runtimeClasspath.get().files + ownJar
            buildStubsSolutionJar {
                solutionName("org.modelix.mps.editor.common.stubs")
                solutionId("208eaf68-fd3a-497a-a4b6-4923ff457c3b")
                outputFolder(pluginDirectory.get().asFile.resolve("languages"))
                runtimeJars.forEach {
                    javaJar(it.name)
//                    kotlinJar(it.name)
                }
//                kotlinJarFromMPS("util-8.jar")
                javaJarFromMPS("util-8.jar")
//                kotlinJarFromMPS("annotations.jar")
                moduleDependency(KnownModuleIds.Annotations)
                moduleDependency(KnownModuleIds.JDK)
                moduleDependency(KnownModuleIds.MPS_OpenAPI)
                moduleDependency(KnownModuleIds.MPS_Core)
                moduleDependency(KnownModuleIds.MPS_IDEA)
//                moduleDependency(KnownModuleIds.jetbrains_mps_kotlin_stdlib)
//                moduleDependency(KnownModuleIds.jetbrains_mps_kotlin_stdlib_jvm)
//                moduleDependency(KnownModuleIds.jetbrains_mps_kotlin_stubs)
            }
        }
    }
}
