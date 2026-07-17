package org.modelix.editor

import org.modelix.checks.CheckMessage
import org.modelix.checks.CheckMessageTarget
import org.modelix.checks.ModelCheckAspect
import org.modelix.checks.addCheckMessages
import org.modelix.editor.celltemplate.CellTemplate
import org.modelix.editor.celltemplate.ParserForEditor
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import org.modelix.editor.text.shared.celltree.cellReferences
import org.modelix.incremental.IncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.IConcept
import org.modelix.model.api.IConceptReference
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.api.IPropertyReference
import org.modelix.model.api.IReferenceLinkReference
import org.modelix.model.api.IWritableNode
import org.modelix.model.api.getAllConcepts
import org.modelix.model.api.remove
import org.modelix.parser.IParseTreeNode

class EditorEngine(
    incrementalEngine: IncrementalEngine? = null,
) {
    private val incrementalEngine: IncrementalEngine
    private val ownsIncrementalEngine: Boolean
    private val editorsForConcept: MutableMap<IConceptReference, MutableList<ConceptEditor>> = LinkedHashMap()
    private val conceptEditorRegistries = ArrayList<IConceptEditorRegistry>()
    private val parser = ParserForEditor(this)

    init {
        if (incrementalEngine == null) {
            this.incrementalEngine = IncrementalEngine(100_000)
            this.ownsIncrementalEngine = true
        } else {
            this.incrementalEngine = incrementalEngine
            this.ownsIncrementalEngine = false
        }
    }

    private val createCellIncremental: (CellTreeState, CellCreationCall) -> IMutableCellTree.MutableCell =
        this.incrementalEngine.incrementalFunction("createCell") { context, editorState, call ->
            val cell = doCreateCell(editorState, call, context.readOwnStateVariable().getOrNull())
            LOG.trace { "Cell created for $call: $cell" }
            cell
        }

    /**
     * Aggregates the check messages of a subtree. Only invoked for descendants that are not rendered in the editor
     * (see [collectHiddenDescendantMessages]), so caching is limited to the hidden parts of the model.
     */
    private val fAllSubtreeMessages: (INode) -> List<CheckMessage> =
        this.incrementalEngine.incrementalFunction("allSubtreeMessages") { _, node ->
            getCheckMessages(node) + node.allChildren.flatMap { allSubtreeMessages(it) }
        }

    private val createCellSpecIncremental: (CellTreeState, CellCreationCall) -> CellSpecBase =
        this.incrementalEngine.incrementalFunction("createCellData") { _, editorState, call ->
            when (call) {
                is NodeCellCreationCall -> {
                    val node = call.node.asLegacyNode()
                    val cellData = doCreateCellData(editorState, node)
                    cellData.properties[CommonCellProperties.node] = node.toNonExisting()
                    cellData.properties[CommonCellProperties.cellCall] = call
                    // Messages whose target cell (a property or reference cell) is rendered are attached to that
                    // cell by the respective cell template. Everything else is attached here, to the node's own cell:
                    //  - whole-node messages (they underline the node's whole cell range; the range is derived by
                    //    the renderer, which walks up the cell tree from each layoutable),
                    //  - targeted messages whose feature cell the editor does not render,
                    //  - all messages of descendants that are not rendered at all (this is the nearest visible ancestor).
                    val messages =
                        collectUnattachedOwnMessages(node, cellData) +
                            collectHiddenDescendantMessages(node, cellData)
                    if (messages.isNotEmpty()) applyCheckMessages(cellData, messages)
                    cellData.freeze()
                    LOG.trace { "Cell created for $node: $cellData" }
                    cellData
                }
            }
        }

    fun addRegistry(registry: IConceptEditorRegistry) {
        conceptEditorRegistries += registry
    }

    fun removeRegistry(registry: IConceptEditorRegistry) {
        conceptEditorRegistries.remove(registry)
    }

    fun registerEditors(editorAspect: EditorAspect) {
        editorAspect.conceptEditors.forEach {
            val declaredConcept = it.declaredConcept ?: return@forEach
            editorsForConcept.getOrPut(declaredConcept.getReference()) { ArrayList() }.add(it)
        }
    }

    fun createCell(
        cellTreeState: CellTreeState,
        node: INode,
    ) = createCell(cellTreeState, node.asWritableNode())

    fun createCell(
        cellTreeState: CellTreeState,
        node: IWritableNode,
    ) = createCell(cellTreeState, NodeCellCreationCall(node))

    fun createCell(
        cellTreeState: CellTreeState,
        call: CellCreationCall,
    ) = createCellIncremental(cellTreeState, call)

    fun createCellModel(concept: IConcept): CellTemplate {
        val editor: ConceptEditor = resolveConceptEditor(concept).first()
        val template: CellTemplate = editor.apply(concept)
        return template
    }

    fun createCellModelExcludingDefault(concept: IConcept): CellTemplate? =
        resolveConceptEditor(concept).minus(defaultConceptEditor).firstOrNull()?.apply(concept)

    fun editNode(node: IWritableNode): BackendEditorComponent = BackendEditorComponent(NodeCellCreationCall(node), this)

    private fun doCreateCell(
        cellTreeState: CellTreeState,
        call: CellCreationCall,
        reusableCell: IMutableCellTree.MutableCell?,
    ): IMutableCellTree.MutableCell =
        dataToCell(cellTreeState, createCellSpecIncremental(cellTreeState, call), reusableCell ?: cellTreeState.cellTree.createCell())

    private fun dataToCell(
        cellTreeState: CellTreeState,
        data: CellSpecBase,
        cell: IMutableCellTree.MutableCell,
    ): IMutableCellTree.MutableCell {
        val propertiesToRemove = cell.getPropertyNames().toMutableSet()

        fun <T> setProperty(
            key: CellPropertyKey<T>,
            newValue: T,
        ) {
            cell.setProperty(key, newValue)
            propertiesToRemove.remove(key.name)
        }

        data.cellReferences.takeIf { it.isNotEmpty() }?.let {
            setProperty(CommonCellProperties.cellReferences, it.toList())
        }
        for (key in data.properties.getKeys()) {
            setProperty(key as CellPropertyKey<Any?>, data.properties[key])
        }

        val unusedChildren = cell.getChildren().toMutableSet()
        when (data) {
            is CellSpec -> {
                setProperty(CommonCellProperties.type, ECellType.COLLECTION)
            }

            is TextCellSpec -> {
                setProperty(CommonCellProperties.type, ECellType.TEXT)
                setProperty(TextCellProperties.text, data.text)
                setProperty(TextCellProperties.placeholderText, data.placeholderText)
            }
        }
        for ((index, childRef) in data.children.withIndex()) {
            val childCell =
                when (childRef) {
                    is CellSpecBase -> {
                        val reusableCell = unusedChildren.find { it.cellReferences == childRef.cellReferences }
                        dataToCell(cellTreeState, childRef, reusableCell ?: cell.addNewChild(index))
                    }

                    is ChildSpecReference -> {
                        createCell(cellTreeState, childRef.childNode)
                    }
                }
            if (childCell.getParent() != cell) {
                childCell.moveCell(cell, index)
            } else if (cell.getChildAt(index) != childCell) {
                childCell.moveCell(index)
            }
            unusedChildren.remove(childCell)
        }

        unusedChildren.forEach {
            // It may have been used elsewhere during the recursive call.
            if (it.getParent() == cell) {
                it.detach()
            }
        }
        propertiesToRemove.forEach { cell.removeProperty(it) }

        return cell
    }

    private fun doCreateCellData(
        cellTreeState: CellTreeState,
        node: INode,
    ): CellSpecBase {
        try {
            val editor = resolveConceptEditor(node.concept)
            val context = CellCreationContext(this, cellTreeState)

            // TODO do some proper conflict resolution between multiple applicable editors instead of just taking the first one.
            val data = editor.asSequence().mapNotNull { it.applyIfApplicable(context, node) }.first()

            data.properties[CellActionProperties.substitute] = ReplaceNodeActionProvider(ExistingNode(node))
            data.cellReferences += NodeCellReference(node.reference)
            data.properties[CellActionProperties.transformBefore] = SideTransformNode(true, node)
            data.properties[CellActionProperties.transformAfter] = SideTransformNode(false, node)
            data.properties[CommonCellProperties.selectable] = true
            data.properties[CellActionProperties.delete] = DeleteNodeCellAction(node)
            return data
        } catch (ex: Exception) {
            LOG.error(ex) { "Failed to create cell for $node" }
            return TextCellSpec("<ERROR: ${ex.message}>", "").apply {
                properties[CommonCellProperties.textColor] = "red"
            }
        }
    }

    /**
     * Returns the messages reported by the registered [ModelCheckAspect] checkers for the given node.
     */
    fun getCheckMessages(node: INode): List<CheckMessage> = ModelCheckAspect.getMessages(incrementalEngine, node)

    /**
     * Collects the check messages of all descendants of [node] that are not rendered in the editor.
     *
     * A child node is rendered when the node's cell spec references it (via a [ChildSpecReference]). Children that
     * are not referenced get no cell, and neither do any of their descendants, so their messages would never be
     * shown. Those messages are returned here so the caller can attach them to [node], the nearest visible ancestor.
     */
    private fun collectHiddenDescendantMessages(
        node: INode,
        cellData: CellSpecBase,
    ): List<CheckMessage> {
        val renderedChildren = HashSet<INodeReference>()
        collectRenderedChildNodes(cellData, renderedChildren)
        return node.allChildren
            .filter { it.reference !in renderedChildren }
            .flatMap { allSubtreeMessages(it) }
    }

    private fun collectRenderedChildNodes(
        spec: ILocalOrChildNodeCell,
        acc: MutableSet<INodeReference>,
    ) {
        when (spec) {
            is ChildSpecReference -> acc.add(spec.childNode.reference)
            is CellSpecBase -> spec.children.forEach { collectRenderedChildNodes(it, acc) }
        }
    }

    /**
     * Returns [node]'s own messages that have to be attached to the node's cell: whole-node messages, and
     * property/reference messages whose feature cell the editor does not render (so they were not attached to a cell
     * of their own by the cell template and would otherwise be lost).
     */
    private fun collectUnattachedOwnMessages(
        node: INode,
        cellData: CellSpecBase,
    ): List<CheckMessage> {
        val renderedFeatures = RenderedFeatures()
        collectRenderedFeatureCells(cellData, node.reference, renderedFeatures)
        return getCheckMessages(node).filter { message ->
            when (val target = message.target) {
                is CheckMessageTarget.WholeNode -> true
                is CheckMessageTarget.PropertyTarget -> renderedFeatures.properties.none { it.matches(target.role) }
                is CheckMessageTarget.ReferenceTarget -> renderedFeatures.references.none { it.matches(target.role) }
            }
        }
    }

    /**
     * Collects the properties and references of [node] for which the cell spec renders a cell. Stops at child node
     * boundaries ([ChildSpecReference]), because those children render their own feature cells.
     */
    private fun collectRenderedFeatureCells(
        spec: ILocalOrChildNodeCell,
        nodeRef: INodeReference,
        acc: RenderedFeatures,
    ) {
        when (spec) {
            is ChildSpecReference -> {
                Unit
            }

            is CellSpecBase -> {
                spec.cellReferences.forEach { ref ->
                    when (ref) {
                        is PropertyCellReference -> if (ref.nodeRef == nodeRef) acc.properties.add(ref.property)
                        is ReferencedNodeCellReference -> if (ref.sourceNodeRef == nodeRef) acc.references.add(ref.link)
                        else -> Unit
                    }
                }
                spec.children.forEach { collectRenderedFeatureCells(it, nodeRef, acc) }
            }
        }
    }

    /**
     * Returns all check messages of [node] and its whole subtree. Used for subtrees that are entirely hidden,
     * so the individual target of a message (property/reference) can no longer be resolved to a cell and every
     * message is instead surfaced on the nearest visible ancestor.
     *
     * The aggregation is cached per node in the incremental engine, so a localized model change only recomputes
     * the results along the path from the changed node to the hidden subtree's root; unchanged sibling subtrees
     * are reused from the cache instead of being re-walked.
     */
    private fun allSubtreeMessages(node: INode): List<CheckMessage> = fAllSubtreeMessages(node)

    /**
     * Attaches the messages to the node's own (root) cell only. The renderer decides which layoutables to decorate:
     * a text cell is underlined when it or an ancestor carries a message (so a whole-node message underlines the
     * node's whole cell range), and a collection cell emits a [LayoutableGutterMarker] carrying the message to the
     * gutter of the line where its content begins.
     */
    private fun applyCheckMessages(
        data: CellSpecBase,
        messages: List<CheckMessage>,
    ) {
        data.properties.addCheckMessages(messages)
    }

    fun resolveConceptEditor(concept: IConcept?): List<ConceptEditor> {
        if (concept == null) return listOf(defaultConceptEditor)
        val editors =
            concept.getAllConcepts().firstNotNullOfOrNull { superConcept ->
                val conceptReference = superConcept.getReference()
                val allEditors =
                    (editorsForConcept[conceptReference] ?: emptyList()) +
                        conceptEditorRegistries.flatMap { it.getConceptEditors(conceptReference) }
                allEditors
                    .filter { it.declaredConcept == null || it.applicableToSubConcepts || concept.isExactly(it.declaredConcept) }
                    .takeIf { it.isNotEmpty() }
            }
        return (editors ?: emptyList()) + defaultConceptEditor
    }

    fun parse(
        input: String,
        outputConcept: IConcept,
        complete: Boolean,
    ): List<IParseTreeNode> =
        parser.getParser(startConcept = outputConcept, forCodeCompletion = complete).parseForest(input, complete).toList()

    fun dispose() {
        if (ownsIncrementalEngine) incrementalEngine.dispose()
    }

    companion object {
        private val LOG =
            io.github.oshai.kotlinlogging.KotlinLogging
                .logger {}
    }
}

class DeleteNodeCellAction(
    val node: INode,
) : ICellAction {
    override fun isApplicable(): Boolean = true

    override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? {
        editor.runWrite {
            node.remove()
        }
        return null // The frontend updates the caret position using SavedCaretPosition
    }
}

/**
 * The properties and references of a node for which the editor renders a cell, collected while walking a cell spec.
 */
private class RenderedFeatures {
    val properties: MutableList<IPropertyReference> = ArrayList()
    val references: MutableList<IReferenceLinkReference> = ArrayList()
}

sealed class CellCreationCall

data class NodeCellCreationCall(
    val node: IWritableNode,
) : CellCreationCall()
