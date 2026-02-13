package org.modelix.editor

interface IEditorComponentUI {
    /**
     * Relative to the top left corner of the editor
     */
    fun getOuterBounds(element: IVirtualDom.Element): Bounds

    fun getInnerBounds(element: IVirtualDom.Element): Bounds

    fun getElementsAt(
        x: Double,
        y: Double,
    ): List<IVirtualDom.Element>
}
