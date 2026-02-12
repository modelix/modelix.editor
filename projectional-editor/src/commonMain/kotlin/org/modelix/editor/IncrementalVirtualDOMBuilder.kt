package org.modelix.editor

import kotlinx.html.Entities
import kotlinx.html.Tag
import kotlinx.html.Unsafe
import kotlinx.html.org.w3c.dom.events.Event
import org.modelix.incremental.AtomicLong

class IncrementalVirtualDOMBuilder(
    val document: IVirtualDom,
    existingRootElement: IVirtualDom.HTMLElement?,
    val generatedHtmlMap: GeneratedHtmlMap,
) : IIncrementalTagConsumer<IVirtualDom.HTMLElement> {
    private inner class StackFrame {
        var forcedReuseNext: IVirtualDom.HTMLElement? = null
        var reusableChildren: ReusableChildren? = null
        var resultingHtml: IVirtualDom.HTMLElement? = null
        var tag: Tag? = null
        val generatedChildren: MutableList<NodeOrProducer> = ArrayList()

        fun close() {
            if (resultingHtml != null) applyAttributes()
            applyChildren()
        }

        fun applyAttributes() {
            val attributesToRemove = resultingHtml!!.getAttributeNames().toMutableSet()
            tag!!.attributesEntries.forEach {
                if (resultingHtml!!.getAttribute(it.key) != it.value) {
                    resultingHtml!!.setAttribute(it.key, it.value)
                }
                attributesToRemove.remove(it.key)
            }
            attributesToRemove.remove("id")
            attributesToRemove.forEach { resultingHtml!!.removeAttribute(it) }
        }

        fun applyChildren() {
            val parent: IVirtualDom.HTMLElement? = resultingHtml
            reusableChildren?.processStillUsed(generatedChildren.mapNotNull { it.producer })
            val generatedNodes =
                ArrayList(generatedChildren).map {
                    it.node ?: runProducer(it.producer!!)
                }

            if (parent != null) {
                parent.childNodes.minus(generatedNodes.toSet()).forEach { parent.removeChild(it) }
                generatedNodes.forEachIndexed { index, expectedChild ->
                    if (index < parent.childNodes.size) {
                        val actualChild = parent.childNodes.get(index)
                        if (actualChild != expectedChild) {
                            expectedChild.parent?.removeChild(expectedChild)
                            parent.insertBefore(expectedChild, actualChild)
                        }
                    } else {
                        expectedChild.parent?.removeChild(expectedChild)
                        parent.appendChild(expectedChild)
                    }
                }
            }
        }
    }

    private var lastClosed: StackFrame? = null
    private val stack = arrayListOf(StackFrame().also { it.reusableChildren = ReusableChildren(listOfNotNull(existingRootElement)) })
    private val childHandler: (IProducesHtml) -> Unit = { produce(it) }

    override fun produce(producer: IProducesHtml): () -> IVirtualDom.HTMLElement {
        stack.last().generatedChildren.add(NodeOrProducer.producer(producer))
        if (stack.size == 1) {
            stack.last().close()
            stack.clear()
            stack.add(StackFrame())
        }
        return { generatedHtmlMap.getOutput(producer) ?: throw IllegalStateException("No HTML generated yet") }
    }

    private fun runProducer(producer: IProducesHtml): IVirtualDom.HTMLElement {
        var childHtml = generatedHtmlMap.getOutput(producer)
        if (childHtml == null || !producer.isHtmlOutputValid()) {
            generatedHtmlMap.unassign(producer)
            stack.lastOrNull()?.forcedReuseNext = childHtml
            producer.produceHtml(this@IncrementalVirtualDOMBuilder)
            childHtml = finalize()
            generatedHtmlMap.reassign(producer, childHtml)
        }
        return childHtml
    }

    override fun onTagStart(tag: Tag) {
        val parentFrame = stack.last()
        val frame = StackFrame()
        stack.add(frame)
        frame.tag = tag

        val reusable: IVirtualDom.HTMLElement? =
            parentFrame.forcedReuseNext
                ?.takeIf { it.tagName.lowercase() == tag.tagName.lowercase() }
                ?: parentFrame.reusableChildren?.findReusable(tag)
        parentFrame.forcedReuseNext = null
        if (reusable != null) {
            frame.reusableChildren = ReusableChildren(reusable)
        }

        val element: IVirtualDom.HTMLElement =
            reusable ?: when {
                tag.namespace != null -> TODO("namespaces not supported yet")
                else -> document.createElement(tag.tagName) as IVirtualDom.HTMLElement
            }

        frame.resultingHtml = element
        parentFrame.generatedChildren.add(NodeOrProducer.node(element))
    }

    override fun onTagAttributeChange(
        tag: Tag,
        attribute: String,
        value: String?,
    ) {
        // handled in StackFrame.applyAttributes
    }

    override fun onTagEvent(
        tag: Tag,
        event: String,
        value: (Event) -> Unit,
    ): Unit = throw UnsupportedOperationException("Use DelayedConsumer")

    override fun onTagEnd(tag: Tag) {
        val frame = stack.last()
        frame.close()
        lastClosed = frame
        if (stack.last() !== frame) throw RuntimeException("$frame !== ${stack.last()}")
        stack.remove(frame)
    }

    override fun onTagContent(content: CharSequence) {
        val frame = stack.lastOrNull() ?: throw IllegalStateException("No current DOM node")
        val reusable: IVirtualDom.Text? = frame.reusableChildren?.findReusableTextNode(content.toString())

        val element = reusable ?: document.createTextNode(content.toString())
        frame.generatedChildren.add(NodeOrProducer.node(element))
    }

    override fun onTagContentEntity(entity: Entities): Unit = throw UnsupportedOperationException()

    override fun onTagContentUnsafe(block: Unsafe.() -> Unit): Unit = throw UnsupportedOperationException()

    override fun onTagComment(content: CharSequence): Unit = throw UnsupportedOperationException()

    override fun finalize(): IVirtualDom.HTMLElement = lastClosed!!.resultingHtml!!

    private inner class ReusableChildren {
        val reusableChildren: MutableList<IVirtualDom.Node>
        constructor(children: Iterable<IVirtualDom.Node>) {
            reusableChildren = children.toMutableList()
        }
        constructor(parent: IVirtualDom.HTMLElement) {
            reusableChildren =
                parent.childNodes
                    // .filter { it.generatedBy == null }
                    .toMutableList()
        }

        fun processStillUsed(childProducers: List<IProducesHtml>) {
            val stillUsedElements: HashSet<IVirtualDom.HTMLElement> =
                childProducers
                    .mapNotNull {
                        generatedHtmlMap.getOutput(
                            it
                        )
                    }.toHashSet()
            reusableChildren.removeAll(stillUsedElements)
            reusableChildren.filterIsInstance<IVirtualDom.HTMLElement>().forEach { generatedHtmlMap.unassign(it) }
        }

        fun findReusable(tag: Tag): IVirtualDom.HTMLElement? {
            // TODO only reuse those where the element in .generatedBy was removed/replaced (this is only known after generating all children)
            val foundIndex =
                reusableChildren.indexOfFirst {
                    it is IVirtualDom.HTMLElement && generatedHtmlMap.getProducer(it) == null &&
                        it.tagName.lowercase() == tag.tagName.lowercase()
                }
            return if (foundIndex >= 0) {
                reusableChildren.removeAt(foundIndex) as IVirtualDom.HTMLElement
            } else {
                null
            }
        }

        fun findReusableTextNode(text: String): IVirtualDom.Text? {
            val foundIndex = reusableChildren.indexOfFirst { it is IVirtualDom.Text && it.textContent == text }
            return if (foundIndex >= 0) {
                reusableChildren.removeAt(foundIndex) as IVirtualDom.Text
            } else {
                null
            }
        }
    }

    private class NodeOrProducer(
        val producer: IProducesHtml?,
        val node: IVirtualDom.Node?,
    ) {
        companion object {
            fun producer(producer: IProducesHtml) = NodeOrProducer(producer, null)

            fun node(node: IVirtualDom.Node) = NodeOrProducer(null, node)
        }
    }
}

class GeneratedHtmlMap {
    private val producer2element: MutableMap<IProducesHtml, IVirtualDom.HTMLElement> = HashMap()
    private val element2producer: MutableMap<IVirtualDom.HTMLElement, IProducesHtml> = HashMap()
    private val producerIds: MutableMap<IProducesHtml, Long> = HashMap()
    private val idSequence = AtomicLong()

    fun getProducerId(producer: IProducesHtml): Long = producerIds.getOrPut(producer) { idSequence.incrementAndGet() }

    private var IProducesHtml.generatedHtml: IVirtualDom.HTMLElement?
        get() = producer2element[this]
        set(value) {
            if (value == null) producer2element.remove(this) else producer2element[this] = value
        }

    private var IVirtualDom.HTMLElement.generatedBy: IProducesHtml?
        get() = element2producer[this]
        set(value) {
            if (value == null) element2producer.remove(this) else element2producer[this] = value
        }

    fun reassign(
        producer: IProducesHtml,
        output: IVirtualDom.HTMLElement,
    ) {
        unassign(producer)
        unassign(output)
        assign(producer, output)
    }

    fun assign(
        producer: IProducesHtml,
        output: IVirtualDom.HTMLElement,
    ) {
        require(producer.generatedHtml == null)
        require(output.generatedBy == null)
        producer.generatedHtml = output
        output.generatedBy = producer
    }

    fun unassign(producer: IProducesHtml) = producer.generatedHtml?.let { unassign(producer, it) }

    fun unassign(output: IVirtualDom.HTMLElement) = output.generatedBy?.let { unassign(it, output) }

    fun getProducer(output: IVirtualDom.HTMLElement) = output.generatedBy

    fun getOutput(producer: IProducesHtml) = producer.generatedHtml

    private fun unassign(
        producer: IProducesHtml,
        output: IVirtualDom.HTMLElement,
    ) {
        require(producer.generatedHtml == output)
        require(output.generatedBy == producer)
        producer.generatedHtml = null
        output.generatedBy = null
    }
}
