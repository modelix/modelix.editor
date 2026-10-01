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

val modelAdaptersPlugin = configurations.register("modelAdaptersPlugin")

dependencies {
    compileOnly(kotlin("stdlib"))
    compileOnly(project(":editor-common-mps"))
    testImplementation(project(":projectional-editor-ssr-mps"), excludeMPSLibraries)
    testImplementation(project(":projectional-editor"), excludeMPSLibraries)
    testImplementation(libs.modelix.mps.model.adapters, excludeMPSLibraries)
    testImplementation(libs.playwright, excludeMPSLibraries)
    testImplementation(coreLibs.kotlin.coroutines.test, excludeMPSLibraries)
    testImplementation(coreLibs.logback.classic, excludeMPSLibraries)
    // The IntelliJ Platform Gradle Plugin doesn't put the JUnit bundled with MPS on the classpath.
    testImplementation(libs.junit)
    modelAdaptersPlugin(libs.modelix.mps.model.adapters.plugin)

    intellijPlatform {
        localPlugin(project(":projectional-editor-ssr-mps"))
        localPlugin(project(":editor-common-mps"))
        localPlugin(project(":react-ssr-mps"))
        bundledPlugin("jetbrains.mps.core")
        bundledPlugin("jetbrains.mps.kotlin")
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

    withType<PrepareSandboxTask>().configureEach {
        dependsOn(project(":mps").tasks.named("packageMpsPublications"))

        includeMetaInfFolder()
        from(modelAdaptersPlugin) {
            into(pluginName.map { "$it/plugins" })
        }

        listOf("editor-devkit", "baseLanguage-notation").forEach { publicationName ->
            from(zipTree({ project(":mps").layout.buildDirectory.file("mpsbuild/publications/$publicationName.zip") })) {
                into(pluginName.map { "$it/languages" })
                eachFile {
                    path = path.replaceFirst("packaged-modules/", "")
                }
            }
        }
        from(project(":mps").layout.buildDirectory.dir("repositoryConcepts/packaged-modules")) {
            into(pluginName.map { "$it/languages" })
        }
    }
}

group = "org.modelix.mps"

publishMpsPlugin("projectional-editor-languages-plugin")
