@file:Suppress("removal")

package org.modelix.mps.editor.image

import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.components.Service
import com.intellij.openapi.components.service
import com.intellij.openapi.project.Project
import com.intellij.openapi.startup.ProjectActivity
import io.ktor.server.application.Application
import io.ktor.server.application.install
import io.ktor.server.engine.EmbeddedServer
import io.ktor.server.engine.embeddedServer
import io.ktor.server.netty.Netty
import io.ktor.server.response.respond
import io.ktor.server.routing.get
import io.ktor.server.routing.route
import io.ktor.server.routing.routing
import io.ktor.server.websocket.DefaultWebSocketServerSession
import io.ktor.server.websocket.WebSockets
import io.ktor.server.websocket.pingPeriod
import io.ktor.server.websocket.timeout
import io.ktor.server.websocket.webSocket
import io.ktor.websocket.Frame
import io.ktor.websocket.readText
import jetbrains.mps.project.MPSProject
import jetbrains.mps.smodel.MPSModuleRepository
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import org.jetbrains.mps.openapi.module.ModelAccess
import org.jetbrains.mps.openapi.module.SRepository
import org.modelix.model.api.INode
import org.modelix.model.api.NodeReference
import org.modelix.model.api.resolveIn
import org.modelix.model.api.runSynchronized
import org.modelix.model.mpsadapters.MPSArea
import org.modelix.model.mpsadapters.MPSRepositoryAsNode
import org.modelix.model.mpsadapters.MPSWritableNode
import org.modelix.model.mpsadapters.tomps.ModelixNodeAsMPSNode
import svg.plugin.RenderSession
import svg.plugin.optBoolean
import java.net.URLDecoder
import java.nio.charset.StandardCharsets
import java.util.Collections
import kotlin.time.Duration.Companion.seconds

private val LOG =
    io.github.oshai.kotlinlogging.KotlinLogging
        .logger { }

@Service(Service.Level.PROJECT)
class ImageEditorForMPSProject(
    private val project: Project,
) : Disposable {
    init {
        ApplicationManager.getApplication().service<ImageEditorForMPS>().registerProject(project)
    }

    override fun dispose() {
        ApplicationManager.getApplication().service<ImageEditorForMPS>().unregisterProject(project)
    }
}

@Service(Service.Level.APP)
class ImageEditorForMPS : Disposable {
    companion object {
        fun getInstance() = ApplicationManager.getApplication().getService(ImageEditorForMPS::class.java)
    }

    private var ktorServer: EmbeddedServer<*, *>? = null
    private val projects: MutableSet<Project> = Collections.synchronizedSet(HashSet())
    private val commandLister =
        object : org.jetbrains.mps.openapi.repository.CommandListener {
            override fun commandFinished() {
                // ssrServer?.updateAll()
            }
        }

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

    private fun getRepository(): SRepository =
        getMPSProjects()
            .asSequence()
            .map {
                it.repository
            }.firstOrNull() ?: MPSModuleRepository.getInstance()

    private fun getRootNode(): INode = MPSRepositoryAsNode(getRepository()).asLegacyNode()

    fun ensureStarted() {
        runSynchronized(this) {
            if (ktorServer != null) return

            println("starting react SSR server")

            MPSModuleRepository.getInstance().modelAccess.addCommandListener(commandLister)
            ktorServer =
                embeddedServer(Netty, port = 43596) {
                    initKtorServer()
                }
            ktorServer!!.start()
        }
    }

    private fun Application.initKtorServer() {
        install(WebSockets) {
            pingPeriod = 15.seconds
            timeout = 15.seconds
            maxFrameSize = Long.MAX_VALUE
            masking = false
        }
        routing {
            get {
                call.respond(this@ImageEditorForMPS::class.qualifiedName ?: "")
            }
            route("nodes/{nodeRef}/image-editor") {
                webSocket("ws") {
                    val nodeRef = URLDecoder.decode(call.parameters["nodeRef"]!!, StandardCharsets.UTF_8)
                    handleWebsocketSession(this, NodeReference(nodeRef))
                }
            }
        }
    }

    fun ensureStopped() {
        runSynchronized(this) {
            if (ktorServer == null) return
            println("stopping modelix SSR server")
            MPSModuleRepository.getInstance().modelAccess.removeCommandListener(commandLister)
            ktorServer?.stop()
            ktorServer = null
        }
    }

    override fun dispose() {
        ensureStopped()
    }

    private suspend fun handleWebsocketSession(
        session: DefaultWebSocketServerSession,
        nodeRef: NodeReference,
    ) {
        val repository = getMPSProjects().firstOrNull()?.repository
        val rootNode =
            repository?.modelAccess?.computeRead {
                (MPSArea(repository).let { nodeRef.resolveIn(it) }?.asWritableNode() as? MPSWritableNode)?.node
            }
        require(rootNode !is ModelixNodeAsMPSNode) { "MPS node without Modelix wrapper expected" }
        var inspectorEditorSession: RenderSession? = null
        val mainEditorSession =
            RenderSession(getMPSProjects().first(), session, "unknown user", isInspector = false, { inspectorEditorSession }, rootNode)
        try {
            mainEditorSession.onOpen()

            for (frame in session.incoming) {
                when (frame) {
                    is Frame.Text -> {
                        val obj = frame.readText().let { Json.decodeFromString<JsonObject>(it) }
                        if (obj.optBoolean("inspector") == true) {
                            try {
                                if (inspectorEditorSession == null) {
                                    inspectorEditorSession =
                                        RenderSession(
                                            getMPSProjects().first(),
                                            session,
                                            "unknown user",
                                            isInspector = true,
                                            { null },
                                            rootNode
                                        )
                                    inspectorEditorSession.onOpen()
                                }
                                inspectorEditorSession.processMessage(obj)
                            } catch (ex: Exception) {
                                LOG.error(ex) { "Failed to process message: " + ex.message }
                            }
                        } else {
                            try {
                                mainEditorSession.processMessage(obj)
                            } catch (ex: Exception) {
                                LOG.error(ex) { "Failed to process inspector message: " + ex.message }
                            }
                        }
                    }

                    else -> {}
                }
            }
        } finally {
            runCatching { mainEditorSession.dispose() }
            runCatching { inspectorEditorSession?.dispose() }
        }
    }
}

class ImageEditorForMPSStartupActivity : ProjectActivity {
    override suspend fun execute(project: Project) {
        project.service<ImageEditorForMPSProject>() // just ensure it's initialized
    }
}

fun <R> ModelAccess.computeRead(body: () -> R): R {
    var result: R? = null
    this.runReadAction {
        result = body()
    }
    return result as R
}
