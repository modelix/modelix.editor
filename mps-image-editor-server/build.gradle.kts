import org.jetbrains.intellij.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
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
    implementation(libs.slf4j.api, excludeMPSLibraries)
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
        untilBuild.set("241.*")
    }

    buildSearchableOptions {
        enabled = false
    }

//    signPlugin {
//        certificateChain.set(System.getenv("CERTIFICATE_CHAIN"))
//        privateKey.set(System.getenv("PRIVATE_KEY"))
//        password.set(System.getenv("PRIVATE_KEY_PASSWORD"))
//    }
//
//    publishPlugin {
//        token.set(System.getenv("PUBLISH_TOKEN"))
//    }

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
