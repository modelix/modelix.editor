package org.modelix.react.ssr.mps.test

import com.microsoft.playwright.Browser
import com.microsoft.playwright.Page
import com.microsoft.playwright.Playwright
import kotlinx.coroutines.delay
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.AfterAll
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test
import org.testcontainers.containers.GenericContainer
import org.testcontainers.containers.wait.strategy.Wait
import org.testcontainers.utility.MountableFile
import java.io.File
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import kotlin.time.Duration.Companion.minutes
import kotlin.time.Duration.Companion.seconds
import kotlin.time.toJavaDuration

class PagesTest {

    companion object {
        var mps: GenericContainer<*>? = null
        var playwright: Playwright? = null
        var browser: Browser? = null

        @BeforeAll
        @JvmStatic
        fun beforeAll() {
            mps = GenericContainer("modelix/mps-vnc-baseimage:0.9.4-mps2023.2")
                .withCopyFileToContainer(MountableFile.forHostPath(File(System.getenv("MODELIX_MPS_PLUGINS_PATH")).toPath()), "/mps/plugins")
                .withCopyFileToContainer(MountableFile.forHostPath(File(System.getenv("MODELIX_TEST_LANGUAGES_PATH")).toPath()), "/mps-languages")
                .withExposedPorts(43595)
//            .waitingFor(Wait.forListeningPort().withStartupTimeout(3.minutes.toJavaDuration()))
                .waitingFor(Wait.forHttp("/pages/modelix/test/modules-list/").withStartupTimeout(3.minutes.toJavaDuration()))
                .withLogConsumer {
                    println(it.utf8StringWithoutLineEnding)
                }
                .also { it.start() }
            playwright = Playwright.create()
            browser = playwright!!.chromium().launch()
        }

        @AfterAll
        @JvmStatic
        fun afterAll() {
            browser?.close()
            browser = null
            playwright?.close()
            playwright = null
            mps?.stop()
            mps = null
        }
    }

    @Test
    fun `custom page is available`() = runBrowserTest("pages/modelix/test/modules-list/") { page ->
        page.locator("ul").waitFor()
        val content = page.content()
        println(content)
        assertTrue(content.contains("""<li class="module">"""))
        assertTrue(content.contains("""Module: org.modelix.mps.react"""))
    }

    @Test
    fun `text field is editable`() = runBrowserTest("pages/modelix/test/text-field/") { page ->
        val textField = page.locator("input")
        val readOnlyText = page.locator("div[class='name']")
        textField.waitFor()
        val content = page.content()
        println(content)
        assertEquals("MyClass", textField.getAttribute("value"))
        assertEquals("MyClass", readOnlyText.textContent())

        textField.fill("MyChangedClass")
        page.locator("div:has-text('MyChangedClass')[class='name']").waitFor()
        assertEquals("MyChangedClass", textField.getAttribute("value"))
        assertEquals("MyChangedClass", readOnlyText.textContent())
    }

    suspend fun Page.waitForContent(expected: String) {
        for (i in 1..10) {
            delay(1.seconds)
            if (content().contains(expected)) return
        }
        error("Content not found.\n\n${content()}")
    }

    private fun runBrowserTest(path: String, body: suspend (Page) -> Unit) = runTest {
        browser!!.newPage().use { page ->
            page.navigate("http://localhost:${mps!!.firstMappedPort}/$path")
            body(page)
        }
    }
}
