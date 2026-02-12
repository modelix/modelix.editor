package org.modelix.aspects.behavior

import org.modelix.metamodel.IConceptOfTypedNode
import org.modelix.metamodel.ITypedConcept
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.untypedConcept
import kotlin.reflect.KProperty

fun buildPolymorphicFunction() = PolymorphicFunctionBuilder()

class PolymorphicFunctionBuilder {
    fun <ReturnT> returns(): WithReturnType<ReturnT> = WithReturnType()

    inner class WithReturnType<ReturnT> {
        fun <ConceptT : ITypedConcept> forConcept(): ForConcept<ConceptT> = ForConcept()

        fun <NodeT : ITypedNode, ConceptT : IConceptOfTypedNode<NodeT>> forNode(concept: ConceptT): ForNode<NodeT, ConceptT> = ForNode()

        abstract inner class ForNodeOrConcept<ParameterT> {
            protected var defaultValue: ((ParameterT) -> ReturnT)? = null

            open fun defaultValue(body: (ParameterT) -> ReturnT): ForNodeOrConcept<ParameterT> {
                defaultValue = body
                return this
            }
        }

        inner class ForConcept<ConceptT : ITypedConcept> : ForNodeOrConcept<ConceptT>() {
            fun build(name: String = "") = PolymorphicFunction(name)

            fun delegate() = SingleInstanceDelegate { PolymorphicFunction(it) }

            override fun defaultValue(body: (ConceptT) -> ReturnT): ForConcept<ConceptT> {
                super.defaultValue(body)
                return this
            }

            inner class PolymorphicFunction(
                name: String,
            ) {
                private var polymorphicValue: PolymorphicValue<(ConceptT) -> ReturnT> = PolymorphicValue(name)

                operator fun invoke(concept: ConceptT): ReturnT {
                    val d = defaultValue
                    return if (d == null) {
                        polymorphicValue.getValue(concept.untyped())(concept)
                    } else {
                        polymorphicValue.getValue(concept.untyped()) { { d(concept) } }(concept)
                    }
                }

                fun <SubConceptT : ConceptT> implement(
                    concept: SubConceptT,
                    body: (SubConceptT) -> ReturnT,
                ) {
                    polymorphicValue.addImplementation(concept.untyped()) { concept -> body(concept as SubConceptT) }
                }
            }
        }

        inner class ForNode<NodeT : ITypedNode, ConceptT : IConceptOfTypedNode<NodeT>> : ForNodeOrConcept<NodeT>() {
            fun build(name: String = "") = PolymorphicFunction(name)

            fun delegate() = SingleInstanceDelegate { PolymorphicFunction(it) }

            override fun defaultValue(body: (NodeT) -> ReturnT): ForNode<NodeT, ConceptT> {
                super.defaultValue(body)
                return this
            }

            inner class PolymorphicFunction(
                name: String,
            ) {
                private var polymorphicValue: PolymorphicValue<(NodeT) -> ReturnT> = PolymorphicValue(name)

                operator fun invoke(node: NodeT): ReturnT {
                    val d = defaultValue
                    return if (d == null) {
                        polymorphicValue.getValue(node.untypedConcept())(node)
                    } else {
                        polymorphicValue.getValue(node.untypedConcept()) { { d(node) } }(node)
                    }
                }

                fun <SubNodeT : NodeT, SubConceptT : IConceptOfTypedNode<SubNodeT>> implement(
                    concept: SubConceptT,
                    body: (SubNodeT) -> ReturnT,
                ) {
                    polymorphicValue.addImplementation(concept.untyped()) { node -> body(node as SubNodeT) }
                }
            }
        }
    }
}

class SingleInstanceDelegate<E>(
    val initializer: (String) -> E,
) {
    private lateinit var name: String
    private val instance by lazy { initializer(name) }

    operator fun getValue(
        nothing: Nothing?,
        property: KProperty<*>,
    ): E {
        name = property.name
        return instance
    }
}
