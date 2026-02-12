/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.modelix.editor.ssr.mps

import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.components.Service
import com.intellij.openapi.components.service
import com.intellij.openapi.project.Project
import com.intellij.openapi.startup.ProjectActivity
import io.ktor.server.application.Application
import io.ktor.server.application.install
import io.ktor.server.engine.EmbeddedServer
import io.ktor.server.html.respondHtml
import io.ktor.server.http.content.staticResources
import io.ktor.server.routing.get
import io.ktor.server.routing.routing
import io.ktor.server.websocket.WebSockets
import io.ktor.server.websocket.pingPeriod
import io.ktor.server.websocket.timeout
import jetbrains.mps.core.aspects.constraints.rules.Rule
import jetbrains.mps.core.aspects.constraints.rules.kinds.CanBeAncestorContext
import jetbrains.mps.core.aspects.constraints.rules.kinds.ContainmentContext
import jetbrains.mps.core.aspects.feedback.messages.FailingPropertyConstraintContext
import jetbrains.mps.core.aspects.feedback.problem.Problem
import jetbrains.mps.project.MPSProject
import jetbrains.mps.scope.Scope
import jetbrains.mps.smodel.ModelDependencyResolver
import jetbrains.mps.smodel.constraints.ConstraintsCanBeFacade
import jetbrains.mps.smodel.constraints.ConstraintsChildAndPropFacade
import jetbrains.mps.smodel.constraints.ModelConstraints
import jetbrains.mps.smodel.language.LanguageRegistry
import jetbrains.mps.smodel.presentation.IPropertyPresentationProvider
import kotlinx.html.a
import kotlinx.html.base
import kotlinx.html.body
import kotlinx.html.div
import kotlinx.html.head
import kotlinx.html.li
import kotlinx.html.link
import kotlinx.html.script
import kotlinx.html.title
import kotlinx.html.ul
import org.jetbrains.mps.openapi.language.SAbstractConcept
import org.jetbrains.mps.openapi.language.SConcept
import org.jetbrains.mps.openapi.language.SContainmentLink
import org.jetbrains.mps.openapi.language.SProperty
import org.jetbrains.mps.openapi.language.SReferenceLink
import org.jetbrains.mps.openapi.model.SNode
import org.modelix.constraints.IConstraintViolation
import org.modelix.constraints.IConstraintsChecker
import org.modelix.editor.ExistingNode
import org.modelix.editor.INonExistingNode
import org.modelix.editor.ancestors
import org.modelix.editor.ssr.server.ModelixSSRServer
import org.modelix.model.api.BuiltinLanguages
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IChildLinkDefinition
import org.modelix.model.api.IConcept
import org.modelix.model.api.INode
import org.modelix.model.api.IProperty
import org.modelix.model.api.IReferenceLink
import org.modelix.model.api.IWritableNode
import org.modelix.model.api.NodeReference
import org.modelix.model.api.runSynchronized
import org.modelix.model.mpsadapters.MPSChildLink
import org.modelix.model.mpsadapters.MPSConcept
import org.modelix.model.mpsadapters.MPSModelAsNode
import org.modelix.model.mpsadapters.MPSNode
import org.modelix.model.mpsadapters.MPSProperty
import org.modelix.model.mpsadapters.MPSReferenceLink
import org.modelix.model.mpsadapters.MPSRepositoryAsNode
import org.modelix.model.mpsadapters.MPSWritableNode
import org.modelix.scopes.IScope
import org.modelix.scopes.IScopeProvider
import java.net.URLEncoder
import java.nio.charset.StandardCharsets
import java.util.Collections
import kotlin.time.Duration.Companion.seconds

@Service(Service.Level.PROJECT)
class ModelixSSRServerForMPSProject(
    private val project: Project,
) : Disposable {
    init {
        ApplicationManager.getApplication().service<ModelixSSRServerForMPS>().registerProject(project)
    }

    override fun dispose() {
        ApplicationManager.getApplication().service<ModelixSSRServerForMPS>().unregisterProject(project)
    }
}

@Service(Service.Level.APP)
class ModelixSSRServerForMPS : Disposable {
    private var ssrServer: ModelixSSRServer? = null
    private var ktorServer: EmbeddedServer<*, *>? = null
    private val projects: MutableSet<Project> = Collections.synchronizedSet(HashSet())
    private var mpsIntegration: EditorIntegrationForMPS? = null

    fun registerProject(project: Project) {
        projects.add(project)
        ensureStarted()
    }

    fun unregisterProject(project: Project) {
        projects.remove(project)
    }

    private fun getMPSProjects(): List<MPSProject> =
        runSynchronized(projects) {
            projects.mapNotNull { it.getComponent(MPSProject::class.java) }
        }

    private fun getRootNode(): INode? =
        getMPSProjects()
            .asSequence()
            .map {
                MPSRepositoryAsNode(it.repository).asLegacyNode()
            }.firstOrNull()

    fun ensureStarted() {
        runSynchronized(this) {
            if (ktorServer != null) return

            println("starting modelix SSR server")

            val ssrServer = ModelixSSRServer((getRootNode() ?: return).getArea().asModel())
            this.ssrServer = ssrServer
            mpsIntegration = EditorIntegrationForMPS(ssrServer.editorEngine)
            mpsIntegration!!.init(getMPSProjects().first().repository)
            ktorServer =
                org.modelix.mps.editor.common.embeddedServer(port = 43593, classLoader = this.javaClass.classLoader) {
                    initKtorServer(ssrServer)
                }
            ktorServer!!.start()
        }
    }

    private fun Application.initKtorServer(ssrServer: ModelixSSRServer) {
        install(WebSockets) {
            pingPeriod = 15.seconds
            timeout = 15.seconds
            maxFrameSize = Long.MAX_VALUE
            masking = false
        }
        routing {
            get("/") {
                call.respondHtml {
                    val repository = getRootNode()!!
                    repository.getArea().executeRead {
                        body {
                            ul {
                                repository
                                    .getChildren(
                                        BuiltinLanguages.MPSRepositoryConcepts.Repository.modules
                                    ).sortedBy { it.name }
                                    .forEach {
                                        li {
                                            a {
                                                href = "module/${URLEncoder.encode(it.reference.serialize(), StandardCharsets.UTF_8)}/"
                                                +(it.name ?: "<no name>")
                                            }
                                        }
                                    }
                            }
                        }
                    }
                }
            }
            get("/module/{moduleRef}/") {
                call.respondHtml {
                    val moduleRef = call.parameters["moduleRef"]!!
                    val repository = getRootNode()!!
                    repository.getArea().executeRead {
                        val module = repository.getArea().resolveNode(NodeReference(moduleRef))!!
                        body {
                            ul {
                                module.getChildren(BuiltinLanguages.MPSRepositoryConcepts.Module.models).sortedBy { it.name }.forEach {
                                    li {
                                        a {
                                            href = "../../model/${URLEncoder.encode(it.reference.serialize(), StandardCharsets.UTF_8)}/"
                                            +(it.name ?: "<no name>")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            get("/model/{modelRef}/") {
                call.respondHtml {
                    val modelRef = call.parameters["modelRef"]!!
                    val repository = getRootNode()!!
                    repository.getArea().executeRead {
                        val model = repository.getArea().resolveNode(NodeReference(modelRef))!!
                        body {
                            ul {
                                model.getChildren(BuiltinLanguages.MPSRepositoryConcepts.Model.rootNodes).sortedBy { it.name }.forEach {
                                    li {
                                        a {
                                            href = "../../editor/${URLEncoder.encode(it.reference.serialize(), StandardCharsets.UTF_8)}/"
                                            +(it.name ?: "<no name>")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            get("/editor/{nodeRef}/") {
                call.respondHtml {
                    head {
                        title("Modelix Text Editor")
                        base {
                            href = "../.."
                        }
                        link {
                            rel = "stylesheet"
                            href = "editor.css"
                        }
                    }
                    body {
                        div(classes = "modelix-text-editor") {
                            attributes["nodeRef"] = requireNotNull(call.parameters["nodeRef"]) { "missing nodeRef parameter" }
                        }
                        script { src = "projectional-editor-ssr-client.js" }
                    }
                }
            }
            staticResources(remotePath = "/", basePackage = "js/productionExecutable")
            ssrServer.install(this)
        }
    }

    fun ensureStopped() {
        runSynchronized(this) {
            if (ktorServer == null) return
            println("stopping modelix SSR server")
            ktorServer?.stop()
            ktorServer = null
            ssrServer?.dispose()
            ssrServer = null
            mpsIntegration?.dispose()
            mpsIntegration = null
        }
    }

    override fun dispose() {
        ensureStopped()
    }
}

class ModelixSSRServerForMPSStartupActivity : ProjectActivity {
    override suspend fun execute(project: Project) {
        project.service<ModelixSSRServerForMPSProject>() // just ensure it's initialized
    }
}

object MPSScopeProvider : IScopeProvider {
    override fun getScope(
        sourceNode: INonExistingNode,
        link: IReferenceLink,
    ): IScope {
        val mpsSourceNode = sourceNode.getNode()?.asWritableNode() as? MPSWritableNode
        val descriptor =
            if (mpsSourceNode == null) {
                val contextNode: SNode = sourceNode.getExistingAncestor().toMPS()!!
                val containmentLink: SContainmentLink = sourceNode.getContainmentLink().toMPS()!!
                val index = sourceNode.index()
                val association: SReferenceLink = link.toMPS()!!
                val concept: SAbstractConcept = sourceNode.expectedConcept().toMPS()!!
                ModelConstraints.getReferenceDescriptor(
                    contextNode,
                    containmentLink,
                    index,
                    association,
                    concept,
                )
            } else {
                ModelConstraints.getReferenceDescriptor(mpsSourceNode.node, link.toMPS()!!)
            }
        return MPSScope(descriptor.getScope())
    }
}

class MPSScope(
    val scope: Scope,
) : IScope {
    override fun getVisibleElements(
        node: INonExistingNode,
        link: IReferenceLink,
    ): List<INonExistingNode> = scope.getAvailableElements("").map { ExistingNode(MPSNode(it)) }
}

object MPSConstraints : IConstraintsChecker {
    override fun check(node: INonExistingNode): List<IConstraintViolation> {
        // Constraints only prevent creating a node. If it already exists, it's handled by the model checker.
        if (node.getNode() != null) return emptyList()

        // Correct would be `parentNode = node.getParent()?.getNode().toMPS()`
        // but the parent node is not allowed to be null.
        // MPS itself then just passes the nearest existing ancestor to the constraints.
        // Without this hack we cannot evaluate any constraints and there would be too many incorrect entries in the
        // code completion menu.
        val parentNode = node.getExistingAncestor().toMPS()

        // ConstraintsCanBeFacade.checkCanBeRoot()

        val containmentContext =
            ContainmentContext
                .Builder()
                .parentNode(parentNode)
                .link(node.getContainmentLink().toMPS())
                .childConcept(node.expectedConcept().toMPS()!!)
                .build()

        val ancestorViolations =
            node.ancestors().flatMap { ancestor ->
                val ancestorNode = ancestor.getNode().toMPS() ?: return@flatMap emptyList()

                ConstraintsCanBeFacade.checkCanBeAncestor(
                    CanBeAncestorContext
                        .Builder()
                        .ancestorNode(ancestorNode)
                        .parentNode(parentNode)
                        .childConcept(node.expectedConcept().toMPS()!!)
                        .descendantNode(node.getNode().toMPS())
                        .link(node.getContainmentLink().toMPS())
                        .build(),
                )
            }
        val parentViolations = ConstraintsCanBeFacade.checkCanBeParent(containmentContext).asSequence()
        val childViolations = ConstraintsCanBeFacade.checkCanBeChild(containmentContext).asSequence()
        return (ancestorViolations + parentViolations + childViolations).map { MPSConstraintViolation(it) }.toList() +
            (node.getParent()?.let { check(it) } ?: emptyList()) + checkLanguageImported(node)
    }

    fun checkLanguageImported(node: INonExistingNode): List<IConstraintViolation> {
        val concept = node.expectedConcept() as? MPSConcept ?: return emptyList()
        val language = concept.concept.language
        val model =
            node
                .ancestors()
                .map { it.getNode() }
                .filterIsInstance<MPSModelAsNode>()
                .map { it.model }
                .firstOrNull() ?: return emptyList()
        val usedLanguages =
            ModelDependencyResolver(
                LanguageRegistry.getInstance(model.repository),
                model.repository
            ).usedLanguages(model).toSet()
        return if (!usedLanguages.contains(language)) {
            listOf(MPSLanguageNotImportedViolation(concept.concept))
        } else {
            emptyList()
        }
    }

    override fun checkPropertyValue(
        node: INonExistingNode,
        property: IProperty,
        value: String,
    ): List<IConstraintViolation> {
        val mpsProperty = property.toMPS() ?: return emptyList()
        val internalValue = IPropertyPresentationProvider.getPresentationProviderFor(mpsProperty).fromPresentation(value)
        val mpsNode =
            node.getNode()?.toMPS()
                ?: jetbrains.mps.smodel.SNode(
                    node.expectedConcept().toMPS() as? SConcept ?: jetbrains.mps.smodel.SNodeUtil.concept_BaseConcept
                )
        val context = FailingPropertyConstraintContext(mpsNode, mpsProperty, internalValue)
        return ConstraintsChildAndPropFacade.checkPropertyValue(context).map { MPSProblem(it) }
    }
}

fun INode?.toMPS(): SNode? = this?.asWritableNode().toMPS()

fun IWritableNode?.toMPS(): SNode? = if (this is MPSWritableNode) this.node else null

fun IChildLink?.toMPS(): SContainmentLink? = if (this is MPSChildLink) this.link else null

fun IChildLinkDefinition?.toMPS(): SContainmentLink? = if (this is MPSChildLink) this.link else null

fun IReferenceLink?.toMPS(): SReferenceLink? = if (this is MPSReferenceLink) this.link else null

fun IProperty?.toMPS(): SProperty? = if (this is MPSProperty) this.property else null

fun IConcept?.toMPS(): SAbstractConcept? = if (this is MPSConcept) this.concept else null

val INode.name get() = getPropertyValue(BuiltinLanguages.jetbrains_mps_lang_core.INamedConcept.name)

class MPSConstraintViolation(
    val rule: Rule<*>,
) : IConstraintViolation

class MPSProblem(
    val problem: Problem,
) : IConstraintViolation

class MPSLanguageNotImportedViolation(
    val concept: SAbstractConcept,
) : IConstraintViolation
