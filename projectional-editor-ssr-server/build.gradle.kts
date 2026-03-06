plugins {
    kotlin("jvm")
    `maven-publish`
}

dependencies {
    implementation(project(":projectional-editor"))
    implementation(project(":projectional-editor-ssr-common"))
    implementation(libs.ktor.server.core)
    implementation(libs.ktor.server.websockets)
    implementation(libs.kotlin.logging)
    implementation(libs.kotlinx.rpc.krpc.ktor.server)
    implementation(libs.kotlinx.rpc.krpc.serialization.json)
}

kotlin {
    jvmToolchain(17)
}
