package svg.plugin

import jetbrains.mps.nodeEditor.EditorComponent
import jetbrains.mps.nodeEditor.EditorContext
import jetbrains.mps.project.Project
import org.jetbrains.mps.openapi.model.SModel
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.module.SRepository

class ServerInspectorEditorComponent(
    node: SNode?,
    project: Project,
) : ServerEditorComponent(node, project) {
    override fun createEditorContext(
        model: SModel?,
        repository: SRepository,
    ): EditorContext = ServerInspectorEditorContext(this, model, repository)

    private inner class ServerInspectorEditorContext(
        editorComponent: EditorComponent,
        model: SModel?,
        repository: SRepository,
    ) : EditorContext(editorComponent, model, repository) {
        override fun isInspector(): Boolean = true
    }
}
