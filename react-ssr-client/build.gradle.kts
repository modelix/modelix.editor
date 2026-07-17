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

// The local @modelix/projectional-editor-ssr-client-lib dependency is a pnpm
// `file:` dependency pointing at this directory, which is produced from the
// Kotlin/JS sources of :projectional-editor-ssr-client-lib.
val clientLibPackageDir =
    project(":projectional-editor-ssr-client-lib").layout.buildDirectory.dir("packages/js")

tasks.withType(PnpmSetupTask::class.java) {
    dependsOn(":projectional-editor-ssr-client-lib:packJsPackage")
}

// `pnpm install` copies the `file:` dependency into node_modules, but Gradle only
// re-runs pnpmInstall when it sees a changed input. Declaring the client library
// package as an input makes pnpmInstall refresh node_modules whenever the Kotlin/JS
// sources change, instead of silently reusing a stale copy.
tasks.named("pnpmInstall") {
    dependsOn(":projectional-editor-ssr-client-lib:assembleJsPackage")
    inputs.dir(clientLibPackageDir).withPropertyName("clientLibPackage")
}

tasks.named("pnpm_run_build") {
    dependsOn("pnpmInstall")
    inputs.dir("src")
    inputs.file("package.json")
    inputs.file("pnpm-lock.yaml")
    // Without this the vite build is considered up-to-date and produces a stale
    // client bundle when only the Kotlin/JS client library changed.
    inputs.dir(clientLibPackageDir).withPropertyName("clientLibPackage")

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
