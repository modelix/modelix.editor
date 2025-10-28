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
    testImplementation(project(":projectional-editor-ssr-mps"), excludeMPSLibraries)
    testImplementation(project(":projectional-editor"), excludeMPSLibraries)
    testImplementation(libs.modelix.mps.model.adapters, excludeMPSLibraries)
}

intellij {
    localPath = mpsHomeDir.map { it.asFile.absolutePath }
    instrumentCode = false
    plugins = listOf(
        project(":projectional-editor-ssr-mps"),
        project(":editor-common-mps"),
    ) + listOf(
//        "Git4Idea",
//        "Subversion",
//        "com.intellij.copyright",
//        "com.intellij.laf.macos",
//        "com.intellij.platform.images",
//        "com.intellij.properties",
//        "com.intellij.properties.bundle.editor",
//        "com.intellij.tasks",
//        "com.jetbrains.changeReminder",
//        "jetbrains.jetpad",
//        "jetbrains.mps.build",
//        "jetbrains.mps.build.ui",
//        "jetbrains.mps.console",
        "jetbrains.mps.core",
//        "jetbrains.mps.debugger.api",
//        "jetbrains.mps.debugger.java",
//        "jetbrains.mps.editor.contextActions",
//        "jetbrains.mps.editor.diagram",
//        "jetbrains.mps.editor.spellcheck",
//        "jetbrains.mps.editor.tooltips",
//        "jetbrains.mps.execution.api",
//        "jetbrains.mps.execution.configurations",
//        "jetbrains.mps.execution.languages",
//        "jetbrains.mps.git4idea.stubs",
//        "jetbrains.mps.ide",
//        "jetbrains.mps.ide.devkit",
//        "jetbrains.mps.ide.httpsupport",
//        "jetbrains.mps.ide.java",
//        "jetbrains.mps.ide.make",
//        "jetbrains.mps.ide.memtool",
//        "jetbrains.mps.ide.migration.workbench",
//        "jetbrains.mps.ide.modelchecker",
//        "jetbrains.mps.ide.mpsmigration",
        "jetbrains.mps.kotlin",
//        "jetbrains.mps.navbar",
//        "jetbrains.mps.rcp",
//        "jetbrains.mps.samples",
//        "jetbrains.mps.testing",
//        "jetbrains.mps.tool.make",
//        "jetbrains.mps.trove",
//        "jetbrains.mps.vcs",
//        "org.intellij.plugins.markdown",
//        "org.jetbrains.plugins.github",
//        "org.jetbrains.settingsRepository",

//        "com.intellij",
//        "com.jetbrains.sh",
//        "org.jetbrains.plugins.terminal",
    )
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
        register<Sync>("installMpsPlugin") {
            dependsOn(prepareSandbox)
            from(project.layout.buildDirectory.dir("idea-sandbox/plugins/${project.name}"))
            into(pluginDir.resolve(project.name))
        }
    }

    withType<org.jetbrains.intellij.tasks.PrepareSandboxTask>().configureEach {
        dependsOn(project(":mps").tasks.named("packageMpsPublications"))

        intoChild(pluginName.map { "$it/META-INF" })
            .from(project.layout.projectDirectory.file("src/main/resources/META-INF"))
            .exclude("plugin.xml")
        intoChild(pluginName.map { "$it/META-INF" })
            .from(patchPluginXml.flatMap { it.outputFiles })

        listOf("editor-languages", "baseLanguage-notation", "react").forEach { publicationName ->
            intoChild(pluginName.map { "$it/languages" })
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
