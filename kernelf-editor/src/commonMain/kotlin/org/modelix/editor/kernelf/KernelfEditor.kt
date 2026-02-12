package org.modelix.editor.kernelf

import org.modelix.editor.CellTemplateBuilder
import org.modelix.editor.EditorAspect
import org.modelix.editor.EditorEngine

fun CellTemplateBuilder<*, *>.iets3keyword() {
    textColor("DarkBlue")
}

fun CellTemplateBuilder<*, *>.iets3type() {
    textColor("rgb(0, 155, 191)")
    // TODO bold
}

object KernelfEditor {
    fun register(editorEngine: EditorEngine) {
        Editor_de_slisson_mps_richtext.getAspect(EditorAspect).register(editorEngine)
        Editor_jetbrains_mps_lang_test.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_base.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_collections.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_datetime.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_lambda.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_path.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_repl.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_simpleTypes.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_simpleTypes_test.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_tests.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_toplevel.getAspect(EditorAspect).register(editorEngine)
        Editor_org_iets3_core_expr_tracing.getAspect(EditorAspect).register(editorEngine)
    }
}
