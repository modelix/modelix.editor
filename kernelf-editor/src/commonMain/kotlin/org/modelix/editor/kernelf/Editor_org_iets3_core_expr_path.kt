package org.modelix.editor.kernelf

import org.iets3.core.expr.base.N_DotExpression
import org.iets3.core.expr.path.L_org_iets3_core_expr_path
import org.iets3.core.expr.toplevel.N_RecordType
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor
import org.modelix.metamodel.ITypedNode
import org.modelix.metamodel.typed
import org.modelix.scopes.scope
import org.modelix.typesystem.type

val Editor_org_iets3_core_expr_path =
    languageAspects(L_org_iets3_core_expr_path) {
        editor(language.PathElement) {
            concept.member.cell({ name })
            // TODO replace name with path label
        }
        scope(language.PathElement.member) {
            val dot = it.getParent()?.getNode()?.typed() as? N_DotExpression ?: return@scope emptyList()
            val left = dot.expr.get() ?: return@scope emptyList()
            val leftType: ITypedNode = left.type() ?: return@scope emptyList()
            when (leftType) {
                is N_RecordType -> leftType.record.members.toList()
                else -> emptyList()
            }
        }
    }
