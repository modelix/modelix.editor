package org.modelix.editor

open class CodeCompletionActionWrapper(val wrappedAction: ICodeCompletionAction) : ICodeCompletionAction by wrappedAction {
    override fun shadowedBy(shadowing: ICodeCompletionAction): Boolean {
        return wrappedAction.shadowedBy(if (shadowing is CodeCompletionActionWrapper) shadowing.wrappedAction else shadowing)
    }

    override fun shadows(shadowed: ICodeCompletionAction): Boolean {
        return wrappedAction.shadows(if (shadowed is CodeCompletionActionWrapper) shadowed.wrappedAction else shadowed)
    }
}

class CodeCompletionActionProviderWrapper(
    val wrappedProvider: ICodeCompletionActionProvider,
    val wrapAction: (CodeCompletionParameters, ICodeCompletionAction) -> ICodeCompletionAction,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> {
        return wrappedProvider.getApplicableActions(parameters).map {
            when (it) {
                is ICodeCompletionAction -> wrapAction(parameters, it)
                is ICodeCompletionActionProvider -> CodeCompletionActionProviderWrapper(it, wrapAction)
                else -> throw RuntimeException("Unexpected type: " + it::class)
            }
        }
    }
}

class CodeCompletionActionWithPostprocessor(action: ICodeCompletionAction, val after: () -> Unit) : CodeCompletionActionWrapper(action) {
    override fun execute(editor: EditorComponent): ICaretPositionPolicy? {
        val policy = wrappedAction.execute(editor)
        after()
        return policy
    }
}

class CodeCompletionActionWithCaretPolicy(action: ICodeCompletionAction, val policy: (ICaretPositionPolicy?) -> ICaretPositionPolicy?) : CodeCompletionActionWrapper(action) {
    override fun execute(editor: EditorComponent): ICaretPositionPolicy? {
        return policy(wrappedAction.execute(editor))
    }
}

class CodeCompletionActionWithMatchingText(action: ICodeCompletionAction, val overridingMatchingText: (String) -> String) : CodeCompletionActionWrapper(action) {
    override fun getMatchingText(): String {
        return overridingMatchingText(super.getMatchingText())
    }

    override fun getTokens(): ICompletionTokenOrList {
        return ConstantCompletionToken(getMatchingText())
    }
}

class CodeCompletionActionWithDescription(action: ICodeCompletionAction, val overridingDescription: String) : CodeCompletionActionWrapper(action) {
    override fun getDescription(): String {
        return overridingDescription
    }
}

class CodeCompletionActionWithTokens(action: ICodeCompletionAction, val overrideTokens: (ICompletionTokenOrList) -> ICompletionTokenOrList) : CodeCompletionActionWrapper(action) {
    override fun getTokens(): ICompletionTokenOrList {
        return overrideTokens(super.getTokens())
    }
}

fun ICodeCompletionActionProvider.after(body: () -> Unit): CodeCompletionActionProviderWrapper {
    return CodeCompletionActionProviderWrapper(this) { _, it ->
        CodeCompletionActionWithPostprocessor(it, body)
    }
}

fun ICodeCompletionActionProvider.withMatchingText(text: (CodeCompletionParameters) -> String): CodeCompletionActionProviderWrapper {
    return CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithMatchingText(it, { text(parameters) })
    }
}

fun ICodeCompletionActionProvider.modifyMatchingText(text: (CodeCompletionParameters, String) -> String): CodeCompletionActionProviderWrapper {
    return CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithMatchingText(it, { text(parameters, it) })
    }
}

fun ICodeCompletionActionProvider.withDescription(text: (CodeCompletionParameters) -> String): CodeCompletionActionProviderWrapper {
    return CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithDescription(it, text(parameters))
    }
}

fun ICodeCompletionAction.withMatchingText(text: String): CodeCompletionActionWithMatchingText {
    return CodeCompletionActionWithMatchingText(this, { text })
}

fun ICodeCompletionActionProvider.withTokens(replacement: (ICompletionTokenOrList) -> ICompletionTokenOrList): ICodeCompletionActionProvider {
    return CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithTokens(it, replacement)
    }
}

fun ICodeCompletionAction.withCaretPolicy(policy: (ICaretPositionPolicy?) -> ICaretPositionPolicy?): CodeCompletionActionWithCaretPolicy {
    return CodeCompletionActionWithCaretPolicy(this, policy)
}

fun ICodeCompletionActionProvider.withCaretPolicy(policy: (ICaretPositionPolicy?) -> ICaretPositionPolicy?): CodeCompletionActionProviderWrapper {
    return CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithCaretPolicy(it, policy)
    }
}
