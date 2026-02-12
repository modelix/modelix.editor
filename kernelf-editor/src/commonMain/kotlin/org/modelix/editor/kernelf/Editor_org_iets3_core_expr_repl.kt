package org.modelix.editor.kernelf

import org.iets3.core.expr.repl.L_org_iets3_core_expr_repl
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_org_iets3_core_expr_repl =
    languageAspects(L_org_iets3_core_expr_repl) {
        val borderCellStyles =
            mapOf(
                language.BottomBorderCellStyle to "bottom border",
                language.LeftBorderCellStyle to "left border",
                language.RightBorderCellStyle to "right border",
                language.TopBorderCellStyle to "top border",
            )
        editor(language.BorderCellStyle) {
            val alias =
                borderCellStyles[concept]
                    ?: "Unknown BorderCellStyle: ${concept.untyped().getLongName()}"
            alias.constant()
            concept.width.cell()
        }
//    editor(language.Cell) {
//        //TODO
//    }
        editor(language.CellArg) {
            concept.name.cell()
            noSpace()
            optional {
                concept.type.cell()
            }
        }
        editor(language.CellArgRef) {
            concept.arg.cell({ name })
        }
        editor(language.CellConstraint) {
            "type:".constant()
            concept.type.cell()
            newLine()
            "where".constant()
            concept.constraint.cell()
        }
        editor(language.CellConstraintIt) {
            "it".constant()
        }
        editor(language.CellLabel) {
            concept.name.cell()
            noSpace()
            ":".constant()
        }
        editor(language.CoordCellRef) {
            "$".constant()
            noSpace()
            optional {
                concept.finder.cell()
                noSpace()
                "/".constant()
            }
            concept.cell.cell()
            // TODO argList if needActuals
        }
//    editor(language.DefaultEntry) {
//        //TODO
//    }
        val fontStyles =
            mapOf(
                language.FontBoldStyle to "font-bold",
            )
        editor(language.FontStyle) {
            val alias = fontStyles[concept] ?: "Unknown font style: ${concept.untyped().getLongName()}"
            alias.constant()
        }
        editor(language.LabelExpression) {
            "'".constant()
            noSpace()
            concept.text.cell()
        }
        editor(language.MakeListExpr) {
            "makeList".constant()
            noSpace()
            squareBrackets {
                concept.from.cell()
                noSpace()
                "..".constant()
                noSpace()
                concept.to.cell()
            }
        }
        editor(language.MakeRecordExpr) {
            "makeRecord".constant()
            noSpace()
            angleBrackets {
                concept.record.cell()
            }
            noSpace()
            squareBrackets {
                concept.from.cell()
                noSpace()
                "..".constant()
                noSpace()
                concept.to.cell()
            }
        }
        editor(language.NamedCellRef) {
            concept.label.cell({ name })
            // TODO argList if needActuals
        }
        editor(language.NamedSheetFinder) {
            concept.sheet.cell({ name })
        }
        editor(language.QuoteExpr) {
            "quote".constant()
            noSpace()
            parentheses {
                concept.cell.cell()
            }
        }
//    editor(language.REPL) {
//        //TODO
//    }
//    editor(language.ReplEntryRef) {
//        //TODO
//    }
        editor(language.ReplEntryRefByName) {
            concept.entry.cell({ optionalName }) {
                textColor("blue")
            }
        }
//    editor(language.Sheet) {
//        //TODO
//    }
        editor(language.SheetEmbedExpr) {
            ifEmpty(concept.sheet) {
                "new sheet from".constant {
                    iets3keyword()
                }
                concept.template.cell({ name })
                "will be".constant {
                    iets3keyword()
                }
                concept.cols.cell()
                "cols and".constant {
                    iets3keyword()
                }
                concept.rows.cell()
                "rows".constant {
                    iets3keyword()
                }
            }
            ifNotEmpty(concept.sheet) {
                concept.sheet.cell()
            }
        }
        editor(language.SheetTestItem) {
            ifEmpty(concept.sheet) {
                "new sheet will be".constant()
                concept.cols.cell()
                "cols and".constant {
                    iets3keyword()
                }
                concept.rows.cell()
                "rows".constant {
                    iets3keyword()
                }
            }
            ifNotEmpty(concept.sheet) {
                concept.sheet.cell()
            }
        }
        editor(language.SheetType) {
            "sheet".constant()
            noSpace()
            angleBrackets {
                concept.template.cell({ name })
            }
        }
//    editor(language.TopLevelSheet) {
//        //TODO
//    }
        editor(language.UpwardsSheetFinder) {
            "..".constant()
        }
    }
