package org.modelix.react.ssr.server

import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject

sealed interface IJsonElement

sealed interface IJsonObject : IJsonElement

sealed interface IJsonArray : IJsonElement

fun JsonArray.wrap(): IJsonArray = JsonArrayAdapter(this)

fun JsonObject.wrap(): IJsonObject = JsonObjectAdapter(this)

fun JsonElement.wrap(): IJsonElement =
    when (this) {
        is JsonObject -> JsonObjectAdapter(this)
        is JsonArray -> JsonArrayAdapter(this)
        else -> JsonElementAdapter(this)
    }

fun IJsonArray.unwrap(): JsonArray =
    when (this) {
        is JsonArrayAdapter -> this.element
    }

fun IJsonObject.unwrap(): JsonObject =
    when (this) {
        is JsonObjectAdapter -> this.element
    }

fun IJsonElement.unwrap() =
    when (this) {
        is JsonArrayAdapter -> this.element
        is JsonObjectAdapter -> this.element
        is JsonElementAdapter -> this.element
    }

private class JsonObjectAdapter(
    val element: JsonObject,
) : IJsonObject

private class JsonArrayAdapter(
    val element: JsonArray,
) : IJsonArray

private class JsonElementAdapter(
    val element: JsonElement,
) : IJsonElement
