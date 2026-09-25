import org.gradle.internal.jvm.Jvm
import org.jetbrains.intellij.platform.gradle.tasks.PrepareSandboxTask
import org.modelix.mpsHomeDir

plugins {
    base
    `maven-publish`
    alias(libs.plugins.modelix.mps.buildtools)
}

group = "org.modelix.mps.modules"

val repositoryConcepts = configurations.create("repositoryConcepts")

dependencies {
    repositoryConcepts(libs.modelix.mps.repository.concepts)
}

// The MPS modules depend on the stubs of these plugins, which are generated into their sandboxes.
val pluginProjects = listOf(":editor-common-mps", ":projectional-editor-ssr-mps", ":react-ssr-mps")
pluginProjects.forEach { evaluationDependsOn(it) }
val pluginSandboxDirs =
    pluginProjects.map { path ->
        project(path).tasks.named<PrepareSandboxTask>("prepareSandbox").flatMap { it.pluginDirectory }
    }

val repositoryConceptsFolder = layout.buildDirectory.dir("repositoryConcepts")
val extractRepositoryConcepts =
    tasks.register("extractRepositoryConcepts", Sync::class) {
        from(zipTree({ repositoryConcepts.singleFile }))
        into(repositoryConceptsFolder)
    }

mpsBuild {
    dependsOn(extractRepositoryConcepts)
    dependsOn(":editor-common-mps:buildPlugin")
    dependsOn(":projectional-editor-ssr-mps:buildPlugin")
    dependsOn(":react-ssr-mps:buildPlugin")
    mpsHome = mpsHomeDir.get().asFile.absolutePath
    javaHome = Jvm.current().javaHome
    disableParentPublication()

    pluginSandboxDirs.forEach { search(it.get().asFile.absolutePath) }
    search(repositoryConceptsFolder.get().asFile.absolutePath)
    search("modules")
    publication("baseLanguage-notation") {
        module("org.modelix.mps.notation.impl.baseLanguage")
    }
    publication("editor-devkit") {
        module("org.modelix.mps.notation")
        module("org.modelix.mps.react")
        module("org.modelix.mps.react.componentslib")
        module("org.modelix.mps.react.ide")
        module("org.modelix.mps.webaspect.devkit")
        module("org.modelix.mps.webaspect.genplan")
    }
    publication("tests") {
        module("test.org.modelix.webaspect")
    }
}

tasks.all {
    if (name in setOf("assembleMpsModules")) {
        inputs.dir(project.layout.projectDirectory.dir("modules"))
        pluginSandboxDirs.forEach { inputs.dir(it) }
    }
    if (name == "assembleMpsModules") {
        outputs.dir(project.layout.buildDirectory.dir("mpsbuild/packaged-modules"))
        outputs.dir(project.layout.buildDirectory.dir("mpsbuild/publications"))
    }
//    if (name == "generateMpsAntScript") {
//        outputs.file(project.layout.buildDirectory.file("mpsbuild/build-modules.xml"))
//    }
}

// val ssrStubs: Configuration by configurations.creating
//
// dependencies {
//    ssrStubs(project(":projectional-editor-ssr-mps"))
// }
//
// val copyStubs = tasks.register("copySSRStubs", Sync::class) {
//    from(ssrStubs)
//    into(project.layout.projectDirectory.dir("org.modelix.mps.editor.ssr.stubs/lib"))
//
// }
