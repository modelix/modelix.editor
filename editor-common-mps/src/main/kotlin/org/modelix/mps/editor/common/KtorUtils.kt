package org.modelix.mps.editor.common

import io.ktor.server.application.Application
import io.ktor.server.application.serverConfig
import io.ktor.server.engine.EmbeddedServer
import io.ktor.server.engine.EngineConnectorBuilder
import io.ktor.server.engine.applicationEnvironment
import io.ktor.server.netty.Netty
import io.ktor.server.netty.NettyApplicationEngine
import io.ktor.util.logging.KtorSimpleLogger
import kotlinx.coroutines.GlobalScope

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
