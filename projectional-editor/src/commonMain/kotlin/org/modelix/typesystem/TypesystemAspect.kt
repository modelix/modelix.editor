package org.modelix.typesystem

import org.modelix.aspects.ILanguageAspect
import org.modelix.aspects.ILanguageAspectFactory
import org.modelix.aspects.LanguageAspectsBuilder
import org.modelix.incremental.IncrementalEngine
import org.modelix.incremental.IncrementalList
import org.modelix.incremental.incrementalFunction
import org.modelix.metamodel.IConceptOfTypedNode
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.model.api.IConcept
import org.modelix.model.api.IConceptReference
import org.modelix.model.api.ILanguage
import org.modelix.model.api.INode
import org.modelix.model.api.getAllConcepts
import org.modelix.model.api.getRoot

class TypesystemAspect : ILanguageAspect {
    private val constraintBuilders: MutableMap<IConceptReference, ITypesystemConstraintsBuilderFactory> = HashMap()

    fun registerConstraintsBuilder(
        concept: IConcept,
        builder: ITypesystemConstraintsBuilderFactory,
    ) {
        TypesystemEngine.registerConstraintsBuilder(concept, builder)
    }

    companion object : ILanguageAspectFactory<TypesystemAspect> {
        override fun createInstance(language: ILanguage): TypesystemAspect = TypesystemAspect()
    }
}

fun <NodeT : ITypedNode, ConceptT : IConceptOfTypedNode<NodeT>> LanguageAspectsBuilder<*>.typesystem(
    concept: ConceptT,
    body: TypesystemConstraintsBuilder<NodeT>.() -> Unit,
) {
    aspects.getAspect(language, TypesystemAspect).registerConstraintsBuilder(
        concept.untyped(),
        object : ITypesystemConstraintsBuilderFactory {
            override fun buildConstraints(node: INode): List<Constraint> {
                val builder = TypesystemConstraintsBuilder<NodeT>(node.typed(concept.getInstanceInterface()))
                body(builder)
                return builder.constraints
            }
        },
    )
}

interface ITypesystemConstraintsBuilderFactory {
    fun buildConstraints(node: INode): List<Constraint>
}

class TypesystemConstraintsBuilder<NodeT : ITypedNode>(
    val node: NodeT,
) {
    val constraints: MutableList<Constraint> = ArrayList()

    fun typeofNode(node: INode): IVariableReference = TypeofNode(node)

    fun typeofNode(node: ITypedNode): IVariableReference = typeofNode(node.untyped())

    fun equalType(
        operand1: IOperand,
        operand2: IOperand,
    ) {
        constraints += EqualType(operand1, operand2)
    }

    fun equalType(
        operand1: IOperand,
        operand2: ITypesystemType,
    ) = equalType(operand1, KnownValue(operand2))

    fun equalType(
        operand1: ITypesystemType,
        operand2: ITypesystemType,
    ) = equalType(KnownValue(operand1), KnownValue(operand2))

    fun equalType(
        operand1: ITypesystemType,
        operand2: IOperand,
    ) = equalType(KnownValue(operand1), operand2)

    infix fun IOperand.equalTo(other: IOperand) = equalType(this, other)

    infix fun IOperand.equalTo(other: ITypesystemType) = equalType(this, KnownValue(other))

    infix fun ITypesystemType.equalTo(other: IOperand) = equalType(KnownValue(this), other)

    infix fun ITypesystemType.equalTo(other: ITypesystemType) = equalType(KnownValue(this), KnownValue(other))

    infix fun IOperand.subtypeOf(superType: IOperand) {
        constraints += Subtype(this, superType)
    }

    infix fun IOperand.subtypeOf(superType: ITypesystemType) = subtypeOf(KnownValue(superType))

    infix fun ITypesystemType.subtypeOf(superType: IOperand) = KnownValue(this).subtypeOf(superType)

    infix fun ITypesystemType.subtypeOf(superType: ITypesystemType) = KnownValue(this).subtypeOf(KnownValue(superType))
}

// TODO make a class and provide IncrementalEngine to constructor
object TypesystemEngine {
    private val incrementalEngine: IncrementalEngine = IncrementalEngine(100_000)
    private val getConstraintsFromSubtree: (INode) -> IncrementalList<Constraint> =
        incrementalEngine.incrementalFunction("getConstraintsFromSubtree") { context, node: INode ->
            return@incrementalFunction doGetConstraintsFromSubtree(node)
        }
    private val getConstraintsFromNode: (INode) -> IncrementalList<Constraint> =
        incrementalEngine.incrementalFunction("getConstraintsFromSubtree") { context, node: INode ->
            return@incrementalFunction doGetConstraintsFromNode(node)
        }
    private val constraintBuilders: MutableMap<IConceptReference, ITypesystemConstraintsBuilderFactory> = HashMap()

    fun registerConstraintsBuilder(
        concept: IConcept,
        builder: ITypesystemConstraintsBuilderFactory,
    ) {
        constraintBuilders[concept.getReference()] = builder
    }

    fun solve(constraints: List<Constraint>): Map<IVariableReference, ITypesystemType> {
        // TODO performance
        val solver = TypesystemSolver()
        solver.solve(constraints)
        val result = HashMap<IVariableReference, ITypesystemType>()
        solver.getTypes().forEach {
            val value = it.value
            if (value != null) result[it.key] = value
        }
        return result
    }

    fun solve(constraintProviderRoots: Sequence<INode>) =
        solve(constraintProviderRoots.flatMap { getConstraintsFromSubtree(it).asSequence() }.toList())

    private fun doGetConstraintsFromSubtree(node: INode): IncrementalList<Constraint> =
        IncrementalList.concat(
            listOf(getConstraintsFromNode(node)) + node.allChildren.map { getConstraintsFromSubtree(it) },
        )

    private fun doGetConstraintsFromNode(node: INode): IncrementalList<Constraint> {
        val concept = node.tryGetConcept() ?: return IncrementalList.empty()
        val constraints =
            concept.getAllConcepts().flatMap { superConcept ->
                constraintBuilders[superConcept.getReference()]?.buildConstraints(node) ?: emptyList()
            }
        return IncrementalList.of(constraints)
    }

    fun computeType(node: INode): ITypesystemType? = solve(sequenceOf(node.getRoot()))[node.asTypeVariable()]
}

fun INode.rawType(): ITypesystemType? = TypesystemEngine.computeType(this)

fun ITypedNode.rawType(): ITypesystemType? = untyped().rawType()

fun INode.type(): INode? = (rawType() as? NodeAsType)?.node

fun ITypedNode.type(): ITypedNode? = untyped().type()?.typed()

class TypesystemSolver {
    private val variables: MutableMap<IVariableReference, Variable> = HashMap()

    fun getTypes(): Map<IVariableReference, ITypesystemType?> = variables.mapValues { it.value.getValue()?.getValue() }

    fun solve(constraints: List<Constraint>) {
        for (constraint in constraints) {
            solveConstraint(constraint)
        }
    }

    private fun solveConstraint(constraint: Constraint) {
        when (constraint) {
            is EqualType -> {
                when (constraint.type1) {
                    is KnownValue -> {
                        when (constraint.type2) {
                            is IVariableReference -> {
                                getVariable(constraint.type2).setValue(ExactValue(constraint.type1.value))
                            }

                            is KnownValue -> {
                                if (constraint.type1.value != constraint.type2.value) {
                                    TODO("Produce error message if they are not equal")
                                }
                            }
                        }
                    }

                    is IVariableReference -> {
                        when (constraint.type2) {
                            is IVariableReference -> {
                                getVariable(constraint.type1).setValue(IndirectValue(getVariable(constraint.type2)))
                            }

                            is KnownValue -> {
                                getVariable(constraint.type1).setValue(ExactValue(constraint.type2.value))
                            }
                        }
                    }
                }
            }

            is Subtype -> {
                // TODO properly handle subtype constraints
                solveConstraint(EqualType(constraint.subtype, constraint.supertype))
            }
        }
    }

    fun getVariable(ref: IVariableReference): Variable = variables.getOrPut(ref) { Variable(ref) }
}

interface ITypesystemType

fun ITypedNode.asType(): ITypesystemType = NodeAsType(this.untyped())

fun INode.asType(): ITypesystemType = NodeAsType(this)

fun ITypedNode.asTypeVariable(): IVariableReference = TypeofNode(this.untyped())

fun INode.asTypeVariable(): IVariableReference = TypeofNode(this)

data class NodeAsType(
    val node: INode,
) : ITypesystemType

class Variable(
    val ref: IVariableReference,
) {
    private var value: VariableValue? = null

    fun getValue(): VariableValue? = value

    fun setValue(newValue: VariableValue) {
        value = value?.combine(newValue) ?: newValue
    }
}

sealed class VariableValue {
    open fun combine(other: VariableValue): VariableValue {
        if (other == this) return this
        throw RuntimeException("Cannot set the value to $other. It is already defined as $this.")
    }

    abstract fun getValue(): ITypesystemType?
}

data class ExactValue(
    private val value: ITypesystemType,
) : VariableValue() {
    override fun getValue(): ITypesystemType = value
}

data class IndirectValue(
    val variable: Variable,
) : VariableValue() {
    fun getDeepestVariable(): Variable = (variable.getValue() as? IndirectValue)?.getDeepestVariable() ?: variable

    override fun getValue(): ITypesystemType? = variable.getValue()?.getValue()

    override fun combine(other: VariableValue): VariableValue {
        if (other is IndirectValue && other.getDeepestVariable() == getDeepestVariable()) {
            return IndirectValue(getDeepestVariable())
        }
        if (other is ExactValue) {
            variable.setValue(other)
            return other
        }
        return super.combine(other)
    }
}

sealed interface IOperand

interface IVariableReference : IOperand

data class TypeofNode(
    val node: INode,
) : IVariableReference

data class NamedVariable(
    val name: String,
) : IVariableReference

class UnnamedVariable : IVariableReference

data class KnownValue(
    val value: ITypesystemType,
) : IOperand

sealed class Constraint {
    abstract fun getVariables(): Sequence<IVariableReference>
}

class EqualType(
    val type1: IOperand,
    val type2: IOperand,
) : Constraint() {
    override fun getVariables(): Sequence<IVariableReference> = sequenceOf(type1, type2).filterIsInstance<IVariableReference>()
}

class Subtype(
    val subtype: IOperand,
    val supertype: IOperand,
) : Constraint() {
    override fun getVariables(): Sequence<IVariableReference> = sequenceOf(subtype, supertype).filterIsInstance<IVariableReference>()
}
