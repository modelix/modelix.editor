package org.modelix.editor.text.shared

import io.github.oshai.kotlinlogging.KotlinLogging
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.Channel.Factory.RENDEZVOUS
import kotlinx.coroutines.channels.SendChannel
import kotlinx.coroutines.channels.consumeEach
import kotlinx.coroutines.launch

private val LOG = KotlinLogging.logger { }

fun <E> CoroutineScope.consume(
    capacity: Int = RENDEZVOUS,
    onBufferOverflow: BufferOverflow = BufferOverflow.SUSPEND,
    consumer: suspend (E) -> Unit,
): SendChannel<E> {
    val channel = Channel<E>(capacity = capacity, onBufferOverflow = onBufferOverflow)
    launch {
        channel.consumeEach {
            LOG.trace { "consuming $it" }
            try {
                consumer(it)
                LOG.trace { "consumed $it" }
            } catch (ex: CancellationException) {
                LOG.warn(ex) { "Consuming canceled" }
                throw ex
            } catch (ex: Throwable) {
                LOG.error(ex) { "UI event processing failed" }
            }
        }
        LOG.trace { "consuming done" }
    }
    return channel
}
