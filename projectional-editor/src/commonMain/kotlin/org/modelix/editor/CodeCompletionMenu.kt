package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.div
import kotlinx.html.table
import kotlinx.html.td
import kotlinx.html.tr
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.text.shared.ActionIcon
import org.modelix.editor.text.shared.CompletionMenuEntryData

class CodeCompletionMenu(
    editor: FrontendEditorComponent,
    anchor: LayoutableCell,
    val completionPosition: CompletionPosition,
    initialEntries: List<CompletionMenuEntryData>,
    initialPattern: String = "",
    initialCaretPosition: Int? = null,
) : ActionMenu(editor, anchor, initialEntries, initialPattern, initialCaretPosition) {
    override val patternClass: String get() = "ccmenu-pattern"
    override val selectedEntryClass: String get() = "ccSelectedEntry"

    override fun matches(entry: CompletionMenuEntryData): Boolean = entry.matches(patternEditor.getTextBeforeCaret())

    override suspend fun updateEntries() {
        editor.updateCodeCompletionActions(getAnchor().cell, patternEditor.getTextBeforeCaret())
    }

    override suspend fun onPatternEdited() {
        // A menu that typing next to a cell opened shows what can follow the typed text. Without it, it's taken back.
        if (completionPosition != CompletionPosition.CENTER && patternEditor.pattern.isEmpty()) {
            editor.closeActionMenu()
            return
        }
        updateEntries()
        executeIfSingleAction()
    }

    override suspend fun onTextInserted(
        oldTextBeforeCaret: String,
        remainingText: String,
    ) {
        val exactMatches = allEntries.filter { it.matchesExactly(oldTextBeforeCaret) }
        if (exactMatches.size == 1 &&
            !editor.serviceCall {
                hasCodeCompletionActions(editor.editorId, getAnchor().cell.getId(), patternEditor.getTextBeforeCaret())
            }
        ) {
            execute(exactMatches.single())
            editor.closeActionMenu()
            if (remainingText.isNotEmpty()) {
                editor.enqueueUpdate {
                    (editor.getSelection() as CaretSelection).processTypedText(remainingText)
                }
            }
        } else {
            onPatternEdited()
            if (filteredEntries.isEmpty()) applyCompletedText(oldTextBeforeCaret)
        }
    }

    /**
     * Nothing matches anymore after the user went on typing behind a space. What was typed before the space is
     * complete if one entry is written exactly like it: `else` of `else {`, which can't be told apart from `else if`
     * before the `{`. That entry is applied, and the rest is typed again behind it.
     */
    private suspend fun applyCompletedText(oldTextBeforeCaret: String) {
        val completedText = oldTextBeforeCaret.trimEnd()
        if (completedText.isEmpty() || completedText == oldTextBeforeCaret) return
        val remainingText = patternEditor.pattern.substring(completedText.length).trimStart()
        editor.updateCodeCompletionActions(getAnchor().cell, completedText)
        val entry = allEntries.singleOrNull { it.matchesExactly(completedText) }
        if (entry == null) {
            updateEntries()
            return
        }
        execute(entry)
        if (remainingText.isNotEmpty()) {
            editor.enqueueUpdate {
                (editor.getSelection() as? CaretSelection)?.processTypedText(remainingText)
            }
        }
    }

    suspend fun executeIfSingleAction() {
        val singleEntry = filteredEntries.singleOrNull() ?: return
        if (singleEntry.matchesExactly(patternEditor.getTextBeforeCaret())) {
            execute(singleEntry)
        }
    }

    override fun getPosition(anchorBounds: Bounds): Position {
        val left =
            when (completionPosition) {
                CompletionPosition.CENTER -> anchorBounds.x
                CompletionPosition.LEFT -> anchorBounds.x - (getPatternElement()?.getOuterBounds()?.width ?: 0.0)
                CompletionPosition.RIGHT -> anchorBounds.maxX()
            }
        return Position(left, anchorBounds.y)
    }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("ccmenu-container") {
            produceChild(patternEditor)
            div("ccmenu") {
                table {
                    filteredEntries.forEachIndexed { index, action ->
                        tr(selectedEntryClass.takeIf { index == selectedIndex }) {
                            td("matchingText") {
                                +action.matchingText
                            }
                            td("description") {
                                +action.description
                            }
                        }
                    }
                    if (filteredEntries.isEmpty()) {
                        tr {
                            td {
                                +"No matches found"
                            }
                        }
                    }
                }
            }
        }
    }
}

class CachedCodeCompletionActions(
    providers: List<ICodeCompletionActionProvider>,
) {
    private var cacheEntries: List<CacheEntry> = providers.map { CacheEntry(it) }

    fun update(parameters: CodeCompletionParameters): List<ICodeCompletionAction> = cacheEntries.flatMap { it.update(parameters) }.toList()

    inner class CacheEntry(
        val provider: IActionOrProvider,
    ) {
        private var initialized = false
        private var cacheEntries: List<CacheEntry> = emptyList()
        private var dependsOnPattern: Boolean = true

        fun update(parameters: CodeCompletionParameters): Sequence<ICodeCompletionAction> {
            return when (provider) {
                is ICodeCompletionAction -> {
                    sequenceOf(provider)
                }

                is ICodeCompletionActionProvider -> {
                    parameters.wasPatternAccessed() // reset state
                    if (!initialized || dependsOnPattern) {
                        cacheEntries = provider.getApplicableActions(parameters).map { CacheEntry(it) }
                        dependsOnPattern = parameters.wasPatternAccessed()
                        initialized = true
                    }
                    return cacheEntries.asSequence().flatMap { it.update(parameters) }
                }

                else -> {
                    throw RuntimeException("Unknown type: " + provider::class)
                }
            }
        }
    }
}

interface IActionOrProvider

interface ICodeCompletionActionProvider : IActionOrProvider {
    fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider>
}

fun ICodeCompletionActionProvider.flattenApplicableActions(parameters: CodeCompletionParameters): List<ICodeCompletionAction> =
    flatten(parameters).toList()

class ActionAsProvider(
    val action: ICodeCompletionAction,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> = listOf(action)
}

fun ICodeCompletionAction.asProvider(): ICodeCompletionActionProvider = ActionAsProvider(this)

fun IActionOrProvider.asProvider(): ICodeCompletionActionProvider =
    when (this) {
        is ICodeCompletionAction -> ActionAsProvider(this)
        is ICodeCompletionActionProvider -> this
        else -> error("Unknown type: $this")
    }

private fun IActionOrProvider.flatten(parameters: CodeCompletionParameters): Sequence<ICodeCompletionAction> =
    when (this) {
        is ICodeCompletionAction -> sequenceOf(this)
        is ICodeCompletionActionProvider -> getApplicableActions(parameters).asSequence().flatMap { it.flatten(parameters) }
        else -> throw RuntimeException("Unknown type: " + this::class)
    }

interface ICodeCompletionAction : IActionOrProvider {
    fun getMatchingText(): String

    fun getTokens(): ICompletionTokenOrList = ConstantCompletionToken(getMatchingText())

    fun getDescription(): String

    /**
     * The group a menu that groups its entries lists this action under, like the sections of the MPS intentions menu.
     * Actions without a group come first, without a heading. The code completion menu doesn't group its entries.
     */
    fun getGroup(): String? = null

    /**
     * What a menu that shows icons shows in front of the action. The context actions menu does, the code completion
     * menu doesn't.
     */
    fun getIcon(): ActionIcon? = null

    fun execute(editor: BackendEditorComponent): ICaretPositionPolicy?

    fun shadows(shadowed: ICodeCompletionAction) = false

    fun shadowedBy(shadowing: ICodeCompletionAction) = false
}

fun ICodeCompletionAction.getCompletionPattern(): String = getTokens().toString()

class CodeCompletionParameters(
    val editor: BackendEditorComponent,
    pattern: String,
) {
    val pattern: String = pattern
        get() {
            patternAccessed = true
            return field
        }
    private var patternAccessed: Boolean = false

    fun wasPatternAccessed(): Boolean {
        val result = patternAccessed
        patternAccessed = false
        return result
    }
}

enum class CompletionPosition {
    CENTER,
    LEFT,
    RIGHT,
}

fun List<ICodeCompletionAction>.applyShadowing(): List<ICodeCompletionAction> =
    groupBy {
        it.getCompletionPattern()
    }.flatMap { applyShadowingToGroup(it.value) }

/**
 * Two actions that shadow each other do the same, so only the first one of them is kept.
 */
private fun applyShadowingToGroup(actions: List<ICodeCompletionAction>): List<ICodeCompletionAction> {
    fun ICodeCompletionAction.isShadowedBy(other: ICodeCompletionAction) = other.shadows(this) || shadowedBy(other)
    return actions.filterIndexed { index, a1 ->
        val isShadowed =
            actions.withIndex().any { (otherIndex, a2) ->
                a2 !== a1 && a1.isShadowedBy(a2) && (otherIndex < index || !a2.isShadowedBy(a1))
            }
        !isShadowed
    }
}
