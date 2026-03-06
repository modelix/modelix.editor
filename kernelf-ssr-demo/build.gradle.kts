plugins {
    kotlin("jvm")
    `maven-publish`
    application
}

dependencies {
    implementation(project(":kernelf-apigen"))
    implementation(project(":kernelf-editor"))
    implementation(project(":projectional-editor"))
    implementation(project(":projectional-editor-ssr-server"))
    implementation(libs.modelix.model.datastructure)
    implementation(libs.modelix.model.client)
    implementation(libs.ktor.server.core)
    implementation(libs.ktor.server.netty)
    implementation(libs.ktor.server.websockets)
    implementation(libs.kotlinx.rpc.krpc.ktor.server)
    implementation(libs.kotlinx.rpc.krpc.serialization.json)
    implementation(coreLibs.logback.classic)
}

application {
    mainClass.set("io.ktor.server.netty.EngineMain")
    applicationDefaultJvmArgs = listOf("-Dio.ktor.development=true")
}

kotlin {
    jvmToolchain(17)
}
