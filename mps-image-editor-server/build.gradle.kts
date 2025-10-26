import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
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
    compilerOptions {
        apiVersion = KotlinVersion.KOTLIN_1_8
    }
}

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(project(":editor-common-mps"))
    implementation(libs.slf4j.api, excludeMPSLibraries)
    intellijPlatform {
        local(mpsHomeDir)
        localPlugin(project(":editor-common-mps"))
    }
    compileOnly(
        fileTree(mpsHomeDir).matching {
            include("lib/*.jar")
        },
    )
}

intellijPlatform {
    instrumentCode = false
    buildSearchableOptions = false
    pluginConfiguration {
        id = "org.modelix.mps.editor.image"
        name = "Image Based Web Editor for MPS"
    }
}

tasks {
    val pluginDir = mpsPluginsDir
    if (pluginDir != null) {
        val installMpsPlugin = register<Sync>("installMpsPlugin") {
            dependsOn(prepareSandbox)
            from(prepareSandbox.map { it.pluginDirectory.get() })
            into(pluginDir.resolve(project.name))
        }
        register<Task>("installMpsDevPlugins") {
            dependsOn(installMpsPlugin)
        }
    }

    withType(PrepareSandboxTask::class.java) {
        rootSpec.addChild().into(pluginName.map { "$it/META-INF" })
            .from(project.layout.projectDirectory.file("src/main/resources/META-INF"))
            .exclude("plugin.xml")
        rootSpec.addChild().into(pluginName.map { "$it/META-INF" })
            .from(patchPluginXml.flatMap { it.outputFile })

        doLast {
            val jarsInBasePlugin = defaultDestinationDirectory.get().asFile.resolve(project(":editor-common-mps").name).resolve("lib").list()?.toHashSet() ?: emptySet<String>()
            defaultDestinationDirectory.get().asFile.resolve(project.name).resolve("lib").listFiles()?.forEach {
                if (jarsInBasePlugin.contains(it.name)) it.delete()
            }
        }
    }
}

group = "org.modelix.mps"

publishing {
    publications {
        create<MavenPublication>("maven") {
            artifactId = "mps-image-editor-server"
            artifact(tasks.buildPlugin) {
                extension = "zip"
            }
        }
    }
}
