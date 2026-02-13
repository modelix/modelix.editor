package org.modelix.editor.ssr.demo.kernelf

import io.ktor.server.application.Application
import io.ktor.server.application.install
import io.ktor.server.response.respondText
import io.ktor.server.routing.get
import io.ktor.server.routing.routing
import io.ktor.server.websocket.WebSockets
import io.ktor.server.websocket.pingPeriod
import io.ktor.server.websocket.timeout
import org.modelix.editor.kernelf.KernelfEditor
import org.modelix.editor.ssr.server.ModelixSSRServer
import org.modelix.kernelf.KernelfLanguages
import org.modelix.model.api.IChildLink
import org.modelix.model.api.IProperty
import org.modelix.model.api.PBranch
import org.modelix.model.api.getRootNode
import org.modelix.model.area.getArea
import org.modelix.model.client.IdGenerator
import org.modelix.model.data.ModelData
import org.modelix.model.lazy.CLTree
import org.modelix.model.lazy.ObjectStoreCache
import org.modelix.model.persistent.MapBasedStore
import org.modelix.model.withIncrementalComputationSupport
import kotlin.time.Duration.Companion.seconds

fun main(args: Array<String>): Unit =
    io.ktor.server.netty.EngineMain
        .main(args)

fun Application.module() {
    val store = ObjectStoreCache(MapBasedStore())
    val tree =
        CLTree
            .builder(store)
            .repositoryId("ssr-demo")
            .useRoleIds(false)
            .build()
    val branch = PBranch(tree, IdGenerator.newInstance(0x8888)).withIncrementalComputationSupport()
    val modelData =
        ModelData.fromJson(
            javaClass.getResourceAsStream("/test.in.expr.os.strings@tests.json")!!.use { it.reader().readText() },
        )
    modelData.load(branch)
    val rootNodeRefs =
        branch.computeRead {
            branch
                .getRootNode()
                .getChildren(IChildLink.fromName("modules"))
                .flatMap { it.getChildren(IChildLink.fromName("models")) }
                .flatMap { it.getChildren(IChildLink.fromName("rootNodes")) }
                .map { it.getPropertyValue(IProperty.fromName("name")) + ": " + it.reference.serialize() }
        }
    println("Root node references: \n" + rootNodeRefs.joinToString("\n"))

    val ssrServer = ModelixSSRServer(branch.getArea().asModel())
    KernelfEditor.register(ssrServer.editorEngine)
    KernelfLanguages.registerAll()

    install(WebSockets) {
        pingPeriod = 15.seconds
        timeout = 15.seconds
        maxFrameSize = Long.MAX_VALUE
        masking = false
    }
    routing {
        get("/") {
            call.respondText("Hello, world!")
        }
        ssrServer.install(this)
    }
}
