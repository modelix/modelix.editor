package org.modelix.editor

import org.modelix.editor.text.backend.BackendEditorComponent

open class CodeCompletionActionWrapper(
    val wrappedAction: ICodeCompletionAction,
) : ICodeCompletionAction by wrappedAction {
    override fun shadowedBy(shadowing: ICodeCompletionAction): Boolean =
        wrappedAction.shadowedBy(if (shadowing is CodeCompletionActionWrapper) shadowing.wrappedAction else shadowing)

    override fun shadows(shadowed: ICodeCompletionAction): Boolean =
        wrappedAction.shadows(if (shadowed is CodeCompletionActionWrapper) shadowed.wrappedAction else shadowed)
}

class CodeCompletionActionProviderWrapper(
    val wrappedProvider: ICodeCompletionActionProvider,
    val wrapAction: (CodeCompletionParameters, ICodeCompletionAction) -> ICodeCompletionAction,
) : ICodeCompletionActionProvider {
    override fun getApplicableActions(parameters: CodeCompletionParameters): List<IActionOrProvider> =
        wrappedProvider.getApplicableActions(parameters).map {
            when (it) {
                is ICodeCompletionAction -> wrapAction(parameters, it)
                is ICodeCompletionActionProvider -> CodeCompletionActionProviderWrapper(it, wrapAction)
                else -> throw RuntimeException("Unexpected type: " + it::class)
            }
        }
}

class CodeCompletionActionWithPostprocessor(
    action: ICodeCompletionAction,
    val after: () -> Unit,
) : CodeCompletionActionWrapper(action) {
    override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? {
        val policy = wrappedAction.execute(editor)
        after()
        return policy
    }
}

class CodeCompletionActionWithCaretPolicy(
    action: ICodeCompletionAction,
    val policy: (ICaretPositionPolicy?) -> ICaretPositionPolicy?,
) : CodeCompletionActionWrapper(action) {
    override fun execute(editor: BackendEditorComponent): ICaretPositionPolicy? = policy(wrappedAction.execute(editor))
}

class CodeCompletionActionWithMatchingText(
    action: ICodeCompletionAction,
    val overridingMatchingText: (String) -> String,
) : CodeCompletionActionWrapper(action) {
    override fun getMatchingText(): String = overridingMatchingText(super.getMatchingText())

    override fun getTokens(): ICompletionTokenOrList = ConstantCompletionToken(getMatchingText())
}

class CodeCompletionActionWithDescription(
    action: ICodeCompletionAction,
    val overridingDescription: String,
) : CodeCompletionActionWrapper(action) {
    override fun getDescription(): String = overridingDescription
}

class CodeCompletionActionWithTokens(
    action: ICodeCompletionAction,
    val overrideTokens: (ICompletionTokenOrList) -> ICompletionTokenOrList,
) : CodeCompletionActionWrapper(action) {
    override fun getTokens(): ICompletionTokenOrList = overrideTokens(super.getTokens())
}

fun ICodeCompletionActionProvider.after(body: () -> Unit): CodeCompletionActionProviderWrapper =
    CodeCompletionActionProviderWrapper(this) { _, it ->
        CodeCompletionActionWithPostprocessor(it, body)
    }

fun ICodeCompletionActionProvider.withMatchingText(text: (CodeCompletionParameters) -> String): CodeCompletionActionProviderWrapper =
    CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithMatchingText(it, { text(parameters) })
    }

fun ICodeCompletionActionProvider.modifyMatchingText(
    text: (CodeCompletionParameters, String) -> String,
): CodeCompletionActionProviderWrapper =
    CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithMatchingText(it, { text(parameters, it) })
    }

fun ICodeCompletionActionProvider.withDescription(text: (CodeCompletionParameters) -> String): CodeCompletionActionProviderWrapper =
    CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithDescription(it, text(parameters))
    }

fun ICodeCompletionAction.withMatchingText(text: String): CodeCompletionActionWithMatchingText =
    CodeCompletionActionWithMatchingText(this, {
        text
    })

fun ICodeCompletionActionProvider.withTokens(
    replacement: (ICompletionTokenOrList) -> ICompletionTokenOrList,
): ICodeCompletionActionProvider =
    CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithTokens(it, replacement)
    }

fun ICodeCompletionAction.withCaretPolicy(policy: (ICaretPositionPolicy?) -> ICaretPositionPolicy?): CodeCompletionActionWithCaretPolicy =
    CodeCompletionActionWithCaretPolicy(this, policy)

fun ICodeCompletionActionProvider.withCaretPolicy(
    policy: (ICaretPositionPolicy?) -> ICaretPositionPolicy?,
): CodeCompletionActionProviderWrapper =
    CodeCompletionActionProviderWrapper(this) { parameters, it ->
        CodeCompletionActionWithCaretPolicy(it, policy)
    }
