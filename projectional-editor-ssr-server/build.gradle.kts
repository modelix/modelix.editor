plugins {
    kotlin("jvm")
    `maven-publish`
}

dependencies {
    implementation(project(":projectional-editor"))
    implementation(project(":projectional-editor-ssr-common"))
    implementation(coreLibs.ktor.server.core)
    implementation(coreLibs.ktor.server.websockets)
    implementation(libs.kotlin.logging)
}

kotlin {
    jvmToolchain(21)
}
