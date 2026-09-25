import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.copyMps
import org.modelix.excludeMPSLibraries
import org.modelix.mpsPluginsDir

plugins {
    kotlin("jvm")
    alias(libs.plugins.intellij)
}

kotlin {
    jvmToolchain(17)
    compilerOptions {
        apiVersion = KotlinVersion.KOTLIN_1_8
    }
}

repositories {
    intellijPlatform {
        localPlatformArtifacts()
    }
}

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(project(":editor-common-mps"))
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

tasks {
//    signPlugin {
//        certificateChain.set(System.getenv("CERTIFICATE_CHAIN"))
//        privateKey.set(System.getenv("PRIVATE_KEY"))
//        password.set(System.getenv("PRIVATE_KEY_PASSWORD"))
//    }
//
//    publishPlugin {
//        token.set(System.getenv("PUBLISH_TOKEN"))
//    }

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
