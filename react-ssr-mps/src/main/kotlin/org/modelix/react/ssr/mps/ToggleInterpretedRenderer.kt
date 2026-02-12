package org.modelix.react.ssr.mps

import com.intellij.openapi.actionSystem.ActionUpdateThread
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.project.DumbAwareAction

class ToggleInterpretedRenderer : DumbAwareAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.EDT

    override fun actionPerformed(event: AnActionEvent) {
        ReactSSRServerForMPS.getInstance().toggleInterpreterMode()
    }

    override fun update(e: AnActionEvent) {
        e.presentation.text =
            (if (ReactSSRServerForMPS.getInstance().isInterpreterMode()) "Disabled" else "Enable") + " Web Editor Interpreter Mode"
    }
}
