package org.modelix.editor

import kotlinx.coroutines.flow.Flow
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IConcept
import org.modelix.model.api.IConceptReference
import org.modelix.model.api.INode
import org.modelix.model.api.INodeReference
import org.modelix.model.api.IProperty
import org.modelix.model.api.IReferenceLink
import org.modelix.model.area.IArea
import org.modelix.parser.AmbiguousNode
import org.modelix.parser.ExactConceptSymbol
import org.modelix.parser.IParseTreeNode
import org.modelix.parser.ListSymbol
import org.modelix.parser.ParseTreeNode
import org.modelix.parser.SubConceptsSymbol

interface IPendingNode : INode {
    fun commit(location: INonExistingNode): INode

    fun flattenFirstAmbiguousNode(): List<INode>

    fun replaceAllAmbiguousWithFirst(): INode
}

abstract class PendingNodeBase : IPendingNode {
    override fun addNewChild(
        role: String?,
        index: Int,
        concept: IConcept?,
    ): INode = TODO("Not yet implemented")

    override val allChildren: Iterable<INode> get() = TODO("Not yet implemented")
    override val concept: IConcept? get() = TODO("Not yet implemented")
    override val isValid: Boolean get() = TODO("Not yet implemented")
    override val parent: INode? get() = TODO("Not yet implemented")
    override val reference: INodeReference get() = TODO("Not yet implemented")
    override val roleInParent: String? get() = TODO("Not yet implemented")

    override fun getArea(): IArea = TODO("Not yet implemented")

    override fun getChildren(role: String?): Iterable<INode> = TODO("Not yet implemented")

    override fun getConceptReference(): IConceptReference? = TODO("Not yet implemented")

    override fun getPropertyRoles(): List<String> = TODO("Not yet implemented")

    override fun getPropertyValue(role: String): String? = TODO("Not yet implemented")

    override fun getReferenceRoles(): List<String> = TODO("Not yet implemented")

    override fun getReferenceTarget(role: String): INode? = TODO("Not yet implemented")

    override fun moveChild(
        role: String?,
        index: Int,
        child: INode,
    ): Unit = TODO("Not yet implemented")

    override fun removeChild(child: INode): Unit = TODO("Not yet implemented")

    override fun setPropertyValue(
        role: String,
        value: String?,
    ): Unit = TODO("Not yet implemented")

    override fun setReferenceTarget(
        role: String,
        target: INode?,
    ): Unit = TODO("Not yet implemented")

    override fun addNewChild(
        role: IChildLink,
        index: Int,
        concept: IConcept?,
    ): INode = TODO("Not yet implemented")

    override fun addNewChild(
        role: IChildLink,
        index: Int,
        concept: IConceptReference?,
    ): INode = TODO("Not yet implemented")

    override fun addNewChild(
        role: String?,
        index: Int,
        concept: IConceptReference?,
    ): INode = TODO("Not yet implemented")

    override fun addNewChildren(
        link: IChildLink,
        index: Int,
        concepts: List<IConceptReference?>,
    ): List<INode> = TODO("Not yet implemented")

    override fun addNewChildren(
        role: String?,
        index: Int,
        concepts: List<IConceptReference?>,
    ): List<INode> = TODO("Not yet implemented")

    override fun getAllChildrenAsFlow(): Flow<INode> = TODO("Not yet implemented")

    override fun getAllProperties(): List<Pair<IProperty, String>> = TODO("Not yet implemented")

    override fun getAllReferenceTargetRefs(): List<Pair<IReferenceLink, INodeReference>> = TODO("Not yet implemented")

    override fun getAllReferenceTargetRefsAsFlow(): Flow<Pair<IReferenceLink, INodeReference>> = TODO("Not yet implemented")

    override fun getAllReferenceTargets(): List<Pair<IReferenceLink, INode>> = TODO("Not yet implemented")

    override fun getAllReferenceTargetsAsFlow(): Flow<Pair<IReferenceLink, INode>> = TODO("Not yet implemented")

    override fun getChildren(link: IChildLink): Iterable<INode> = TODO("Not yet implemented")

    override fun getChildrenAsFlow(role: IChildLink): Flow<INode> = TODO("Not yet implemented")

    override fun getContainmentLink(): IChildLink? = TODO("Not yet implemented")

    override fun getDescendantsAsFlow(includeSelf: Boolean): Flow<INode> = TODO("Not yet implemented")

    override fun getOriginalReference(): String? = TODO("Not yet implemented")

    override fun getParentAsFlow(): Flow<INode> = TODO("Not yet implemented")

    override fun getPropertyLinks(): List<IProperty> = TODO("Not yet implemented")

    override fun getPropertyValue(property: IProperty): String? = TODO("Not yet implemented")

    override fun getPropertyValueAsFlow(role: IProperty): Flow<String?> = TODO("Not yet implemented")

    override fun getReferenceLinks(): List<IReferenceLink> = TODO("Not yet implemented")

    override fun getReferenceTarget(link: IReferenceLink): INode? = TODO("Not yet implemented")

    override fun getReferenceTargetAsFlow(role: IReferenceLink): Flow<INode> = TODO("Not yet implemented")

    override fun getReferenceTargetRef(role: IReferenceLink): INodeReference? = TODO("Not yet implemented")

    override fun getReferenceTargetRef(role: String): INodeReference? = TODO("Not yet implemented")

    override fun getReferenceTargetRefAsFlow(role: IReferenceLink): Flow<INodeReference> = TODO("Not yet implemented")

    override fun moveChild(
        role: IChildLink,
        index: Int,
        child: INode,
    ): Unit = TODO("Not yet implemented")

    override fun removeReference(role: IReferenceLink): Unit = TODO("Not yet implemented")

    override fun setPropertyValue(
        property: IProperty,
        value: String?,
    ): Unit = TODO("Not yet implemented")

    override fun setReferenceTarget(
        link: IReferenceLink,
        target: INode?,
    ): Unit = TODO("Not yet implemented")

    override fun setReferenceTarget(
        role: IReferenceLink,
        target: INodeReference?,
    ): Unit = TODO("Not yet implemented")

    override fun setReferenceTarget(
        role: String,
        target: INodeReference?,
    ): Unit = TODO("Not yet implemented")

    override fun tryGetConcept(): IConcept? = TODO("Not yet implemented")

    override fun usesRoleIds(): Boolean = TODO("Not yet implemented")
}

class AmbiguousPendingNode(
    val alternatives: List<INode>,
) : PendingNodeBase() {
    override fun commit(location: INonExistingNode): INode = throw UnsupportedOperationException()

    override fun flattenFirstAmbiguousNode(): List<INode> = alternatives

    override fun replaceAllAmbiguousWithFirst(): INode = (alternatives.first() as IPendingNode).replaceAllAmbiguousWithFirst()
}

data class PendingNode(
    override val concept: IConcept,
    val children: MutableMap<IChildLink, MutableList<IPendingNode>> = LinkedHashMap(),
    val properties: MutableMap<IProperty, String> = LinkedHashMap(),
    val references: MutableMap<IReferenceLink, INode> = LinkedHashMap(),
) : PendingNodeBase() {
    override fun flattenFirstAmbiguousNode(): List<INode> {
        val allChildren: List<Pair<IChildLink, IPendingNode>> =
            children.flatMap { childrenInRole ->
                childrenInRole.value.map {
                    childrenInRole.key to
                        it
                }
            }

        for ((index, child) in allChildren.withIndex()) {
            val flattenedChild = child.second.flattenFirstAmbiguousNode()
            if (flattenedChild.size <= 1) continue

            val allChildrenAlternatives =
                flattenedChild.map { alternative ->
                    allChildren.take(index) + (child.first to alternative) + allChildren.drop(index + 1)
                }
            return allChildrenAlternatives.map {
                PendingNode(
                    concept = concept,
                    children =
                        it
                            .groupBy { it.first }
                            .mapValues { it.value.map { it.second as IPendingNode }.toMutableList() }
                            .toMutableMap(),
                    properties = properties.toMutableMap(),
                    references = references.toMutableMap()
                )
            }
        }

        return listOf(this)
    }

    override fun replaceAllAmbiguousWithFirst(): INode {
        val newChildren =
            children
                .mapValues { it.value.map { it.replaceAllAmbiguousWithFirst() as IPendingNode }.toMutableList() }
                .toMutableMap()
        return PendingNode(
            concept = concept,
            children = newChildren,
            properties = properties.toMutableMap(),
            references = references.toMutableMap()
        )
    }

    fun applyContent(node: INode) {
        for (property in properties) {
            node.setPropertyValue(property.key, property.value)
        }
        for (entry in references) {
            node.setReferenceTarget(entry.key, entry.value)
        }
        for (entry in children) {
            for (pendingChild in entry.value) {
                val childNode = node.addNewChild(entry.key, -1, pendingChild.concept)
                (pendingChild as PendingNode).applyContent(childNode)
            }
        }
    }

    override fun commit(location: INonExistingNode): INode {
        val newNode = location.replaceNode(concept)
        applyContent(newNode)
        return newNode
    }

    override fun getChildren(link: IChildLink): Iterable<INode> = children[link] ?: emptyList()

    override val reference: INodeReference get() = TODO()

    override fun setPropertyValue(
        property: IProperty,
        value: String?,
    ) {
        if (value == null) {
            properties.remove(property)
        } else {
            properties[property] = value
        }
    }

    override fun getPropertyValue(property: IProperty): String? = properties[property]

    override fun getReferenceTarget(link: IReferenceLink): INode? = references[link]
}

interface IParseTreeToAstBuilder {
    fun currentNode(): INode

    fun buildNode(parseTreeNode: IParseTreeNode): List<INode>

    fun consumeNextToken(predicate: (IParseTreeNode) -> Boolean): IParseTreeNode?

    fun buildChild(
        role: IChildLink,
        childParseTree: IParseTreeNode,
    )

    fun consumeTokens(tokens: List<IParseTreeNode>)
}

class ParseTreeToAstBuilder(
    val editorEngine: EditorEngine,
    var node: PendingNode,
    val unconsumedTokens: MutableList<IParseTreeNode>,
) : IParseTreeToAstBuilder {
    override fun buildChild(
        role: IChildLink,
        childParseTree: IParseTreeNode,
    ) {
        val alternatives = buildNode(childParseTree)
        node.children.getOrPut(role) { ArrayList() }.add(
            if (alternatives.size ==
                1
            ) {
                alternatives.single()
            } else {
                AmbiguousPendingNode(alternatives)
            }
        )
    }

    override fun currentNode(): INode = node

    override fun buildNode(parseTreeNode: IParseTreeNode): List<IPendingNode> = Companion.buildNodes(editorEngine, parseTreeNode)

    override fun consumeNextToken(predicate: (IParseTreeNode) -> Boolean): IParseTreeNode? {
        val index = unconsumedTokens.indexOfFirst(predicate)
        return if (index == -1) null else unconsumedTokens.removeAt(index)
    }

    override fun consumeTokens(tokens: List<IParseTreeNode>) {
        ParseTreeToAstBuilder(editorEngine, node, tokens.toMutableList())
    }

    companion object {
        fun buildNodes(
            editorEngine: EditorEngine,
            parseTreeNode: IParseTreeNode,
        ): List<IPendingNode> =
            when (parseTreeNode) {
                is ParseTreeNode -> {
                    val nonTerminal = parseTreeNode.rule.head
                    when (nonTerminal) {
                        is ExactConceptSymbol -> {
                            val childNode = PendingNode(nonTerminal.concept)
                            val childSymbols = editorEngine.createCellModelExcludingDefault(nonTerminal.concept)!!.getGrammarSymbols()
                            val childBuilder = ParseTreeToAstBuilder(editorEngine, childNode, parseTreeNode.children.toMutableList())
                            for (symbol in childSymbols) {
                                symbol.consumeTokens(childBuilder)
                            }
                            listOf(childNode)
                        }

                        is SubConceptsSymbol -> {
                            buildNodes(editorEngine, parseTreeNode.children.single())
                        }

                        is ListSymbol -> {
                            parseTreeNode.children.flatMap { buildNodes(editorEngine, it) }
                        }

                        else -> {
                            throw NotImplementedError("$nonTerminal")
                        }
                    }
                }

                is AmbiguousNode -> {
                    listOf(AmbiguousPendingNode(parseTreeNode.trees.map { buildNodes(editorEngine, it).single() }))
                }

                else -> {
                    throw NotImplementedError("$parseTreeNode")
                }
            }
    }
}
