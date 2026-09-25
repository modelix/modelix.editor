plugins {
    kotlin("multiplatform")
    kotlin("plugin.serialization")
    alias(libs.plugins.kotlin.rpc)
    `maven-publish`
}

kotlin {
    jvmToolchain(17)
    jvm()
    js(IR) {
        browser {}
        nodejs {
            testTask {
                useMocha {
                    timeout = "10s"
                }
            }
        }
    }

    sourceSets {
        commonMain {
            dependencies {
                implementation(libs.modelix.model.api)
                implementation(libs.modelix.model.api.gen.runtime)
                implementation(kotlin("stdlib-common"))
                implementation(libs.kotlin.logging)
                implementation(coreLibs.kotlin.coroutines.core)
                implementation(coreLibs.kotlin.serialization.json)
                api(coreLibs.modelix.incremental)
                api(libs.kotlin.html)
                api(libs.kotlinx.rpc.core)
                api(project(":parser"))
            }
        }
        commonTest {
            dependencies {
                implementation(coreLibs.kotlin.coroutines.test)
                implementation(kotlin("test-common"))
                implementation(kotlin("test-annotations-common"))
            }
        }
        jvmMain {
            dependencies {
            }
        }
        jvmTest {
            dependencies {
                implementation(kotlin("test"))
                implementation(kotlin("test-junit"))
            }
        }
        jsMain {
            dependencies {
            }
        }
        jsTest {
            dependencies {
                implementation(kotlin("test-js"))
                implementation(npm("jsdom-global", "3.0.2"))
                implementation(npm("jsdom", "20.0.2"))
                implementation(npm("@modelix/ts-model-api", rootProject.property("ts-model-api.version").toString()))
            }
        }
    }
}
