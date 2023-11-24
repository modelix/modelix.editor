import org.jetbrains.intellij.tasks.PrepareSandboxTask
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

buildscript {
    dependencies {
        classpath(coreLibs.semver)
    }
}

plugins {
    id("org.jetbrains.kotlin.jvm")
    id("org.jetbrains.intellij") version "1.16.0"
}

val mpsToIdeaMap = mapOf(
    "2020.3.6" to "203.8084.24", // https://github.com/JetBrains/MPS/blob/2020.3.6/build/version.properties
    "2021.1.4" to "211.7628.21", // https://github.com/JetBrains/MPS/blob/2021.1.4/build/version.properties
    "2021.2.6" to "212.5284.40", // https://github.com/JetBrains/MPS/blob/2021.2.5/build/version.properties (?)
    "2021.3.3" to "213.7172.25", // https://github.com/JetBrains/MPS/blob/2021.3.3/build/version.properties
    "2022.2" to "222.4554.10", // https://github.com/JetBrains/MPS/blob/2021.2.1/build/version.properties
    "2022.3" to "223.8836.41", // https://github.com/JetBrains/MPS/blob/2022.3.0/build/version.properties (?)
    "2023.2" to "232.10072.27", // https://github.com/JetBrains/MPS/blob/2023.2.0/build/version.properties (?)
)
// use the given MPS version, or 2022.2 (last version with JAVA 11) as default
val mpsVersion = project.findProperty("mps.version")?.toString().takeIf { !it.isNullOrBlank() } ?: "2023.2"
if (!mpsToIdeaMap.containsKey(mpsVersion)) {
    throw GradleException("Build for the given MPS version '$mpsVersion' is not supported.")
}
// identify the corresponding intelliJ platform version used by the MPS version
val ideaVersion = mpsToIdeaMap.getValue(mpsVersion)
val mpsJavaVersion = if (mpsVersion >= "2022.3") 17 else 11
println("Building for MPS version $mpsVersion and IntelliJ version $ideaVersion and Java $mpsJavaVersion")

dependencies {
    implementation(project(":projectional-editor"))
    implementation(project(":projectional-editor-ssr-server"))
    implementation(libs.modelix.mps.model.adapters)

    implementation(coreLibs.ktor.server.core)
    implementation(coreLibs.ktor.server.netty)
    implementation(coreLibs.ktor.server.websockets)
    implementation(coreLibs.ktor.server.html.builder)
    implementation(coreLibs.logback.classic)
    implementation(coreLibs.kotlin.logging)

    compileOnly("com.jetbrains:mps-openapi:$mpsVersion")
    compileOnly("com.jetbrains:mps-core:$mpsVersion")
    compileOnly("com.jetbrains:mps-environment:$mpsVersion")
    compileOnly("com.jetbrains:mps-platform:$mpsVersion")
}

tasks.processResources {
    dependsOn(project(":projectional-editor-ssr-client").tasks.named("jsBrowserDistribution"))
}

sourceSets {
    main {
        resources {
            srcDir(project(":projectional-editor-ssr-client").layout.buildDirectory.dir("dist"))
        }
    }
}

// Configure Gradle IntelliJ Plugin
// Read more: https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html
intellij {

    // IDEA platform version used in MPS 2021.1.4: https://github.com/JetBrains/MPS/blob/2021.1.4/build/version.properties#L11
    version.set(ideaVersion)

    // type.set("IC") // Target IDE Platform

    // plugins.set(listOf("jetbrains.mps.core", "com.intellij.modules.mps"))
}

java {
    sourceCompatibility = JavaVersion.toVersion(mpsJavaVersion)
    targetCompatibility = JavaVersion.toVersion(mpsJavaVersion)
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.fromTarget(mpsJavaVersion.toString()))
    }
}

tasks {
    withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
        kotlinOptions.jvmTarget = mpsJavaVersion.toString()
    }

    patchPluginXml {
        sinceBuild.set("232.10072.781")
        untilBuild.set("232.10072.781")
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

    val mpsPluginDir = project.findProperty("mps232.plugins.dir")?.toString()?.let { file(it) }
    if (mpsPluginDir != null && mpsPluginDir.isDirectory) {
        create<Sync>("installMpsPlugin") {
            dependsOn(prepareSandbox)
            from(project.layout.buildDirectory.dir("idea-sandbox/plugins/${project.name}"))
            into(mpsPluginDir.resolve(project.name))
        }
    }

    withType<PrepareSandboxTask> {
        intoChild(pluginName.map { "$it/languages/org.modelix.mps.editor.ssr.stubs" })
            .from(project(":mps").layout.projectDirectory.dir("org.modelix.mps.editor.ssr.stubs"))
    }
}

group = "org.modelix.mps"

publishing {
    publications {
        create<MavenPublication>("maven") {
            artifact(tasks.buildPlugin) {
                extension = "zip"
            }
        }
    }
}
