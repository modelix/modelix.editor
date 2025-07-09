package org.modelix.editor.kernelf

import jetbrains.mps.lang.core.N_INamedConcept
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.html.TagConsumer
import kotlinx.html.consumers.DelayedConsumer
import kotlinx.html.stream.HTMLStreamBuilder
import org.iets3.core.expr.tests.N_TestSuite
import org.modelix.editor.EditorEngine
import org.modelix.editor.EditorState
import org.modelix.editor.toHtml
import org.modelix.kernelf.KernelfLanguages
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.TypedLanguagesRegistry
import org.modelix.metamodel.typed
import org.modelix.metamodel.untypedConcept
import org.modelix.model.ModelFacade
import org.modelix.model.api.INode
import org.modelix.model.client2.ModelClientV2
import org.modelix.model.client2.ReplicatedModel
import org.modelix.model.client2.getReplicatedModel
import org.modelix.model.data.ModelData
import org.modelix.model.lazy.RepositoryId
import org.modelix.model.mutable.ModelixIdGenerator
import org.modelix.model.repositoryconcepts.N_Module
import org.modelix.model.withIncrementalComputationSupport

object KernelfAPI {
    private val LOG = io.github.oshai.kotlinlogging.KotlinLogging.logger { }
    val editorEngine = EditorEngine()

    init {
        KernelfLanguages.languages.forEach { it.register() }
        KernelfEditor.register(editorEngine)
    }

    fun renderJsonAsHtmlText(json: String): String {
        return renderModelAsHtmlText(ModelData.fromJson(json))
    }

    fun loadModelFromJson(json: String): INode = loadModelsFromJson(arrayOf(json))

    fun loadModelsFromJson(json: Array<String>): INode {
        // val branch = IncrementalBranch(PBranch(ModelFacade.newLocalTree(), IdGenerator.getInstance(0xabcdef)))
        val branch = ModelFacade.toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false)).withIncrementalComputationSupport()
        // TODO call IncrementalBranch.dispose

        json.forEach { ModelData.fromJson(it).load(branch) }
        val rootNode = ModelFacade.getRootNode(branch)
        return rootNode
    }

    fun connectToModelServer(url: String? = null, initialJsonData: Array<String> = emptyArray(), callback: (INode) -> Unit, errorCallback: (Exception) -> Unit = {}) {
        GlobalScope.launch {
            try {
                if (url != null && (url.endsWith("/v2") || url.endsWith("/v2/"))) {
                    val repositoryId = RepositoryId("kernelf-demo")
                    val client = ModelClientV2.builder().url(url).build()
                    client.init()
                    val existingRepositories = client.listRepositories()
                    val repositoryExisted = existingRepositories.contains(repositoryId)
                    if (!repositoryExisted) {
                        client.initRepository(repositoryId)
                    }
                    val model: ReplicatedModel = client.getReplicatedModel(repositoryId.getBranchReference(), { ModelixIdGenerator(client.getIdGenerator(), it) })
                    model.start()
                    TODO("Migration of IncrementalBranch to IMutableModelTree is needed")
//                    val branch = model.getVersionedModelTree().withIncrementalComputationSupport()
//                    if (!repositoryExisted) {
//                        initialJsonData.forEach { ModelData.fromJson(it).load(branch) }
//                    }
//                    val rootNode = branch.withAutoTransactions().getRootNode()
//                    LOG.debug { "Connected to model server" }
//                    callback(rootNode)
                } else {
                    error("Unsupported URL: $url")
//                    val builder = LightModelClient.builder().port(48305)
//                    if (url != null) {
//                        builder.url(url)
//                    }
//                    val client = builder.autoTransactions().autoFilterNonLoadedNodes().build()
//                    client.changeQuery(
//                        buildModelQuery {
//                            root {
//                                children("modules") {
//                                    whereProperty("name").startsWith("test.in.expr.")
//                                    children("models") {
//                                        children("rootNodes") {
//                                            descendants {}
//                                        }
//                                    }
//                                }
//                            }
//                        },
//                    )
//                    val rootNode = client.waitForRootNode(30.seconds) ?: throw RuntimeException("Root node not received")
//                    callback(rootNode)
                }
            } catch (ex: Exception) {
                errorCallback(ex)
            }
        }
    }

    fun renderNodeAsHtmlText(rootNode: INode): String {
        return renderTypedNodeAsHtmlText(rootNode.typed())
    }

    fun renderTypedNodeAsHtmlText(rootNode: ITypedNode): String {
        val sb = StringBuilder()
        renderTypedNode(EditorState(), rootNode, DelayedConsumer(HTMLStreamBuilder(out = sb, prettyPrint = true, xhtmlCompatible = true)))
        return sb.toString()
    }

    fun <T> renderNode(editorState: EditorState, rootNode: INode, tagConsumer: TagConsumer<T>) {
        renderTypedNode(editorState, rootNode.typed(), tagConsumer)
    }

    fun <T> renderTypedNode(editorState: EditorState, rootNode: ITypedNode, tagConsumer: TagConsumer<T>) {
        ModelFacade.readNode(rootNode.unwrap()) {
            val cell = editorEngine.createCell(editorState, rootNode.unwrap())
            cell.layout.toHtml(tagConsumer)
        }
    }

    fun renderModelAsHtmlText(modelData: ModelData): String {
        val branch = ModelFacade.toLocalBranch(ModelFacade.newLocalTree(useRoleIds = false))
        modelData.load(branch)
        val rootNode = ModelFacade.getRootNode(branch)
        return rootNode.allChildren
            .filter { it.getConceptReference() != null }
            .joinToString("\n") { renderNodeAsHtmlText(it) }
    }

    fun nodeToString(node: Any): String {
        val typedNode = when (node) {
            is ITypedNode -> node
            is INode -> node.typed()
            else -> throw IllegalArgumentException("Unsupported node type: $node")
        }
        return (if (typedNode is N_INamedConcept) typedNode.name else null) ?: typedNode.untypedConcept().getLongName()
    }

    fun findTestSuites(rootNode: INode): Array<N_TestSuite> {
        return ModelFacade.readNode(rootNode) {
            val modules = rootNode.getChildren("modules")
                .map { TypedLanguagesRegistry.wrapNode(it) }
                .filterIsInstance<N_Module>()
            modules.flatMap { it.models }.flatMap { it.rootNodes }
                .filterIsInstance<N_TestSuite>()
                .toTypedArray()
        }
    }

    fun getModules(rootNode: INode): Array<INode> {
        return ModelFacade.readNode(rootNode) {
            val modules = rootNode.getChildren("modules")
                .map { TypedLanguagesRegistry.wrapNode(it) }
                .filterIsInstance<N_Module>()
                .map { it.unwrap() }
            modules.toTypedArray()
        }
    }

    fun unwrapNode(node: Any): Any {
        if (node is INode) return node
        if (node is ITypedNode) return node.unwrap()
        return node
    }
}
