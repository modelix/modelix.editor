package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.div
import kotlinx.html.table
import kotlinx.html.td
import kotlinx.html.tr
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.text.shared.CompletionMenuEntryData

class CodeCompletionMenu(
    val editor: FrontendEditorComponent,
    val anchor: LayoutableCell,
    val completionPosition: CompletionPosition,
    initialEntries: List<CompletionMenuEntryData>,
    initialPattern: String = "",
    initialCaretPosition: Int? = null,
) : IProducesHtml, IKeyboardHandler {
    val patternEditor = PatternEditor(initialPattern, initialCaretPosition)
    private var selectedIndex: Int = 0
    private var allEntries: List<CompletionMenuEntryData> = initialEntries
    private var filteredEntries: List<CompletionMenuEntryData> = allEntries

    init {
        applyFilter()
    }

    override fun isHtmlOutputValid(): Boolean = false

    fun loadEntries(newActions: List<CompletionMenuEntryData>) {
        allEntries = newActions
        applyFilter()
    }

    fun applyFilter() {
        val pattern = patternEditor.pattern
        filteredEntries = allEntries.filter { it.matches(pattern) }
    }

    suspend fun updateActions() {
        editor.serviceCall { this.updateCodeCompletionActions(editor.editorId, anchor.cell.getId(), patternEditor.pattern) }
    }

    fun selectNext() {
        selectedIndex++
        if (selectedIndex >= filteredEntries.size) selectedIndex = 0
    }

    fun selectPrevious() {
        selectedIndex--
        if (selectedIndex < 0) selectedIndex = (filteredEntries.size - 1).coerceAtLeast(0)
    }

    fun getSelectedEntry(): CompletionMenuEntryData? = filteredEntries.getOrNull(selectedIndex)

    override suspend fun processKeyDown(event: JSKeyboardEvent): Boolean {
        when (event.knownKey) {
            KnownKeys.ArrowUp -> selectPrevious()
            KnownKeys.ArrowDown -> selectNext()
            KnownKeys.ArrowLeft -> patternEditor.moveCaret(-1)
            KnownKeys.ArrowRight -> patternEditor.moveCaret(1)
            KnownKeys.Escape -> editor.closeCodeCompletionMenu()
            KnownKeys.Enter -> {
                getSelectedEntry()?.execute()
            }
            KnownKeys.Backspace -> patternEditor.deleteText(true)
            KnownKeys.Delete -> patternEditor.deleteText(false)
            else -> {
                if (!event.typedText.isNullOrEmpty()) {
                    patternEditor.insertText(event.typedText)
                } else {
                    return false
                }
            }
        }
        editor.flushLocal()
        return true
    }

    private suspend fun CompletionMenuEntryData.execute() {
        val entry = this
        editor.serviceCall { executeCodeCompletionAction(editor.editorId, entry.id) }
        editor.closeCodeCompletionMenu()
    }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("ccmenu-container") {
            produceChild(patternEditor)
            div("ccmenu") {
                table {
                    filteredEntries.forEachIndexed { index, action ->
                        tr("ccSelectedEntry".takeIf { index == selectedIndex }) {
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

    suspend fun executeIfSingleAction() {
        val singleEntry = filteredEntries.singleOrNull() ?: return
        if (singleEntry.matchesExactly(patternEditor.pattern)) {
            singleEntry.execute()
        }
    }

    inner class PatternEditor(initialPattern: String, initialCaretPosition: Int?) : IProducesHtml {
        private var patternCell: Cell? = null
        var caretPos: Int = initialCaretPosition ?: initialPattern.length
        var pattern: String = initialPattern

        override fun isHtmlOutputValid(): Boolean = false

        fun getTextBeforeCaret() = pattern.substring(0, caretPos)

        suspend fun deleteText(before: Boolean): Boolean {
            if (before) {
                if (caretPos == 0) return false
                pattern = pattern.removeRange((caretPos - 1) until caretPos)
                caretPos--
            } else {
                if (caretPos == pattern.length) return false
                pattern = pattern.removeRange(caretPos..caretPos)
            }
            updateActions()
            executeIfSingleAction()
            return true
        }

        suspend fun insertText(text: String) {
            val oldTextBeforeCaret = pattern.substring(0, caretPos)
            pattern = pattern.replaceRange(caretPos until caretPos, text)
            val remainingText = pattern.substring(caretPos)
            caretPos += text.length
            val newTextBeforeCaret = pattern.substring(0, caretPos)

            val exactMatches = allEntries.filter { it.matchesExactly(oldTextBeforeCaret) }
            if (exactMatches.size == 1 && !editor.serviceCall { hasCodeCompletionActions(editor.editorId, anchor.cell.getId(), newTextBeforeCaret) }) {
                exactMatches.single().execute()
                editor.closeCodeCompletionMenu()
                if (remainingText.isNotEmpty()) {
                    editor.flushLocal()
                    (editor.getSelection() as? CaretSelection)?.processTypedText(remainingText)
                }
            } else {
                updateActions()
                executeIfSingleAction()
            }
        }

        suspend fun moveCaret(delta: Int) {
            caretPos = (caretPos + delta).coerceIn(0..pattern.length)
            updateActions()
        }

        override fun <T> produceHtml(consumer: TagConsumer<T>) {
            consumer.div {
                div("ccmenu-pattern") {
                    +pattern.useNbsp()
                }
                div("caret own") { }
            }
        }
    }
}

class CachedCodeCompletionActions(providers: List<ICodeCompletionActionProvider>) {
    private var cacheEntries: List<CacheEntry> = providers.map { CacheEntry(it) }

    fun update(parameters: CodeCompletionParameters): List<ICodeCompletionAction> {
        return cacheEntries.flatMap { it.update(parameters) }.toList()
    }

    inner class CacheEntry(val provider: IActionOrProvider) {
        private var initialized = false
        private var cacheEntries: List<CacheEntry> = emptyList()
        private var dependsOnPattern: Boolean = true
        fun update(parameters: CodeCompletionParameters): Sequence<ICodeCompletionAction> {
            return when (provider) {
                is ICodeCompletionAction -> sequenceOf(provider)
                is ICodeCompletionActionProvider -> {
                    parameters.wasPatternAccessed() // reset state
                    if (!initialized || dependsOnPattern) {
                        cacheEntries = provider.getApplicableActions(parameters).map { CacheEntry(it) }
                        dependsOnPattern = parameters.wasPatternAccessed()
                        initialized = true
                    }
                    return cacheEntries.asSequence().flatMap { it.update(parameters) }
                }
                else -> throw RuntimeException("Unknown type: " + provider::class)
            }
        }
    }
}

interface IActionOrProvider

interface ICodeCompletionActionProvider : IActionOrProvider {
    fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider>
}

fun ICodeCompletionActionProvider.flattenApplicableActions(parameters: CodeCompletionParameters): List<ICodeCompletionAction> {
    return flatten(parameters).toList()
}

class ActionAsProvider(val action: ICodeCompletionAction) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        return listOf(action)
    }
}

fun ICodeCompletionAction.asProvider(): ICodeCompletionActionProvider = ActionAsProvider(this)
fun IActionOrProvider.asProvider(): ICodeCompletionActionProvider = when (this) {
    is ICodeCompletionAction -> ActionAsProvider(this)
    is ICodeCompletionActionProvider -> this
    else -> error("Unknown type: $this")
}

private fun IActionOrProvider.flatten(parameters: CodeCompletionParameters): Sequence<ICodeCompletionAction> = when (this) {
    is ICodeCompletionAction -> sequenceOf(this)
    is ICodeCompletionActionProvider -> getApplicableActions(parameters).asSequence().flatMap { it.flatten(parameters) }
    else -> throw RuntimeException("Unknown type: " + this::class)
}

interface ICodeCompletionAction : IActionOrProvider {
    fun getMatchingText(): String
    fun getTokens(): ICompletionTokenOrList = ConstantCompletionToken(getMatchingText())
    fun getDescription(): String
    fun execute(editor: BackendEditorComponent): ICaretPositionPolicy?
    fun shadows(shadowed: ICodeCompletionAction) = false
    fun shadowedBy(shadowing: ICodeCompletionAction) = false
}

fun ICodeCompletionAction.getCompletionPattern(): String = getTokens().toString()

class CodeCompletionParameters(val editor: BackendEditorComponent, pattern: String) {
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

fun List<ICodeCompletionAction>.applyShadowing(): List<ICodeCompletionAction> {
    return groupBy { it.getCompletionPattern() }.flatMap { applyShadowingToGroup(it.value) }
}

private fun applyShadowingToGroup(actions: List<ICodeCompletionAction>): List<ICodeCompletionAction> {
    return actions.filter { a1 ->
        val isShadowed = actions.any { a2 -> a2 !== a1 && (a2.shadows(a1) || a1.shadowedBy(a2)) }
        !isShadowed
    }
}
