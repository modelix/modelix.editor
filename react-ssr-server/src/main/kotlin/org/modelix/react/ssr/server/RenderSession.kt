package org.modelix.react.ssr.server

import org.modelix.incremental.TrackableMap

class RenderSession {
    val allStates = TrackableMap<String, Any>()
    val messageHandlers: MutableMap<String, suspend (MessageFromClient) -> Unit> = HashMap()
    var lastViewModel: ViewModel? = null
}
