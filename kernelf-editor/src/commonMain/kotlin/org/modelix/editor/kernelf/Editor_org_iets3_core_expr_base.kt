package org.modelix.editor.kernelf

import jetbrains.mps.lang.core.N_INamedConcept
import org.iets3.core.expr.base.C_ISingleSymbolRef
import org.iets3.core.expr.base.L_org_iets3_core_expr_base
import org.iets3.core.expr.base.N_IRef
import org.iets3.core.expr.lambda.L_org_iets3_core_expr_lambda
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_org_iets3_core_expr_base =
    languageAspects(L_org_iets3_core_expr_base) {
        val abstractMinMaxAliases =
            mapOf(
                language.MinExpression to "min",
                language.MaxExpression to "max",
            )
        editor(language.AbstractMinMaxExpression) {
            val alias =
                abstractMinMaxAliases[concept]
                    ?: "Unknown MinMaxExpression ${concept.untyped().getLongName()}"
            alias.constant()
            noSpace()
            parentheses {
                concept.values.horizontal(",")
            }
        }
        editor(language.AlternativesExpression) {
            "alt".constant {
                iets3keyword()
            }
            // TODO custom OpeningBracketCell
            concept.alternatives.vertical()
        }
        editor(language.AltOption) {
            concept.`when`.cell()
            "=>".constant()
            concept.then.cell()
        }
        editor(language.AlwaysValue) {
            "always".constant()
        }
        editor(language.AttemptType) {
            "attempt".constant {
                iets3keyword()
            }
            noSpace()
            angleBrackets {
                concept.successType.cell()
                noSpace()
                optional {
                    "|".constant()
                    concept.errorLiterals.horizontal(",")
                }
            }
        }
        editor(language.BangOp) {
            concept.expr.cell()
            noSpace()
            "!".constant()
        }

        binaryExpressionSymbols.implement(language.AssignmentExpr) { ":=" }

        binaryExpressionSymbols.implement(language.DivExpression) { "/" }
        binaryExpressionSymbols.implement(language.MinusExpression) { "-" }
        binaryExpressionSymbols.implement(language.ModExpression) { "%" }
        binaryExpressionSymbols.implement(language.MulExpression) { "*" }
        binaryExpressionSymbols.implement(language.PlusExpression) { "+" }

        binaryExpressionSymbols.implement(language.GreaterEqualsExpression) { ">=" }
        binaryExpressionSymbols.implement(language.GreaterExpression) { ">" }
        binaryExpressionSymbols.implement(language.LessEqualsExpression) { "<=>" }
        binaryExpressionSymbols.implement(language.LessExpression) { "<" }

        binaryExpressionSymbols.implement(language.EqualsExpression) { "==" }
        binaryExpressionSymbols.implement(language.NonStrictEqualsExpression) { "===" }
        binaryExpressionSymbols.implement(language.NotEqualsExpression) { "!=" }

        binaryExpressionSymbols.implement(language.LogicalAndExpression) { "&&" }
        binaryExpressionSymbols.implement(language.LogicalIffExpression) { "<=>" }
        binaryExpressionSymbols.implement(language.LogicalImpliesExpression) { "=>" }
        binaryExpressionSymbols.implement(language.LogicalOrExpression) { "||" }

        binaryExpressionSymbols.implement(language.OptionOrExpression) { "?:" }
        binaryExpressionSymbols.implement(L_org_iets3_core_expr_lambda.FunCompose) { ":o:" }

        editor(language.BinaryExpression, applicableToSubConcepts = true) {
            val symbol = binaryExpressionSymbols(concept)
            concept.left.cell()
            symbol.constant()
            concept.right.cell()
        }
        editor(language.CastExpression) {
            "cast".constant {
                iets3keyword()
            }
            noSpace()
            angleBrackets {
                concept.expectedType.cell()
            }
            noSpace()
            parentheses {
                concept.expr.cell()
            }
        }
        editor(language.CheckTypeConstraintsExpr) {
            "check".constant {
                iets3keyword()
            }
            concept.failIfInvalid.flagCell("failIfInvalid")
            noSpace()
            angleBrackets {
                concept.tp.cell()
            }
            noSpace()
            parentheses {
                concept.expr.cell()
            }
        }
        editor(language.ColonCast) {
            concept.expr.cell()
            noSpace()
            ":".constant()
            noSpace()
            concept.type.cell()
        }
        editor(language.Contract) {
            "where".constant {
                iets3keyword()
            }
            largeBrackets {
                concept.items.vertical()
            }
        }
        editor(language.ContractItem) {
            "".constant()
        }
        editor(language.ConvenientBoolean) {
            concept.value.cell()
        }
        editor(language.ConvenientValueCond) {
            "if".constant()
            concept.expr.cell()
        }
        editor(language.DefaultValueExpression) {
            "default".constant {
                iets3keyword()
            }
            noSpace()
            parentheses {
                concept.type.cell()
            }
        }
        editor(language.DeRefTarget) {
            "deref".constant()
        }
        editor(language.DotExpression) {
            concept.expr.cell()
            noSpace()
            ".".constant()
            noSpace()
            concept.target.cell()
        }
        editor(language.EmptyExpression) {
            "".constant()
        }
        editor(language.EmptyType) {
            "emptytype".constant()
        }
        editor(language.EmptyValue) {
            "empty".constant()
            noSpace()
            optional {
                angleBrackets {
                    concept.type.cell()
                }
            }
        }
        editor(language.ErrorExpression) {
            "error".constant {
                iets3keyword()
            }
            noSpace()
            parentheses {
                concept.error.cell()
            }
        }
        editor(language.ErrorLiteral) {
            concept.name.cell()
        }
        editor(language.ErrorTarget) {
            "err".constant()
        }
        editor(language.FailExpr) {
            "fail".constant {
                iets3keyword()
            }
            noSpace()
            optional {
                angleBrackets {
                    concept.type.cell()
                }
            }
            noSpace()
            squareBrackets {
                concept.message.cell()
            }
            noSpace()
            optional {
                ",".constant()
                concept.contextExpression.cell()
            }
        }
        editor(language.GenericErrorType) {
            "error".constant {
                iets3keyword()
            }
        }
        editor(language.HasValueOp) {
            "hasValue".constant()
        }
        editor(language.IfElseSection) {
            "else".constant {
                iets3keyword()
            }
            concept.expr.cell()
        }
        editor(language.IfExpression) {
            "if".constant {
                iets3keyword()
            }
            concept.condition.cell()
            "then".constant {
                iets3keyword()
            }
            concept.thenPart.cell()
            optional {
                concept.elseSection.cell()
            }
        }
        editor(language.ImplicitValidityValExpr) {
            "it".constant()
        }
        editor(language.InlineMessage) {
            "message".constant()
            noSpace()
            squareBrackets {
                concept.text.cell()
            }
        }
        editor(language.Invariant) {
            "inv".constant {
                iets3keyword()
            }
            concept.warning.flagCell("warning")
            concept.expr.cell()
            optional {
                indented {
                    ":".constant()
                    concept.err.cell()
                }
            }
        }
        ISingleSymbolRef_getSymbolName.implement(C_ISingleSymbolRef) { node ->
            ((node as? N_IRef)?.target() as? N_INamedConcept)?.name ?: "<unnamed>"
        }
        editor(language.ISingleSymbolRef) {
            withNode {
                node.getSymbolName().constant()
            }
        }
        editor(language.IsSomeExpression) {
            "isSome".constant {
                iets3keyword()
            }
            noSpace()
            parentheses {
                concept.expr.cell()
            }
            optional {
                "as".constant()
                concept.optionalName.cell()
            }
        }
        editor(language.JoinType) {
            "join".constant()
            noSpace()
            angleBrackets {
                concept.types.horizontal(",")
            }
        }
        editor(language.LogicalNotExpression) {
            "!".constant()
            noSpace()
            concept.expr.cell()
        }
        editor(language.MakeRefTarget) {
            "ref".constant()
        }
        editor(language.MessageValueType) {
            "message".constant()
        }
        editor(language.NeverValue) {
            "never".constant()
        }
        editor(language.NoneLiteral) {
            "none".constant {
                iets3keyword()
            }
            optional {
                noSpace()
                angleBrackets {
                    concept.optionalBaseType.cell()
                }
            }
        }
        editor(language.NoneType) {
            "none".constant {
                iets3keyword()
            }
        }
        editor(language.OkTarget) {
            "ok".constant()
        }
        editor(language.OneOfTarget) {
            "oneOf".constant()
            noSpace()
            squareBrackets {
                concept.values.horizontal(",")
            }
        }
        editor(language.OperatorGroup) {
            "join".constant {
                iets3keyword()
            }
            noSpace()
            angleBrackets {
                concept.tag.cell()
            }
            largeBrackets {
                concept.expressions.vertical()
            }
        }
        val operatorTagSymbols =
            mapOf(
                language.AndTag to "&&",
                language.MulTag to "*",
                language.OrTag to "||",
                language.PlusTag to "+",
            )
        editor(language.OperatorTag, applicableToSubConcepts = true) {
            val symbol =
                operatorTagSymbols[concept]
                    ?: "Unknown operator tag ${concept.untyped().getLongName()}"
            symbol.constant()
        }
        editor(language.OptionType) {
            "opt".constant {
                iets3keyword()
            }
            noSpace()
            angleBrackets {
                concept.baseType.cell()
            }
        }
        editor(language.ParensExpression) {
            parentheses {
                concept.expr.cell()
            }
        }
        editor(language.PlainConstraint) {
            concept.warning.flagCell("warning")
            concept.expr.cell()
            optional {
                ":".constant()
                concept.err.cell()
            }
        }
        editor(language.Postcondition) {
            "post".constant {
                iets3keyword()
            }
            concept.warning.flagCell("warning")
            concept.expr.cell()
            optional {
                ":".constant()
                concept.err.cell()
            }
        }
        editor(language.Precondition) {
            "pre".constant {
                iets3keyword()
            }
            concept.warning.flagCell("warning")
            concept.expr.cell()
            optional {
                ":".constant()
                concept.err.cell()
            }
        }
        editor(language.PrimitiveType) {
            (concept.alias ?: concept.untyped().getShortName()).constant {
                iets3type()
            }
        }
        editor(language.ProgramLocationOp) {
            "url".constant()
        }
        editor(language.ProgramLocationType) {
            "loc".constant()
        }
        editor(language.RangeTarget) {
            "inRange".constant()
            noSpace()
            concept.lowerExcluding.booleanCell("]", "[")
            noSpace()
            squareBrackets {
                concept.min.cell()
                "..".constant()
                concept.max.cell()
            }
            noSpace()
            concept.upperExcluding.booleanCell("[", "]")
        }
//    editor(language.ReductionInspector) {
//        //TODO
//    }
        editor(language.ReferenceType) {
            "ref".constant {
                iets3keyword()
            }
            noSpace()
            angleBrackets {
                concept.baseType.cell()
            }
        }
//    editor(language.Revealer) {
//        //TODO
//    }
        editor(language.RevealerThis) {
            "revealed".constant()
        }
//    editor(language.SimpleExpressionValueInspector) {
//        //TODO
//    }
        editor(language.SomeValExpr) {
            concept.someQuery.cell(presentation = {
                expr.read { exprNode ->
                    if (exprNode == null) {
                        null
                    } else {
                        exprNode
                            .unwrap()
                            .getReferenceRoles()
                            .map { exprNode.unwrap().getReferenceTarget(it) }
                            .filterIsInstance<N_INamedConcept>()
                            .map { it.name }
                            .firstOrNull()
                    }
                }
            })
        }
        editor(language.SpecificErrorType) {
            "error".constant()
            noSpace()
            angleBrackets {
                concept.error.cell()
            }
        }
        editor(language.SuccessExpression) {
            "success".constant {
                iets3keyword()
            }
            noSpace()
            parentheses {
                concept.expr.cell()
            }
        }
        editor(language.SuccessType) {
            "success".constant()
            noSpace()
            angleBrackets {
                concept.baseType.cell()
            }
        }
        editor(language.SuccessValueExpr) {
            concept.`try`.cell({ name })
        }
        editor(language.ThisExpression) {
            "this".constant {
                iets3keyword()
            }
        }
        editor(language.TracerExpression) {
            squareBrackets {
                concept.traced.cell()
            }
        }
        editor(language.TryErrorClause) {
            "error".constant {
                iets3keyword()
            }
            noSpace()
            optional {
                angleBrackets {
                    concept.errorLiteral.cell()
                    "=>".constant()
                    concept.expr.cell()
                }
            }
        }
        editor(language.TryExpression) {
            "try".constant {
                iets3keyword()
            }
            concept.complete.flagCell("complete")
            concept.expr.cell()
            optional {
                "as".constant()
                concept.optionalName.cell()
            }
            concept.successClause.cell()
            newLine()
            indented {
                concept.errorClauses.vertical()
            }
        }
        editor(language.TrySuccessClause) {
            "=>".constant()
            concept.expr.cell()
        }
        editor(language.TupleAccessExpr) {
            concept.tuple.cell()
            noSpace()
            squareBrackets {
                concept.index.cell()
            }
        }
        editor(language.TupleType) {
            squareBrackets {
                concept.elementTypes.horizontal(",")
            }
        }
        editor(language.TupleValue) {
            squareBrackets {
                concept.values.horizontal(",")
            }
        }
        editor(language.UnaryMinusExpression) {
            "-".constant()
            noSpace()
            concept.expr.cell()
        }
        editor(language.ValidityType) {
            "validity".constant()
        }
        editor(language.VoidType) {
            "void".constant()
        }
    }
