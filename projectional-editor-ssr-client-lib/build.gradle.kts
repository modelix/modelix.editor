import dev.petuska.npm.publish.task.NpmPackTask

plugins {
    kotlin("multiplatform")
    `maven-publish`
    alias(libs.plugins.npm.publish)
}

kotlin {
    js(IR) {
        browser {
            commonWebpackConfig {
                cssSupport {
                    enabled.set(true)
                }
            }
        }
        binaries.library()
        generateTypeScriptDefinitions()
        useCommonJs()
    }

    sourceSets {
        val jsMain by getting {
            dependencies {
                implementation(project(":projectional-editor"))
                implementation(project(":projectional-editor-ssr-common"))
                implementation(coreLibs.ktor.client.core)
                implementation(coreLibs.ktor.client.websockets)
                implementation(coreLibs.ktor.client.js)
                implementation(libs.kotlin.html)
                implementation(libs.modelix.model.api)
                implementation(libs.kotlin.logging)
                implementation(libs.kotlinx.rpc.krpc.ktor.client)
                implementation(libs.kotlinx.rpc.krpc.serialization.json)
            }
        }
        val jsTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
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
            packageJson {
                name.set("@modelix/projectional-editor-ssr-client-lib")
                homepage.set("https://modelix.org/")
                repository {
                    type.set("git")
                    url.set("https://github.com/modelix/modelix.editor.git")
                    directory.set(project.name)
                }
            }
        }
    }
}

tasks.register("packageWithoutVersion", Copy::class.java) {
    dependsOn("packJsPackage")
    from(tasks.named("packJsPackage", NpmPackTask::class.java).map { it.outputFile })
    into(project.layout.buildDirectory.dir("packages")).rename { "${project.name}.tgz" }
}

tasks.named("packJsPackage") { dependsOn(":setupNodeEverywhere") }
