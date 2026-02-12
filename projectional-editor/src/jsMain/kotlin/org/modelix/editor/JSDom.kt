package org.modelix.editor

import kotlinx.browser.document
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.HTMLElement
import org.w3c.dom.Node
import org.w3c.dom.Text
import org.w3c.dom.asList
import org.w3c.dom.get

class JSDom(
    private val doc: Document = document,
) : IVirtualDom,
    IVirtualDomUI {
    var originElement: Element? = null

    private fun getOrigin() = originElement?.getAbsoluteBounds() ?: Bounds.ZERO

    override val ui: IVirtualDomUI
        get() = this

    override fun getOuterBounds(element: IVirtualDom.Element): Bounds = element.unwrap().getAbsoluteBounds().relativeTo(getOrigin())

    override fun getInnerBounds(element: IVirtualDom.Element): Bounds = element.unwrap().getAbsoluteInnerBounds().relativeTo(getOrigin())

    override fun getElementsAt(
        x: Double,
        y: Double,
    ): List<IVirtualDom.Element> = doc.elementsFromPoint(x, y).map { it.wrap() }

    override fun getElementById(id: String): IVirtualDom.Element? = doc.getElementById(id)?.wrap()

    override fun createElement(localName: String): IVirtualDom.Element = doc.createElement(localName).wrap()

    override fun createTextNode(data: String): IVirtualDom.Text = doc.createTextNode(data).wrap()

    fun wrap(node: HTMLElement) = wrapNode(node) as IVirtualDom.HTMLElement

    fun wrap(node: Element) = wrapNode(node) as IVirtualDom.Element

    fun wrap(node: Text) = wrapNode(node) as IVirtualDom.Text

    fun wrap(node: Node) = wrapNode(node)

    fun Node.wrap() = wrap(this)

    fun Element.wrap() = wrap(this)

    fun HTMLElement.wrap() = wrap(this)

    fun Text.wrap() = wrap(this)

    private fun wrapNode(node: Node): IVirtualDom.Node =
        when (node) {
            is HTMLElement -> HTMLElementWrapper(node)
            is Element -> ElementWrapper(node)
            is Text -> TextNodeWrapper(node)
            else -> NodeWrapper(node)
        }

    open inner class NodeWrapper(
        private val node: Node,
    ) : IVirtualDom.Node {
        open fun getWrappedNode(): Node = node

        override fun getVDom(): IVirtualDom = this@JSDom

        override fun equals(other: Any?): Boolean {
            if (other == null) return false
            if (other !is NodeWrapper) return false
            if (other.node !== node) return false
            return true
        }

        override fun hashCode(): Int = node.hashCode()

        override val parent: IVirtualDom.Node?
            get() = node.parentNode?.wrap()
        override val childNodes: List<IVirtualDom.Node>
            get() = node.childNodes.asList().map { it.wrap() }

        override fun getUserObject(key: String): Any? = node.asDynamic()["key"]

        override fun putUserObject(
            key: String,
            value: Any?,
        ) {
            node.asDynamic()["key"] = value
        }

        override fun insertBefore(
            newNode: IVirtualDom.Node,
            referenceNode: IVirtualDom.Node?,
        ): IVirtualDom.Node = node.insertBefore(newNode.unwrap(), referenceNode?.unwrap()).wrap()

        override fun appendChild(child: IVirtualDom.Node): IVirtualDom.Node = node.appendChild(child.unwrap()).wrap()

        override fun replaceChild(
            newChild: IVirtualDom.Node,
            oldChild: IVirtualDom.Node,
        ): IVirtualDom.Node = node.replaceChild(newChild.unwrap(), oldChild.unwrap()).wrap()

        override fun removeChild(child: IVirtualDom.Node): IVirtualDom.Node = node.removeChild(child.unwrap()).wrap()

        override fun remove() {
            node.parentNode?.removeChild(node)
        }
    }

    open inner class TextNodeWrapper(
        node: Text,
    ) : NodeWrapper(node),
        IVirtualDom.Text {
        override fun getWrappedNode() = super.getWrappedNode() as Text

        override var textContent: String?
            get() = getWrappedNode().textContent
            set(value) {
                getWrappedNode().textContent = value
            }
    }

    open inner class ElementWrapper(
        node: Element,
    ) : NodeWrapper(node),
        IVirtualDom.Element {
        override fun getWrappedNode() = super.getWrappedNode() as Element

        override val tagName: String
            get() = getWrappedNode().nodeName

        override fun getAttributeNames(): Array<String> = getWrappedNode().getAttributeNames()

        override fun getAttribute(qualifiedName: String): String? = getWrappedNode().getAttribute(qualifiedName)

        override fun setAttribute(
            qualifiedName: String,
            value: String,
        ) = getWrappedNode().setAttribute(qualifiedName, value)

        override fun removeAttribute(qualifiedName: String) = getWrappedNode().removeAttribute(qualifiedName)

        override fun getAttributes(): Map<String, String> {
            val attributes = getWrappedNode().attributes
            return (0 until attributes.length)
                .mapNotNull { i -> attributes[i] }
                .associate { it.name to it.value }
        }

        override fun getInnerBounds(): Bounds = getWrappedNode().getAbsoluteInnerBounds().relativeTo(getOrigin())

        override fun getOuterBounds(): Bounds = getWrappedNode().getAbsoluteBounds().relativeTo(getOrigin())
    }

    inner class HTMLElementWrapper(
        node: HTMLElement,
    ) : ElementWrapper(node),
        IVirtualDom.HTMLElement {
        override fun getWrappedNode() = super.getWrappedNode() as HTMLElement
    }
}

fun IVirtualDom.HTMLElement.unwrap(): HTMLElement = (this as JSDom.HTMLElementWrapper).getWrappedNode()

fun IVirtualDom.Element.unwrap(): Element = (this as JSDom.ElementWrapper).getWrappedNode()

fun IVirtualDom.Node.unwrap(): Node = (this as JSDom.NodeWrapper).getWrappedNode()
