import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.gradle.mpsplatform.excludeMPSLibraries
import org.modelix.gradle.mpsplatform.includeMetaInfFolder
import org.modelix.gradle.mpsplatform.publishMpsPlugin

plugins {
    kotlin("jvm")
    id("org.modelix.mps.plugin")
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

    intellijPlatform {
        localPlugin(project(":editor-common-mps"))
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

    if (names.contains("installMpsPlugin")) {
        register("installMpsDevPlugins") {
            dependsOn("installMpsPlugin")
        }
    }

    withType(PrepareSandboxTask::class.java) {
        includeMetaInfFolder()

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

publishMpsPlugin()
