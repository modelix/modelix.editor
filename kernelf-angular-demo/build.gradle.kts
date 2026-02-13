import com.github.gradle.node.npm.task.NpmInstallTask
import com.github.gradle.node.npm.task.NpmSetupTask
import com.github.gradle.node.npm.task.NpmTask

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

tasks.named("npm_run_build") {
    inputs.dir("src")
    inputs.file("package.json")
    inputs.file("package-lock.json")

    outputs.dir("dist")
}

tasks.named("assemble") {
    dependsOn("npm_run_build")
}

val updateTsModelApiVersion =
    tasks.create("updateTsModelApiVersion") {
        doLast {
            val localPath = rootDir.parentFile.resolve("modelix.core").resolve("ts-model-api")
            val packageJsonFile = projectDir.resolve("package.json")
            var text = packageJsonFile.readText()
            println("ts-model-api path: $localPath")
            val replacement =
                if (localPath.exists()) {
                    """"@modelix/ts-model-api": "file:${localPath.relativeTo(projectDir).toString().replace("\\", "\\\\")}""""
                } else {
                    """"@modelix/ts-model-api": "${rootProject.property("ts-model-api.version")}""""
                }
            println("ts-model-api version: $replacement")
            text = text.replace(Regex(""""@modelix/ts-model-api": ".*""""), { replacement })
            packageJsonFile.writeText(text)
        }
    }

tasks.withType<NpmSetupTask> {
    dependsOn(updateTsModelApiVersion)
    dependsOn(":kernelf-apigen:generateMetaModelSources")
    dependsOn(":kernelf-editor:packJsPackage")
}

val updateTask =
    tasks.register<NpmTask>("updateOwnDependencies") {
        args = listOf("update", "@modelix/kernelf-editor")
    }

tasks.withType<NpmInstallTask> {
    dependsOn(updateTask)
}
