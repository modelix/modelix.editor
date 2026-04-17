plugins {
    kotlin("jvm")
    kotlin("plugin.serialization")
    `maven-publish`
}

dependencies {
    implementation(libs.modelix.model.api)
    api(coreLibs.modelix.incremental)
    implementation(libs.ktor.server.core)
    implementation(libs.ktor.server.netty)
    implementation(libs.ktor.server.websockets)
    implementation(libs.kotlin.logging)
    implementation(coreLibs.kotlin.serialization.json)
}

kotlin {
    jvmToolchain(17)
}

val copyClient =
    tasks.register("copyClient", Sync::class.java) {
        dependsOn(project(":react-ssr-client").tasks.named("pnpm_run_build"))
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
