package org.modelix.mps.editor.common

import com.intellij.ide.AppLifecycleListener
import com.intellij.ide.plugins.DynamicPluginListener
import com.intellij.ide.plugins.IdeaPluginDescriptor
import com.intellij.ide.plugins.PluginManager
import com.intellij.openapi.Disposable
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.diagnostic.Logger
import io.ktor.server.application.Application
import io.ktor.server.application.serverConfig
import io.ktor.server.engine.EmbeddedServer
import io.ktor.server.engine.EngineConnectorBuilder
import io.ktor.server.engine.applicationEnvironment
import io.ktor.server.netty.Netty
import io.ktor.server.netty.NettyApplicationEngine
import io.ktor.util.logging.KtorSimpleLogger
import kotlinx.coroutines.GlobalScope
import kotlin.concurrent.thread

private val LOG = Logger.getInstance("org.modelix.mps.editor.common.KtorUtils")

fun embeddedServer(
    port: Int,
    classLoader: ClassLoader? = null,
    module: Application.() -> Unit,
): EmbeddedServer<NettyApplicationEngine, NettyApplicationEngine.Configuration> {
    val portParam = port
    val classLoaderParam = classLoader
    val moduleParam = module
    val environment =
        applicationEnvironment {
            if (classLoaderParam != null) this.classLoader = classLoaderParam
            this.log = KtorSimpleLogger("ktor.application")
        }
    val applicationProperties =
        serverConfig(environment) {
            this.module(moduleParam)
            this.parentCoroutineContext = GlobalScope.coroutineContext
            this.watchPaths = emptyList()
        }
    return io.ktor.server.engine.embeddedServer(Netty, applicationProperties, configure = {
        this.connectors += EngineConnectorBuilder().also { it.port = portParam }
    })
}

/**
 * Like [EmbeddedServer.stop], but returns after [maxWaitMillis] even if the server isn't stopped yet.
 *
 * Netty terminates an event loop only after the task it is currently running returned. [EmbeddedServer.stop] waits
 * for that without any timeout, [gracePeriodMillis] and [timeoutMillis] only apply between tasks. A request handler
 * that is blocked in an MPS read action, while stop is called inside a write action, blocks it forever.
 */
fun EmbeddedServer<*, *>.stopBounded(
    gracePeriodMillis: Long,
    timeoutMillis: Long,
    maxWaitMillis: Long,
) {
    val stopThread =
        thread(name = "modelix-ktor-server-stop", isDaemon = true) {
            try {
                stop(gracePeriodMillis, timeoutMillis)
            } catch (ex: Throwable) {
                LOG.warn("Failed to stop the server", ex)
            }
        }
    stopThread.join(maxWaitMillis)
    if (stopThread.isAlive) {
        LOG.warn("Server didn't stop within $maxWaitMillis ms. A request handler is probably blocked.")
    }
}

/**
 * Calls [stop] when the application is about to close or when the plugin that contains [pluginClass] is about to be
 * unloaded, as long as [parentDisposable] isn't disposed.
 *
 * Both happen before the services are disposed. That happens inside a write action, where request handlers that wait
 * for a read action can't finish and stopping a server has to give up on them (see [stopBounded]).
 */
fun stopBeforeDisposal(
    parentDisposable: Disposable,
    pluginClass: Class<*>,
    stop: () -> Unit,
) {
    val pluginId = PluginManager.getPluginByClass(pluginClass)?.pluginId
    val connection = ApplicationManager.getApplication().messageBus.connect(parentDisposable)
    connection.subscribe(
        AppLifecycleListener.TOPIC,
        object : AppLifecycleListener {
            override fun appWillBeClosed(isRestart: Boolean) {
                stop()
            }
        },
    )
    connection.subscribe(
        DynamicPluginListener.TOPIC,
        object : DynamicPluginListener {
            override fun beforePluginUnload(
                pluginDescriptor: IdeaPluginDescriptor,
                isUpdate: Boolean,
            ) {
                if (pluginId != null && pluginDescriptor.pluginId == pluginId) stop()
            }
        },
    )
}
