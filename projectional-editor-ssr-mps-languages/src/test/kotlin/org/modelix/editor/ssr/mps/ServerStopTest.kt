package org.modelix.editor.ssr.mps

import io.ktor.server.response.respondText
import io.ktor.server.routing.get
import io.ktor.server.routing.routing
import kotlinx.coroutines.runBlocking
import org.modelix.mps.editor.common.embeddedServer
import org.modelix.mps.editor.common.stopBounded
import java.net.URI
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import kotlin.concurrent.thread
import kotlin.system.measureTimeMillis

/**
 * MPS didn't shut down while a page with live updates was open. Services are disposed inside a write action and a
 * request handler of the server was waiting for a read action at the same time. Stopping the server waited for the
 * handler and the handler waited for the write action to finish.
 */
@Suppress("ktlint:standard:function-naming")
class ServerStopTest : TestBase("SimpleProject") {
    fun `test stopping inside a write action doesn't wait for a handler that waits for a read action`() {
        val handlerStarted = CountDownLatch(1)
        val server =
            embeddedServer(port = 0) {
                routing {
                    get("read") {
                        handlerStarted.countDown()
                        mpsProject.modelAccess.runReadAction { }
                        call.respondText("OK")
                    }
                }
            }
        server.start()
        val port =
            runBlocking {
                server.engine
                    .resolvedConnectors()
                    .first()
                    .port
            }

        val stopDuration =
            writeActionOnEdt {
                thread(isDaemon = true) {
                    runCatching { URI("http://localhost:$port/read").toURL().readText() }
                }
                assertTrue(handlerStarted.await(30, TimeUnit.SECONDS))
                measureTimeMillis { server.stopBounded(100, 500, 3_000) }
            }

        assertTrue("Stopping the server took $stopDuration ms", stopDuration < 10_000)
    }
}
