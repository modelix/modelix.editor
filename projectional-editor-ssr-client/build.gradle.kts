import org.jetbrains.kotlin.gradle.dsl.JsSourceMapEmbedMode

plugins {
    kotlin("multiplatform")
    `maven-publish`
}

kotlin {
    js(IR) {
        compilerOptions {
            sourceMapEmbedSources = JsSourceMapEmbedMode.SOURCE_MAP_SOURCE_CONTENT_INLINING
        }
        browser {
            commonWebpackConfig {
                cssSupport {
                    enabled.set(true)
                }
            }
        }

        binaries.executable()
        generateTypeScriptDefinitions()
        useCommonJs()
    }

    sourceSets {
        val jsMain by getting {
            dependencies {
                implementation(project(":projectional-editor"))
                implementation(project(":projectional-editor-ssr-common"))
                implementation(project(":projectional-editor-ssr-client-lib"))
                implementation(libs.ktor.client.core)
                implementation(libs.ktor.client.websockets)
                implementation(libs.ktor.client.js)
                implementation(libs.kotlin.html)
                implementation(libs.modelix.model.api)
                implementation(libs.kotlin.logging)
                implementation(libs.kotlinx.rpc.krpc.client)
                implementation(libs.kotlinx.rpc.krpc.ktor.client)
            }
        }
        val jsTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
    }
}
