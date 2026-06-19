import org.jetbrains.intellij.tasks.BuildPluginTask
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension
import org.jetbrains.kotlin.gradle.dsl.KotlinMultiplatformExtension
import org.jetbrains.kotlin.gradle.plugin.KotlinMultiplatformPluginWrapper
import org.jetbrains.kotlin.gradle.plugin.KotlinPluginWrapper
import org.jetbrains.kotlin.gradle.targets.js.yarn.YarnLockMismatchReport
import org.jetbrains.kotlin.gradle.targets.js.yarn.YarnRootExtension
import org.modelix.copyMps

buildscript {
    dependencies {
        classpath(libs.modelix.build.tools.lib)
    }
}

plugins {
    `maven-publish`
    id("com.dorongold.task-tree") version "4.0.1"
    alias(libs.plugins.kotlin.multiplatform) apply false
    alias(libs.plugins.kotlin.serialization) apply false
    alias(libs.plugins.kotlin.rpc) apply false
    id("org.jetbrains.intellij") version "1.17.4" apply false
    alias(libs.plugins.npm.publish) apply false
}

group = "org.modelix"
description = "KernelF editor implemented with Modelix "
version = computeVersion()
println("Version: $version")

fun computeVersion(): String {
    // The released version is owned by release-please and kept in
    // .release-please-manifest.json. Release builds publish that version
    // verbatim; every other build appends -SNAPSHOT.
    //
    // -PreleaseVersion=<version> overrides everything and is used by the manual
    // tag publish (publish.yml), where the pushed tag is the source of truth.
    (project.findProperty("releaseVersion") as String?)
        ?.trim()
        ?.takeIf { it.isNotEmpty() }
        ?.let { return it }

    val baseVersion = readReleaseManifestVersion()
    return if (project.findProperty("release") == "true") baseVersion else "$baseVersion-SNAPSHOT"
}

@Suppress("UNCHECKED_CAST")
fun readReleaseManifestVersion(): String {
    val manifestFile = file(".release-please-manifest.json")
    val manifest = groovy.json.JsonSlurper().parse(manifestFile) as Map<String, String>
    return manifest["."] ?: error("No \".\" entry in ${manifestFile.name}")
}

val tsModelApiPath = rootDir.parentFile.resolve("modelix.core").resolve("ts-model-api")
val tsModelApiVersion = libs.versions.modelixCore.get()
// if (tsModelApiPath.exists()) "file:${tsModelApiPath.absolutePath}" else libs.versions.modelixCore.get()
ext.set("ts-model-api.version", tsModelApiVersion)

subprojects {
    apply(plugin = "maven-publish")
    version = rootProject.version
    group = rootProject.group

    repositories {
        maven { url = uri("https://artifacts.itemis.cloud/repository/maven-mps/") }
        maven { url = uri("https://maven.pkg.jetbrains.space/public/p/kotlinx-html/maven") }
        mavenCentral()
        mavenLocal()
    }
}

allprojects {
    publishing {
        repositories {
            if (project.hasProperty("artifacts.itemis.cloud.user")) {
                maven {
                    name = "itemis"
                    url =
                        if (version.toString().contains("SNAPSHOT")) {
                            uri("https://artifacts.itemis.cloud/repository/maven-mps-snapshots/")
                        } else {
                            uri("https://artifacts.itemis.cloud/repository/maven-mps-releases/")
                        }
                    credentials {
                        username = project.findProperty("artifacts.itemis.cloud.user").toString()
                        password = project.findProperty("artifacts.itemis.cloud.pw").toString()
                    }
                }
            }
        }
    }
}

subprojects {
    val sourceFile = rootDir.resolve(".npmrc")
    val targetFile = projectDir.resolve(".npmrc")
    if (!targetFile.exists() && sourceFile.exists() && projectDir.resolve("package.json").exists()) {
        sourceFile.copyTo(targetFile)
    }

    val kotlinApiVersion = org.jetbrains.kotlin.gradle.dsl.KotlinVersion.KOTLIN_1_8
    plugins.withType<JavaPlugin> {
        extensions.configure<JavaPluginExtension> {
            toolchain {
                languageVersion.set(JavaLanguageVersion.of(17))
            }
        }
    }

    plugins.withType<KotlinPluginWrapper> {
        extensions.configure<KotlinJvmProjectExtension> {
            jvmToolchain(17)
            sourceSets.all {
                if (!name.lowercase().contains("test")) {
                    languageSettings {
                        apiVersion = kotlinApiVersion.version
                    }
                }
            }
        }
    }

    plugins.withType<KotlinMultiplatformPluginWrapper> {
        extensions.configure<KotlinMultiplatformExtension> {
            jvmToolchain(17)
            sourceSets.all {
                if (!name.lowercase().contains("test")) {
                    languageSettings {
                        apiVersion = kotlinApiVersion.version
                    }
                }
            }
        }
    }
}

rootProject.plugins.withType(org.jetbrains.kotlin.gradle.targets.js.yarn.YarnPlugin::class.java) {
    rootProject.the<YarnRootExtension>().yarnLockMismatchReport =
        YarnLockMismatchReport.WARNING // NONE | FAIL
    rootProject.the<YarnRootExtension>().reportNewYarnLock = false // true
    rootProject.the<YarnRootExtension>().yarnLockAutoReplace = false // true
}

copyMps()

// make all 'packJsPackage' tasks depend on all 'kotlinNodeJsSetup' tasks, because gradle complained about this being missing
tasks.register<Task>("setupNodeEverywhere") {
    dependsOn(":kernelf-apigen:kotlinNodeJsSetup")
    dependsOn(":kernelf-editor:kotlinNodeJsSetup")
    dependsOn(":parser:kotlinNodeJsSetup")
    dependsOn(":projectional-editor:kotlinNodeJsSetup")
    dependsOn(":projectional-editor-ssr-client:kotlinNodeJsSetup")
    dependsOn(":projectional-editor-ssr-client-lib:kotlinNodeJsSetup")
    dependsOn(":projectional-editor-ssr-common:kotlinNodeJsSetup")
}

val packageAllPlugins by tasks.registering(Zip::class) {
    val zipTask = this
    archiveBaseName = "all-editor-plugins"
    subprojects {
        tasks.all {
            if (this.name == "buildPlugin") {
                val buildPluginTask = this as BuildPluginTask
                zipTask.dependsOn(buildPluginTask)
                zipTask.from(zipTree(buildPluginTask.archiveFile))
            }
        }
    }
}

// publish all-editor-plugins.zip to GitHub packages to make it appear on the releases page
publishing {
    publications {
        create<MavenPublication>("maven") {
            artifactId = "all-editor-plugins"
            artifact(packageAllPlugins) {
                extension = "zip"
            }
        }
    }
}
