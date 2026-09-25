import org.jetbrains.intellij.platform.gradle.TestFrameworkType
import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.configureMpsTestClasspath
import org.modelix.configureMpsTestTask
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
        apiVersion = KotlinVersion.KOTLIN_1_9
    }
}

val modelAdaptersPlugin = configurations.register("modelAdaptersPlugin")

repositories {
    intellijPlatform {
        localPlatformArtifacts()
    }
}

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
        local(copyMps())
        localPlugin(project(":projectional-editor-ssr-mps"))
        localPlugin(project(":editor-common-mps"))
        localPlugin(project(":react-ssr-mps"))
        bundledPlugin("jetbrains.mps.core")
        bundledPlugin("jetbrains.mps.kotlin")
        testFramework(TestFrameworkType.Bundled)
    }
}

configureMpsTestClasspath()

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
    test {
        configureMpsTestTask()
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

    val pluginDir = mpsPluginsDir
    if (pluginDir != null) {
        register<Sync>("installMpsPlugin") {
            from(prepareSandbox.flatMap { it.pluginDirectory })
            into(pluginDir.resolve(project.name))
        }
    }

    withType<PrepareSandboxTask>().configureEach {
        dependsOn(project(":mps").tasks.named("packageMpsPublications"))

        from(project.layout.projectDirectory.dir("src/main/resources/META-INF")) {
            exclude("plugin.xml")
            into(pluginName.map { "$it/META-INF" })
        }
        from(patchPluginXml.flatMap { it.outputFile }) {
            into(pluginName.map { "$it/META-INF" })
        }
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
