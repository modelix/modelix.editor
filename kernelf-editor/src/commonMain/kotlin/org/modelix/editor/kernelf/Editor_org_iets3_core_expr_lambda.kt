package org.modelix.editor.kernelf

import org.iets3.core.expr.lambda.L_org_iets3_core_expr_lambda
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_org_iets3_core_expr_lambda =
    languageAspects(L_org_iets3_core_expr_lambda) {
        editor(language.ArgRef) {
            concept.arg.cell({ name })
        }
        editor(language.AssertExpr) {
            "assert".constant {
                iets3keyword()
            }
            noSpace()
            parentheses {
                concept.expr.cell()
            }
        }
//    editor(language.AttachedConstraint) {
//        //TODO
//    }
        editor(language.BlockExpression) {
            foldable("{...}") {
                curlyBrackets {
                    newLine()
                    indented {
                        concept.expressions.vertical()
                    }
                    newLine()
                }
            }
        }
        editor(language.BindOp) {
            "bind".constant()
            noSpace()
            parentheses {
                concept.args.horizontal(",")
            }
        }
        editor(language.CapturedValue) {
            "!!!user objects are not supported!!!".constant()
        }
        editor(language.ExecOp) {
            "exec".constant()
            noSpace()
            parentheses {
                concept.args.horizontal(",")
            }
        }
        editor(language.FunctionArgument) {
            concept.name.cell()
            noSpace()
            optional {
                ":".constant()
                concept.type.cell()
            }
        }
        editor(language.FunctionStyleExecOp) {
            concept.`fun`.cell()
            noSpace()
            parentheses {
                concept.args.horizontal(",")
            }
        }
        editor(language.FunctionType) {
            parentheses {
                concept.argumentTypes.horizontal(",")
                "=>".constant()
                optional {
                    concept.effect.cell()
                }
                concept.returnType.cell()
            }
        }
        editor(language.FunResExpr) {
            "res".constant {
                iets3keyword()
            }
        }
        editor(language.LambdaArg) {
            concept.name.cell()
            noSpace()
            optional {
                ":".constant()
                concept.type.cell()
            }
        }
        editor(language.LambdaArgRef) {
            concept.arg.cell({ name })
        }
        editor(language.LambdaExpression) {
            brackets(true, "|", "|") {
                concept.args.horizontal(",")
                "=>".constant()
                concept.expression.cell()
            }
        }
        editor(language.LocalVarDeclExpr) {
            "var".constant {
                iets3keyword()
            }
            optional {
                noSpace()
                ":".constant()
                concept.type.cell()
            }
            optional {
                concept.contract.cell()
            }
            "=".constant()
            concept.expr.cell()
        }
        editor(language.LocalVarRef) {
            concept.`var`.cell({ name })
        }
        editor(language.ShortLambdaExpression) {
            brackets(true, "|", "|") {
                concept.expression.cell()
            }
        }
        editor(language.ShortLambdaItExpression) {
            "it".constant()
        }
        editor(language.ValExpression) {
            "val".constant {
                iets3keyword()
            }
            concept.name.cell {
                regex("[_a-zA-Z][_a-zA-Z0-9]*")
            }
            optional {
                ":".constant()
                concept.type.cell()
            }
            optional {
                concept.contract.cell()
            }
            "=".constant()
            concept.expr.cell()
        }
        editor(language.ValRef) {
            concept.`val`.cell({ name })
        }
        editor(language.ValValueInContractExpr) {
            "it".constant()
        }
    }
