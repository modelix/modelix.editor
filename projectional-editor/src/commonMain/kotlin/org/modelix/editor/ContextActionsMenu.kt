package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.div
import org.modelix.editor.text.shared.CompletionMenuEntryData
import kotlin.math.max
import kotlin.math.min

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

    /**
     * Below the anchor, as tall as the space down to the end of the visible part of the editor allows. If the entries
     * don't fit there, but there is more space above the anchor, the menu opens above it instead, like the popups of
     * MPS do.
     */
    override fun place(
        menuElement: IVirtualDom.HTMLElement,
        anchorBounds: Bounds,
        visibleBounds: Bounds?,
    ): Position {
        val below = getPosition(anchorBounds)
        if (visibleBounds == null) return below
        val entriesElement = menuElement.elementsWithClass("context-actions-entries").firstOrNull() ?: return below

        val entriesBounds = entriesElement.getOuterBounds()
        // The title and the search pattern.
        val headerHeight = menuElement.getOuterBounds().height - entriesBounds.height
        // The entries element may be limited from the last time, but the entries in it still have their full height.
        val entries = entriesElement.childNodes.filterIsInstance<IVirtualDom.Element>()
        val contentHeight =
            if (entries.isEmpty()) entriesBounds.height else entries.last().getOuterBounds().maxY() - entries.first().getOuterBounds().y

        val spaceBelow = visibleBounds.maxY() - anchorBounds.maxY() - MARGIN
        val spaceAbove = anchorBounds.y - visibleBounds.y - MARGIN
        val openAbove = headerHeight + contentHeight > spaceBelow && spaceAbove > spaceBelow
        val maxEntriesHeight = max(MIN_ENTRIES_HEIGHT, (if (openAbove) spaceAbove else spaceBelow) - headerHeight)
        entriesElement.style["max-height"] = "${maxEntriesHeight}px"

        if (!openAbove) return below
        return Position(anchorBounds.x, anchorBounds.y - headerHeight - min(contentHeight, maxEntriesHeight))
    }

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

    private companion object {
        /** Between the menu and the end of the visible part of the editor. */
        const val MARGIN = 4.0

        /** Below this the menu rather scrolls the editor than its entries. */
        const val MIN_ENTRIES_HEIGHT = 100.0
    }
}
