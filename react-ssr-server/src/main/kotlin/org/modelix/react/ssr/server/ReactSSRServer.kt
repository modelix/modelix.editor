package org.modelix.react.ssr.server

import io.github.oshai.kotlinlogging.KotlinLogging
import io.ktor.server.application.call
import io.ktor.server.application.install
import io.ktor.server.engine.embeddedServer
import io.ktor.server.http.content.staticResources
import io.ktor.server.netty.Netty
import io.ktor.server.request.receiveStream
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.route
import io.ktor.server.routing.routing
import io.ktor.server.websocket.WebSockets
import io.ktor.server.websocket.webSocket
import io.ktor.util.toMap
import io.ktor.websocket.Frame
import io.ktor.websocket.readText
import io.ktor.websocket.send
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.modelix.incremental.IIncrementalEngine
import org.modelix.incremental.IncrementalEngine
import org.modelix.incremental.incrementalFunction
import org.modelix.kotlin.utils.ContextValue
import java.net.URLDecoder
import java.nio.charset.StandardCharsets
import java.util.Collections
import kotlin.time.Duration.Companion.milliseconds

private val LOG = KotlinLogging.logger { }

fun main() {
    ReactSSRServer().start()
}

interface IRendererFactory {
    fun createRenderer(incrementalEngine: IIncrementalEngine, nodeRef: String, parameters: Map<String, List<String>>, coroutineScope: CoroutineScope): IRenderer
}

interface IRenderer {
    companion object {
        val contextIncrementalEngine = ContextValue<IIncrementalEngine>()
    }

    fun <R> runRead(body: () -> R): R
    fun render(): ViewModel
    suspend fun messageReceived(message: MessageFromClient)
}

class DefaultRendererFactory : IRendererFactory {

    override fun createRenderer(
        incrementalEngine: IIncrementalEngine,
        nodeRef: String,
        parameters: Map<String, List<String>>,
        coroutineScope: CoroutineScope,
    ): IRenderer {
        return Renderer(nodeRef)
    }

    class Renderer(val nodeRef: String) : IRenderer {
        override fun render(): ViewModel {
            return ViewModel(
                children = listOf(
                    ComponentOrText(
                        text = "No renderer defined for $nodeRef"
                    )
                )
            )
        }

        override suspend fun messageReceived(message: MessageFromClient) {}
        override fun <R> runRead(body: () -> R): R = body()
    }
}

class ReactSSRServer(val rendererFactory: IRendererFactory = DefaultRendererFactory()) {

    private val coroutinesScope = CoroutineScope(Dispatchers.Default)
    private val allUpdaters: MutableSet<() -> Unit> = Collections.synchronizedSet(HashSet())
    var knownComponents: List<String> = emptyList()

    fun start() {
        embeddedServer(Netty, port = 43594) {
            install(WebSockets)
            routing {
                install(this)
            }
        }.start(wait = true)
    }

    fun install(route: Route) {
        route.installRoutes()
    }

    fun dispose() {
        coroutinesScope.cancel("disposed")
    }

    fun updateAll() {
        allUpdaters.forEach { it.invoke() }
    }

    private fun Route.installRoutes() {
        post("known-components") {
            withContext(Dispatchers.IO) {
                call.receiveStream().bufferedReader().useLines {
                    knownComponents = it.toSortedSet().toList()
                }
                call.respond("OK")
            }
        }
        route("/nodes/{nodeRef}") {
            staticResources("client/", basePackage = "org.modelix.react.ssr.client")
            webSocket("ws") {
                val incrementalEngine = IncrementalEngine()
                lateinit var updateFunction: () -> Unit
                try {
                    val nodeRef = URLDecoder.decode(call.parameters["nodeRef"]!!, StandardCharsets.UTF_8)
                    val queryParameters = call.request.queryParameters.toMap()
                    val createRenderer = incrementalEngine.incrementalFunction("createRenderer") { _ ->
                        rendererFactory.createRenderer(
                            incrementalEngine,
                            nodeRef,
                            queryParameters,
                            this
                        )
                    }

                    var previousViewModel: ViewModel? = null
                    var previousText = ""
                    val mutex = Mutex()
                    suspend fun sendUpdate(viewModel: ViewModel) {
                        mutex.withLock {
                            if (!isActive) return@withLock
                            if (viewModel === previousViewModel) return@withLock
                            previousViewModel = viewModel

                            val newText = Json.encodeToString(MessageFromServer(viewModel))
                            if (newText == previousText) return@withLock
                            previousText = newText

                            if (!isActive) return@withLock
                            send(newText)
                        }
                    }

                    val createViewModel = incrementalEngine.incrementalFunction("createViewModel") { _ ->
                        IRenderer.contextIncrementalEngine.computeWith(incrementalEngine) {
                            createRenderer().render()
                        }
                    }
                    suspend fun sendUpdate() {
                        if (!isActive) return
                        val viewModel = createRenderer().runRead {
                            if (!isActive) return@runRead null
                            synchronized(incrementalEngine) {
                                if (incrementalEngine.isDisposed()) return@runRead null
                                createViewModel()
                            }
                        } ?: return
                        sendUpdate(viewModel)
                    }
                    updateFunction = { launch { sendUpdate() } }
                    allUpdaters.add(updateFunction)

                    launch {
                        while (isActive) {
                            sendUpdate()
                            delay(1000.milliseconds)
                        }
                    }

                    for (wsMessage in incoming) {
                        try {
                            when (wsMessage) {
                                is Frame.Text -> {
                                    val message = wsMessage.readText()
                                    LOG.debug { "Received message: $message" }
                                    createRenderer().messageReceived(Json.decodeFromString(message))
                                    sendUpdate()
                                }
                                else -> {}
                            }
                        } catch (ex: Throwable) {
                            LOG.error(ex) { "Failed to process $wsMessage" }
                        }
                    }
                } finally {
                    allUpdaters.remove(updateFunction)
                    synchronized(incrementalEngine) {
                        incrementalEngine.dispose()
                    }
                }
            }
        }
    }
}

fun IncrementalEngine.isDisposed(): Boolean {
    return this::class.java.getDeclaredField("disposed").also { it.isAccessible = true }.get(this) as Boolean
}
