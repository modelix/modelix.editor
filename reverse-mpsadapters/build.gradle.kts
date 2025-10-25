import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
import org.modelix.mpsHomeDir

plugins {
    kotlin("jvm")
}

kotlin {
    jvmToolchain(21)
    compilerOptions {
        apiVersion = KotlinVersion.KOTLIN_1_8
    }
}

dependencies {
    implementation(libs.modelix.mps.model.adapters)
    compileOnly(
        fileTree(mpsHomeDir).matching {
            include("lib/*.jar")
        },
    )
}

group = "org.modelix.mps"
