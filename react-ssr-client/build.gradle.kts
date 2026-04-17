import com.github.gradle.node.pnpm.task.PnpmSetupTask

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

tasks.withType(PnpmSetupTask::class.java) {
    dependsOn(":projectional-editor-ssr-client-lib:packJsPackage")
}

tasks.named("pnpm_run_build") {
    dependsOn("pnpmSetup")
    inputs.dir("src")
    inputs.file("package.json")
    inputs.file("pnpm-lock.yaml")

    outputs.dir("dist")
}

tasks.named("assemble") {
    dependsOn("pnpm_run_build")
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
