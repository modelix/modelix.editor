import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.buildtools.KnownModuleIds
import org.modelix.buildtools.buildStubsSolutionJar
import org.modelix.gradle.mpsplatform.excludeMPSLibraries
import org.modelix.gradle.mpsplatform.includeMetaInfFolder

plugins {
    kotlin("jvm")
    id("org.modelix.mps.plugin")
}

kotlin {
    jvmToolchain(17)
}

dependencies {
    // The plugins bundle a newer Kotlin stdlib than the one shipped with MPS (see gradle.properties).
    // It's declared explicitly, because excludeMPSLibraries removes it from the other dependencies.
    implementation(kotlin("stdlib"))
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
}

kotlin {
    compilerOptions {
        // MPS 2023.2 bundles Kotlin 1.8.20, see https://www.jetbrains.com/legal/third-party-software/?product=IIU&version=2023.2
        apiVersion.set(KotlinVersion.KOTLIN_1_8)
    }
}

tasks {
    if (names.contains("installMpsPlugin")) {
        register("installMpsDevPlugins") {
            dependsOn("installMpsPlugin")
        }
    }

    withType(PrepareSandboxTask::class.java) {
        includeMetaInfFolder()

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
