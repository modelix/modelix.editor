package org.modelix.editor

import org.modelix.model.api.INode
import org.modelix.parser.ConstantSymbol
import org.modelix.parser.IParseTreeNode
import kotlin.math.max
import kotlin.math.min

class CaretSelection(val layoutable: LayoutableCell, val start: Int, val end: Int, val desiredXPosition: Int? = null) : Selection() {
    constructor(cell: LayoutableCell, pos: Int) : this(cell, pos, pos)
    constructor(cell: LayoutableCell, pos: Int, desiredXPosition: Int?) : this(cell, pos, pos, desiredXPosition)

    init {
        require(start >= 0) { "invalid start: $start" }
        require(end >= 0) { "invalid end: $start" }
    }

    override fun getSelectedCells(): List<Cell> {
        return listOf(layoutable.cell)
    }

    override fun isValid(): Boolean {
        val editor = getEditor() ?: return false
        val visibleText = editor.getRootCell().layout
        val ownText = layoutable.getLine()?.getText()
        return visibleText === ownText
    }

    private fun reResolveLayoutable(editor: EditorComponent): LayoutableCell? {
        return layoutable.cell.data.cellReferences.asSequence()
            .mapNotNull { editor.resolveCell(it).firstOrNull() }
            .firstOrNull()?.layoutable()
    }

    override fun update(editor: EditorComponent): Selection? {
        val newLayoutable = reResolveLayoutable(editor) ?: return null
        val textLength = newLayoutable.getLength()
        return CaretSelection(newLayoutable, start.coerceAtMost(textLength), end.coerceAtMost(textLength))
    }

    override fun processKeyDown(event: JSKeyboardEvent): Boolean {
        val editor = getEditor() ?: throw IllegalStateException("Not attached to any editor")
        val knownKey = event.knownKey
        when (knownKey) {
            KnownKeys.ArrowLeft -> {
                if (end > 0) {
                    if (event.modifiers.shift) {
                        editor.changeSelection(CaretSelection(layoutable, start, end - 1))
                    } else {
                        editor.changeSelection(CaretSelection(layoutable, end - 1))
                    }
                } else {
                    val previous = layoutable.getSiblingsInText(next = false)
                        .filterIsInstance<LayoutableCell>()
                        .find { it.cell.getSelectableText() != null }
                    if (previous != null) {
                        if (event.modifiers.shift) {
                            val commonAncestor = layoutable.cell.commonAncestor(previous.cell)
                            val selectableAncestor = commonAncestor.ancestors(true).filter { it.isSelectable() }.firstOrNull()
                            selectableAncestor?.let { editor.changeSelection(CellSelection(it, true, this)) }
                        } else {
                            editor.changeSelection(CaretSelection(previous, previous.cell.getMaxCaretPos()))
                        }
                    }
                }
            }
            KnownKeys.ArrowRight -> {
                if (end < (layoutable.cell.getSelectableText()?.length ?: 0)) {
                    if (event.modifiers.shift) {
                        editor.changeSelection(CaretSelection(layoutable, start, end + 1))
                    } else {
                        editor.changeSelection(CaretSelection(layoutable, end + 1))
                    }
                } else {
                    val next = layoutable.getSiblingsInText(next = true)
                        .filterIsInstance<LayoutableCell>()
                        .find { it.cell.getSelectableText() != null }
                    if (next != null) {
                        if (event.modifiers.shift) {
                            val commonAncestor = layoutable.cell.commonAncestor(next.cell)
                            val selectableAncestor = commonAncestor.ancestors(true).filter { it.isSelectable() }.firstOrNull()
                            selectableAncestor?.let { editor.changeSelection(CellSelection(it, false, this)) }
                        } else {
                            editor.changeSelection(CaretSelection(next, 0))
                        }
                    }
                }
            }
            KnownKeys.ArrowDown -> {
                selectNextPreviousLine(true)
            }
            KnownKeys.ArrowUp -> {
                if (event.modifiers.meta) {
                    layoutable.cell.let { editor.changeSelection(CellSelection(it, true, this)) }
                } else {
                    selectNextPreviousLine(false)
                }
            }
            KnownKeys.Tab -> {
                for (c in if (event.modifiers.shift) layoutable.cell.previousCells() else layoutable.cell.nextCells()) {
                    if (c.isTabTarget()) {
                        val l = c.layoutable()
                        if (l != null) {
                            editor.changeSelection(CaretSelection(l, 0))
                            break
                        }
                    }
                    val action = c.getProperty(CellActionProperties.show)
                    if (action != null) {
                        // cannot tab into nested optionals because the parent optional will disappear
                        if (!c.ancestors(true).any { it.getProperty(CommonCellProperties.isForceShown) }) {
                            editor.state.forceShowOptionals.clear()
                            action.executeAndUpdateSelection(editor)
                            break
                        }
                    }
                }
            }
            KnownKeys.Delete, KnownKeys.Backspace -> {
                if (start == end) {
                    val posToDelete = when (knownKey) {
                        KnownKeys.Delete -> end
                        KnownKeys.Backspace -> (end - 1)
                        else -> throw RuntimeException("Cannot happen")
                    }
                    val legalRange = 0 until (layoutable.cell.getSelectableText()?.length ?: 0)
                    if (legalRange.contains(posToDelete)) {
                        replaceText(posToDelete..posToDelete, "", editor, true)
                    } else {
                        val deleteAction = layoutable.cell.ancestors(true)
                            .mapNotNull { it.data.properties[CellActionProperties.delete] }
                            .firstOrNull { it.isApplicable() }
                        if (deleteAction != null) {
                            deleteAction.executeAndUpdateSelection(editor)
                        }
                    }
                } else {
                    replaceText(min(start, end) until max(start, end), "", editor, true)
                }
            }
            KnownKeys.Enter -> {
                val actionOnSelectedCell = layoutable.cell.getProperty(CellActionProperties.insert)?.takeIf { it.isApplicable() }
                if (actionOnSelectedCell != null) {
                    actionOnSelectedCell.executeAndUpdateSelection(editor)
                } else {
                    var previousLeaf: Cell? = layoutable.cell
                    while (previousLeaf != null) {
                        val nextLeaf = previousLeaf.nextLeaf { it.isVisible() }
                        val actions = getBordersBetween(previousLeaf.rightBorder(), nextLeaf?.leftBorder())
                            .filter { it.isLeft }
                            .mapNotNull { it.cell.getProperty(CellActionProperties.insert) }
                            .distinct()
                            .filter { it.isApplicable() }
                        // TODO resolve conflicts if multiple actions are applicable
                        val action = actions.firstOrNull()
                        if (action != null) {
                            action.executeAndUpdateSelection(editor)
                            break
                        }
                        previousLeaf = nextLeaf
                    }
                }
            }
            else -> {
                val typedText = event.typedText
                if (!typedText.isNullOrEmpty()) {
                    if (typedText == " " && event.modifiers.ctrl) {
                        if (event.modifiers.shift) {
                            triggerParserCompletion()
                        } else {
                            triggerCodeCompletion()
                        }
                    } else {
                        processTypedText(typedText, editor)
                    }
                }
            }
        }

        return true
    }

    fun selectNextPreviousLine(next: Boolean) {
        createNextPreviousLineSelection(next, desiredXPosition ?: getAbsoluteX())
            ?.let { getEditor()?.changeSelection(it) }
    }

    fun processTypedText(typedText: String, editor: EditorComponent) {
        val oldText = layoutable.cell.getSelectableText() ?: ""
        val range = min(start, end) until max(start, end)
        val textLength = oldText.length
        val leftTransform = start == end && end == 0
        val rightTransform = start == end && end == textLength
        if (leftTransform || rightTransform) {
            // if (replaceText(range, typedText, editor, false)) return

            val completionPosition = if (leftTransform) CompletionPosition.LEFT else CompletionPosition.RIGHT
            val providers = (
                if (completionPosition == CompletionPosition.LEFT) {
                    layoutable.cell.getActionsBefore()
                } else {
                    layoutable.cell.getActionsAfter()
                }
                ).toList()
            val params = CodeCompletionParameters(editor, typedText)
            val matchingActions = editor.runRead {
                val actions = providers.flatMap { it.flattenApplicableActions(params) }
                actions
                    .filter { it.getCompletionPattern().startsWith(typedText) }
                    .applyShadowing()
            }
            if (matchingActions.isNotEmpty()) {
                if (matchingActions.size == 1 && matchingActions.first().getCompletionPattern() == typedText) {
                    matchingActions.first().executeAndUpdateSelection(editor)
                    return
                }
                editor.showCodeCompletionMenu(
                    anchor = layoutable,
                    position = completionPosition,
                    entries = providers,
                    pattern = typedText,
                    caretPosition = typedText.length,
                )
                return
            }
        }
        replaceText(range, typedText, editor, true)
    }

    fun getAbsoluteX() = layoutable.getX() + end

    fun getTextBeforeCaret() = (layoutable.cell.getSelectableText() ?: "").substring(0, end)

    fun triggerCodeCompletion() {
        val editor = getEditor() ?: throw IllegalStateException("Not attached to any editor")
        val actionProviders = layoutable.cell.getSubstituteActions().toList()
        editor.showCodeCompletionMenu(
            anchor = layoutable,
            position = CompletionPosition.CENTER,
            entries = actionProviders,
            pattern = layoutable.cell.getSelectableText() ?: "",
            caretPosition = end,
        )
    }

    fun triggerParserCompletion() {
        val editor = checkNotNull(getEditor()) { "Not attached to any editor" }
        val engine = checkNotNull(editor.engine) { "EditorEngine not available" }
        val selectedNode = layoutable.cell.ancestors(true)
            .mapNotNull { it.getProperty(CommonCellProperties.node) }.firstOrNull() ?: return
        // TODO cell should have a provider for parser based completions
        val text = layoutable.cell.getSelectableText() ?: "" // TODO include all cells of the node
        val expectedConcept = selectedNode.expectedConcept() ?: return
        var parseTrees: List<IParseTreeNode> = engine.parse(text, expectedConcept, false)
        if (parseTrees.isEmpty()) parseTrees = engine.parse(text + ConstantSymbol.CARET.text, expectedConcept, true)
        var asts: List<INode> = parseTrees
            .flatMap { ParseTreeToAstBuilder.buildNodes(engine, it) }

        var previousSize: Int
        do {
            previousSize = asts.size
            asts = asts.flatMap { (it as IPendingNode).flattenFirstAmbiguousNode() }
        } while (asts.size != previousSize && asts.size < 1000)

        // .map { it.replaceAllAmbiguousWithFirst() as IPendingNode }
        val actions = asts.map { ast ->
            object : ICodeCompletionAction {
                val rendered = engine.createCell(EditorState(), ast)
                override fun execute(editor: EditorComponent): ICaretPositionPolicy? {
                    val newNode = editor.runWrite {
                        (ast as IPendingNode).commit(selectedNode)
                    }
                    return CaretPositionPolicy(newNode)
                }

                override fun getMatchingText(): String {
                    return rendered.layout.toString()
                }

                override fun getDescription(): String {
                    return ""
                }
            }
        }.map { it.asProvider() }.toList()
        editor.showCodeCompletionMenu(
            anchor = layoutable,
            position = CompletionPosition.CENTER,
            entries = actions,
            pattern = layoutable.cell.getSelectableText() ?: "",
            caretPosition = end,
        )
    }

    fun getCurrentCellText() = layoutable.cell.getSelectableText() ?: ""

    fun replaceText(newText: String): Boolean {
        return replaceText(0 until getCurrentCellText().length, newText, layoutable.cell.editorComponent!!, false)
    }

    private fun replaceText(range: IntRange, replacement: String, editor: EditorComponent, triggerCompletion: Boolean): Boolean {
        val oldText = getCurrentCellText()
        val newText = oldText.replaceRange(range, replacement)

        if (triggerCompletion) {
            // complete immediately if there is a single matching action
            val providers = layoutable.cell.getSubstituteActions()
            val params = CodeCompletionParameters(editor, newText)
            val actions = editor.runRead { providers.flatMap { it.flattenApplicableActions(params) }.toList() }
            val matchingActions = actions
                .filter { it.getTokens().consumeForAutoApply(newText)?.length == 0 }
                .applyShadowing()
            val singleAction = matchingActions.singleOrNull()
            if (singleAction != null) {
                editor.runWrite {
                    singleAction.executeAndUpdateSelection(editor)
                    editor.state.clearTextReplacement(layoutable)
                }
                return true
            }
        }

        val replaceTextActions = layoutable.cell.centerAlignedHierarchy().mapNotNull { it.getProperty(CellActionProperties.replaceText) }
        for (action in replaceTextActions) {
            if (action.isValid(newText) && action.replaceText(editor, range, replacement, newText)) {
                editor.selectAfterUpdate {
                    reResolveLayoutable(editor)?.let { CaretSelection(it, range.first + replacement.length) }
                }
                return true
            }
        }
        return false
    }

    fun getEditor(): EditorComponent? = layoutable.cell.editorComponent

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || this::class != other::class) return false

        other as CaretSelection

        if (layoutable != other.layoutable) return false
        if (start != other.start) return false
        if (end != other.end) return false

        return true
    }

    override fun hashCode(): Int {
        var result = layoutable.hashCode()
        result = 31 * result + start
        result = 31 * result + end
        return result
    }

    override fun toString(): String {
        val text = layoutable.toText()
        return text.substring(0 until end) + "|" + text.substring(end)
    }

    private fun createNextPreviousLineSelection(next: Boolean, x: Int): CaretSelection? {
        val line: TextLine = layoutable.getLine() ?: return null
        val text: LayoutedText = line.getText() ?: return null
        val lines = text.lines.asSequence()
        val nextPrevLines = if (next) {
            lines.dropWhile { it != line }.drop(1)
        } else {
            lines.takeWhile { it != line }.toList().reversed().asSequence()
        }
        return nextPrevLines.mapNotNull { it.createBestMatchingCaretSelection(x) }.firstOrNull()
    }
}

fun TextLine.createBestMatchingCaretSelection(x: Int): CaretSelection? {
    var currentOffset = 0
    for (layoutable in words) {
        val length = layoutable.getLength()
        val range = currentOffset..(currentOffset + length)
        if (layoutable is LayoutableCell) {
            if (x < range.first) return CaretSelection(layoutable, 0, desiredXPosition = x)
            if (range.contains(x)) return CaretSelection(layoutable, (x - range.first).coerceAtMost(layoutable.cell.getMaxCaretPos()), desiredXPosition = x)
        }
        currentOffset += length
    }
    return words.filterIsInstance<LayoutableCell>().lastOrNull()?.let { CaretSelection(it, it.cell.getMaxCaretPos(), desiredXPosition = x) }
}
