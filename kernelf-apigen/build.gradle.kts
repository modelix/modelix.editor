import org.gradle.internal.jvm.Jvm
import org.modelix.mpsHomeDir

buildscript {
    repositories {
        maven { url = uri("https://artifacts.itemis.cloud/repository/maven-mps/") }
        mavenLocal()
    }
    dependencies {
        classpath(libs.modelix.model.api)
        classpath("com.charleskorn.kaml:kaml:0.85.0")
    }
}

plugins {
    kotlin("multiplatform")
    `maven-publish`
    alias(libs.plugins.modelix.model.api.gen)
    alias(libs.plugins.modelix.mps.buildtools)
}

val generatorOutputDir = buildDir.resolve("apigen").resolve("src_gen")
val tsGeneratorOutputDir = file("../kernelf-angular-demo/src/gen")

kotlin {
    jvm()
    js(IR) {
        browser {}
//        nodejs {
//            testTask {
//                useMocha {
//                    timeout = "10s"
//                }
//            }
//        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation(libs.modelix.model.api.gen.runtime)
                implementation(kotlin("stdlib-common"))
            }
            kotlin.srcDir(generatorOutputDir)
        }
        val commonTest by getting {
            dependencies {
            }
        }
        val jvmMain by getting {
            dependencies {
            }
        }
        val jvmTest by getting {
            dependencies {
            }
        }
        val jsMain by getting {
            dependencies {
            }
        }
        val jsTest by getting {
            dependencies {
            }
        }
    }
}

mpsBuild {
    mpsHome = mpsHomeDir.get().asFile.absolutePath
    javaHome = Jvm.current().javaHome
    externalModules("org.iets3:opensource:2023.2.7497.3fa5bb2")
}

metamodel {
    mpsHeapSize = "2g"
    dependsOn("copyDependencies")
    mpsHome = mpsHomeDir.get().asFile.absoluteFile
    modulesFrom(buildDir.resolve("mpsbuild/dependencies"))
    includeNamespace("org.iets3.core.expr")
    includeLanguage("org.modelix.model.repositoryconcepts")
    includeLanguage("de.slisson.mps.richtext")
    includeConcept("jetbrains.mps.lang.test.TestInfo")
    kotlinProject = project
    kotlinDir = generatorOutputDir
    typescriptDir = tsGeneratorOutputDir
    registrationHelperName = "org.modelix.kernelf.KernelfLanguages"
    conceptPropertiesInterfaceName = "org.modelix.kernelf.IConceptProperties"
    // exportModules("jetbrains.mps.baseLanguage")
}
