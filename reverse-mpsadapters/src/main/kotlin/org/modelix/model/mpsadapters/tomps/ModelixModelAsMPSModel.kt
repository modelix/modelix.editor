package org.modelix.model.mpsadapters.tomps

import jetbrains.mps.smodel.SModelInternal
import org.jetbrains.mps.openapi.model.SModel
import org.jetbrains.mps.openapi.model.SNode
import org.jetbrains.mps.openapi.model.SNodeId
import org.modelix.incremental.DependencyTracking
import org.modelix.model.mpsadapters.MPSRootNodesListDependency
import org.modelix.model.mpsadapters.MPSWritableNode
import java.lang.ref.WeakReference
import java.util.WeakHashMap

/**
 * Returned from [ModelixNodeAsMPSNode.getModel] so that MPS code navigating through the model
 * (e.g. `SModelOperations.roots`) stays in the wrapper world and its model reads are tracked.
 *
 * Without this wrapper, rules that iterate the root nodes and skip the checked node by reference identity
 * (`it != node`) never find the raw node identical to the wrapped node and report false positives,
 * e.g. `check_DuplicateClassifierNames_NonTypesystemRule` reporting a classifier as a duplicate of itself.
 *
 * Also implements [SModelInternal], because MPS casts to it unguarded (e.g. [jetbrains.mps.smodel.ModelImports],
 * which `LanguageScopeExecutor.execWithModelScope` relies on to find the applicable rules).
 */
class ModelixModelAsMPSModel private constructor(
    val model: SModel,
) : SModel by model,
    SModelInternal by (model as SModelInternal) {
    companion object {
        private val instances = WeakHashMap<SModel, WeakReference<ModelixModelAsMPSModel>>()

        /**
         * Instances are cached so that MPS code can compare models by reference identity.
         */
        @JvmStatic
        fun getInstance(model: SModel): SModel {
            if (model is ModelixModelAsMPSModel) return model
            if (model !is SModelInternal) return model
            synchronized(instances) {
                instances[model]?.get()?.let { return it }
                return ModelixModelAsMPSModel(model).also { instances[model] = WeakReference(it) }
            }
        }
    }

    override fun getRootNodes(): Iterable<SNode> {
        DependencyTracking.accessed(MPSRootNodesListDependency(model))
        return model.rootNodes.map { ModelixNodeAsMPSNode.toMPSNode(MPSWritableNode(it)) }
    }

    override fun getNode(id: SNodeId): SNode? = model.getNode(id)?.let { ModelixNodeAsMPSNode.toMPSNode(MPSWritableNode(it)) }

    override fun equals(other: Any?): Boolean = other is ModelixModelAsMPSModel && model == other.model

    override fun hashCode(): Int = model.hashCode()

    override fun toString(): String = model.toString()
}
