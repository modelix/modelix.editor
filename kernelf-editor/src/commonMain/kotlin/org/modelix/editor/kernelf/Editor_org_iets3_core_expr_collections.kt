package org.modelix.editor.kernelf

import org.iets3.core.expr.collections.L_org_iets3_core_expr_collections
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_org_iets3_core_expr_collections =
    languageAspects(L_org_iets3_core_expr_collections) {
        editor(language.AsSingletonList) {
            "toList".constant()
        }
        editor(language.BracketOp) {
            concept.expr.cell()
            noSpace()
            squareBrackets {
                concept.index.cell()
            }
        }
        editor(language.CollectionSizeSpec) {
            angleBrackets {
                concept.min.cell()
                "|".constant()
                concept.max.cell()
            }
        }
        editor(language.CollectionType) {
            "collection".constant()
            noSpace()
            angleBrackets {
                concept.baseType.cell()
            }
            optional {
                concept.sizeConstraint.cell()
            }
        }
        editor(language.ElementTypeConstraintMap) {
            noSpace()
            angleBrackets {
                concept.typeConstraint1.cell()
                noSpace()
                ",".constant()
                concept.typeConstraint2.cell()
            }
        }
        editor(language.ElementTypeConstraintSingle) {
            noSpace()
            angleBrackets {
                concept.typeConstraint.cell()
            }
        }
        editor(language.IndexExpr) {
            "index".constant()
        }
        editor(language.KeyValuePair) {
            concept.key.cell()
            noSpace()
            "->".constant()
            noSpace()
            concept.`val`.cell()
        }
        editor(language.ListInsertOp) {
            "insert".constant()
            noSpace()
            parentheses {
                concept.index.cell()
                noSpace()
                ",".constant()
                concept.arg.cell()
            }
        }
        editor(language.ListLiteral) {
            "list".constant()
            optional {
                concept.typeConstraint.cell()
            }
            noSpace()
            parentheses {
                concept.elements.horizontal {
                    separator {
                        noSpace()
                        ",".constant()
                    }
                }
            }
        }
        editor(language.ListPickOp) {
            "pick".constant()
            noSpace()
            squareBrackets {
                concept.selectorList.cell()
            }
        }
        editor(language.ListType) {
            "list".constant()
            noSpace()
            angleBrackets {
                concept.baseType.cell()
            }
            optional {
                concept.sizeConstraint.cell()
            }
        }
        editor(language.MaxOp) {
            "max".constant()
        }
        editor(language.MapKeysOp) {
            "keys".constant()
        }
        editor(language.MapLiteral) {
            "map".constant()
            optional {
                concept.typeConstraint.cell()
            }
            noSpace()
            parentheses {
                concept.elements.horizontal(",")
            }
        }
        editor(language.MapSizeOp) {
            "size".constant()
        }
        editor(language.MapType) {
            "map".constant()
            noSpace()
            angleBrackets {
                concept.keyType.cell()
                noSpace()
                ",".constant()
                concept.valueType.cell()
            }
        }
        editor(language.MapValuesOp) {
            "values".constant()
        }
        editor(language.MinOp) {
            "min".constant()
        }
        editor(language.SetLiteral) {
            "set".constant()
            optional {
                concept.typeConstraint.cell()
            }
            noSpace()
            parentheses {
                concept.elements.horizontal(",")
            }
        }
        editor(language.SetType) {
            "set".constant()
            noSpace()
            angleBrackets {
                concept.baseType.cell()
            }
        }
        editor(language.SimpleSortOp) {
            "sort".constant()
            noSpace()
            parentheses {
                concept.order.cell()
            }
        }
        editor(language.UpToTarget) {
            "upto".constant()
            noSpace()
            parentheses {
                concept.max.cell()
            }
        }
    }
