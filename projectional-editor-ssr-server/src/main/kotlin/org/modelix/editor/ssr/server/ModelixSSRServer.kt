package org.modelix.editor.ssr.server

import io.github.oshai.kotlinlogging.KotlinLogging
import io.ktor.server.routing.Route
import io.ktor.websocket.WebSocketSession
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.rpc.krpc.ktor.server.rpc
import kotlinx.rpc.krpc.serialization.json.json
import org.modelix.editor.EditorEngine
import org.modelix.editor.text.backend.TextEditorServiceImpl
import org.modelix.editor.text.shared.TextEditorService
import org.modelix.incremental.DependencyTracking
import org.modelix.incremental.IDependencyListener
import org.modelix.incremental.IStateVariableGroup
import org.modelix.incremental.IStateVariableReference
import org.modelix.incremental.IncrementalEngine
import org.modelix.model.api.IMutableModel
import java.util.concurrent.atomic.AtomicReference
import kotlin.collections.forEach
import kotlin.collections.minus
import kotlin.time.Duration.Companion.days

private val LOG = KotlinLogging.logger { }

class ModelixSSRServer(
    private val model: IMutableModel,
) {
    private val incrementalEngine = IncrementalEngine()
    val editorEngine: EditorEngine = EditorEngine(incrementalEngine)
    private val lock = Any()
    private val coroutinesScope = CoroutineScope(Dispatchers.Default)
    private val serviceInstances: AtomicReference<Set<TextEditorServiceImpl>> = AtomicReference(emptySet())
    private val dependencyListener: IDependencyListener =
        object : IDependencyListener {
            override fun parentGroupChanged(childGroup: IStateVariableGroup) {}

            override fun accessed(key: IStateVariableReference<*>) {}

            override fun modified(key: IStateVariableReference<*>) {
                serviceInstances.get().forEach { it.triggerUpdates() }
            }
        }

    fun install(route: Route) {
        route.installRoutes()
    }

    fun dispose() {
        DependencyTracking.removeListener(dependencyListener)
        serviceInstances.get().forEach { it.dispose() }
        coroutinesScope.cancel("disposed")
    }

    private fun Route.installRoutes() {
        DependencyTracking.registerListener(dependencyListener)

        rpc("rpc") {
            val websocketSession: WebSocketSession = this
            rpcConfig {
                serialization {
                    json()
                }
            }

            registerService<TextEditorService> {
                val instance = TextEditorServiceImpl(editorEngine, model, websocketSession)
                serviceInstances.getAndUpdate { it + instance }
                websocketSession.onCancellation { instance.dispose() }
                websocketSession.onCancellation {
                    serviceInstances.getAndUpdate { it - instance }
                    instance.dispose()
                }
                instance
            }
        }
    }
}

private fun CoroutineScope.onCancellation(body: suspend () -> Unit) {
    launch {
        try {
            while (true) {
                delay(100000.days)
            }
        } catch (ex: kotlinx.coroutines.CancellationException) {
            body()
            throw ex
        }
    }
}
