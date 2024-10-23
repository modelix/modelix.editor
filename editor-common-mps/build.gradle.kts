import org.jetbrains.intellij.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.buildtools.KnownModuleIds
import org.modelix.buildtools.buildStubsSolutionJar
import org.modelix.excludeMPSLibraries
import org.modelix.mpsHomeDir
import org.modelix.mpsPluginsDir

plugins {
    kotlin("jvm")
    id("org.jetbrains.intellij")
}

kotlin {
    jvmToolchain(17)
}

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(coreLibs.kotlin.coroutines.core)
    compileOnly(coreLibs.kotlin.coroutines.swing)
    compileOnly(coreLibs.kotlin.serialization.json)

    api(coreLibs.ktor.server.core, excludeMPSLibraries)
    api(coreLibs.ktor.server.netty, excludeMPSLibraries)
    api(coreLibs.ktor.server.websockets, excludeMPSLibraries)
    api(coreLibs.ktor.server.html.builder, excludeMPSLibraries)
    api(libs.kotlin.logging, excludeMPSLibraries)
    api(coreLibs.logback.classic, excludeMPSLibraries)
    api(libs.slf4j.api, excludeMPSLibraries)
    api(libs.kotlin.html)

    api(libs.modelix.mps.model.adapters, excludeMPSLibraries)
    api(libs.modelix.model.api.gen.runtime, excludeMPSLibraries)
    api(project(":reverse-mpsadapters"), excludeMPSLibraries)
}

// Configure Gradle IntelliJ Plugin
// Read more: https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html
intellij {
    localPath = mpsHomeDir.map { it.asFile.absolutePath }
    instrumentCode = false
}

kotlin {
    compilerOptions {
        // MPS 2023.2 bundles Kotlin 1.8.20, see https://www.jetbrains.com/legal/third-party-software/?product=IIU&version=2023.2
        apiVersion.set(KotlinVersion.KOTLIN_1_8)
    }
}

tasks {
    patchPluginXml {
        sinceBuild.set("232")
        untilBuild.set("233.*")
    }

    buildSearchableOptions {
        enabled = false
    }

    runIde {
        autoReloadPlugins.set(true)
    }

    val pluginDir = mpsPluginsDir
    if (pluginDir != null) {
        val installMpsPlugin = register<Sync>("installMpsPlugin") {
            dependsOn(prepareSandbox)
            from(project.layout.buildDirectory.dir("idea-sandbox/plugins/${project.name}"))
            into(pluginDir.resolve(project.name))
        }
        register("installMpsDevPlugins") {
            dependsOn(installMpsPlugin)
        }
    }

    withType(PrepareSandboxTask::class.java) {
        intoChild(pluginName.map { "$it/META-INF" })
            .from(project.layout.projectDirectory.file("src/main/resources/META-INF"))
            .exclude("plugin.xml")
        intoChild(pluginName.map { "$it/META-INF" })
            .from(patchPluginXml.flatMap { it.outputFiles })

        doLast {
            val ownJar: File = pluginJar.get().asFile
            val runtimeJars = configurations.getByName(JavaPlugin.RUNTIME_CLASSPATH_CONFIGURATION_NAME).resolvedConfiguration.files + ownJar
            buildStubsSolutionJar {
                solutionName("org.modelix.mps.editor.common.stubs")
                solutionId("208eaf68-fd3a-497a-a4b6-4923ff457c3b")
                outputFolder(defaultDestinationDir.get().resolve(project.name).resolve("languages"))
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
