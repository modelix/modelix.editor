package org.modelix.presentation

import org.modelix.model.api.IProperty

/**
 * How a property value is written, where the model holds it in a form that is not the form it is read and typed in.
 *
 * An MPS enumeration is the case this exists for: the model stores `gZ5fh_4/error`, and the editor has to show
 * `error` and accept `error` back. MPS does the same conversion in its editor rather than in the model - see
 * `jetbrains.mps.nodeEditor.cells.PropertyAccessor`, whose `getText` is `getPresentation(value)` and whose `setText`
 * is `fromPresentation(text)` - because the stored form is what persistence and synchronisation need to keep seeing.
 *
 * A provider returns null for a value or a property it has nothing to say about, and the stored text is then used
 * as it is. That is also what happens to text that is not a valid value yet, which is every prefix of one while it
 * is being typed.
 */
object PropertyPresentationAspect {
    val providers: MutableSet<IPropertyPresentation> = HashSet()

    /** The stored value as it should be read. Null when no provider converts it. */
    fun toPresentation(
        property: IProperty,
        storedValue: String,
    ): String? = providers.firstNotNullOfOrNull { it.toPresentation(property, storedValue) }

    /** Typed text as it should be stored. Null when no provider recognises it. */
    fun fromPresentation(
        property: IProperty,
        text: String,
    ): String? = providers.firstNotNullOfOrNull { it.fromPresentation(property, text) }
}

interface IPropertyPresentation {
    fun toPresentation(
        property: IProperty,
        storedValue: String,
    ): String?

    fun fromPresentation(
        property: IProperty,
        text: String,
    ): String?
}
