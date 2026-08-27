package org.modelix.editor.ssr.mps

import gnu.trove.THashMap
import org.jetbrains.mps.openapi.model.SModel
import org.modelix.model.mpsadapters.tomps.ModelixModelAsMPSModel

/**
 * MPS keys Trove maps by `SNode.getModel()` (e.g. `IncrementalTypechecking.MyModelListenerManager.myNodesCount`).
 * Such a map holds the wrapper for the nodes of the edited root and the raw MPS model for everything the type
 * system navigates to, so the wrapper's equality has to behave like any other object's.
 */
@Suppress("ktlint:standard:function-naming")
class ModelixModelAsMPSModelTest : TestBase("SimpleProject") {
    private lateinit var model: SModel

    override fun setUp() {
        super.setUp()
        readAction {
            model =
                mpsProject.projectModules
                    .first { it.moduleName == "Solution1" }
                    .models
                    .first()
        }
    }

    private fun wrapper() = ModelixModelAsMPSModel.getInstance(model)

    fun `test the wrapper is canonical`() {
        assertTrue("Not a wrapper: " + wrapper(), wrapper() is ModelixModelAsMPSModel)
        assertSame(wrapper(), wrapper())
        assertSame(wrapper(), ModelixModelAsMPSModel.getInstance(wrapper()))
    }

    fun `test equality with the wrapped model is symmetric`() {
        val wrapper = wrapper()
        assertNotSame(model, wrapper)
        // MPS models compare by identity, so the wrapper must not claim to be equal to one.
        assertEquals("Asymmetric equals", model == wrapper, wrapper == model)
        assertFalse(wrapper == model)
    }

    /**
     * What the asymmetry actually broke: the map accepts both keys, because the raw model doesn't equal the
     * wrapper, and then finds them equal while rehashing, because the wrapper did equal the raw model.
     */
    fun `test a trove map holding the model and its wrapper survives a rehash`() {
        val map = THashMap<Any, Int>()
        map.put(model, 1)
        map.put(wrapper(), 2)
        assertEquals(2, map.size)
        // Enough entries to force several rehashes, which re-insert the two keys above.
        repeat(100) { map.put(Any(), it) }
        assertEquals(102, map.size)
    }
}
