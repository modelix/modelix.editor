package org.modelix.editor.kernelf

import org.iets3.core.expr.simpleTypes.tests.L_org_iets3_core_expr_simpleTypes_tests
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_org_iets3_core_expr_simpleTypes_test =
    languageAspects(L_org_iets3_core_expr_simpleTypes_tests) {
        editor(language.EqClassProducer) {
            "eqclass".constant()
        }
        editor(language.RandomVectorProducer) {
            "random".constant()
            concept.count.cell()
            "only interesting".constant()
            concept.onlyInteresing.cell()
        }
    }
