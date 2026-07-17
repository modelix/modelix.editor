package org.modelix.editor

import kotlinx.html.TagConsumer
import kotlinx.html.div
import kotlinx.html.span
import kotlinx.html.style
import kotlinx.html.title
import org.modelix.editor.text.frontend.editorComponent
import org.modelix.editor.text.frontend.getVisibleText
import org.modelix.editor.text.frontend.text
import org.modelix.editor.text.frontend.type
import org.modelix.editor.text.shared.celltree.ICellTree
import org.modelix.incremental.IncrementalList

/**
 * The check messages that are shown in the gutter for a single line. Aggregated from all cells whose content
 * starts on the line: the text cells on the line and the [LayoutableGutterMarker]s of enclosing cells that render
 * no text of their own (e.g. a wrapper that only delegates to a child).
 */
class LineGutterState(
    val errors: Set<String>,
    val warnings: Set<String>,
) {
    val hasError: Boolean get() = errors.isNotEmpty()
    val hasWarning: Boolean get() = warnings.isNotEmpty()
    val isEmpty: Boolean get() = errors.isEmpty() && warnings.isEmpty()

    fun tooltip(): String = (errors + warnings).joinToString("\n")
}

class TextLine(
    words_: Iterable<Layoutable>,
) : IProducesHtml {
    var initialText: LayoutedText? = null
    var finalText: LayoutedText? = null
    val words: List<Layoutable> = words_.toList()
    val layoutablesIndexList: IncrementalList<Pair<ICellTree.Cell, LayoutableCell>> =
        IncrementalList.of(words.filterIsInstance<LayoutableCell>().map { it.cell to it })

    /**
     * Aggregates the check messages shown in this line's gutter. Text cells contribute their own messages (which
     * are also underlined inline); [LayoutableGutterMarker]s contribute the messages of enclosing cells that have
     * no text cell of their own, so those are not lost.
     */
    fun getGutterState(): LineGutterState {
        val errors = LinkedHashSet<String>()
        val warnings = LinkedHashSet<String>()
        words.forEach { word ->
            when (word) {
                is LayoutableCell -> {
                    word.cell.getProperty(CommonCellProperties.errorMessage)?.let { errors.add(it) }
                    word.cell.getProperty(CommonCellProperties.warningMessage)?.let { warnings.add(it) }
                }

                is LayoutableGutterMarker -> {
                    word.errorMessage?.let { errors.add(it) }
                    word.warningMessage?.let { warnings.add(it) }
                }
            }
        }
        return LineGutterState(errors, warnings)
    }

    /**
     * Whether the given whitespace [word] (a space or indent) sits inside a run of cells that all carry an error,
     * so it should be underlined together with them to make a node's cell-range underline continuous rather than
     * broken at every space. A leading indent is only included when the range continues from the previous line.
     */
    fun isUnderlinedError(word: Layoutable): Boolean = isInSeverityRange(word) { it.getProperty(CommonCellProperties.errorMessage) != null }

    fun isUnderlinedWarning(word: Layoutable): Boolean =
        isInSeverityRange(word) { it.getProperty(CommonCellProperties.warningMessage) != null }

    private fun isInSeverityRange(
        word: Layoutable,
        hasSeverity: (ICellTree.Cell) -> Boolean,
    ): Boolean {
        val index = words.indexOf(word)
        if (index < 0) return false
        val cellBefore = (index - 1 downTo 0).firstNotNullOfOrNull { words[it] as? LayoutableCell }
        val cellAfter = (index + 1 until words.size).firstNotNullOfOrNull { words[it] as? LayoutableCell }
        if (cellBefore != null && cellAfter != null) {
            return hasSeverity(cellBefore.cell) && hasSeverity(cellAfter.cell)
        }
        // No cell before (a leading indent): only continue a range that already spans from the previous line, so a
        // standalone match at the start of a line does not underline its indentation.
        if (cellBefore == null && cellAfter != null && hasSeverity(cellAfter.cell)) {
            val prevLineLastCell = getSibling(false)?.words?.lastOrNull { it is LayoutableCell } as LayoutableCell?
            return prevLineLastCell != null && hasSeverity(prevLineLastCell.cell)
        }
        return false
    }

    init {
        words.filter { it.initialLine == null }.forEach { it.initialLine = this }
        words.forEach { it.finalLine = this }
    }

    fun getY(): Int {
        val text = getText() ?: return 0
        return text.lines.asSequence().indexOf(this)
    }

    fun getText(): LayoutedText? = finalText?.rootText() ?: initialText?.rootText()

    fun getSibling(next: Boolean): TextLine? {
        val text = getText() ?: return null
        val index = text.lines.indexOf(this)
        if (index < 0) return null
        val siblingIndex = index + (if (next) 1 else -1)
        if (siblingIndex < 0 || siblingIndex >= text.lines.size) return null
        return text.lines[siblingIndex]
    }

    fun getContextIndent() = initialText?.getContextIndent() ?: 0

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("line") {
            val gutterState = getGutterState()
            val gutterClasses =
                listOfNotNull(
                    "line-gutter",
                    "has-error".takeIf { gutterState.hasError },
                    "has-warning".takeIf { gutterState.hasWarning },
                ).joinToString(" ")
            span(gutterClasses) {
                // The line number itself is rendered via CSS (content: counter(line-number)). This element only
                // exists so the gutter can also carry error/warning styling and a tooltip with the messages.
                if (!gutterState.isEmpty) title = gutterState.tooltip()
            }
            words.forEach { element: Layoutable ->
                // Gutter markers are invisible in the line body; they only feed the gutter aggregation above.
                if (element !is LayoutableGutterMarker) produceChild(element)
            }
            if (words.sumOf { it.getLength() } == 0) {
                +Typography.nbsp.toString()
            }
        }
    }
}

class LayoutedText(
    val lines: TreeList<TextLine>,
    val beginsWithNewLine: Boolean,
    val endsWithNewLine: Boolean,
    val beginsWithNoSpace: Boolean,
    val endsWithNoSpace: Boolean,
    var indent: Int = 0,
) : IProducesHtml {
    var owner: LayoutedText? = null
    val layoutablesIndexList: IncrementalList<Pair<ICellTree.Cell, LayoutableCell>> =
        IncrementalList.concat(lines.map { it.layoutablesIndexList })

    init {
        lines.forEach { if (it.initialText == null) it.initialText = this }
        lines.forEach { it.finalText = this }
    }

    fun rootText(): LayoutedText? = owner?.rootText() ?: owner ?: this

    fun getContextIndent(): Int = (owner?.getContextIndent() ?: 0) + indent

    override fun toString(): String {
        val buffer = StringBuilder()
        lines.forEachIndexed { index, line ->
            if (index != 0) buffer.append('\n')
            line.words.forEach { element ->
                buffer.append(element.toText())
            }
        }
        return buffer.toString()
    }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.div("layouted-text") {
            lines.forEach { line ->
                produceChild(line)
            }
        }
    }
}

class TextLayouter {
    private var beginsWithNewLine: Boolean = false
    private var beginsWithNoSpace: Boolean = false
    private val closedLines = ArrayList<TreeList<TextLine>>()
    private var reusableLastLine: TextLine? = null
    private var lastLine: MutableList<Layoutable>? = null
    private var currentIndent: Int = 0
    private var autoInsertSpace: Boolean = true
    private var insertNewLineNext: Boolean = false
    private val childTexts = ArrayList<LayoutedText>()

    fun done(): LayoutedText {
        val endsWithNoSpace = !autoInsertSpace
        val endsWithNewLine = insertNewLineNext
        closeLine()
        val newText =
            LayoutedText(
                TreeList.flatten(closedLines),
                beginsWithNewLine = beginsWithNewLine,
                endsWithNewLine = endsWithNewLine,
                beginsWithNoSpace = beginsWithNoSpace,
                endsWithNoSpace = endsWithNoSpace,
            )
        childTexts.forEach { it.owner = newText }
        return newText
    }

    private fun closeLine() {
        lastLine?.let { line ->
            if (line.first() !is LayoutableIndent) line.add(0, LayoutableIndent(currentIndent))
            if (line.toList() == reusableLastLine?.words?.toList()) {
                closedLines.add(TreeList.of(reusableLastLine!!))
            } else {
                closedLines.add(TreeList.of(TextLine(line)))
            }

            lastLine = null
            insertNewLineNext = false
            autoInsertSpace = true
        }
    }

    private fun addNewLine() {
        closeLine()
        lastLine = ArrayList()
    }

    private fun ensureLastLine(): MutableList<Layoutable> {
        if (lastLine == null) {
            lastLine = ArrayList()
        }
        return lastLine!!
    }

    fun isEmpty() = closedLines.isEmpty() && lastLine == null

    fun onNewLine() {
        if (isEmpty()) beginsWithNewLine = true
        insertNewLineNext = true
    }

    fun emptyLine() {
        addNewLine()
        onNewLine()
    }

    fun withIndent(body: () -> Unit) {
        val oldIndent = currentIndent
        try {
            currentIndent++
            body()
        } finally {
            currentIndent = oldIndent
        }
    }

    fun noSpace() {
        if (isEmpty()) beginsWithNoSpace = true
        autoInsertSpace = false
    }

    /**
     * Re-appends the words of a line that is being merged into the current line. The merged line already contains
     * explicit [LayoutableSpace]s, so auto-spacing is suppressed between its words ([realIndex] > 0), while the space
     * between the current line's existing content and the merged content is still inserted for its first real word.
     * Invisible [LayoutableGutterMarker]s don't count towards that index, so they can't swallow the space between the
     * real words around them.
     *
     * @param filterIndent drops the merged line's leading indentation, used when merging into a line that already
     * has its own indentation.
     */
    private fun appendMergedLineWords(
        words: List<Layoutable>,
        filterIndent: Boolean,
    ) {
        var realIndex = 0
        words.forEach { word ->
            when {
                word is LayoutableGutterMarker -> {
                    append(word)
                }

                filterIndent && word is LayoutableIndent -> {
                    Unit
                }

                else -> {
                    if (realIndex > 0) noSpace() // already contains LayoutableSpace instances
                    append(word)
                    realIndex++
                }
            }
        }
    }

    fun append(text: LayoutedText) {
        childTexts.add(text)
        text.indent = currentIndent
        if (text.beginsWithNoSpace) noSpace()
        var closedLinesToCopy = text.lines
        if (text.beginsWithNewLine || insertNewLineNext || lastLine == null) {
            closeLine()
        } else {
            val line = closedLinesToCopy.first()
            closedLinesToCopy = closedLinesToCopy.withoutFirst()
            if (line != null && line.words.isNotEmpty()) {
                appendMergedLineWords(line.words, filterIndent = true)
            }
        }

        var lastLineToCopy: TextLine? = null
        if (!text.endsWithNewLine) {
            lastLineToCopy = closedLinesToCopy.last()
            closedLinesToCopy = closedLinesToCopy.withoutLast()
        }
        if (closedLinesToCopy.isNotEmpty()) {
            closeLine()
            closedLines.add(closedLinesToCopy)
        }

        if (lastLineToCopy != null) {
            if (lastLineToCopy.words.isNotEmpty()) {
                appendMergedLineWords(lastLineToCopy.words, filterIndent = false)
            }
            reusableLastLine = lastLineToCopy
        }

        if (text.endsWithNoSpace) noSpace()
        if (text.endsWithNewLine) onNewLine()
    }

    fun append(element: Layoutable) {
        reusableLastLine = null
        ensureLastLine()
        if (insertNewLineNext) {
            insertNewLineNext = false
            if (lastLine!!.isNotEmpty()) {
                addNewLine()
            }
        }
        if (element is LayoutableGutterMarker) {
            // The marker is invisible and must not influence the spacing of the surrounding words, so it is added
            // without inserting a space and without changing autoInsertSpace.
            lastLine!!.add(element)
            return
        }
        if (currentIndent > 0 && lastLine!!.isEmpty()) {
            // lastLine!!.add(LayoutableIndent(currentIndent))
        }
        // Skip invisible markers when looking at the previous element, so a marker between two words does not
        // swallow the space that would otherwise separate them.
        val lastOnLine = lastLine!!.lastOrNull { it !is LayoutableGutterMarker }
        if (autoInsertSpace && lastOnLine != null && !lastOnLine.isWhitespace() && element !is LayoutableSpace) {
            lastLine!!.add(LayoutableSpace())
        }
        lastLine!!.add(element)
        autoInsertSpace = true
    }
}

abstract class Layoutable : IProducesHtml {
    var initialLine: TextLine? = null
    var finalLine: TextLine? = null

    abstract fun getLength(): Int

    abstract fun isWhitespace(): Boolean

    abstract fun toText(): String

    override fun toString(): String = toText()

    fun getX(): Int {
        val line = getLine() ?: return 0
        val prevSiblings = line.words.takeWhile { it != this }
        return prevSiblings.sumOf { it.getLength() }
    }

    fun getY(): Int = getLine()?.getY() ?: 0

    fun getLine(): TextLine? = finalLine ?: initialLine

    fun getSiblingInLine(next: Boolean): Layoutable? {
        val line = getLine() ?: return null
        val index = line.words.indexOf(this)
        if (index < 0) return null
        val siblingIndex = index + (if (next) +1 else -1)
        if (siblingIndex < 0 || siblingIndex >= line.words.size) return null
        return line.words[siblingIndex]
    }

    fun getSiblingInText(next: Boolean): Layoutable? {
        val siblingInLine = getSiblingInLine(next)
        if (siblingInLine != null) return siblingInLine
        val siblingLines = generateSequence(getLine()) { it.getSibling(next) }.drop(1)
        val nonEmptySiblingLine = siblingLines.filter { it.words.isNotEmpty() }.firstOrNull() ?: return null
        return if (next) nonEmptySiblingLine.words.first() else nonEmptySiblingLine.words.last()
    }

    fun getSiblingsInText(next: Boolean): Sequence<Layoutable> = generateSequence(getSiblingInText(next)) { it.getSiblingInText(next) }
}

/*class LayoutableWord(val text: String) : ILayoutable {
    override fun getLength(): Int = text.length
    override fun isWhitespace(): Boolean = text.isNotEmpty() && text.last().isWhitespace()
    override fun toText(): String = text
    override fun toHtml(consumer: TagConsumer<*>) {
        consumer.onTagContent(text.useNbsp())
    }
}*/
class LayoutableCell(
    val cell: ICellTree.Cell,
) : Layoutable() {
    init {
        require(cell.type == ECellType.TEXT) { "Not a text cell: $cell" }
    }

    override fun getLength(): Int = toText().length

    override fun toText(): String =
        cell.getProperty(CommonCellProperties.textReplacement)
            ?: cell.getVisibleText()

    override fun isWhitespace(): Boolean = false

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        val textIsOverridden = cell.getProperty(CommonCellProperties.textReplacement) != null
        val isPlaceholder = cell.text.isNullOrEmpty()
        val textColor =
            when {
                textIsOverridden -> "#A81E1E"
                isPlaceholder -> cell.getProperty(CommonCellProperties.placeholderTextColor)
                else -> cell.getProperty(CommonCellProperties.textColor)
            }
        val backgroundColor =
            when {
                textIsOverridden -> "rgba(255, 0, 0, 0.5)"
                else -> null
            }
        val errorMessage = cell.getProperty(CommonCellProperties.errorMessage)
        val warningMessage = cell.getProperty(CommonCellProperties.warningMessage)
        val classes =
            listOfNotNull(
                "text-cell",
                "has-error".takeIf { errorMessage != null },
                "has-warning".takeIf { warningMessage != null },
            ).joinToString(" ")
        consumer.span(classes) {
            val styleParts = mutableListOf<String>()
            if (textColor != null) styleParts += "color: $textColor"
            if (backgroundColor != null) styleParts += "background-color: $backgroundColor"
            if (styleParts.isNotEmpty()) style = styleParts.joinToString(";")
            listOfNotNull(errorMessage, warningMessage).takeIf { it.isNotEmpty() }?.let { title = it.joinToString("\n") }

            +toText().useNbsp()
        }
    }
}

fun Cell.layoutable(): LayoutableCell? {
    // return rootCell().layout.lines.asSequence().flatMap { it.words }.filterIsInstance<LayoutableCell>().find { it.cell == this }
    return editorComponent.resolveLayoutable(this)
}

class LayoutableIndent(
    val indentSize: Int,
) : Layoutable() {
    fun totalIndent() = indentSize + (initialLine?.getContextIndent() ?: 0)

    override fun getLength(): Int = totalIndent() * 2

    override fun isWhitespace(): Boolean = true

    override fun toText(): String = (1..totalIndent()).joinToString("") { "  " }

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.span(whitespaceUnderlineClasses("indent", this)) {
            +toText().useNbsp()
        }
    }
}

/**
 * A zero-width, invisible element that carries the check messages of an enclosing cell which renders no text of its
 * own (e.g. a wrapper delegating to a child) to the line where that cell's content begins. It is not shown in the
 * line body; [TextLine.getGutterState] reads it to populate the gutter. Being an ordinary word, it flows through the
 * layouter's line merging unchanged, and a message change produces a new instance which forces the affected line
 * (and its gutter) to be re-rendered.
 */
class LayoutableGutterMarker(
    val errorMessage: String?,
    val warningMessage: String?,
) : Layoutable() {
    override fun getLength(): Int = 0

    override fun isWhitespace(): Boolean = true

    override fun toText(): String = ""

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        // Rendered indirectly through the line's gutter, not as part of the line body.
    }
}

class LayoutableSpace : Layoutable() {
    override fun getLength(): Int = 1

    override fun isWhitespace(): Boolean = true

    override fun toText(): String = " "

    override fun <T> produceHtml(consumer: TagConsumer<T>) {
        consumer.span(whitespaceUnderlineClasses("space", this)) {
            +Typography.nbsp.toString()
        }
    }
}

/**
 * The CSS classes for a whitespace layoutable (a space or indent): its [baseClass] plus has-error/has-warning when it
 * falls inside an underlined cell range on its line (see [TextLine.isUnderlinedError]).
 */
private fun whitespaceUnderlineClasses(
    baseClass: String,
    word: Layoutable,
): String {
    val line = word.getLine()
    return listOfNotNull(
        baseClass,
        "has-error".takeIf { line?.isUnderlinedError(word) == true },
        "has-warning".takeIf { line?.isUnderlinedWarning(word) == true },
    ).joinToString(" ")
}

fun String.useNbsp() = replace(' ', Typography.nbsp)
