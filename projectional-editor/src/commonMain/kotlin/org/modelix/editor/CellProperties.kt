package org.modelix.editor

import org.modelix.editor.text.shared.celltree.BooleanCellPropertyValue
import org.modelix.editor.text.shared.celltree.CellPropertyValue
import org.modelix.editor.text.shared.celltree.CellReferenceListValue
import org.modelix.editor.text.shared.celltree.StringCellPropertyValue

class CellProperties : Freezable() {
    private val properties: MutableMap<CellPropertyKey<*>, Any?> = HashMap()

    operator fun <T> get(key: CellPropertyKey<T>): T = if (properties.containsKey(key)) properties[key] as T else key.defaultValue

    fun isSet(key: CellPropertyKey<*>): Boolean = properties.containsKey(key)

    operator fun <T> set(
        key: CellPropertyKey<T>,
        value: T,
    ) {
        checkNotFrozen()
//        if (isSet(key)) throw IllegalStateException("property '$key' is already set")
        properties[key] = value
    }

    fun copy(): CellProperties = CellProperties().also { it.addAll(this) }

    fun addAll(from: CellProperties) {
        checkNotFrozen()
        properties += from.properties
    }

    fun getKeys(): Set<CellPropertyKey<*>> = properties.keys
}

sealed class CellPropertyKey<E>(
    val name: String,
    val defaultValue: E,
    val inherits: Boolean = false,
    val frontend: Boolean = true,
    /**
     * When true, changing this property also invalidates the cached layout of the cell's descendants, not just of
     * the cell itself and its ancestors. Used for check messages, which are attached to a single cell but underline
     * that cell's whole subtree (the descendants read the message by walking up the cell tree while rendering).
     */
    val invalidatesSubtree: Boolean = false,
) {
    override fun toString() = name

    abstract fun valueToString(value: E): String?

    abstract fun valueFromString(str: String?): E

    abstract fun toSerializableValue(value: E): CellPropertyValue<*>?

    abstract fun fromSerializableValue(value: Any?): E
}

class BooleanCellPropertyKey(
    name: String,
    defaultValue: Boolean,
    inherits: Boolean = false,
    frontend: Boolean = true,
    invalidatesSubtree: Boolean = false,
) : CellPropertyKey<Boolean>(name, defaultValue, inherits, frontend, invalidatesSubtree) {
    override fun valueToString(value: Boolean): String = value.toString()

    override fun valueFromString(str: String?): Boolean = str.toBoolean()

    override fun toSerializableValue(value: Boolean) = BooleanCellPropertyValue(value)

    override fun fromSerializableValue(value: Any?): Boolean = value as Boolean
}

class StringCellPropertyKey(
    name: String,
    defaultValue: String?,
    inherits: Boolean = false,
    frontend: Boolean = true,
    invalidatesSubtree: Boolean = false,
) : CellPropertyKey<String?>(name, defaultValue, inherits, frontend, invalidatesSubtree) {
    override fun valueToString(value: String?): String? = value

    override fun valueFromString(str: String?): String? = str

    override fun toSerializableValue(value: String?) = value?.let { StringCellPropertyValue(it) }

    override fun fromSerializableValue(value: Any?) = value as String?
}

object CellReferenceListPropertyKey :
    CellPropertyKey<List<CellReference>>("cell-references", emptyList(), inherits = false, frontend = true) {
    override fun valueToString(value: List<CellReference>): String? {
        TODO("Not yet implemented")
    }

    override fun valueFromString(str: String?): List<CellReference> {
        TODO("Not yet implemented")
    }

    override fun toSerializableValue(value: List<CellReference>): CellPropertyValue<*>? = CellReferenceListValue(value)

    override fun fromSerializableValue(value: Any?): List<CellReference> = value as List<CellReference>
}

class EnumCellPropertyKey<E : Enum<E>>(
    name: String,
    defaultValue: E,
    val deserializer: (Any?) -> E,
    inherits: Boolean = false,
    frontend: Boolean = true,
) : CellPropertyKey<E>(name, defaultValue, inherits, frontend) {
    override fun valueToString(value: E) = value.name

    override fun valueFromString(str: String?) = if (str == null) defaultValue else deserializer(str)

    override fun toSerializableValue(value: E) = StringCellPropertyValue(value.name)

    override fun fromSerializableValue(value: Any?): E = deserializer(value)
}

inline fun <reified E : Enum<E>> enumCellPropertyKey(
    name: String,
    defaultValue: E,
    inherits: Boolean = false,
    frontend: Boolean = true,
): EnumCellPropertyKey<E> =
    EnumCellPropertyKey<E>(
        name,
        defaultValue,
        { it as? E ?: enumValueOf<E>(it.toString()) },
        inherits,
        frontend
    )

class BackendCellPropertyKey<E>(
    name: String,
    defaultValue: E,
    inherits: Boolean = false,
) : CellPropertyKey<E>(name, defaultValue, inherits, frontend = false) {
    override fun valueToString(value: E): String? = throw UnsupportedOperationException("backend only")

    override fun valueFromString(str: String?): E = throw UnsupportedOperationException("backend only")

    override fun toSerializableValue(value: E): CellPropertyValue<*>? = throw UnsupportedOperationException("backend only")

    override fun fromSerializableValue(value: Any?): E = throw UnsupportedOperationException("backend only")
}

fun <E> CellPropertyKey<E>.from(cell: Cell) = cell.getProperty(this)

enum class ECellLayout {
    VERTICAL,
    HORIZONTAL,
}

enum class ECellType {
    COLLECTION,
    TEXT,
}

object CommonCellProperties {
    val layout = enumCellPropertyKey<ECellLayout>("layout", ECellLayout.HORIZONTAL)
    val type: CellPropertyKey<ECellType> = enumCellPropertyKey<ECellType>("type", ECellType.COLLECTION)
    val indentChildren = BooleanCellPropertyKey("indent-children", false)
    val onNewLine = BooleanCellPropertyKey("on-new-line", false)
    val noSpace = BooleanCellPropertyKey("no-space", false)
    val textColor = StringCellPropertyKey("text-color", null, inherits = true, invalidatesSubtree = true)
    val errorMessage = StringCellPropertyKey("error-message", null, invalidatesSubtree = true)
    val warningMessage = StringCellPropertyKey("warning-message", null, invalidatesSubtree = true)
    val placeholderTextColor =
        StringCellPropertyKey("placeholder-text-color", "lightGray", inherits = true, invalidatesSubtree = true)
    val backgroundColor = StringCellPropertyKey("background-color", null, inherits = true, invalidatesSubtree = true)
    val fontFamily = StringCellPropertyKey("font-family", null, inherits = true, invalidatesSubtree = true)
    val fontSize = StringCellPropertyKey("font-size", null, inherits = true, invalidatesSubtree = true)
    val bold = BooleanCellPropertyKey("bold", false, inherits = true, invalidatesSubtree = true)
    val italic = BooleanCellPropertyKey("italic", false, inherits = true, invalidatesSubtree = true)
    val underlined = BooleanCellPropertyKey("underlined", false, inherits = true, invalidatesSubtree = true)
    val strikeOut = BooleanCellPropertyKey("strike-out", false, inherits = true, invalidatesSubtree = true)
    val textReplacement = StringCellPropertyKey("text-replacement", null)
    val tabTarget = BooleanCellPropertyKey("tab-target", false) // caret is placed into the cell when navigating via TAB
    val selectable = BooleanCellPropertyKey("selectable", false)
    val codeCompletionText = StringCellPropertyKey("code-completion-text", null) // empty string hides the entry
    val isForceShown = BooleanCellPropertyKey("force-shown", false)
    val node = BackendCellPropertyKey<INonExistingNode?>("node", null) // set on the root cell of a node
    val cellCall = BackendCellPropertyKey<CellCreationCall?>("cell-call", null) // set on the root cell of a cell call
    val cellReferences = CellReferenceListPropertyKey
}

object TextCellProperties {
    val text = StringCellPropertyKey(name = "text", defaultValue = null, inherits = false, frontend = true)
    val placeholderText = StringCellPropertyKey(name = "placeholderText", defaultValue = null, inherits = false, frontend = true)
}

fun Cell.isTabTarget() = getProperty(CommonCellProperties.tabTarget)

fun Cell.isSelectable() = getProperty(CommonCellProperties.selectable)
