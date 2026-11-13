package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.div
import org.modelix.editor.text.shared.CompletionMenuEntryData

/**
 * The menu of the context actions of the selection (see [getContextActions]).
 *
 * Nothing is being completed here, so unlike the [CodeCompletionMenu] it leaves the text of the selected cell alone: it
 * opens below the cell, and what is typed only searches the entries, anywhere in their text and ignoring the case. An
 * action is only executed once the user confirmed it. The entries don't depend on the pattern, so they are filtered
 * here instead of being loaded again from the backend.
 *
 * The entries are listed under a heading per group (see [org.modelix.editor.ICodeCompletionAction.getGroup]), like the
 * sections of the MPS intentions menu, and with an icon instead of a description, like the intentions there.
 */
class ContextActionsMenu(
    editor: FrontendEditorComponent,
    anchor: LayoutableCell,
    initialEntries: List<CompletionMenuEntryData>,
) : ActionMenu(editor, anchor, initialEntries) {
    override val patternClass: String get() = "context-actions-pattern"
    override val selectedEntryClass: String get() = "selected"

    override fun matches(entry: CompletionMenuEntryData): Boolean = entry.matches(patternEditor.pattern, ignoreCase = true)

    override suspend fun updateEntries() {
        applyFilter()
        editor.invalidateActionMenu()
    }

    override fun getPosition(anchorBounds: Bounds): Position = Position(anchorBounds.x, anchorBounds.y + anchorBounds.height)

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("context-actions-menu") {
            div("context-actions-title") {
                +"Context Actions"
            }
            if (patternEditor.pattern.isNotEmpty()) {
                div("context-actions-search") {
                    produceChild(patternEditor)
                }
            }
            div("context-actions-entries") {
                filteredEntries.forEachIndexed { index, entry ->
                    // The entries arrive ordered by their group, so a group starts where it differs from the previous.
                    val group = entry.group
                    if (group != null && group != filteredEntries.getOrNull(index - 1)?.group) {
                        div("context-actions-group") {
                            +group
                        }
                    }
                    div(if (index == selectedIndex) "context-action $selectedEntryClass" else "context-action") {
                        // Also without an icon, so that the texts of all entries line up.
                        div(listOfNotNull("context-action-icon", entry.icon?.let { "icon-${it.cssClass}" }).joinToString(" ")) { }
                        div("context-action-text") {
                            +entry.matchingText
                        }
                    }
                }
                if (filteredEntries.isEmpty()) {
                    div("context-actions-empty") {
                        +(if (allEntries.isEmpty()) "No actions available" else "No matches found")
                    }
                }
            }
        }
    }
}
