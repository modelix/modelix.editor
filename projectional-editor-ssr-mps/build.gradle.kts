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

// Configure Gradle IntelliJ Plugin
// Read more: https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html
intellij {
    localPath = mpsHomeDir.map { it.asFile.absolutePath }
    instrumentCode = false
    plugins.set(listOf(project(":editor-common-mps")))
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
            val jarsInBasePlugin = defaultDestinationDir.get().resolve(project(":editor-common-mps").name).resolve("lib").list()?.toHashSet() ?: emptySet<String>()
            defaultDestinationDir.get().resolve(project.name).resolve("lib").listFiles()?.forEach {
                if (jarsInBasePlugin.contains(it.name)) it.delete()
            }

            val ownJar: File = pluginJar.get().asFile
            val runtimeJars = configurations.getByName(JavaPlugin.RUNTIME_CLASSPATH_CONFIGURATION_NAME).resolvedConfiguration.files + ownJar
            buildStubsSolutionJar {
                solutionName("org.modelix.mps.editor.ssr.stubs")
                solutionId("771cf896-ab1b-409b-93b4-48c3bbb6b23f")
                outputFolder(defaultDestinationDir.get().resolve(project.name).resolve("languages"))
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

publishing {
    publications {
        create<MavenPublication>("maven") {
            artifactId = "projectional-editor-plugin"
            artifact(tasks.buildPlugin) {
                extension = "zip"
            }
        }
    }
}
