package org.modelix.editor.kernelf

import org.iets3.core.expr.toplevel.L_org_iets3_core_expr_toplevel
import org.iets3.core.expr.toplevel.N_EnumDeclaration
import org.iets3.core.expr.toplevel.N_RecordType
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor
import org.modelix.metamodel.typed
import org.modelix.metamodel.untyped
import org.modelix.typesystem.asType
import org.modelix.typesystem.asTypeVariable
import org.modelix.typesystem.typesystem

val Editor_org_iets3_core_expr_toplevel =
    languageAspects(L_org_iets3_core_expr_toplevel) {
        editor(language.AbstractFunctionAdapter) {
            concept.`fun`.cell()
        }
        editor(language.AbstractFunctionLikeAdapter) {
            concept.functionLike.cell()
        }
        editor(language.AbstractToplevelExprAdapter) {
            concept.toplevelExprContent.cell()
        }
        editor(language.AllLitList) {
            "literals".constant()
            noSpace()
            squareBrackets {
                concept.enumType.cell()
            }
        }
//    editor(language.BuilderExpression) {
//        //TODO
//    }
        editor(language.Constant) {
            "val".constant {
                iets3keyword()
            }
            concept.name.cell()
            optional {
                ":".constant()
                concept.type.cell()
            }
            "=".constant()
            concept.value.cell()
        }
        editor(language.ConstantRef) {
            concept.constant.cell()
        }
        editor(language.EmptyMember) {
            "".constant()
        }
        editor(language.EmptyToplevelContent) {
            constant("")
        }
//    editor(language.EnumDeclaration) {
//        //TODO
//    }
        editor(language.EnumIndexOp) {
            "index".constant()
        }
        editor(language.EnumIsInSelector) {
            concept.literal.cell()
        }
        editor(language.EnumIsInTarget) {
            "isIn".constant()
            noSpace()
            parentheses {
                concept.selectors.horizontal(",")
            }
        }
        editor(language.EnumIsTarget) {
            "is".constant()
            noSpace()
            parentheses {
                concept.literal.cell()
            }
        }
        editor(language.EnumLiteral) {
            concept.name.cell()
            withNode {
                if (node
                        .untyped()
                        .parent!!
                        .typed<N_EnumDeclaration>()
                        .type
                        .isSet()
                ) {
                    "->".constant()
                    concept.value.cell()
                }
            }
        }
        editor(language.EnumLiteralRef) {
            concept.literal.cell({
                val enumDecl = untyped().parent!!.typed<N_EnumDeclaration>()
                if (enumDecl.qualified) {
                    enumDecl.name + ":" + name
                } else {
                    name
                }
            })
        }
        editor(language.EnumType) {
            concept.enum.cell()
        }
        editor(language.EnumValueAccessor) {
            "value".constant()
        }
        editor(language.ExtensionFunctionCall) {
            concept.extFun.cell()
            // TODO effect descriptor
            noSpace()
            parentheses {
                concept.args.horizontal(",")
            }
        }
        editor(language.FieldSetter) {
            concept.field.cell()
            concept.value.cell()
        }
        editor(language.Function) {
            concept.ext.flagCell("ext") {
                iets3keyword()
            }
            "fun".constant {
                iets3keyword()
            }
            concept.name.cell()
            optional {
                concept.effect.cell()
            }
            noSpace()
            parentheses {
                concept.args.horizontal(",")
            }
            optional {
                ":".constant()
                concept.type.cell()
            }
            optional {
                concept.contract.cell()
            }
            indented {
                concept.body.cell()
            }
            // TODO ? = for single line body
        }
        typesystem(language.Function) {
            val body = node.body.get()
            val returnType = node.type.get()
            if (returnType != null) {
                node.asTypeVariable() equalTo returnType.asType()
            }
            if (body != null) {
                body.asTypeVariable() subtypeOf node.asTypeVariable()
            }
        }
        editor(language.FunctionCall) {
            concept.function.cell()
            // TODO effect descriptor
            noSpace()
            parentheses {
                concept.args.horizontal()
            }
        }
        typesystem(language.FunctionCall) {
            node.asTypeVariable() equalTo node.function.asTypeVariable()
        }
        editor(language.FunRef) {
            ":".constant()
            noSpace()
            concept.`fun`.cell()
        }
        editor(language.GroupKeyTarget) {
            "key".constant()
        }
        editor(language.GroupMembersTarget) {
            "members".constant()
        }
        editor(language.GroupType) {
            "group".constant()
            noSpace()
            angleBrackets {
                concept.keyType.cell()
                noSpace()
                ",".constant()
                concept.memberType.cell()
            }
        }
        editor(language.InlineRecordMemberAccess) {
            concept.name.cell {
                regex("[_a-zA-Z][_a-zA-Z0-9]*")
            }
        }
        editor(language.InlineRecordType) {
            "record".constant {
                iets3keyword()
            }
            noSpace()
            curlyBrackets {
                concept.members.horizontal(",")
            }
        }
        editor(language.Library) {
            // TODO custom cells
            "library".constant {
                iets3keyword()
            }
            concept.name.cell()
            indented {
                "imports:".constant()
                concept.imports.vertical()
            }
            emptyLine()
            concept.contents.vertical()
        }
        editor(language.NewValueSetter) {
            concept.member.cell()
            optional {
                "=".constant()
                concept.newValue.cell()
            }
        }
        editor(language.OldMemberRef) {
            concept.member.cell()
        }
        editor(language.OldValueExpr) {
            "old".constant()
        }
        editor(language.ProjectIt) {
            "it".constant()
        }
        editor(language.ProjectMember) {
            concept.name.cell()
            "=".constant()
            concept.expr.cell()
        }
        editor(language.ProjectOp) {
            "project".constant()
            noSpace()
            parentheses {
                concept.members.horizontal(",")
            }
        }
        editor(language.QualifierRef) {
            concept.enum.cell()
            noSpace()
            ":".constant()
            noSpace()
            concept.lit.cell()
        }
        editor(language.RecordChangeTarget) {
            "with".constant()
            noSpace()
            parentheses {
                concept.setters.horizontal(",")
            }
        }
        editor(language.RecordDeclaration) {
            optional {
                concept.refFlag.cell()
            }
            "record".constant {
                iets3keyword()
            }
            concept.name.cell()
            curlyBrackets {
                newLine()
                indented {
                    concept.members.vertical()
                }
                newLine()
            }
            optional {
                concept.contract.cell()
            }
        }
        editor(language.RecordLiteral) {
            "#".constant()
            concept.type.cell()
            curlyBrackets {
                newLine()
                concept.memberValues.horizontal(",")
            }
        }
        typesystem(language.RecordLiteral) {
            val recordType = node.type.get() as? N_RecordType
            if (recordType != null) {
                node.asTypeVariable() equalTo recordType.asType()
            }
        }
        editor(language.RecordMember) {
            concept.name.cell()
            ":".constant()
            concept.type.cell()
            optional {
                concept.contract.cell()
            }
        }
        editor(language.RecordMemberRefInConstraint) {
            concept.member.cell()
        }
        editor(language.RecordType) {
            concept.record.cell()
        }
        editor(language.RecordTypeAdapter) {
            concept.type.cell()
        }
        editor(language.ReferenceableFlag) {
            "referenceable".constant {
                iets3keyword()
            }
        }
        editor(language.SectionMarker) {
            concept.label.cell()
            newLine()
            "-----------------------------------".constant()
        }
        editor(language.Typedef) {
            "type".constant {
                iets3keyword()
            }
            concept.name.cell()
            noSpace()
            ":".constant()
            concept.originalType.cell()
            optional {
                concept.contract.cell()
            }
        }
        editor(language.TypedefContractValExpr) {
            "it".constant()
        }
        editor(language.TypedefType) {
            concept.typedef.cell()
        }
    }
