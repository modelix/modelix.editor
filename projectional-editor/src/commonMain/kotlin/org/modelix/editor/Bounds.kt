package org.modelix.editor

import kotlinx.serialization.Serializable
import kotlin.jvm.JvmName
import kotlin.math.max
import kotlin.math.min

@Serializable
data class Bounds(
    val x: Double,
    val y: Double,
    val width: Double,
    val height: Double,
) {
    fun maxX() = x + width

    fun maxY() = y + height

    fun minX() = x

    fun minY() = y

    companion object {
        val ZERO = Bounds(0.0, 0.0, 0.0, 0.0)
    }
}

fun Bounds.relativeTo(origin: Bounds): Bounds =
    Bounds(
        x - origin.x,
        y - origin.y,
        width,
        height,
    )

@JvmName("union_nullable")
fun Bounds?.union(other: Bounds?): Bounds? = if (this == null) other else union(other)

fun Bounds.union(other: Bounds?): Bounds {
    if (other == null) return this
    val minX = min(minX(), other.minX())
    val maxX = max(maxX(), other.maxX())
    val minY = min(minY(), other.minY())
    val maxY = max(maxY(), other.maxY())
    return Bounds(minX, minY, maxX - minX, maxY - minY)
}

fun Bounds.translated(
    deltaX: Double,
    deltaY: Double,
) = copy(x = x + deltaX, y = y + deltaY)

fun Bounds.expanded(delta: Double) =
    copy(
        x = x - delta,
        y = y - delta,
        width = width + delta * 2.0,
        height = height + delta * 2.0,
    )

fun Bounds.contains(
    x: Double,
    y: Double,
): Boolean = (minX()..maxX()).contains(x) && (minY()..maxY()).contains(y)
