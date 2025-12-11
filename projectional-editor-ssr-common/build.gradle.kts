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
        nodejs {}
    }

    sourceSets {
        commonMain {
            dependencies {
                implementation(coreLibs.kotlin.serialization.json)
                api(project(":projectional-editor"))
                api(libs.modelix.model.api)
                api(coreLibs.kotlin.serialization.json)
                api(coreLibs.kotlin.coroutines.core)
                api(libs.kotlinx.rpc.core)
            }
        }
        commonTest {
            dependencies {
                implementation(kotlin("test"))
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
                implementation(kotlin("test"))
            }
        }
    }
}
