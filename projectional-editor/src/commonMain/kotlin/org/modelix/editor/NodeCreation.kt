package org.modelix.editor

import org.modelix.model.api.INode

/**
 * How many of the ancestors of this location don't exist yet. A completion creates them together with the node: the
 * wrappers it puts around what was typed, like the `int <name>;` declaration around a typed `int`.
 */
fun INonExistingNode.nonExistingAncestorCount(): Int = ancestors().takeWhile { it.getNode() == null }.count()

/**
 * Where the caret goes after [node] was created for what was typed, together with [createdAncestors] levels of
 * wrappers around it. Without wrappers it stays in [startCell]. With them, typing continues where the wrappers still
 * need input: see [ContinueTypingPolicy].
 */
fun caretPolicyAfterCreating(
    startCell: CellReference,
    node: INode,
    createdAncestors: Int,
): ICaretPositionPolicy {
    if (createdAncestors <= 0) return CaretPositionPolicy(startCell)
    val outermost = generateSequence(node) { it.parent }.elementAtOrNull(createdAncestors) ?: return CaretPositionPolicy(startCell)
    return ContinueTypingPolicy(startCell, NodeCellReference(outermost.reference))
}

/**
 * Adds the children that a new node can't do without and that leave no choice: a mandatory single child whose
 * concept isn't abstract. That is the `{ }` of an `if` or a `while` - without it, the editor shows a placeholder in
 * which the user can't type a statement, only the statement list around it.
 *
 * MPS initializes a new node the same way (`NodeFactoryManager.createNodeStructure`). Abstract concepts are left to
 * the user, who has to choose one anyway.
 */
fun INode.addMissingMandatoryChildren() = addMissingMandatoryChildren(this, HashSet())

private fun addMissingMandatoryChildren(
    node: INode,
    conceptsBeingCreated: MutableSet<String>,
) {
    val concept = node.concept ?: return
    for (link in concept.getAllChildLinks()) {
        if (link.isOptional || link.isMultiple) continue
        val targetConcept = link.targetConcept
        if (targetConcept.isAbstract()) continue
        if (node.getChildren(link).iterator().hasNext()) continue
        // A concept that contains itself through mandatory links can't be completed.
        if (!conceptsBeingCreated.add(targetConcept.getUID())) continue
        try {
            addMissingMandatoryChildren(node.addNewChild(link, -1, targetConcept), conceptsBeingCreated)
        } finally {
            conceptsBeingCreated.remove(targetConcept.getUID())
        }
    }
}
