package org.modelix.editor.celltemplate

import org.modelix.editor.CaretPositionPolicy
import org.modelix.editor.CellActionProperties
import org.modelix.editor.CellCreationContext
import org.modelix.editor.CellReference
import org.modelix.editor.CellSpec
import org.modelix.editor.ChildCompletionToken
import org.modelix.editor.ChildNodeCellReference
import org.modelix.editor.ChildSpecReference
import org.modelix.editor.CodeCompletionParameters
import org.modelix.editor.CommonCellProperties
import org.modelix.editor.ExistingNode
import org.modelix.editor.IActionOrProvider
import org.modelix.editor.ICaretPositionPolicy
import org.modelix.editor.ICellAction
import org.modelix.editor.ICellTemplateReference
import org.modelix.editor.ICodeCompletionAction
import org.modelix.editor.ICompletionTokenOrList
import org.modelix.editor.INonExistingNode
import org.modelix.editor.IParseTreeToAstBuilder
import org.modelix.editor.NonExistingChild
import org.modelix.editor.PlaceholderCellReference
import org.modelix.editor.ReplaceNodeActionProvider
import org.modelix.editor.SeparatorCellReference
import org.modelix.editor.SeparatorCellTemplateReference
import org.modelix.editor.SubstitutionPlaceholderPosition
import org.modelix.editor.TemplateCellReference
import org.modelix.editor.TextCellSpec
import org.modelix.editor.after
import org.modelix.editor.ancestors
import org.modelix.editor.asProvider
import org.modelix.editor.replacement
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.toNonExisting
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.remove
import org.modelix.parser.AmbiguousNode
import org.modelix.parser.ExactConceptSymbol
import org.modelix.parser.INonTerminalToken
import org.modelix.parser.IParseTreeNode
import org.modelix.parser.ISymbol
import org.modelix.parser.ITerminalSymbol
import org.modelix.parser.ListSymbol
import org.modelix.parser.ParseTreeNode
import org.modelix.parser.SubConceptsSymbol

class ChildCellTemplate(
    concept: IConcept,
    val link: IChildLink,
) : CellTemplate(concept), IGrammarConditionSymbol {

    private var separatorCell: CellTemplate? = null

    /**
     * When pressing ENTER a new node of this concept is inserted.
     * If this concept is null, then a special placeholder cell is added to the editor and a node can be created using
     * the code completion menu.
     */
    var newLineConcept: IConcept? = null

    override fun toParserSymbol(): ISymbol {
        return if (link.isMultiple) {
            val separatorSymbols = (separatorCell?.getGrammarSymbols()?.toList() ?: emptyList())
                .map { it.toParserSymbol() }.filterIsInstance<ITerminalSymbol>()
            ListSymbol(SubConceptsSymbol(link.targetConcept), separatorSymbols.firstOrNull())
        } else {
            SubConceptsSymbol(link.targetConcept)
        }
    }

    override fun toCompletionToken(): ICompletionTokenOrList? {
        return ChildCompletionToken(link)
    }

    override fun consumeTokens(builder: IParseTreeToAstBuilder) {
        val symbol = toParserSymbol()
        val token = builder.consumeNextToken { it is INonTerminalToken && it.getNonTerminalSymbol() == symbol } ?: return
        loadChildrenFromParseTree(builder, token)
    }

    private fun loadChildrenFromParseTree(builder: IParseTreeToAstBuilder, parseTree: IParseTreeNode) {
        when (parseTree) {
            is ParseTreeNode -> {
                val nonTerminal = parseTree.rule.head
                when (nonTerminal) {
                    is ExactConceptSymbol -> {
                        builder.buildChild(link, parseTree)
                    }
                    is SubConceptsSymbol -> {
                        parseTree.children.forEach { loadChildrenFromParseTree(builder, it) }
                    }
                    is ListSymbol -> {
                        parseTree.children.forEach { loadChildrenFromParseTree(builder, it) }
                    }
                    else -> throw NotImplementedError("$nonTerminal")
                }
            }
            is AmbiguousNode -> {
                builder.buildChild(link, parseTree)
            }
            else -> throw NotImplementedError("$parseTree")
        }
    }

    fun setSeparator(newSeparator: CellTemplate) {
        this.separatorCell = newSeparator
        reference?.let { newSeparator.setReference(SeparatorCellTemplateReference(it)) }
    }

    override fun setReference(ref: ICellTemplateReference) {
        super.setReference(ref)
        separatorCell?.setReference(SeparatorCellTemplateReference(ref))
    }

    override fun createCell(context: CellCreationContext, node: INode) = CellSpec().also { cell ->
        val childNodes = getChildNodes(node)
        val substitutionPlaceholder = context.cellTreeState.substitutionPlaceholderPositions[createCellReference(node)]
        val placeholderIndex = substitutionPlaceholder?.index?.coerceIn(0..childNodes.size) ?: 0
        fun addSubstitutionPlaceholder(index: Int) {
            val isDefaultPlaceholder = childNodes.isEmpty()
            val placeholderText = if (isDefaultPlaceholder) "<no ${link.getSimpleName()}>" else "<choose ${link.getSimpleName()}>"
            val placeholder = TextCellSpec("", placeholderText)
            placeholder.properties[CellActionProperties.substitute] =
                ReplaceNodeActionProvider(NonExistingChild(node.toNonExisting(), link, index)).after {
                    context.cellTreeState.substitutionPlaceholderPositions.remove(createCellReference(node))
                }
            placeholder.cellReferences.add(PlaceholderCellReference(createCellReference(node)))
            if (isDefaultPlaceholder) {
                placeholder.cellReferences += ChildNodeCellReference(node.reference, link.toReference(), index)
            }
            placeholder.properties[CommonCellProperties.tabTarget] = true
            placeholder.properties[CellActionProperties.delete] = object : ICellAction {
                override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? {
                    context.cellTreeState.substitutionPlaceholderPositions.remove(createCellReference(node))
                    return null // Position is updated by the frontend
                }

                override fun isApplicable(): Boolean = true
            }
            cell.addChild(placeholder)
        }
        fun addInsertActionCell(index: Int) {
            if (link.isMultiple) {
                val actionCell = CellSpec()
                val action = newLineConcept?.let {
                    InstantiateNodeCellAction(NonExistingChild(ExistingNode(node), link, index), it)
                } ?: InsertSubstitutionPlaceholderAction(context.cellTreeState, createCellReference(node), index)
                actionCell.properties[CellActionProperties.insert] = action
                cell.addChild(actionCell)
            }
        }
        fun addSeparator(before: CellReference) {
            separatorCell?.let {
                cell.addChild(
                    it.apply(context, node).also {
                        it.cellReferences += SeparatorCellReference(before)
                    },
                )
            }
        }
        if (childNodes.isEmpty()) {
            addSubstitutionPlaceholder(0)
        } else {
            val separatorText = separatorCell?.getGrammarSymbols()?.filterIsInstance<ConstantCellTemplate>()
                ?.firstOrNull()?.text
            val childCells = childNodes.map { ChildSpecReference(it) }
            childCells.forEachIndexed { index, child ->
                val childCellReference = ChildNodeCellReference(node.reference, link.toReference(), index)
                if (index != 0) {
                    addSeparator(childCellReference)
                }

                if (substitutionPlaceholder != null && placeholderIndex == index) {
                    addSubstitutionPlaceholder(placeholderIndex)
                    addSeparator(PlaceholderCellReference(createCellReference(node)))
                } else {
                    addInsertActionCell(index)
                }

                // child.parent?.removeChild(child) // child may be cached and is still attached to the old parent
                val wrapper = CellSpec() // allow setting properties by the parent, because the cell is already frozen
                wrapper.addChild(child)
                wrapper.cellReferences += childCellReference

                if (separatorText != null) {
                    wrapper.properties[CellActionProperties.transformBefore] = InsertSubstitutionPlaceholderCompletionAction(
                        index,
                        separatorText,
                        createCellReference(node),
                    ).asProvider()
                    wrapper.properties[CellActionProperties.transformAfter] = InsertSubstitutionPlaceholderCompletionAction(
                        index + 1,
                        separatorText,
                        createCellReference(node),
                    ).asProvider()
                }

                cell.addChild(wrapper)
            }
            if (substitutionPlaceholder != null && placeholderIndex == childNodes.size) {
                if (childCells.isNotEmpty()) {
                    addSeparator(PlaceholderCellReference(createCellReference(node)))
                }
                addSubstitutionPlaceholder(placeholderIndex)
            } else {
                addInsertActionCell(childNodes.size)
            }
        }
    }

    fun getChildNodes(node: INode) = node.getChildren(link).toList()

    override fun getInstantiationActions(location: INonExistingNode, parameters: CodeCompletionParameters): List<IActionOrProvider>? {
        // This cell produces "wrappers".
        // For example, in MPS baseLanguage you can type "int" (which is a Type) where a Statement is expected,
        // and it is automatically wrapped with a LocalVariableDeclarationStatement.
        // If the to-be-wrapped concept is already allowed without the wrapper, then it's not necessary to generate
        // such an action.
        if (link.targetConcept.isSubConceptOf(location.expectedConcept())) {
            return emptyList()
        }

        // prevent endless nesting
        if (location.ancestors(true).takeWhile { it.getNode() == null }.count() > 10) return emptyList()

        val childNode = NonExistingChild(location.replacement(concept), link)
        return listOf(ReplaceNodeActionProvider(childNode))
    }

    override fun getSymbolConditionState(node: INode): Boolean {
        return node.getChildren(link).iterator().hasNext()
    }

    override fun setSymbolConditionFalse(node: INode) {
        node.getChildren(link).toList().forEach { it.remove() }
    }

    override fun getSymbolTransformationAction(node: INode, optionalCell: TemplateCellReference): IActionOrProvider? {
        return ReplaceNodeActionProvider(NonExistingChild(node.toNonExisting(), link))
    }

    inner class InsertSubstitutionPlaceholderCompletionAction(
        val index: Int,
        val separatorText: String,
        val ref: TemplateCellReference,
    ) : ICodeCompletionAction {
        override fun getDescription(): String {
            return "Add new node to ${link.getSimpleName()}"
        }

        override fun getMatchingText(): String {
            return separatorText
        }

        override fun execute(editor: BackendEditorComponent): CaretPositionPolicy? {
            editor.state.substitutionPlaceholderPositions[ref] = SubstitutionPlaceholderPosition(index)
            editor.state.textReplacements.remove(PlaceholderCellReference(ref))
            return CaretPositionPolicy(PlaceholderCellReference(ref))
        }
    }
}
