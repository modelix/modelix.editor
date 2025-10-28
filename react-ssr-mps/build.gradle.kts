import org.jetbrains.intellij.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.buildtools.KnownModuleIds
import org.modelix.buildtools.ModuleId
import org.modelix.buildtools.ModuleIdAndName
import org.modelix.buildtools.buildStubsSolutionJar
import org.modelix.excludeMPSLibraries
import org.modelix.mpsHomeDir
import org.modelix.mpsPluginsDir

plugins {
    kotlin("jvm")
    id("org.jetbrains.intellij")
    alias(libs.plugins.modelix.model.api.gen)
}

kotlin {
    jvmToolchain(17)
}

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(project(":editor-common-mps"))
    implementation(project(":react-ssr-server"), excludeMPSLibraries)
    implementation(libs.slf4j.api, excludeMPSLibraries)
}

// Configure Gradle IntelliJ Plugin
// Read more: https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html
intellij {
    localPath = mpsHomeDir.map { it.asFile.absolutePath }
    instrumentCode = false
    plugins.set(listOf(project(":editor-common-mps")))
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
        untilBuild.set("241.*")
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
            val jarsInBasePlugin = defaultDestinationDir.get().resolve(project(":editor-common-mps").name).resolve("lib").list()?.toHashSet() ?: emptySet<String>()
            defaultDestinationDir.get().resolve(project.name).resolve("lib").listFiles()?.forEach {
                if (jarsInBasePlugin.contains(it.name)) it.delete()
            }

            val ownJar: File = pluginJar.get().asFile
            val runtimeJars = configurations.getByName(JavaPlugin.RUNTIME_CLASSPATH_CONFIGURATION_NAME).resolvedConfiguration.files + ownJar
            buildStubsSolutionJar {
                solutionName("org.modelix.mps.react.ssr.stubs")
                solutionId("83a7cbdc-dd9d-4dad-be97-957aa1b07375")
                outputFolder(defaultDestinationDir.get().resolve(project.name).resolve("languages"))
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
    modulesFrom(project(":mps").layout.projectDirectory.dir("modules/org.modelix.mps.react").asFile)

    includeNamespace("org.modelix")
    includeLanguage("jetbrains.mps.baseLanguage")
    includeLanguage("jetbrains.mps.lang.structure")
    kotlinProject = project
    kotlinDir = project.layout.buildDirectory.dir("apigen/kotlin_gen").get().asFile
    registrationHelperName = "org.modelix.react.ApiGenLanguages"
    conceptPropertiesInterfaceName = "org.modelix.react.IConceptProperties"
}

sourceSets["main"].kotlin {
    srcDir(project.layout.buildDirectory.dir("apigen/kotlin_gen"))
}
