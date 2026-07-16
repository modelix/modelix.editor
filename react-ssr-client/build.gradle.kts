import com.github.gradle.node.pnpm.task.PnpmSetupTask

plugins {
    base
    alias(coreLibs.plugins.node)
}

// Single sources of truth so the locally downloaded toolchain and the one CI puts on
// the PATH cannot drift apart:
//   - Node version comes from .nvmrc (also consumed by actions/setup-node in CI)
//   - pnpm version comes from the root package.json "packageManager" field
//     (also consumed by pnpm/action-setup in CI)
val nvmrcNodeVersion =
    rootDir
        .resolve(".nvmrc")
        .readText()
        .trim()
        .removePrefix("v")
val packageManagerPnpmVersion =
    run {
        @Suppress("UNCHECKED_CAST")
        val rootPackageJson = groovy.json.JsonSlurper().parse(rootDir.resolve("package.json")) as Map<String, Any?>
        val packageManager =
            rootPackageJson["packageManager"] as? String
                ?: error("No \"packageManager\" field in root package.json")
        Regex("""pnpm@([0-9]+\.[0-9]+\.[0-9]+)""").find(packageManager)?.groupValues?.get(1)
            ?: error("Could not parse a pnpm version from packageManager: $packageManager")
    }

node {
    version.set(nvmrcNodeVersion)
    npmVersion.set("11.13.0")
    pnpmVersion.set(packageManagerPnpmVersion)
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
