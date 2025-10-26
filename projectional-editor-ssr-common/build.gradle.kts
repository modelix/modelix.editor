plugins {
    kotlin("multiplatform")
    kotlin("plugin.serialization")
    `maven-publish`
}

kotlin {
    jvmToolchain(21)
    jvm()
    js(IR) {
        browser {}
        nodejs {}
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation(coreLibs.kotlin.serialization.json)
                api(project(":projectional-editor"))
                api(libs.modelix.model.api)
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val jvmMain by getting {
            dependencies {
            }
        }
        val jvmTest by getting {
            dependencies {
                implementation(kotlin("test"))
                implementation(kotlin("test-junit"))
            }
        }
        val jsMain by getting {
            dependencies {
            }
        }
        val jsTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
    }
}
