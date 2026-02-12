package org.modelix.editor.text.backend

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.launch

/**
 * When calling invalidate(), the `validator` function is executed, but avoid executing it too often when there are
 * many invalidate() calls.
 */
class Validator(
    val coroutineScope: CoroutineScope,
    private val validator: suspend () -> Unit,
) {
    private val channel = Channel<Unit>(capacity = 1, onBufferOverflow = BufferOverflow.DROP_LATEST)
    private var validationJob: Job? = null

    fun invalidate() {
        channel.trySend(Unit)
    }

    fun start() {
        check(validationJob?.isActive != true) { "Already started" }
        validationJob =
            coroutineScope.launch {
                for (x in channel) {
                    try {
                        validator()
                    } catch (ex: CancellationException) {
                        throw ex
                    } catch (ex: Throwable) {
                        LOG.error(ex) { "Validation failed" }
                    }
                }
            }
    }

    fun stop() {
        validationJob?.cancel("stopped")
        validationJob = null
    }

    companion object {
        private val LOG = KotlinLogging.logger { }
    }
}
