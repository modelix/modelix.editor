plugins {
    kotlin("jvm")
    kotlin("plugin.serialization")
    `maven-publish`
}

dependencies {
    implementation(libs.modelix.model.api)
    api(coreLibs.modelix.incremental)
    implementation(coreLibs.ktor.server.core)
    implementation(coreLibs.ktor.server.netty)
    implementation(coreLibs.ktor.server.websockets)
    implementation(libs.kotlin.logging)
    implementation(coreLibs.kotlin.serialization.json)
}

kotlin {
    jvmToolchain(21)
}

val copyClient = tasks.register("copyClient", Sync::class.java) {
    dependsOn(project(":react-ssr-client").tasks.named("yarn_run_build"))
    from(project(":react-ssr-client").layout.projectDirectory.dir("dist"))
    into(project.layout.buildDirectory.dir("client/org/modelix/react/ssr/client"))
}

tasks.processResources {
    dependsOn(copyClient)
}

sourceSets {
    main {
        resources {
            srcDir(project.layout.buildDirectory.dir("client"))
        }
    }
}
