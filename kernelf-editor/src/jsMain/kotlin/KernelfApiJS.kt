import kotlinx.atomicfu.atomic
import kotlinx.browser.document
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.html.dom.createTree
import org.modelix.editor.EditorState
import org.modelix.editor.GeneratedHtmlMap
import org.modelix.editor.IVirtualDom
import org.modelix.editor.IncrementalVirtualDOMBuilder
import org.modelix.editor.JSDom
import org.modelix.editor.JsEditorComponent
import org.modelix.editor.kernelf.KernelfAPI
import org.modelix.editor.unwrap
import org.modelix.metamodel.typed
import org.modelix.model.ModelFacade
import org.modelix.model.api.*
import org.modelix.model.area.IAreaChangeList
import org.modelix.model.area.IAreaListener
import org.w3c.dom.HTMLElement
import org.w3c.dom.Node

@JsExport
object KernelfApiJS {
    private val LOG = mu.KotlinLogging.logger {}
    private val generatedHtmlMap = GeneratedHtmlMap()

    fun connectToModelServer(json: Array<String>, callback: (INode) -> Unit) {
        KernelfAPI.connectToModelServer(
            initialJsonData = json,
            callback = callback,
            errorCallback = { LOG.error(it) { "Failed to connect to model server" } }
        )
    }
    fun loadModelsFromJson(json: Array<String>): INode = KernelfAPI.loadModelsFromJson(json)
    fun getModules(rootNode: INode): Array<INode> = KernelfAPI.getModules(rootNode)
    fun nodeToString(node: Any): String = KernelfAPI.nodeToString(JSNodeConverter.toINode(node))

    fun getNodeConverter() = JSNodeConverter

    private fun renderNodeAsDom(editorState: EditorState, rootNode: INode): HTMLElement {
        val tagConsumer = document.createTree()
        KernelfAPI.renderNode(editorState, rootNode, tagConsumer)
        return tagConsumer.finalize()
    }

    fun updateNodeAsDom(editorState: EditorState, rootNode: INode, parentElement: HTMLElement) {
        val existing = parentElement.firstElementChild as? HTMLElement
        val virtualDom = JSDom(parentElement.ownerDocument!!)
        val consumer = IncrementalVirtualDOMBuilder(virtualDom, existing?.let { virtualDom.wrap(it) }, generatedHtmlMap)
        KernelfAPI.renderNode(editorState, rootNode, consumer)
        val newHtml = consumer.finalize()
        if (newHtml != existing) {
            if (existing != null) parentElement.removeChild(existing)
            parentElement.appendChild(newHtml.unwrap())
        }
    }

    fun renderAndUpdateNodeAsDom(rootNode: INode): HTMLElement {
        val editor = JsEditorComponent(KernelfAPI.editorEngine, rootNode.getArea()) { state ->
            KernelfAPI.editorEngine.createCell(state, rootNode)
        }
        val branch = ModelFacade.getBranch(rootNode)?.deepUnwrap()
        if (branch != null) {
            branch.addListener(object : IBranchListener {
                private var updateScheduled = atomic(false)
                private val coroutinesScope = CoroutineScope(Dispatchers.Main)
                override fun treeChanged(oldTree: ITree?, newTree: ITree) {
                    if (editor.containerElement.unwrap().isInDocument()) {
                        if (!updateScheduled.getAndSet(true)) {
                            coroutinesScope.launch {
                                updateScheduled.getAndSet(false)
                                editor.update()
                            }
                        }
                    } else {
                        coroutinesScope.cancel("Editor removed from document")
                        branch.removeListener(this)
                        editor.dispose()
                    }
                }
            })
        } else {
            val area = rootNode.getArea()
            area.addListener(object : IAreaListener {
                private var updateScheduled = atomic(false)
                private val coroutinesScope = CoroutineScope(Dispatchers.Main)
                override fun areaChanged(changes: IAreaChangeList) {
                    if (editor.containerElement.unwrap().isInDocument()) {
                        if (!updateScheduled.getAndSet(true)) {
                            coroutinesScope.launch {
                                updateScheduled.getAndSet(false)
                                editor.update()
                            }
                        }
                    } else {
                        coroutinesScope.cancel("Editor removed from document")
                        area.removeListener(this)
                        editor.dispose()
                    }
                }

            })
        }
        editor.updateHtml()
        return editor.containerElement.unwrap()
    }
}

private fun Node.isInDocument(): Boolean = if (this === document) true else parentNode?.isInDocument() ?: false