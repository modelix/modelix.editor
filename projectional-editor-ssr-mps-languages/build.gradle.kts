import org.jetbrains.intellij.platform.gradle.TestFrameworkType
import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.modelix.excludeMPSLibraries
import org.modelix.mpsHomeDir
import org.modelix.mpsPluginsDir
import org.modelix.mpsVersion

plugins {
    kotlin("jvm")
    alias(libs.plugins.intellij2)
}

repositories {
    intellijPlatform {
        defaultRepositories()
    }
}

kotlin {
    jvmToolchain(21)
//    compilerOptions {
//        apiVersion = KotlinVersion.KOTLIN_1_8
//    }
}

dependencies {
    testImplementation(project(":projectional-editor-ssr-mps"), excludeMPSLibraries)
    testImplementation(project(":projectional-editor"), excludeMPSLibraries)
    testImplementation(libs.modelix.mps.model.adapters, excludeMPSLibraries)
    intellijPlatform {
        local(mpsHomeDir)
//        bundledPlugin("jetbrains.mps.core")
//        bundledPlugin("jetbrains.mps.kotlin")
        localPlugin(project(":editor-common-mps"))
        localPlugin(project(":projectional-editor-ssr-mps"))
        testFramework(TestFrameworkType.Bundled)
    }
    compileOnly(
        fileTree(mpsHomeDir).matching {
            include("lib/*.jar")
        },
    )
    testCompileOnly(
        fileTree(mpsHomeDir).matching {
            include("lib/*.jar")
        },
    )
}

intellijPlatform {
    instrumentCode = false
    buildSearchableOptions = false
    pluginConfiguration {
        id = "org.modelix.mps.editor.languages"
        name = "Notation Language for the Modelix Web Editor"
    }
}

tasks {
    val pluginDir = mpsPluginsDir
    if (pluginDir != null) {
        register<Sync>("installMpsPlugin") {
            dependsOn(prepareSandbox)
            from(project.layout.buildDirectory.dir("idea-sandbox/MPS-${project.mpsVersion}/plugins/${project.name}"))
            into(pluginDir.resolve(project.name))
        }
    }

    withType<PrepareSandboxTask>().configureEach {
        dependsOn(project(":mps").tasks.named("packageMpsPublications"))

        rootSpec.addChild().into(pluginName.map { "$it/META-INF" })
            .from(project.layout.projectDirectory.file("src/main/resources/META-INF"))
            .exclude("plugin.xml")
        rootSpec.addChild().into(pluginName.map { "$it/META-INF" })
            .from(patchPluginXml.flatMap { it.outputFile })

        listOf("editor-languages", "baseLanguage-notation", "react").forEach { publicationName ->
            rootSpec.addChild().into(pluginName.map { "$it/languages" })
                .from(zipTree({ project(":mps").layout.buildDirectory.file("mpsbuild/publications/$publicationName.zip") }))
                .eachFile {
                    path = path.replaceFirst("packaged-modules/", "")
                }
        }
    }
}

group = "org.modelix.mps"

publishing {
    publications {
        create<MavenPublication>("maven") {
            artifactId = "projectional-editor-languages-plugin"
            artifact(tasks.buildPlugin) {
                extension = "zip"
            }
        }
    }
}
