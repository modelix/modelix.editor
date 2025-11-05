import org.modelix.mpsVersion

plugins {
    kotlin("jvm")
}

dependencies {
    testImplementation(kotlin("stdlib"))
    testImplementation(kotlin("test"))
    testImplementation(libs.playwright)
    testImplementation(coreLibs.kotlin.coroutines.core)
    testImplementation(coreLibs.kotlin.coroutines.test)
    testImplementation(libs.testcontainers)
    testImplementation(coreLibs.logback.classic)
}

val pluginsDir = layout.buildDirectory.dir("plugins")
val collectPlugins by tasks.registering(Sync::class) {
    dependsOn(":packageAllPlugins")
    from(zipTree { rootProject.tasks.named<Zip>("packageAllPlugins").map { it.archiveFile.get() } })
    into(pluginsDir)
}

val testLanguagesDir = layout.buildDirectory.dir("test-languages")
val copyTestLanguages by tasks.registering(Sync::class) {
    dependsOn(":mps:assembleMpsModules")
    from(project(":mps").layout.projectDirectory.dir("modules/test.org.modelix.webaspect"))
    into(testLanguagesDir.map { it.dir("test.org.modelix.webaspect") })
}

tasks {
    test {
        useJUnitPlatform()
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
