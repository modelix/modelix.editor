import org.jetbrains.kotlin.com.google.gson.JsonPrimitive
import org.jetbrains.kotlin.com.google.gson.JsonParser

buildscript {
    repositories {
        mavenLocal()
        maven { url = uri("https://artifacts.itemis.cloud/repository/maven-mps/") }
    }
    dependencies {
    }
}

plugins {
    kotlin("multiplatform")
    `maven-publish`
    alias(libs.plugins.npm.publish)
}

val generatorOutputDir = file("src/commonMain/kotlin_gen")
val tsGeneratorOutputDir = file("../kernelf-angular-demo/src/gen")

kotlin {
    jvm {
        compilations.all {
            kotlinOptions.jvmTarget = "11"
        }
    }
    js(IR) {
        browser {
            testTask {
                useMocha {
                    timeout = "10s"
                }
            }
        }
        binaries.library()
        nodejs {
            testTask {
                useMocha {
                    timeout = "10s"
                }
            }
        }
        generateTypeScriptDefinitions()
    }

    sourceSets {
        all {
            languageSettings.optIn("kotlin.js.ExperimentalJsExport")
        }
        val commonMain by getting {
            dependencies {
                implementation(libs.modelix.model.api.gen.runtime)
                implementation(project(":projectional-editor"))
                implementation(kotlin("stdlib-common"))
                implementation(coreLibs.kotlin.logging)
                implementation(coreLibs.kotlin.coroutines.core)
                implementation(libs.modelix.light.model.client)
                implementation(libs.modelix.model.client)
                implementation(libs.kotlin.html)
                implementation(project(":kernelf-apigen"))
            }
            kotlin.srcDir(generatorOutputDir)
        }
        val commonTest by getting {
            dependencies {
                implementation(coreLibs.kotlin.coroutines.test)
                implementation(kotlin("test-common"))
                implementation(kotlin("test-annotations-common"))
                implementation(project(":kernelf-apigen"))
            }
        }
        val jvmMain by getting {
            dependencies {
                implementation(coreLibs.kotlin.coroutines.swing)
            }
        }
        val jvmTest by getting {
            dependencies {
                implementation(libs.modelix.model.api.gen.runtime)
                implementation(kotlin("test"))
                implementation(kotlin("test-junit"))
            }
        }
        val jsMain by getting {
            dependencies {
                api(libs.modelix.model.api)
            }
        }
        val jsTest by getting {
            dependencies {
                implementation(kotlin("test-js"))
                implementation(npm("jsdom", "20.0.1"))
                implementation(npm("@types/jsdom", "20.0.1"))
                implementation(npm("@modelix/ts-model-api", rootProject.property("ts-model-api.version").toString()))
            }
        }
    }
}

fun fixSourceMap(sourcesDir: File, sourceMapFile: File) {
    if (!sourcesDir.exists()) return
    if (!sourceMapFile.exists()) return
    val json = JsonParser.parseString(sourceMapFile.readText()).asJsonObject
    val correctPaths = sourcesDir.walk().associateBy { it.name }
    val wrongPaths = json.getAsJsonArray("sources")
    wrongPaths.forEachIndexed { index, wrongPath ->
        val fileName = wrongPath.asString.substringAfterLast('/')
        val resolvedFile = correctPaths[fileName]
        if (resolvedFile != null) {
            wrongPaths.set(index, JsonPrimitive(resolvedFile.absolutePath))
        }
    }

    sourceMapFile.writeText(json.toString())
}

val fixSourceMaps by tasks.registering {
    dependsOn("assembleJsPackage")
    doLast {
        val jsOutputDir = buildDir.resolve("packages/js")
//        fixSourceMap(
//            rootDir.resolve("../modelix.core/editor-runtime/src").canonicalFile,
//            rootDir.resolve("build/js/packages/modelix.kernelf-kernelf-editor/kotlin/modelix.core-editor-runtime.js.map")
//        )
        fixSourceMap(
            rootDir.resolve("../modelix.core/model-api/src").canonicalFile,
            jsOutputDir.resolve("modelix.core-model-api.js.map")
        )
        fixSourceMap(
            rootDir.resolve("../modelix.core/model-api-gen-runtime/src").canonicalFile,
            jsOutputDir.resolve("modelix.core-model-api-gen-runtime.js.map")
        )
        fixSourceMap(
            rootDir.resolve("../modelix.core/model-client/src").canonicalFile,
            jsOutputDir.resolve("modelix.core-model-client.js.map")
        )
        fixSourceMap(
            rootDir.resolve("../modelix.core/light-model-client/src").canonicalFile,
            jsOutputDir.resolve("modelix.core-light-model-client.js.map")
        )
        fixSourceMap(
            rootDir.resolve("../incremental/src").canonicalFile,
            jsOutputDir.resolve("incremental.js.map")
        )

    }
}
tasks.named("packJsPackage") {
    dependsOn(fixSourceMaps)
}

listOf("jsBrowserDevelopmentLibraryPrepare", "jsBrowserProductionLibraryPrepare", "jsNodeDevelopmentLibraryPrepare", "jsNodeProductionLibraryPrepare").forEach {
    tasks.named(it) {
        // because it uses build/js/packages/modelix.text-editor-kernelf-editor/kotlin
        dependsOn("jsDevelopmentLibraryCompileSync")
        dependsOn("jsProductionLibraryCompileSync")
    }
}

val productionLibraryByKotlinOutputDirectory = layout.buildDirectory.dir("compileSync/js/main/productionLibrary/kotlin")
val preparedProductionLibraryOutputDirectory = layout.buildDirectory.dir("npmPublication")

val patchTypesScriptInProductionLibrary = tasks.register("patchTypesScriptInProductionLibrary") {
    dependsOn("compileProductionLibraryKotlinJs")
    inputs.dir(productionLibraryByKotlinOutputDirectory)
    outputs.dir(preparedProductionLibraryOutputDirectory)
    outputs.cacheIf { true }
    doLast {
        // Delete old data
        delete {
            delete(preparedProductionLibraryOutputDirectory)
        }

        // Copy over library create by Kotlin
        copy {
            from(productionLibraryByKotlinOutputDirectory)
            into(preparedProductionLibraryOutputDirectory)
        }

        // Add correct TypeScript imports.
        val typescriptDeclaration =
            preparedProductionLibraryOutputDirectory.get().file("modelix.text-editor-kernelf-editor.d.ts").asFile
        val originalTypescriptDeclarationContent = typescriptDeclaration.readText()
        typescriptDeclaration.writer().use {
            it.appendLine("""import { INodeJS } from "@modelix/ts-model-api";""").appendLine()
            it.append(originalTypescriptDeclarationContent)
        }
    }
}

npmPublish {
//    registries {
//        register("itemis-npm-open") {
//            uri.set("https://artifacts.itemis.cloud/repository/npm-open")
//            System.getenv("NODE_AUTH_TOKEN").takeIf { !it.isNullOrBlank() }?.let {
//                authToken.set(it)
//            }
//        }
//    }
    packages {
        named("js") {
            files {
                // The files need to be set manually because we patch
                // the JS/TS produces by `compileProductionLibraryKotlinJs`
                // with the `patchTypesScriptInProductionLibrary` task
                setFrom(patchTypesScriptInProductionLibrary)
            }
            packageJson {
                name.set("@modelix/kernelf-editor")
            }
        }
    }
}

tasks.named("packJsPackage") {
    doLast {
        val packagesDir = buildDir.resolve("packages")
        packagesDir.resolve("modelix-kernelf-editor-$version.tgz")
            .copyTo(packagesDir.resolve("modelix-kernelf-editor.tgz"), overwrite = true)
    }
}
