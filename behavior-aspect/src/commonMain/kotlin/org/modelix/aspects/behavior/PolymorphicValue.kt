package org.modelix.aspects.behavior

import org.modelix.model.api.IConcept

class PolymorphicValue<ValueT>(val name: String) {
    private var implementations: PolymorphicDispatch<ValueT> = PolymorphicDispatch<ValueT>(emptyMap())

    fun getValue(concept: IConcept): ValueT {
        return implementations.dispatch(concept).let {
            if (it == null) {
                throw NoImplementationException(this, concept)
            } else {
                it.value
            }
        }
    }

    fun addImplementation(concept: IConcept, impl: ValueT) {
        implementations = PolymorphicDispatch(implementations.implementations + (concept.getReference() to impl))
    }
}

class NoImplementationException(val value: PolymorphicValue<*>, val concept: IConcept)
    : Exception("${value.name} has no implementation for concept ${concept.getLongName()}")
