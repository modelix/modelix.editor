package org.modelix.editor

import org.modelix.editor.celltemplate.CellTemplate
import org.modelix.editor.celltemplate.ParserForEditor
import org.modelix.editor.text.backend.BackendEditorComponent
import org.modelix.editor.text.shared.celltree.IMutableCellTree
import org.modelix.incremental.IncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.model.api.IConcept
import org.modelix.model.api.IConceptReference
import org.modelix.model.api.INode
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
        this.incrementalEngine.incrementalFunction("createCell") { _, editorState, call ->
            val cell = doCreateCell(editorState, call)
            LOG.trace { "Cell created for $call: $cell" }
            cell
        }

    private val createCellSpecIncremental: (CellTreeState, CellCreationCall) -> CellSpecBase =
        this.incrementalEngine.incrementalFunction("createCellData") { _, editorState, call ->
            when (call) {
                is NodeCellCreationCall -> {
                    val node = call.node.asLegacyNode()
                    val cellData = doCreateCellData(editorState, node)
                    cellData.properties[CommonCellProperties.node] = node.toNonExisting()
                    cellData.properties[CommonCellProperties.cellCall] = call
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
    ): IMutableCellTree.MutableCell =
        dataToCell(cellTreeState, createCellSpecIncremental(cellTreeState, call), cellTreeState.cellTree.createCell())

    private fun dataToCell(
        cellTreeState: CellTreeState,
        data: CellSpecBase,
        cell: IMutableCellTree.MutableCell,
    ): IMutableCellTree.MutableCell {
        data.cellReferences.takeIf { it.isNotEmpty() }?.let {
            cell.setProperty(CommonCellProperties.cellReferences, it.toList())
        }
        for (key in data.properties.getKeys()) {
            cell.setProperty(key as CellPropertyKey<Any?>, data.properties[key])
        }
        when (data) {
            is CellSpec -> {
                cell.setProperty(CommonCellProperties.type, ECellType.COLLECTION)
            }

            is TextCellSpec -> {
                cell.setProperty(CommonCellProperties.type, ECellType.TEXT)
                cell.setProperty(TextCellProperties.text, data.text)
                cell.setProperty(TextCellProperties.placeholderText, data.placeholderText)
            }
        }
        for ((index, childRef) in data.children.withIndex()) {
            val childCell =
                when (childRef) {
                    is CellSpecBase -> {
                        dataToCell(cellTreeState, childRef, cell.addNewChild(index))
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
        }
        cell.getChildren().drop(data.children.size).forEach { it.detach() }
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

sealed class CellCreationCall

data class NodeCellCreationCall(
    val node: IWritableNode,
) : CellCreationCall()
