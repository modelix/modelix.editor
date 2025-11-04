@file:Suppress("removal")

package org.modelix.react.ssr.mps

import com.intellij.icons.AllIcons
import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.components.Service
import com.intellij.openapi.components.service
import com.intellij.openapi.project.Project
import com.intellij.openapi.startup.ProjectActivity
import com.intellij.openapi.util.Disposer
import io.ktor.http.ContentType
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.Application
import io.ktor.server.application.ApplicationCall
import io.ktor.server.application.install
import io.ktor.server.engine.EmbeddedServer
import io.ktor.server.response.respond
import io.ktor.server.response.respondBytes
import io.ktor.server.response.respondText
import io.ktor.server.routing.get
import io.ktor.server.routing.routing
import io.ktor.server.websocket.WebSockets
import io.ktor.server.websocket.pingPeriod
import io.ktor.server.websocket.timeout
import jetbrains.mps.icons.MPSIcons
import jetbrains.mps.ide.icons.GlobalIconManager
import jetbrains.mps.ide.icons.IdeIcons
import jetbrains.mps.internal.collections.runtime.Sequence
import jetbrains.mps.project.MPSProject
import jetbrains.mps.smodel.MPSModuleRepository
import org.jetbrains.mps.openapi.module.ModelAccess
import org.jetbrains.mps.openapi.module.SRepository
import org.jetbrains.mps.openapi.persistence.PersistenceFacade
import org.modelix.model.api.INode
import org.modelix.model.api.runSynchronized
import org.modelix.model.mpsadapters.MPSChangeTranslator
import org.modelix.model.mpsadapters.MPSRepositoryAsNode
import org.modelix.react.ApiGenLanguages
import org.modelix.react.ssr.server.ReactSSRServer
import java.awt.image.BufferedImage
import java.io.ByteArrayOutputStream
import java.lang.reflect.Modifier
import java.util.Collections
import javax.imageio.ImageIO
import javax.swing.Icon
import kotlin.time.Duration.Companion.seconds

@Service(Service.Level.PROJECT)
class ReactSSRServerForMPSProject(private val project: Project) : Disposable {

    init {
        ApplicationManager.getApplication().service<ReactSSRServerForMPS>().registerProject(project)
    }

    override fun dispose() {
        ApplicationManager.getApplication().service<ReactSSRServerForMPS>().unregisterProject(project)
    }
}

@Service(Service.Level.APP)
class ReactSSRServerForMPS : Disposable {

    companion object {
        fun getInstance() = ApplicationManager.getApplication().getService(ReactSSRServerForMPS::class.java)
    }

    private var ssrServer: ReactSSRServer? = null
    private var ktorServer: EmbeddedServer<*, *>? = null
    private var rendererFactory: MPSRendererFactory? = null
    private val projects: MutableSet<Project> = Collections.synchronizedSet(HashSet())
    private val changeTranslator = MPSChangeTranslator()
    private val commandLister = object : org.jetbrains.mps.openapi.repository.CommandListener {
        override fun commandFinished() {
            ssrServer?.updateAll()
        }
    }

    fun getKnownComponents(): List<String> = ssrServer?.knownComponents ?: emptyList()

    fun toggleInterpreterMode() = rendererFactory?.useInterpreter?.setValue(!isInterpreterMode())

    fun isInterpreterMode() = rendererFactory?.useInterpreter?.getValue() ?: false

    fun registerProject(project: Project) {
        projects.add(project)
        ensureStarted()
    }

    fun unregisterProject(project: Project) {
        projects.remove(project)
    }

    private fun getMPSProjects(): List<MPSProject> {
        return runSynchronized(projects) {
            projects.mapNotNull { it.getComponent(MPSProject::class.java) }
        }
    }

    private fun getRepository(): SRepository {
        return getMPSProjects().asSequence().map {
            it.repository
        }.firstOrNull() ?: MPSModuleRepository.getInstance()
    }

    private fun getRootNode(): INode {
        return MPSRepositoryAsNode(getRepository()).asLegacyNode()
    }

    fun ensureStarted() {
        runSynchronized(this) {
            if (ktorServer != null) return

            println("starting react SSR server")

            ApiGenLanguages.registerAll()
            changeTranslator.start(getRepository())
            rendererFactory = MPSRendererFactory(::getRepository).also { Disposer.register(this, it) }
            val ssrServer = ReactSSRServer(rendererFactory!!)
            MPSModuleRepository.getInstance().modelAccess.addCommandListener(commandLister)
            this.ssrServer = ssrServer

            ktorServer = org.modelix.mps.editor.common.embeddedServer(port = 43595, classLoader = this.javaClass.classLoader) {
                initKtorServer(ssrServer)
            }

            ktorServer!!.start()
        }
    }

    private fun Application.initKtorServer(ssrServer: ReactSSRServer) {
        install(WebSockets) {
            pingPeriod = 15.seconds
            timeout = 15.seconds
            maxFrameSize = Long.MAX_VALUE
            masking = false
        }
        routing {
            ssrServer.install(this)

            get {
                call.respond(this@ReactSSRServerForMPS::class.qualifiedName ?: "")
            }

            val rootIconClasses = listOf(IdeIcons::class.java, AllIcons::class.java, MPSIcons::class.java).associateBy { it.simpleName }
            get("icons/{icon}") {
                val iconName = call.parameters["icon"]!!
                val path = iconName.split('.').toList()
                val icon = rootIconClasses[path.first()]?.let { resolveIcon(it, path.drop(1)) }
                if (icon == null) {
                    call.respondText(text = "Icon not found: $iconName", status = HttpStatusCode.NotFound)
                } else {
                    call.respondIcon(icon)
                }
            }
            get("icons/concepts/{concept}") {
                val conceptRef = call.parameters["concept"]!!
                val concept = PersistenceFacade.getInstance().createConcept(conceptRef)
                val icon = GlobalIconManager.getInstance().getIconFor(concept)
                call.respondIcon(icon)
            }
        }
    }

    fun ensureStopped() {
        runSynchronized(this) {
            if (ktorServer == null) return
            println("stopping modelix SSR server")
            MPSModuleRepository.getInstance().modelAccess.removeCommandListener(commandLister)
            ktorServer?.let { server ->
                ApplicationManager.getApplication().executeOnPooledThread {
                    // The stop call often blocks forever and MPS can't shut down if called synchronously.
                    server.stop()
                }
            }
            ktorServer = null
            ssrServer?.dispose()
            ssrServer = null
            changeTranslator.stop()
        }
    }

    override fun dispose() {
        ensureStopped()
    }
}

class ReactSSRServerForMPSStartupActivity : ProjectActivity {
    override suspend fun execute(project: Project) {
        project.service<ReactSSRServerForMPSProject>() // just ensure it's initialized
    }
}

fun <R> ModelAccess.computeRead(body: () -> R): R {
    var result: R? = null
    this.runReadAction {
        result = body()
    }
    return result as R
}

suspend fun ApplicationCall.respondIcon(icon: Icon) {
    val image = BufferedImage(icon.iconWidth, icon.iconHeight, BufferedImage.TYPE_INT_ARGB)
    icon.paintIcon(null, image.graphics, 0, 0)
    val bytes = ByteArrayOutputStream().also {
        it.use {
            ImageIO.write(image, "png", it)
        }
    }.toByteArray()
    respondBytes(bytes = bytes, contentType = ContentType.Image.PNG)
}

private fun resolveIcon(cls: Class<*>, path: List<String>): Icon? {
    val remainingPath: List<String> = path.drop(1)
    if (Sequence.fromIterable(remainingPath).isNotEmpty) {
        val nestedClasses = cls.declaredClasses
        val nestedCls = nestedClasses.firstOrNull { it.simpleName == path.first() }
        return (if (nestedCls == null) null else resolveIcon(nestedCls, remainingPath))
    } else {
        val field = cls.declaredFields.firstOrNull { it.name == path.first() }
        if (field != null && Modifier.isStatic(field.modifiers) && field.canAccess(null)) {
            try {
                val value = field[null]
                return (if (value is Icon) value else null)
            } catch (e: IllegalAccessException) {
            }
        }
        return null
    }
}
