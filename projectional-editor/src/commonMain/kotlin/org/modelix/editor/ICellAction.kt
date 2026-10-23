package org.modelix.editor

import org.modelix.editor.celltemplate.NotationRootCellTemplate
import org.modelix.editor.celltemplate.getAttributeSideTransformActions
import org.modelix.editor.celltemplate.hasSymbolsBesideAttributedCell
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.model.api.INode
import org.modelix.model.api.getInstantiatableSubConcepts

interface ICellAction {
    fun isApplicable(): Boolean

    fun execute(editor: BackendEditorComponent): ICaretPositionPolicy?
}

interface ITextChangeAction {
    fun isValid(value: String?): Boolean

    fun replaceText(
        editor: CellTreeState,
        range: IntRange,
        replacement: String,
        newText: String,
    ): Boolean
}

class CompositeTextChangeAction(
    val actions: List<ITextChangeAction>,
) : ITextChangeAction {
    override fun isValid(value: String?): Boolean = actions.any { it.isValid(value) }

    override fun replaceText(
        editor: CellTreeState,
        range: IntRange,
        replacement: String,
        newText: String,
    ): Boolean =
        actions
            .filter { it.isValid(newText) }
            .any { it.replaceText(editor, range, replacement, newText) }

    companion object {
        fun create(actions: List<ITextChangeAction?>): ITextChangeAction? {
            val nonNullActions = actions.filterNotNull()
            return when (nonNullActions.size) {
                0 -> null
                1 -> nonNullActions.first()
                else -> CompositeTextChangeAction(nonNullActions)
            }
        }
    }
}

object CellActionProperties {
    val substitute = BackendCellPropertyKey<ICodeCompletionActionProvider?>("substitute", null)
    val transformBefore = BackendCellPropertyKey<ICodeCompletionActionProvider?>("transformBefore", null)
    val transformAfter = BackendCellPropertyKey<ICodeCompletionActionProvider?>("transformAfter", null)
    val insert = BackendCellPropertyKey<ICellAction?>("insert", null)
    val delete = BackendCellPropertyKey<ICellAction?>("delete", null)
    val show = BackendCellPropertyKey<ICellAction?>("show", null)
    val replaceText = BackendCellPropertyKey<ITextChangeAction?>("replaceText", null)
}

class SideTransformNode(
    val before: Boolean,
    val node: INode,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        val engine = parameters.editor.engine ?: return emptyList()
        return getWrapperActions(engine) + getAttributeActions(engine)
    }

    fun getWrapperActions(engine: EditorEngine): List<IActionOrProvider> {
        val location = ExistingNode(node)
        val expectedConcept = location.expectedConcept() ?: return emptyList()
        val allowedConcepts = expectedConcept.getInstantiatableSubConcepts()
        val cellModels =
            allowedConcepts.map { concept ->
                engine.createCellModel(concept)
            }
        return cellModels.flatMap {
            it.getSideTransformActions(before, node) ?: emptyList()
        }
    }

    /**
     * Node attributes added on the border of the node's own cell go inside all existing ones.
     */
    private fun getAttributeActions(engine: EditorEngine): List<IActionOrProvider> {
        val innermostLayer = engine.getNodeAttributeLayers(node).lastOrNull()
        val index = innermostLayer?.let { layer -> node.getAttributes().indexOfFirst { it.reference == layer.reference } + 1 } ?: 0
        return engine.getNodeAttributeTemplates().flatMap { it.getAttributeSideTransformActions(before, node, index) }
    }
}

/**
 * The side transforms on the border of a node attribute's cell, which wraps the cell of the node it is attached to.
 *
 * A node attribute added here goes directly outside of [attribute]. On the border of the outermost attribute the
 * side transforms of the attributed node apply as well, because that border is where its parent sees it.
 */
class AttributeLayerSideTransform(
    val before: Boolean,
    val attribute: INode,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        val engine = parameters.editor.engine ?: return emptyList()
        val attributedNode = attribute.getAttributedNode() ?: return emptyList()
        val attributeConcept = attribute.concept ?: return emptyList()
        val template = engine.createCellModel(attributeConcept) as? NotationRootCellTemplate ?: return emptyList()
        // Otherwise this border is the border of the next layer inward, which offers the same actions.
        if (!template.hasSymbolsBesideAttributedCell(before)) return emptyList()

        val isOutermost = engine.getNodeAttributeLayers(attributedNode).firstOrNull()?.reference == attribute.reference
        val wrapperActions = if (isOutermost) SideTransformNode(before, attributedNode).getWrapperActions(engine) else emptyList()
        val index = attributedNode.getAttributes().indexOfFirst { it.reference == attribute.reference }
        val attributeActions =
            engine.getNodeAttributeTemplates().flatMap { it.getAttributeSideTransformActions(before, attributedNode, index) }
        return wrapperActions + attributeActions
    }
}

fun Cell.getSubstituteActions() =
    collectSubstituteActionsBetween(
        previousLeaf {
            it.isVisible()
        },
        firstLeaf()
    ).distinct() // TODO non-leafs can also be visible (text cells can have children)

fun Cell.getActionsBefore(): Sequence<ICodeCompletionActionProvider> {
    val stopAt = previousLeaf { it.isVisible() }?.rightBorder()
    return firstLeaf()
        .leftBorder()
        .allPrevious()
        .takeWhile { it != stopAt }
        .takeUnlessPrevious { it.isLeft && it.cell.getProperty(CommonCellProperties.onNewLine) }
        .mapNotNull { it.cell.getProperty(if (it.isLeft) CellActionProperties.transformBefore else CellActionProperties.transformAfter) }
        .distinct()
    // TODO non-leafs can also be visible (text cells can have children)
}

fun Cell.getActionsAfter(): Sequence<ICodeCompletionActionProvider> {
    val stopAt = nextLeaf { it.isVisible() }?.leftBorder()
    return lastLeaf()
        .rightBorder()
        .allNext()
        .takeWhile { it != stopAt }
        .takeWhile { !(it.isLeft && it.cell.getProperty(CommonCellProperties.onNewLine)) }
        .mapNotNull { it.cell.getProperty(if (it.isLeft) CellActionProperties.transformBefore else CellActionProperties.transformAfter) }
        .distinct()
    // TODO non-leafs can also be visible (text cells can have children)
}

private fun collectSubstituteActionsBetween(
    leftLeaf: Cell?,
    rightLeaf: Cell?,
): Sequence<ICodeCompletionActionProvider> =
    getBordersBetween(leftLeaf?.rightBorder(), rightLeaf?.leftBorder())
        .filter { it.isLeft }
        .mapNotNull { it.cell.getProperty(CellActionProperties.substitute) }

private fun collectTransformActionsBetween(
    leftLeaf: Cell?,
    rightLeaf: Cell?,
): Sequence<ICodeCompletionActionProvider> =
    getBordersBetween(leftLeaf?.rightBorder(), rightLeaf?.leftBorder())
        .mapNotNull { it.cell.getProperty(if (it.isLeft) CellActionProperties.transformBefore else CellActionProperties.transformAfter) }

fun getBordersBetween(
    left: CellBorder?,
    right: CellBorder?,
): Sequence<CellBorder> =
    if (left != null && right != null) {
        generateSequence(left) { it.next() }.takeWhilePrevious { it != right }
    } else if (left != null) {
        generateSequence(left) { it.next() }
    } else {
        generateSequence(right) { it.previous() }
    }

data class CellBorder(
    val cell: Cell,
    val isLeft: Boolean,
) {
    val isRight: Boolean get() = !isLeft

    fun allPrevious() = generateSequence(this) { it.previous() }

    fun allNext() = generateSequence(this) { it.next() }

    fun previous(): CellBorder? {
        if (isLeft) {
            val previousSibling = cell.previousSibling()
            if (previousSibling == null) {
                val parent = cell.getParent() ?: return null
                return parent.leftBorder()
            } else {
                return previousSibling.rightBorder()
            }
        } else {
            val lastChild = cell.getChildren().lastOrNull()
            if (lastChild == null) {
                return cell.leftBorder()
            } else {
                return lastChild.rightBorder()
            }
        }
    }

    fun next(): CellBorder? {
        if (isLeft) {
            val firstChild = cell.getChildren().firstOrNull()
            if (firstChild == null) {
                return cell.rightBorder()
            } else {
                return firstChild.leftBorder()
            }
        } else {
            val nextSibling = cell.nextSibling()
            if (nextSibling == null) {
                val parent = cell.getParent() ?: return null
                return parent.rightBorder()
            } else {
                return nextSibling.leftBorder()
            }
        }
    }
}

fun Cell.leftBorder() = CellBorder(this, true)

fun Cell.rightBorder() = CellBorder(this, false)
