package org.modelix.editor.celltemplate

import org.modelix.editor.AttributedNodeCellCreationCall
import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellSpec
import org.modelix.editor.CellSpecBase
import org.modelix.editor.ChildSpecReference
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.NodeCellReference
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.TextCellSpec
import org.modelix.editor.getAttributedNode
import org.modelix.editor.getAttributes
import org.modelix.editor.isSubConceptOfUID
import org.modelix.editor.smodelAttributeLink
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.upcast
import org.modelix.parser.ISymbol
import org.modelix.parser.SubConceptsSymbol

/**
 * Stands for the node a node attribute is attached to, inside the notation of that attribute.
 *
 * It renders the next layer inward: the next node attribute of the same node, or the node's own notation below the
 * innermost one. Which one that is follows from the model alone (the attribute's parent and its next sibling
 * attribute), so the cell is created by its own [AttributedNodeCellCreationCall] like any child cell, instead of
 * being handed down by whoever renders the attribute.
 */
class AttributedCellTemplate(
    concept: IConcept,
) : CellTemplate(concept),
    IGrammarSymbol {
    /**
     * The concepts the attribute can be attached to, from its `@attribute info`. Empty means any concept.
     */
    val attributedConcepts: MutableList<IConcept> = ArrayList()

    /**
     * Whether a node can have several attributes of this concept.
     */
    var multiple: Boolean = false

    fun isApplicableTo(attributedNode: INode): Boolean {
        val attributedConcept = attributedNode.concept ?: return false
        if (attributedConcepts.isNotEmpty() && attributedConcepts.none { attributedConcept.isSubConceptOfUID(it.getUID()) }) {
            return false
        }
        if (!multiple && attributedNode.getAttributes().any { it.concept?.getUID() == concept.getUID() }) return false
        return true
    }

    override fun createCell(
        context: CellCreationContext,
        node: INode,
    ): CellSpecBase {
        val attributedNode = node.getAttributedNode() ?: return TextCellSpec("", "<attributed node>")
        val layers = context.editorEngine.getNodeAttributeLayers(attributedNode)
        val nextLayer = layers.getOrNull(layers.indexOfFirst { it.reference == node.reference } + 1)
        return CellSpec().also {
            it.addChild(ChildSpecReference(AttributedNodeCellCreationCall(attributedNode.asWritableNode(), nextLayer?.asWritableNode())))
        }
    }

    override fun toCompletionToken(): ICompletionTokenOrList? = null

    override fun getSymbolTransformationAction(
        node: INode,
        optionalCell: TemplateCellReference,
    ): IActionOrProvider? = null

    // Not part of any grammar yet: no child cell offers attributes, so the parser never reaches an attribute's rule.
    override fun toParserSymbol(): ISymbol =
        SubConceptsSymbol(attributedConcepts.singleOrNull() ?: BuiltinLanguages.jetbrains_mps_lang_core.BaseConcept)

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {}
}

/**
 * Adding a node attribute by typing its notation next to the node it is attached to: the first constant before the
 * `attributed` cell when typed in front of the node, the first constant after it when typed behind the node. What
 * the notation has between that constant and the `attributed` cell is left empty, the same way a side transform
 * leaves the other operand of a binary operator empty.
 *
 * [index] is the position in the `smodelAttribute` role. It decides how the new attribute nests with the existing
 * ones (the first one is the outermost) and is derived from where the caret is.
 */
fun NotationRootCellTemplate.getAttributeSideTransformActions(
    before: Boolean,
    attributedNode: INode,
    index: Int,
): List<ICodeCompletionAction> {
    val symbols = getGrammarSymbols().toList()
    val attributedIndex = symbols.indexOfFirst { it is AttributedCellTemplate }
    if (attributedIndex < 0) return emptyList()
    val attributedCell = symbols[attributedIndex] as AttributedCellTemplate
    if (!attributedCell.isApplicableTo(attributedNode)) return emptyList()
    val sideSymbols = if (before) symbols.take(attributedIndex) else symbols.drop(attributedIndex + 1)
    val token = sideSymbols.filterIsInstance<ConstantCellTemplate>().firstOrNull() ?: return emptyList()
    return listOf(AddNodeAttributeAction(token.text, concept, attributedNode, index))
}

/**
 * Whether the notation writes something on that side of the `attributed` cell. If not, the border of the attribute's
 * cell on that side coincides with the border of the layer inside it, and only the inner one offers actions.
 */
fun NotationRootCellTemplate.hasSymbolsBesideAttributedCell(before: Boolean): Boolean {
    val symbols = getGrammarSymbols().toList()
    val attributedIndex = symbols.indexOfFirst { it is AttributedCellTemplate }
    if (attributedIndex < 0) return false
    return if (before) attributedIndex > 0 else attributedIndex < symbols.lastIndex
}

class AddNodeAttributeAction(
    val text: String,
    val attributeConcept: IConcept,
    val attributedNode: INode,
    val index: Int,
) : ICodeCompletionAction {
    override fun getMatchingText(): String = text

    override fun getDescription(): String = attributeConcept.getShortName()

    override fun execute(editor: BackendEditorComponent): CaretPositionPolicy {
        val attribute =
            attributedNode
                .asWritableNode()
                .addNewChild(smodelAttributeLink.toReference(), index, attributeConcept.getReference().upcast())
        return CaretPositionPolicy(attribute.asLegacyNode())
            .avoid(NodeCellReference(attributedNode.reference))
    }

    /**
     * Where the cells of several nodes start at the same position (a method and its first keyword), the attribute
     * is attached to the outermost one, the construct as a whole.
     */
    override fun shadows(shadowed: ICodeCompletionAction): Boolean {
        if (shadowed !is AddNodeAttributeAction) return false
        if (shadowed.attributeConcept.getUID() != attributeConcept.getUID()) return false
        return shadowed.attributedNode
            .ancestors()
            .any { it.reference == attributedNode.reference }
    }
}

private fun INode.ancestors(): Sequence<INode> = generateSequence(parent) { it.parent }
