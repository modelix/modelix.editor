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
    implementation(coreLibs.ktor.server.core)
    implementation(coreLibs.ktor.server.netty)
    implementation(coreLibs.ktor.server.websockets)
    implementation(coreLibs.logback.classic)
}

application {
    mainClass.set("io.ktor.server.netty.EngineMain")
    applicationDefaultJvmArgs = listOf("-Dio.ktor.development=true")
}

kotlin {
    jvmToolchain(21)
}
