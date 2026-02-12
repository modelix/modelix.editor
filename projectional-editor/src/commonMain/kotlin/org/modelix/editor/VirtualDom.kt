package org.modelix.editor

import kotlinx.html.TagConsumer
import org.modelix.incremental.AtomicLong
import kotlin.reflect.KProperty

interface IVirtualDom {
    val ui: IVirtualDomUI

    interface Node {
        fun getVDom(): IVirtualDom

        val parent: IVirtualDom.Node?
        val childNodes: List<IVirtualDom.Node>

        fun getUserObject(key: String): Any?

        fun putUserObject(
            key: String,
            value: Any?,
        )

        fun insertBefore(
            newNode: IVirtualDom.Node,
            referenceNode: IVirtualDom.Node?,
        ): IVirtualDom.Node

        fun appendChild(child: IVirtualDom.Node): IVirtualDom.Node

        fun replaceChild(
            newChild: IVirtualDom.Node,
            oldChild: IVirtualDom.Node,
        ): IVirtualDom.Node

        fun removeChild(child: IVirtualDom.Node): IVirtualDom.Node

        fun remove()
    }

    interface Element : Node {
        val tagName: String

        fun getAttributeNames(): Array<String>

        fun getAttribute(qualifiedName: String): String?

        fun setAttribute(
            qualifiedName: String,
            value: String,
        )

        fun removeAttribute(qualifiedName: String)

        fun getAttributes(): Map<String, String>

        fun getInnerBounds(): Bounds

        fun getOuterBounds(): Bounds
    }

    interface HTMLElement : Element

    interface Text : Node {
        var textContent: String?
    }

    fun getElementById(id: String): Element?

    fun createElement(localName: String): IVirtualDom.Element

    fun createTextNode(data: String): IVirtualDom.Text

    companion object {
        fun newInstance(): IVirtualDom = newInstance(DummyUI())

        fun newInstance(ui: IVirtualDomUI): IVirtualDom = VirtualDom(ui)
    }
}

fun IVirtualDom.create(): TagConsumer<IVirtualDom.HTMLElement> = IncrementalVirtualDOMBuilder(this, null, GeneratedHtmlMap())

private class DummyUI : IVirtualDomUI {
    override fun getOuterBounds(element: IVirtualDom.Element): Bounds = Bounds.ZERO

    override fun getInnerBounds(element: IVirtualDom.Element): Bounds = Bounds.ZERO

    override fun getElementsAt(
        x: Double,
        y: Double,
    ): List<IVirtualDom.Element> = emptyList()
}

fun IVirtualDom.Node.descendants(includeSelf: Boolean = false): Sequence<IVirtualDom.Node> =
    if (includeSelf) {
        sequenceOf(this) + descendants(false)
    } else {
        childNodes.asSequence().flatMap { it.descendants(true) }
    }

fun IVirtualDom.Element.getClasses(): Set<String> =
    getAttribute("class")?.let {
        it
            .split(' ')
            .asSequence()
            .map { it.trim() }
            .filter { it.isNotEmpty() }
            .toSet()
    } ?: emptySet()

fun IVirtualDom.Element.removeClass(name: String) {
    val classes = getClasses()
    if (!classes.contains(name)) return
    setAttribute("class", (classes - name).joinToString(" "))
}

fun IVirtualDom.Element.addClass(name: String) {
    val classes = getClasses()
    if (classes.contains(name)) return
    setAttribute("class", (classes + name).joinToString(" "))
}

fun IVirtualDom.Element.innerText(): String = (childNodes.single() as IVirtualDom.Text).textContent ?: ""

val IVirtualDom.HTMLElement.style: VirtualDomStyle get() = VirtualDomStyle(this)

object StyleAttributeDelegate {
    operator fun getValue(
        style: VirtualDomStyle,
        property: KProperty<*>,
    ): String? = style[property.name]

    operator fun setValue(
        style: VirtualDomStyle,
        property: KProperty<*>,
        value: String?,
    ) {
        style[property.name] = value
    }
}

object ElementAttributeDelegate {
    operator fun getValue(
        element: IVirtualDom.Element,
        property: KProperty<*>,
    ): String? = element.getAttribute(property.name)

    operator fun setValue(
        element: IVirtualDom.Element,
        property: KProperty<*>,
        value: String?,
    ) {
        if (value == null) {
            element.removeAttribute(property.name)
        } else {
            element.setAttribute(property.name, value)
        }
    }
}

var IVirtualDom.Element.id by ElementAttributeDelegate
var VirtualDomStyle.position by StyleAttributeDelegate
var VirtualDomStyle.left by StyleAttributeDelegate
var VirtualDomStyle.right by StyleAttributeDelegate
var VirtualDomStyle.top by StyleAttributeDelegate
var VirtualDomStyle.width by StyleAttributeDelegate
var VirtualDomStyle.height by StyleAttributeDelegate

class VirtualDomStyle(
    private val element: IVirtualDom.Element,
) {
    fun toMap(): Map<String, String> =
        (element.getAttribute("style") ?: "")
            .split(';')
            .map { it.split(':', limit = 2) }
            .filter { it.size == 2 }
            .associate { it[0].trim() to it[1].trim() }

    operator fun get(name: String): String? = toMap()[name]

    operator fun set(
        name: String,
        value: String?,
    ) = toMap()
        .toMutableMap()
        .also { if (value == null) it.remove(name) else it[name] = value }
        .entries
        .joinToString(";") { "${it.key}:${it.value}" }
        .let { element.setAttribute("style", it) }
}

fun IVirtualDom.HTMLElement.setBounds(bounds: Bounds) {
    with(style) {
        left = "${bounds.x}px"
        top = "${bounds.y}px"
        width = "${bounds.width}px"
        height = "${bounds.height}px"
    }
}

interface IVirtualDomUI {
    fun getOuterBounds(element: IVirtualDom.Element): Bounds

    fun getInnerBounds(element: IVirtualDom.Element): Bounds

    fun getElementsAt(
        x: Double,
        y: Double,
    ): List<IVirtualDom.Element>
}

class VirtualDom(
    override val ui: IVirtualDomUI,
    val idPrefix: String = "",
) : IVirtualDom {
    private val idSequence = AtomicLong()
    private val elementsMap: MutableMap<String, Element> = HashMap()

    override fun getElementById(id: String): IVirtualDom.Element? = elementsMap[id]?.takeIf { it.id == id }

    override fun createElement(localName: String): Element =
        HTMLElement(localName).also {
            it.id = idPrefix + idSequence.incrementAndGet().toString()
        }

    override fun createTextNode(data: String): Text = Text().also { it.textContent = data }

    open inner class Node : IVirtualDom.Node {
        private var wasModified: Boolean = true
        private var wasAnyDescendantModified: Boolean = true
        private val userObjects: MutableMap<String, Any> = HashMap()
        override var parent: Node? = null
        override val childNodes: MutableList<Node> = ArrayList()

        fun resetModificationMarker() {
            if (!wasModified && wasAnyDescendantModified) return
            childNodes.forEach { it.resetModificationMarker() }
            wasAnyDescendantModified = false
            wasModified = false
        }

        fun markModified() {
            wasModified = true
            parent?.markDescendantModified()
        }

        fun markDescendantModified() {
            if (wasAnyDescendantModified) return
            wasAnyDescendantModified = true
            parent?.markDescendantModified()
        }

        fun wasAnyDescendantModified() = wasAnyDescendantModified

        fun wasModified(): Boolean = wasModified

        override fun getVDom(): IVirtualDom = this@VirtualDom

        override fun getUserObject(key: String): Any? = userObjects[key]

        override fun putUserObject(
            key: String,
            value: Any?,
        ) {
            if (value == null) {
                userObjects.remove(key)
            } else {
                userObjects[key] = value
            }
        }

        override fun insertBefore(
            newNode: IVirtualDom.Node,
            referenceNode: IVirtualDom.Node?,
        ): IVirtualDom.Node {
            if (referenceNode == null) return appendChild(newNode)
            val index = childNodes.indexOf(referenceNode)
            require(index >= 0) { "$referenceNode is not a child of $this" }
            addChild(index, newNode)
            return newNode
        }

        override fun appendChild(child: IVirtualDom.Node): IVirtualDom.Node {
            addChild(childNodes.size, child)
            return child
        }

        override fun replaceChild(
            newChild: IVirtualDom.Node,
            oldChild: IVirtualDom.Node,
        ): IVirtualDom.Node {
            val index = childNodes.indexOf(oldChild)
            require(index >= 0) { "$oldChild is not a child of $this" }

            removeChildAt(index)
            addChild(index, newChild)
            return oldChild
        }

        override fun removeChild(child: IVirtualDom.Node): IVirtualDom.Node {
            val index = childNodes.indexOf(child)
            require(index >= 0) { "$child is not a child of $this" }
            removeChildAt(index)
            return child
        }

        fun removeChildAt(index: Int) {
            val child = childNodes.removeAt(index)
            child.parent = null
            markModified()
        }

        fun addChild(
            index: Int,
            child: IVirtualDom.Node,
        ) {
            require(child is Node)
            check(child.parent == null) { "Node is already attached to a parent node" }
            childNodes.add(index, child)
            child.parent = this
            markModified()
            if (child.wasModified() || child.wasAnyDescendantModified()) markDescendantModified()
        }

        override fun remove() {
            parent?.removeChild(this)
        }
    }

    open inner class Element(
        override val tagName: String,
    ) : Node(),
        IVirtualDom.Element {
        private val attributes: MutableMap<String, String> = LinkedHashMap()

        override fun getAttributeNames(): Array<String> = attributes.keys.toTypedArray()

        override fun getAttribute(qualifiedName: String): String? = attributes[qualifiedName]

        override fun setAttribute(
            qualifiedName: String,
            value: String,
        ) {
            if (attributes[qualifiedName] == value) return
            attributes[qualifiedName] = value
            if (qualifiedName == "id") {
                elementsMap[value] = this
            }
            markModified()
        }

        override fun removeAttribute(qualifiedName: String) {
            if (attributes.remove(qualifiedName) != null) {
                markModified()
            }
        }

        override fun getAttributes(): Map<String, String> = attributes

        override fun getInnerBounds(): Bounds = ui.getInnerBounds(this)

        override fun getOuterBounds(): Bounds = ui.getOuterBounds(this)

        override fun toString(): String =
            buildString {
                append("<$tagName>")
                attributes.forEach { attribute ->
                    append(" ")
                    append(attribute.key)
                    append("=\"")
                    append(attribute.value)
                    append("\"")
                }
                append(">")
                childNodes.forEach { child ->
                    append(child)
                }
                append("</$tagName>")
            }
    }

    inner class HTMLElement(
        tagName: String,
    ) : Element(tagName),
        IVirtualDom.HTMLElement

    inner class Text :
        Node(),
        IVirtualDom.Text {
        override var textContent: String? = null
            set(value) {
                if (field == value) return
                field = value
                markModified()
            }

        override fun toString(): String = textContent ?: ""
    }
}
