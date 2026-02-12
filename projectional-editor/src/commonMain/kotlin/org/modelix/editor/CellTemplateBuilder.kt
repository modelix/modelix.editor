package org.modelix.editor

import io.github.oshai.kotlinlogging.KotlinLogging
import org.modelix.editor.celltemplate.CellTemplate
import org.modelix.editor.celltemplate.ChildCellTemplate
import org.modelix.editor.celltemplate.CollectionCellTemplate
import org.modelix.editor.celltemplate.ConstantCellTemplate
import org.modelix.editor.celltemplate.FlagCellTemplate
import org.modelix.editor.celltemplate.LabelCellTemplate
import org.modelix.editor.celltemplate.NewLineCellTemplate
import org.modelix.editor.celltemplate.NoSpaceCellTemplate
import org.modelix.editor.celltemplate.NotationRootCellTemplate
import org.modelix.editor.celltemplate.OptionalCellTemplate
import org.modelix.editor.celltemplate.PropertyCellTemplate
import org.modelix.editor.celltemplate.ReferenceCellTemplate
import org.modelix.metamodel.IConceptOfTypedNode
import org.modelix.metamodel.ITypedChildLink
import org.modelix.metamodel.ITypedChildListLink
import org.modelix.metamodel.ITypedConcept
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.ITypedProperty
import org.modelix.metamodel.ITypedReferenceLink
import org.modelix.metamodel.ITypedSingleChildLink
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.model.api.IReferenceLink
import kotlin.jvm.JvmName
import kotlin.reflect.KClass

private val LOG = KotlinLogging.logger { }

open class CellTemplateBuilder<NodeT : Any, ConceptT : Any>(
    val template: CellTemplate,
    val concept: ConceptT,
    protected val nodeConverter: INodeConverter<NodeT>,
) {
    val properties = CellProperties()

    protected fun CellTemplate.builder(): CellTemplateBuilder<NodeT, ConceptT> =
        CellTemplateBuilder<NodeT, ConceptT>(this, this@CellTemplateBuilder.concept, nodeConverter)

    fun ifEmpty(
        link: ITypedChildLink<*>,
        body: () -> Unit,
    ) = ifEmpty(link.untyped(), body)

    fun ifNotEmpty(
        link: ITypedChildLink<*>,
        body: () -> Unit,
    ) = ifNotEmpty(link.untyped(), body)

    fun ifEmpty(
        link: IChildLink,
        body: () -> Unit,
    ) {
        withUntypedNode { node ->
            if (!node.getChildren(link).iterator().hasNext()) {
                body()
            }
        }
    }

    fun ifNotEmpty(
        link: IChildLink,
        body: () -> Unit,
    ) {
        withUntypedNode { node ->
            if (node.getChildren(link).iterator().hasNext()) {
                body()
            }
        }
    }

    fun withNode(body: WithNodeContext.() -> Unit) {
        withUntypedNode { node ->
            body(WithNodeContext(nodeConverter.fromUntyped(node)))
        }
    }

    fun withUntypedNode(body: (INode) -> Unit) {
        template.withNode += body
    }

    @Deprecated("use .constant or .label")
    fun String.cell(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        constant(this, body)
    }

    @JvmName("string2constant")
    fun String.constant(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        constant(this, body)
    }

    @JvmName("string2label")
    fun String.label(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        constant(this, body)
    }

    fun constant(
        text: String,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        ConstantCellTemplate(template.concept, text)
            .builder()
            .also(body)
            .template
            .also(template::addChild)
    }

    fun untypedConcept() =
        when (concept) {
            is IConcept -> concept
            is ITypedConcept -> concept.untyped()
            else -> throw RuntimeException("Unknown concept type: $concept")
        }

    fun conceptProperty(
        name: String,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        (untypedConcept().getConceptProperty(name) ?: untypedConcept().getShortName()).constant(body)
    }

    fun conceptAlias(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        conceptProperty("alias", body)
    }

    fun label(
        text: String,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        LabelCellTemplate(template.concept, text)
            .builder()
            .also(body)
            .template
            .also(template::addChild)
    }

    fun textColor(color: String) {
        template.properties[CommonCellProperties.textColor] = color
    }

    fun backgroundColor(color: String) {
        template.properties[CommonCellProperties.backgroundColor] = color
    }

    fun vertical(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        // TODO add correct layout information
        CollectionCellTemplate(template.concept)
            .builder()
            .also { it.template.properties[CommonCellProperties.layout] = ECellLayout.VERTICAL }
            .also(
                body
            ).template
            .also(template::addChild)
    }

    fun horizontal(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        // TODO add layout information
        CollectionCellTemplate(template.concept)
            .builder()
            .also(body)
            .template
            .also(template::addChild)
    }

    fun optional(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        OptionalCellTemplate(template.concept)
            .builder()
            .also(body)
            .template
            .also(template::addChild)
    }

    fun brackets(
        singleLine: Boolean = true,
        leftSymbol: String,
        rightSymbol: String,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {
        },
    ) {
        if (singleLine) {
            constant(leftSymbol)
            noSpace()
            body()
            noSpace()
            constant(rightSymbol)
        } else {
            constant(leftSymbol)
            foldable {
                newLine()
                indented {
                    body()
                }
                newLine()
            }
            constant(rightSymbol)
        }
    }

    fun parentheses(
        singleLine: Boolean = true,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        brackets(singleLine, "(", ")", body)
    }

    fun curlyBrackets(
        singleLine: Boolean = false,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        brackets(singleLine, "{", "}", body)
    }

    fun angleBrackets(
        singleLine: Boolean = true,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        brackets(singleLine, "<", ">", body)
    }

    fun largeBrackets(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        // TODO the body should be displayed inline and the bracket symbol should span multiple lines
        curlyBrackets(false, body)
    }

    fun squareBrackets(
        singleLine: Boolean = true,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        brackets(singleLine, "[", "]", body)
    }

    /**
     * The next cell appears on a new line.
     * Multiple consecutive newLine's are merged to a single one. See also emptyLine()
     */
    fun newLine() {
        NewLineCellTemplate(template.concept).builder().template.also(template::addChild)
    }

    /**
     * The next cell appears two lines below the current line.
     */
    fun emptyLine() {
        newLine()
        constant("")
        newLine()
    }

    fun noSpace() {
        NoSpaceCellTemplate(template.concept)
            .builder()
            .template
            .also(template::addChild)
    }

    fun indented(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        horizontal {
            template.properties[CommonCellProperties.indentChildren] = true
            body()
        }
    }

    /**
     * The content is foldable
     */
    fun foldable(
        foldedText: String = "...",
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        // TODO
        horizontal(body)
    }

    /**
     * The current cell is foldable
     */
    fun foldable(foldedText: String = "...") {
        // TODO
    }

    fun IProperty.cell(body: PropertyCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        propertyCell(body)
    }

    fun ITypedProperty<*>.cell(body: PropertyCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        untyped().cell(body)
    }

    fun IProperty.propertyCell(body: PropertyCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        PropertyCellTemplateBuilder(PropertyCellTemplate(template.concept, this), concept, nodeConverter)
            .also(body)
            .template
            .also(template::addChild)
    }

    fun ITypedProperty<Boolean>.flagCell(
        text: String? = null,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        untyped().flagCell(text, body)
    }

    fun IProperty.flagCell(
        text: String? = null,
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        PropertyCellTemplateBuilder(FlagCellTemplate(template.concept, this, text ?: getSimpleName()), concept, nodeConverter)
            .also(body)
            .template
            .also(template::addChild)
    }

    fun ITypedProperty<Boolean>.booleanCell(
        trueText: String = "true",
        falseText: String = "false",
        body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {
        },
    ) {
        // TODO generate code completion entries for the two possible values
        untyped().propertyCell {
            readReplace { if (it == "true") trueText else falseText }
            writeReplace { if (it == trueText) "true" else "false" }
            body()
        }
    }

    private fun <TargetNodeT> IReferenceLink.cell(
        presentation: TargetNodeT.() -> String?,
        body: ReferenceCellTemplateBuilder<NodeT, ConceptT, TargetNodeT>.() -> Unit = {
        },
        targetNodeConverter: INodeConverter<TargetNodeT>,
    ) {
        ReferenceCellTemplateBuilder(
            template =
                ReferenceCellTemplate(
                    concept = template.concept,
                    link = this,
                    presentation = {
                        runCatching {
                            presentation(targetNodeConverter.fromUntyped(this))
                        }.onFailure { LOG.error(it) { "Failed computing presentation for reference target: $this (${this.concept})" } }
                            .getOrNull()
                    },
                ),
            link = this,
            concept = concept,
            sourceNodeConverter = nodeConverter,
            targetNodeConverter = targetNodeConverter,
        ).also(body).template.also(template::addChild)
    }

    fun <TargetNodeT : ITypedNode> ITypedReferenceLink<TargetNodeT>.cell(
        presentation: TargetNodeT.() -> String?,
        body: ReferenceCellTemplateBuilder<NodeT, ConceptT, TargetNodeT>.() -> Unit = {
        },
    ) {
        val targetNodeConverter = INodeConverter.Typed(this.getTypedTargetConcept())
        this.untyped().cell(presentation, body, targetNodeConverter)
    }

    fun IReferenceLink.cell(
        presentation: INode.() -> String?,
        body: ReferenceCellTemplateBuilder<NodeT, ConceptT, INode>.() -> Unit = {},
    ) {
        val targetNodeConverter = INodeConverter.Untyped
        this.cell(presentation, body, targetNodeConverter)
    }

    fun ITypedSingleChildLink<*>.cell(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        untyped().cell(body)
    }

    fun IChildLink.cell(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        require(!this.isMultiple) { "Not allowed on child lists" }
        ChildCellTemplate(template.concept, this)
            .builder()
            .also(body)
            .template
            .also(template::addChild)
    }

    fun ITypedChildListLink<*>.vertical(body: ChildCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        this.untyped().vertical(body)
    }

    fun IChildLink.vertical(body: ChildCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {}) {
        horizontal(separator = null) {
            template.properties[CommonCellProperties.layout] = ECellLayout.VERTICAL
            body()
        }
    }

    fun ITypedChildListLink<*>.horizontal(
        separator: String? = ",",
        body: ChildCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        this.untyped().horizontal(separator, body)
    }

    fun IChildLink.horizontal(
        separator: String? = ",",
        body: ChildCellTemplateBuilder<NodeT, ConceptT>.() -> Unit = {},
    ) {
        ChildCellTemplateBuilder<NodeT, ConceptT>(ChildCellTemplate(template.concept, this), concept, nodeConverter)
            .also { if (separator != null) it.separator { constant(separator) } }
            .also(body)
            .template
            .also(template::addChild)
    }

    fun modelAccess(body: ModelAccessBuilder.() -> Unit) {
        var setter: (String?) -> Unit = {}
        var getter: () -> String? = { "<getter missing>" }
        body(
            object : ModelAccessBuilder {
                override fun get(body: () -> String?) {
                    getter = body
                }

                override fun set(body: (String?) -> Unit) {
                    setter = body
                }
            }
        )
        modelAccess(getter, setter)
    }

    fun modelAccess(
        getter: () -> String?,
        setter: (String?) -> Unit,
    ) {
        // TODO ModelAccessCellTemplate
        ConstantCellTemplate(template.concept, "<model access>").builder().template.also(template::addChild)
    }

    inner class WithNodeContext(
        val node: NodeT,
    )
}

class NotationRootCellTemplateBuilder<NodeT : Any, ConceptT : Any>(
    template: NotationRootCellTemplate,
    concept: ConceptT,
    nodeConverter: INodeConverter<NodeT>,
) : CellTemplateBuilder<NodeT, ConceptT>(template, concept, nodeConverter) {
    fun condition(condition: (INode) -> Boolean) {
        (template as NotationRootCellTemplate).condition = condition
    }

    fun hideInCodeCompletion() = completionText("")

    fun completionText(text: String) {
        template.properties[CommonCellProperties.codeCompletionText] = text
    }
}

class PropertyCellTemplateBuilder<NodeT : Any, ConceptT : Any>(
    template: PropertyCellTemplate,
    concept: ConceptT,
    nodeConverter: INodeConverter<NodeT>,
) : CellTemplateBuilder<NodeT, ConceptT>(template, concept, nodeConverter) {
    fun validateValue(validator: (String) -> Boolean) {
        (template as PropertyCellTemplate).validator = validator
    }

    fun regex(regex: String) {
        regex(Regex(regex))
    }

    fun regex(regex: Regex) {
        (template as PropertyCellTemplate).regex = regex
    }

    fun readReplace(replacement: (String) -> String) {
        // TODO
    }

    fun writeReplace(replacement: (String) -> String) {
        // TODO
    }

    fun placeholderText(placeholderText: String) {
        (template as PropertyCellTemplate).placeholderText = placeholderText
    }
}

class ChildCellTemplateBuilder<NodeT : Any, ConceptT : Any>(
    template: ChildCellTemplate,
    concept: ConceptT,
    nodeConverter: INodeConverter<NodeT>,
) : CellTemplateBuilder<NodeT, ConceptT>(template, concept, nodeConverter) {
    fun separator(body: CellTemplateBuilder<NodeT, ConceptT>.() -> Unit) {
        (template as ChildCellTemplate).setSeparator(
            CollectionCellTemplate(template.concept).also { body(it.builder()) },
        )
    }

    fun newLineConcept(newLineConcept: IConcept) {
        (template as ChildCellTemplate).newLineConcept = newLineConcept
    }
}

class ReferenceCellTemplateBuilder<SourceNodeT : Any, SourceConceptT : Any, TargetNodeT>(
    template: CellTemplate,
    val link: IReferenceLink,
    concept: SourceConceptT,
    sourceNodeConverter: INodeConverter<SourceNodeT>,
    private val targetNodeConverter: INodeConverter<TargetNodeT>,
) : CellTemplateBuilder<SourceNodeT, SourceConceptT>(template, concept, sourceNodeConverter) {
    fun presentation(f: (TargetNodeT) -> String?) {
        TODO("Not implemented yet")
    }

    fun withTargetNode(body: WithTargetNodeContext.() -> Unit) {
        withUntypedNode { node ->
            val targetNode: INode? = node.getReferenceTarget(link)
            if (targetNode != null) {
                body(WithTargetNodeContext(nodeConverter.fromUntyped(node), targetNodeConverter.fromUntyped(targetNode)))
            }
        }
    }

    inner class WithTargetNodeContext(
        val sourceNode: SourceNodeT,
        val targetNode: TargetNodeT,
    )
}

interface INodeConverter<NodeT> {
    fun fromUntyped(node: INode): NodeT

    fun toUntyped(node: NodeT): INode

    class Typed<NodeT : ITypedNode>(
        private val nodeClass: KClass<out NodeT>,
    ) : INodeConverter<NodeT> {
        constructor(concept: IConceptOfTypedNode<NodeT>) : this(concept.getInstanceInterface())

        override fun fromUntyped(node: INode): NodeT = node.typed(nodeClass)

        override fun toUntyped(node: NodeT): INode = node.untyped()
    }

    object Untyped : INodeConverter<INode> {
        override fun fromUntyped(node: INode): INode = node

        override fun toUntyped(node: INode): INode = node
    }
}

interface ITypedOrUntypedNode<NodeT> {
    val node: NodeT
    val untypedNode: INode

    class Typed<NodeT : ITypedNode>(
        override val node: NodeT,
    ) : ITypedOrUntypedNode<NodeT> {
        override val untypedNode: INode
            get() = node.untyped()
    }

    class Untyped(
        override val node: INode,
    ) : ITypedOrUntypedNode<INode> {
        override val untypedNode: INode
            get() = node
    }
}

fun <NodeT : ITypedNode, ConceptT : IConceptOfTypedNode<NodeT>> CellTemplate.builder(
    concept: ConceptT,
): CellTemplateBuilder<NodeT, ConceptT> {
    require(this.concept == concept.untyped())
    return CellTemplateBuilder(this, concept, INodeConverter.Typed<NodeT>(concept))
}

fun <ConceptT : IConcept> CellTemplate.builder(concept: ConceptT): CellTemplateBuilder<INode, ConceptT> {
    require(this.concept == concept)
    return CellTemplateBuilder(this, concept, INodeConverter.Untyped)
}
