package org.modelix.aspects.behavior

import org.modelix.model.api.IConcept
import org.modelix.model.api.IConceptReference
import org.modelix.model.api.getAllConcepts
import kotlin.jvm.Synchronized

class PolymorphicDispatch<ValueT>(
    val implementations: Map<IConceptReference, ValueT>,
) {
    private val cache: MutableMap<IConceptReference, Value<ValueT>?> = HashMap()

    @Synchronized
    fun dispatch(
        receiverConcept: IConcept,
        default: () -> ValueT,
    ): ValueT {
        val optionalResult =
            cache.getOrPut(receiverConcept.getReference()) {
                findValue(receiverConcept)
            }
        return if (optionalResult == null) default() else optionalResult.value
    }

    private fun findValue(receiverConcept: IConcept): Value<ValueT>? {
        for (superConcept in receiverConcept.getAllConcepts()) {
            if (implementations.containsKey(superConcept.getReference())) {
                return Value(implementations[superConcept.getReference()] as ValueT)
            }
        }
        return null
    }

    private class Value<ValueT>(
        val value: ValueT,
    )
}
