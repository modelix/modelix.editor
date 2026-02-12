package org.modelix.editor

import org.modelix.model.api.IChildLink
import org.modelix.model.api.IProperty
import org.modelix.model.api.IReferenceLink
import org.modelix.model.api.IRole

class CompletionEntry(
    val tokens: ICompletionTokenOrList,
    val outputType: String,
)

interface ICompletionTokenOrList {
    fun flatten(): List<CompletionToken>

    fun isEmpty(): Boolean = false

    fun normalize(): ICompletionTokenOrList = this

    fun consumeForAutoApply(input: CharSequence): CharSequence?
}

class CompletionTokenList(
    val tokens: List<ICompletionTokenOrList>,
) : ICompletionTokenOrList {
    override fun flatten(): List<CompletionToken> = tokens.flatMap { it.flatten() }

    override fun isEmpty(): Boolean = tokens.isEmpty()

    override fun normalize(): ICompletionTokenOrList {
        val unfiltered = tokens.flatMap { it.normalize().flatten() }
        val filtered = ArrayList<ICompletionTokenOrList>()

        var spaceType: SpaceTokenType = SpaceTokenType.OPTIONAL
        for (token in unfiltered) {
            when (token) {
                is SpaceCompletionToken -> {
                    spaceType = spaceType.merge(token.type)
                }

                else -> {
                    filtered += SpaceCompletionToken(spaceType)
                    filtered += token
                    spaceType = SpaceTokenType.OPTIONAL
                }
            }
        }
        if (filtered.isNotEmpty()) {
            filtered += SpaceCompletionToken(spaceType)
        }

        return filtered.asTokenList()
    }

    override fun consumeForAutoApply(input: CharSequence): CharSequence? {
        var remainingInput: CharSequence? = input
        for (token in tokens) {
            if (remainingInput.isNullOrEmpty()) break
            remainingInput = token.consumeForAutoApply(remainingInput)
        }
        return remainingInput
    }

    override fun toString(): String =
        tokens.withIndex().joinToString("") { (index, token) ->
            if (token is SpaceCompletionToken && (index == 0 || index == tokens.lastIndex)) {
                ""
            } else {
                token.toString()
            }
        }
}

fun List<ICompletionTokenOrList>.asTokenList() = if (size == 1) first() else CompletionTokenList(this)

sealed class CompletionToken : ICompletionTokenOrList {
    var actions: IActionOrProvider? = null
    var highlighted: Boolean = false
    val alternatives: MutableList<CompletionEntry> = ArrayList()

    override fun flatten(): List<CompletionToken> = listOf(this)
}

sealed class RoleToken : CompletionToken() {
    abstract val role: IRole

    override fun toString(): String = "<" + role.getSimpleName() + ">"

    override fun consumeForAutoApply(input: CharSequence): CharSequence? = null
}

class ChildCompletionToken(
    override val role: IChildLink,
) : RoleToken()

class PropertyCompletionToken(
    override val role: IProperty,
) : RoleToken()

class ReferenceCompletionToken(
    override val role: IReferenceLink,
) : RoleToken()

class ConstantCompletionToken(
    val text: String,
) : CompletionToken() {
    override fun toString(): String = text

    override fun consumeForAutoApply(input: CharSequence): CharSequence? =
        if (input.startsWith(text)) {
            input.subSequence(text.length, input.length)
        } else {
            null
        }
}

class SpaceCompletionToken(
    val type: SpaceTokenType,
) : CompletionToken() {
    override fun toString(): String = if (type == SpaceTokenType.NONE) "" else " "

    override fun consumeForAutoApply(input: CharSequence): CharSequence? =
        when (type) {
            SpaceTokenType.NONE -> {
                input
            }

            SpaceTokenType.MANDATORY -> {
                if (input.startsWith(" ")) {
                    input.subSequence(1, input.length)
                } else {
                    null
                }
            }

            SpaceTokenType.OPTIONAL -> {
                if (input.startsWith(" ")) {
                    input.subSequence(1, input.length)
                } else {
                    input
                }
            }
        }
}

enum class SpaceTokenType(
    val prio: Int,
) {
    NONE(3),
    MANDATORY(2),
    OPTIONAL(1),
    ;

    fun merge(other: SpaceTokenType): SpaceTokenType = if (this.prio > other.prio) this else other
}
