package org.modelix.editor.ssr.mps

import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.application.ModalityState
import jetbrains.mps.editor.runtime.HeadlessEditorComponent
import jetbrains.mps.ide.ThreadUtils
import jetbrains.mps.intentions.IntentionsManager
import jetbrains.mps.openapi.intentions.IntentionExecutable
import jetbrains.mps.openapi.intentions.Kind
import jetbrains.mps.smodel.adapter.structure.MetaAdapterFactory
import jetbrains.mps.smodel.language.LanguageRegistry
import kotlinx.coroutines.CoroutineDispatcher
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.IContextActionsProvider
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.text.shared.ActionIcon
import org.modelix.model.api.INode
import org.modelix.model.mpsadapters.MPSNode
import kotlin.coroutines.CoroutineContext

/**
 * Offers the intentions of the MPS languages as context actions, the same ones the intentions menu of MPS (Alt+Enter)
 * shows for the node: the enabled intentions of the node and those of its ancestors that are available in child nodes.
 *
 * Intentions are written against an MPS editor, which they get as their [jetbrains.mps.openapi.editor.EditorContext]
 * and may use to check the selection or to select what they created. They get a [HeadlessEditorComponent] on the root
 * of the node with the node selected, and what an intention selects in it is selected in the web editor afterwards.
 *
 * The intentions are collected on the UI thread (see [EdtDispatcher]), like MPS does for its menu.
 *
 * Quick fixes of the checker messages aren't offered yet. MPS takes them from the messages its editor highlights,
 * which a headless editor has none of.
 */
class MPSIntentions(
    val repository: SRepository,
) : IContextActionsProvider {
    override fun getContextActions(
        node: INode,
        parameters: CodeCompletionParameters,
    ): List<IActionOrProvider> {
        val mpsNode = node.toMPS() ?: return emptyList()
        // MPS doesn't offer intentions in a model that can't be changed.
        val model = mpsNode.model ?: return emptyList()
        if (model.isReadOnly) return emptyList()

        val sectioned = isSectionedIntentionsMenuInstalled()
        return withHeadlessEditor(mpsNode) { editor ->
            val query = IntentionsManager.QueryDescriptor().also { it.setEnabledOnly(true) }
            IntentionsManager
                .getInstance()
                .getAvailableIntentions(query, mpsNode, editor.editorContext)
                .map { pair ->
                    val intention = pair.o1
                    val intentionNode = pair.o2
                    val description = intention.getDescription(intentionNode, editor.editorContext)
                    val (section, text) = if (sectioned) splitSection(description) else (null to description)
                    MPSIntentionAction(this, intention, intentionNode, text, section)
                }
        }
    }

    /**
     * The intentions menu of MPS-extensions (`com.mbeddr.mpsutil.intentions`) groups the intentions into sections. It
     * replaces the menu of every editor when its language is loaded.
     */
    private fun isSectionedIntentionsMenuInstalled(): Boolean =
        LanguageRegistry.getInstance(repository).getLanguage(SECTIONS_LANGUAGE) != null

    internal fun <R> withHeadlessEditor(
        node: SNode,
        body: (HeadlessEditorComponent) -> R,
    ): R {
        val editor = HeadlessEditorComponent(repository)
        try {
            editor.editNode(node.containingRoot)
            editor.selectNode(node)
            return body(editor)
        } finally {
            // An editor can only be disposed on the EDT and in a read action. Executing an intention is already there,
            // because it runs in a command, but the intentions are collected in a read action of the web editor.
            if (ThreadUtils.isInEDT()) {
                editor.dispose()
            } else {
                repository.modelAccess.runReadInEDT { editor.dispose() }
            }
        }
    }

    companion object {
        private val SECTIONS_LANGUAGE =
            MetaAdapterFactory.getLanguage(
                0xb92f861d0184446dUL.toLong(),
                0xb88b6dcf0e070241UL.toLong(),
                "com.mbeddr.mpsutil.intentions",
            )

        /**
         * Same as `com.mbeddr.mpsutil.intentions.runtime.ActionSection`: the text up to the first `:` names the section,
         * and what follows it is the text of the intention.
         */
        fun splitSection(description: String): Pair<String?, String> {
            val separatorPosition = description.indexOf(':')
            if (separatorPosition < 0) return null to description
            val section = description.substring(0, separatorPosition).takeIf { it.isNotEmpty() }
            return section to description.substring(separatorPosition + 1).trimStart()
        }
    }
}

class MPSIntentionAction(
    private val provider: MPSIntentions,
    val intention: IntentionExecutable,
    val node: SNode,
    private val text: String,
    private val section: String?,
) : ICodeCompletionAction {
    override fun getMatchingText(): String = text

    override fun getDescription(): String {
        val kind =
            when (intention.descriptor.kind) {
                Kind.ERROR -> "Error intention"
                Kind.QUICKFIX -> "Quick fix"
                Kind.MIGRATION -> "Migration"
                Kind.NORMAL, null -> "Intention"
            }
        return "$kind of ${node.concept.name}"
    }

    override fun getGroup(): String? = section

    /**
     * Same as `jetbrains.mps.intentions.icons.IntentionIconProvider`, which shows a quick fix like a normal intention.
     */
    override fun getIcon(): ActionIcon =
        when (intention.descriptor.kind) {
            Kind.ERROR -> ActionIcon.ERROR_INTENTION
            Kind.MIGRATION -> ActionIcon.MIGRATION
            Kind.QUICKFIX, Kind.NORMAL, null -> ActionIcon.INTENTION
        }

    /**
     * Runs in the command of the web editor, which an intention is executed in by MPS as well.
     */
    override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? =
        provider.withHeadlessEditor(node) { headless ->
            val selectedBefore = headless.selectedNode
            intention.execute(node, headless.editorContext)
            // The selection of a node the intention created needs the cells for it.
            headless.editorContext.flushEvents()
            headless.selectedNode
                ?.takeIf { it != selectedBefore && it.model != null }
                ?.let { CaretPositionPolicy(MPSNode(it)) }
        }
}

/**
 * Runs coroutines on the UI thread, where MPS also collects the intentions for its menu. A [HeadlessEditorComponent]
 * can only be created there, because the editor asks the IntelliJ data context for its project.
 *
 * Holding a read action there is safe, unlike waiting for the UI thread while holding one, which deadlocks as soon as
 * a write action is pending on the UI thread.
 */
object EdtDispatcher : CoroutineDispatcher() {
    override fun isDispatchNeeded(context: CoroutineContext): Boolean = !ApplicationManager.getApplication().isDispatchThread

    override fun dispatch(
        context: CoroutineContext,
        block: Runnable,
    ) {
        // Also while a modal dialog is open, the actions are only read.
        ApplicationManager.getApplication().invokeLater(block, ModalityState.any())
    }
}
