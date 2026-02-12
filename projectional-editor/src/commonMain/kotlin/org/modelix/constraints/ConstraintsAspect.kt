package org.modelix.constraints

import org.modelix.editor.INonExistingNode
import org.modelix.model.api.IProperty

object ConstraintsAspect {
    val checkers: MutableSet<IConstraintsChecker> = HashSet()

    fun check(node: INonExistingNode) = checkers.flatMap { it.check(node) }

    fun checkPropertyValue(
        node: INonExistingNode,
        property: IProperty,
        value: String,
    ) = checkers.flatMap {
        it.checkPropertyValue(node, property, value)
    }

    fun canCreate(node: INonExistingNode) = check(node).isEmpty()
}

interface IConstraintsChecker {
    fun check(node: INonExistingNode): List<IConstraintViolation>

    fun checkPropertyValue(
        node: INonExistingNode,
        property: IProperty,
        value: String,
    ): List<IConstraintViolation>
}

interface IConstraintViolation
