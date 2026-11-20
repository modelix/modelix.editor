package org.modelix.editor.ssr.mps

import jetbrains.mps.errors.QuickFix_Runtime
import jetbrains.mps.errors.item.NodeReportItem
import jetbrains.mps.errors.item.QuickFixReportItem
import jetbrains.mps.errors.item.QuickFixRuntimeAdapter
import org.modelix.model.api.IWritableNode
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import java.lang.reflect.Field

/**
 * The model checker checks wrappers of the nodes ([ModelixNodeAsMPSNode]), which track what a check reads, so the quick
 * fixes it reports hold these wrappers in their arguments. A quick fix that puts such an argument into the model, like
 * `AddCast` does with the expression it casts, would put a wrapper into the MPS model. The arguments are replaced by the
 * MPS nodes they wrap before a quick fix is offered.
 *
 * The node a quick fix is executed on is a reference, which already resolves to the MPS node.
 */
internal object QuickFixArguments {
    /**
     * [QuickFix_Runtime] has no API to list its arguments. Its subclasses read them by name from this map.
     */
    private val argumentsField: Field? =
        runCatching { QuickFix_Runtime::class.java.getDeclaredField("myMap").also { it.isAccessible = true } }.getOrNull()

    /**
     * Has to run in a read action, and is a no-op for arguments that are no wrappers, so it can run again.
     */
    fun unwrap(item: NodeReportItem) {
        val field = argumentsField ?: return
        for (quickFix in QuickFixReportItem.FLAVOUR_EDITOR_QUICKFIX.getCollection(item)) {
            // The runtime is created once per quick fix provider of the item and then reused.
            val runtime = (quickFix as? QuickFixRuntimeAdapter)?.fixRuntime ?: continue

            @Suppress("UNCHECKED_CAST")
            val arguments = field.get(runtime) as? Map<String, Array<Any?>> ?: continue
            for (values in arguments.values) {
                for (i in values.indices) {
                    values[i] = unwrap(values[i])
                }
            }
        }
    }

    private fun unwrap(value: Any?): Any? =
        when (value) {
            is ModelixNodeAsMPSNode -> (value.node as? IWritableNode).toMPS() ?: value
            is List<*> -> if (value.any { it is ModelixNodeAsMPSNode }) value.map { unwrap(it) } else value
            else -> value
        }
}
