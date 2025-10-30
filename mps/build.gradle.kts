import org.gradle.internal.jvm.Jvm
import org.modelix.mpsHomeDir

plugins {
    base
    `maven-publish`
    alias(libs.plugins.modelix.mps.buildtools)
}

group = "org.modelix.mps.modules"

val repositoryConcepts by configurations.creating

dependencies {
    repositoryConcepts(libs.modelix.mps.repository.concepts)
}

val repositoryConceptsFolder = layout.buildDirectory.dir("repositoryConcepts")
val extractRepositoryConcepts = tasks.register("extractRepositoryConcepts", Sync::class) {
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

    search("../editor-common-mps/build/idea-sandbox/plugins/editor-common-mps")
    search("../projectional-editor-ssr-mps/build/idea-sandbox/plugins/projectional-editor-ssr-mps")
    search("../react-ssr-mps/build/idea-sandbox/plugins/react-ssr-mps")
    search(repositoryConceptsFolder.get().asFile.absolutePath)
    search("modules")
    publication("baseLanguage-notation") {
        module("org.modelix.mps.notation.impl.baseLanguage")
    }
    publication("editor-devkit") {
        module("org.modelix.mps.notation")
        module("org.modelix.mps.react")
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
        inputs.dir(project(":editor-common-mps").layout.buildDirectory.dir("idea-sandbox/plugins/editor-common-mps"))
        inputs.dir(project(":projectional-editor-ssr-mps").layout.buildDirectory.dir("idea-sandbox/plugins/projectional-editor-ssr-mps"))
        inputs.dir(project(":react-ssr-mps").layout.buildDirectory.dir("idea-sandbox/plugins/react-ssr-mps"))
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
