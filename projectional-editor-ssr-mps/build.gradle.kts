import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.buildtools.KnownModuleIds
import org.modelix.buildtools.ModuleId
import org.modelix.buildtools.ModuleIdAndName
import org.modelix.buildtools.buildStubsSolutionJar
import org.modelix.gradle.mpsplatform.excludeMPSLibraries
import org.modelix.gradle.mpsplatform.includeMetaInfFolder
import org.modelix.gradle.mpsplatform.publishMpsPlugin

plugins {
    kotlin("jvm")
    id("org.modelix.mps.plugin")
}

kotlin {
    jvmToolchain(17)
    compilerOptions {
        apiVersion = KotlinVersion.KOTLIN_1_8
    }
}

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(project(":editor-common-mps"))
    implementation(project(":projectional-editor"), excludeMPSLibraries)
    implementation(project(":projectional-editor-ssr-server"), excludeMPSLibraries)
    implementation(libs.slf4j.api, excludeMPSLibraries)
    implementation(libs.kotlinx.rpc.krpc.ktor.server, excludeMPSLibraries)

    intellijPlatform {
        localPlugin(project(":editor-common-mps"))
    }
}

tasks.processResources {
    dependsOn(project(":projectional-editor-ssr-client").tasks.named("jsBrowserDistribution"))
}

sourceSets {
    main {
        resources {
            srcDir(project(":projectional-editor-ssr-client").layout.buildDirectory.dir("dist"))
        }
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
                solutionName("org.modelix.mps.editor.ssr.stubs")
                solutionId("771cf896-ab1b-409b-93b4-48c3bbb6b23f")
                outputFolder(pluginDirectory.get().asFile.resolve("languages"))
                runtimeJars.filterNot { jarsInBasePlugin.contains(it.name) }.forEach {
                    javaJar(it.name)
//                    kotlinJar(it.name)
                }
                moduleDependency(ModuleIdAndName(ModuleId("208eaf68-fd3a-497a-a4b6-4923ff457c3b"), "org.modelix.mps.editor.common.stubs"))
                moduleDependency(KnownModuleIds.JDK)
                moduleDependency(KnownModuleIds.Annotations)
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

publishMpsPlugin("projectional-editor-plugin")
