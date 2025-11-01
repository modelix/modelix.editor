import org.modelix.mpsVersion

plugins {
    kotlin("jvm")
}

dependencies {
    testImplementation(kotlin("stdlib"))
    testImplementation(libs.playwright)
    testImplementation(coreLibs.kotlin.coroutines.core)
    testImplementation(coreLibs.kotlin.coroutines.test)
    testImplementation(libs.testcontainers)
}

val pluginsDir = layout.buildDirectory.dir("plugins")
val collectPlugins by tasks.registering(Sync::class) {
    dependsOn(":packageAllPlugins")
    from(zipTree { rootProject.tasks.named<Zip>("packageAllPlugins").map { it.archiveFile.get() } })
    into(pluginsDir)
}

val testLanguagesDir = layout.buildDirectory.dir("test-languages")
val copyTestLanguages by tasks.registering(Sync::class) {
    dependsOn(":packageAllPlugins")
    from(zipTree({ project(":mps").layout.buildDirectory.file("mpsbuild/publications/tests.zip") }))
    into(testLanguagesDir)
}

tasks {
    test {
        dependsOn(collectPlugins)
        dependsOn(copyTestLanguages)
        environment("MPS_VERSION", mpsVersion)
        environment(
            "MODELIX_MPS_PLUGINS_PATH",
            pluginsDir.get().asFile.absolutePath,
        )
        environment(
            "MODELIX_TEST_LANGUAGES_PATH",
            testLanguagesDir.get().asFile.absolutePath,
        )
    }
}
