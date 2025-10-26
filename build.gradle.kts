import org.jetbrains.intellij.platform.gradle.tasks.BuildPluginTask
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension
import org.jetbrains.kotlin.gradle.dsl.KotlinMultiplatformExtension
import org.jetbrains.kotlin.gradle.plugin.KotlinMultiplatformPluginWrapper
import org.jetbrains.kotlin.gradle.plugin.KotlinPluginWrapper
import org.jetbrains.kotlin.gradle.targets.js.yarn.YarnLockMismatchReport
import org.jetbrains.kotlin.gradle.targets.js.yarn.YarnRootExtension
import org.modelix.copyMps
import org.semver.Version

buildscript {
    dependencies {
        classpath(coreLibs.semver)
        classpath(libs.modelix.build.tools.lib)
    }
}

plugins {
    `maven-publish`
    id("com.palantir.git-version") version "4.1.0"
    id("com.dorongold.task-tree") version "4.0.1"
    alias(libs.plugins.kotlin.multiplatform) apply false
    alias(libs.plugins.kotlin.serialization) apply false
    alias(libs.plugins.intellij2) apply false
    alias(libs.plugins.npm.publish) apply false
}

group = "org.modelix"
description = "KernelF editor implemented with Modelix "
version = computeVersion()
println("Version: $version")

fun computeVersion(): Any {
    val versionFile = file("version.txt")
    if (versionFile.exists()) return versionFile.readText().trim()

    val gitVersion: groovy.lang.Closure<String> by extra
    var version = if (versionFile.exists()) versionFile.readText().trim() else gitVersion()
    if (!versionFile.exists() && "true" != project.findProperty("ciBuild")) {
        version = "$version-SNAPSHOT"
    }

    // A common case where the git-version plugin generates a version that is incompatible to NPM
    version = version.replace(".dirty-", "-dirty-")

    // NPM requires a valid semantic version
    try {
        Version.parse(version)
    } catch (_: IllegalArgumentException) {
        version = "0.0.0-$version"
    }

    // NPM is even stricter about the version format
    if (!version.matches("""\d+\.\d+.\d+-.*""".toRegex())) {
        version = "0.0.0-$version"
    }

    versionFile.writeText(version)

    return version
}

val tsModelApiPath = rootDir.parentFile.resolve("modelix.core").resolve("ts-model-api")
val tsModelApiVersion = libs.versions.modelixCore.get() // if (tsModelApiPath.exists()) "file:${tsModelApiPath.absolutePath}" else libs.versions.modelixCore.get()
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
                    url = if (version.toString().contains("SNAPSHOT")) {
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
            jvmToolchain(21)
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
            jvmToolchain(21)
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
