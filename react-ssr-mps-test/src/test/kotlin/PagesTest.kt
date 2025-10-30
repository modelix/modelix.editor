package org.modelix.react.ssr.mps.test

import com.microsoft.playwright.Playwright
import junit.framework.TestCase
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeout
import org.testcontainers.containers.GenericContainer
import org.testcontainers.containers.wait.strategy.Wait
import org.testcontainers.utility.MountableFile
import java.io.File
import kotlin.time.Duration.Companion.minutes
import kotlin.time.Duration.Companion.seconds
import kotlin.time.ExperimentalTime
import kotlin.time.toJavaDuration

class PagesTest : TestCase() {

    fun `test custom page`() = runWithMPS { port ->
        Playwright.create().use { playwright ->
            val browser = playwright.chromium().launch()
            val page = browser.newPage()
            page.navigate("http://localhost:$port/pages/modelix/test/modules-list/")
            for (i in 1..10) {
                delay(1.seconds)
                if (page.content().contains("""<li class="module">""")) break
            }
            val content = page.content()
            println(content)
            assertTrue(content.contains("""<li class="module">"""))
            assertTrue(content.contains("""Module: org.modelix.mps.react"""))
        }
    }
}

fun runWithMPS(
    body: suspend (port: Int) -> Unit,
) = runBlocking {
    @OptIn(ExperimentalTime::class)
    withTimeout(5.minutes) {
        val mps: GenericContainer<*> = GenericContainer("modelix/mps-vnc-baseimage:0.9.4-mps${System.getenv("MPS_VERSION")}")
            .withCopyFileToContainer(MountableFile.forHostPath(File(System.getenv("MODELIX_MPS_PLUGINS_PATH")).toPath()), "/mps/plugins")
            .withCopyFileToContainer(MountableFile.forHostPath(File(System.getenv("MODELIX_TEST_LANGUAGES_PATH")).toPath()), "/mps-languages")
            .withExposedPorts(43595)
//            .waitingFor(Wait.forListeningPort().withStartupTimeout(3.minutes.toJavaDuration()))
            .waitingFor(Wait.forHttp("/pages/modelix/test/modules-list/").withStartupTimeout(3.minutes.toJavaDuration()))
            .withLogConsumer {
                println(it.utf8StringWithoutLineEnding)
            }

        mps.start()
        try {
            body(mps.firstMappedPort)
        } finally {
            mps.stop()
        }
    }
}
