package org.modelix.react.ssr.mps

import com.intellij.ide.browsers.actions.WebPreviewVirtualFile
import com.intellij.openapi.actionSystem.ActionUpdateThread
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.fileEditor.ex.FileEditorManagerEx
import com.intellij.openapi.project.DumbAwareAction
import com.intellij.util.Urls
import jetbrains.mps.ide.actions.MPSCommonDataKeys
import jetbrains.mps.ide.project.ProjectHelper
import jetbrains.mps.nodefs.NodeVirtualFileSystem
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import java.net.URLEncoder
import java.nio.charset.StandardCharsets

class OpenNodeInWebEditorAction : DumbAwareAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.EDT

    override fun actionPerformed(event: AnActionEvent) {
        val project = event.project ?: return
        val node = event.getRequiredData(MPSCommonDataKeys.NODE)
        val mpsProject = checkNotNull(ProjectHelper.fromIdeaProject(project)) { "No MPSProject found for $project" }
        val nodeFile = NodeVirtualFileSystem.getInstance().getFileFor(mpsProject.repository, node)

        fun urlEncode(input: String) = URLEncoder.encode(input, StandardCharsets.UTF_8)

        fun concatUrl(nodeRef: String) = "http://localhost:43595/nodes/${urlEncode(nodeRef)}/client/"

        fun parseUrl(url: String) = Urls.parse(url, false)!!
        val nodeRef = ModelixNodeAsMPSNode.toModelixNode(node).reference.serialize()
        val expectedUrl = concatUrl(nodeRef)
        val parsedUrl = parseUrl(expectedUrl)
        val workaroundUrl =
            if (parsedUrl.toExternalForm() == expectedUrl) {
                parsedUrl
            } else {
                // double encode to work around a bug in IntelliJ
                parseUrl(concatUrl(urlEncode(nodeRef)))
            }

        val file = WebPreviewVirtualFile(nodeFile, workaroundUrl)
        FileEditorManagerEx.getInstanceEx(project).openFile(
            file = file,
            focusEditor = true,
            searchForOpen = true
        )
    }

    override fun update(e: AnActionEvent) {
        val project = e.project
        val node = e.getData(MPSCommonDataKeys.NODE)
        val enabled = project != null && node != null
        e.presentation.isEnabledAndVisible = enabled
    }
}
