import com.github.gradle.node.yarn.task.YarnSetupTask

plugins {
    base
    alias(coreLibs.plugins.node)
}

node {
    version.set("22.2.0")
    npmVersion.set("10.7.0")
    val isCIBuild = "true" == project.findProperty("ciBuild")
    download.set(!isCIBuild)
}

tasks.withType(YarnSetupTask::class.java) {
    dependsOn(":projectional-editor-ssr-client-lib:packJsPackage")
}

tasks.named("yarn_run_build") {
    dependsOn("yarnSetup")
    inputs.dir("src")
    inputs.file("package.json")
    inputs.file("yarn.lock")

    outputs.dir("dist")
}

tasks.named("assemble") {
    dependsOn("yarn_run_build")
}

val deleteDistFolder =
    tasks.register<Delete>("cleanDistFolder") {
        delete(
            layout.projectDirectory.dir("dist"),
            layout.projectDirectory.dir("node_modules/@modelix"),
        )
    }

tasks.clean {
    dependsOn(deleteDistFolder)
}
