package org.modelix.editor.kernelf

import org.iets3.core.expr.tests.L_org_iets3_core_expr_tests
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_org_iets3_core_expr_tests =
    languageAspects(L_org_iets3_core_expr_tests) {
        editor(language.AllExpressionsFilter) {
            "expressions everywhere".constant()
        }
        editor(language.AllNodesFilter) {
            "nodes everywhere".constant()
        }
        editor(language.AndMatcher) {
            concept.left.cell()
            "and".constant {
                iets3keyword()
            }
            concept.right.cell()
        }
        editor(language.AssertOptionTestItem) {
            "assert-opt".constant {
                iets3keyword()
            }
            concept.actual.cell()
            "is".constant {
                iets3keyword()
            }
            concept.what.cell()
            // TODO editor component actualAndError
        }
        editor(language.AssertTestItem) {
            optional {
                concept.optionalName.cell()
                "=".constant()
            }
            "assert".constant {
                iets3keyword()
            }
            concept.actual.cell()
            concept.strict.flagCell()
            concept.op.cell()
            concept.expected.cell()
            withNode {
                if (node.isIgnored) {
                    "[ignored]".constant {
                        textColor("red")
                        backgroundColor("orange")
                    }
                }
            }
        }
        editor(language.AssertThatTestItem) {
            optional {
                concept.optionalName.cell()
                "=".constant()
            }
            "assert-that".constant {
                iets3keyword()
            }
            concept.value.cell()
            "is".constant {
                iets3keyword()
            }
            concept.matcher.cell()
            // TODO editor component actualAndError
        }
        editor(language.ConstraintFailedTestItem) {
            "confail".constant {
                iets3keyword()
            }
            concept.actual.cell()
            optional {
                "with error".constant()
                concept.errmsg.cell()
            }
        }
        editor(language.ContainsString) {
            "a string containing".constant()
            concept.text.cell()
        }
        editor(language.EmptyProducer) {
            "empty".constant()
        }
        editor(language.EmptyTestItem) {
            "".constant()
        }
        editor(language.EqualsTestOp) {
            "equals".constant {
                iets3keyword()
            }
        }
        editor(language.EvalAnythingExpr) {
            "evalanything".constant()
            squareBrackets {
                concept.anything.cell()
            }
        }
        editor(language.ForceCastExpr) {
            "forceCast".constant {
                iets3keyword()
            }
            noSpace()
            angleBrackets {
                concept.targetType.cell()
            }
            noSpace()
            parentheses {
                concept.expr.cell()
            }
        }
        editor(language.FunctionSubjectAdapter) {
            "function".constant()
            concept.`fun`.cell({ name })
            newLine()
            "results:".constant()
            concept.checkResults.cell()
            ifNotEmpty(concept.mutator) {
                "mutator:".constant()
                concept.mutator.cell()
            }
        }
        editor(language.IgnoredConcept) {
            "concept".constant()
            noSpace()
            brackets(true, "/", "/") {
                concept.concept.cell({ name })
            }
        }
        editor(language.InputValue) {
            concept.value.cell()
        }
        editor(language.InterpreterCoverageAssResult) {
            concept.concept.cell({ name })
            concept.comment.cell()
        }
        editor(language.InterpreterCoverageAssSummary) {
            "coverage".constant()
            concept.coverageRatio.cell()
        }
        editor(language.InterpreterValueStat) {
            concept.label.cell()
            "=".constant()
            concept.value.cell()
        }
        editor(language.InterpreterValueSummary) {
            "value ranges".constant()
            newLine()
            indented {
                concept.valueStats.vertical()
            }
        }
        editor(language.InvalidInputOutcome) {
            "invalid input".constant()
            // TODO text color
        }
        editor(language.InvalidValueTestItem) {
            "inval".constant {
                iets3keyword()
            }
            concept.actual.cell()
            optional {
                "with error".constant {
                    iets3keyword()
                }
                concept.errmsg.cell()
            }
        }
        editor(language.IsInvalid) {
            "invalid".constant {
                iets3keyword()
            }
            optional {
                "with message".constant {
                    iets3keyword()
                }
                concept.messageMatcher.cell()
            }
        }
        editor(language.IsValidRecord) {
            "a valid record".constant {
                iets3keyword()
            }
        }
        editor(language.LanguageRef) {
            "language".constant()
            brackets(true, "/", ",") {
                concept.lang.cell()
            }
        }
        editor(language.MatcherForAnyRecordType) {
            "matcher-for-any-record-type".constant()
        }
        editor(language.MatcherForAnyType) {
            "macher-for-any-type".constant()
        }
        editor(language.MatcherType) {
            "matcher".constant()
            noSpace()
            angleBrackets {
                concept.forType.cell()
            }
        }
        editor(language.MeasureCoverageFor) {
            "concept".constant()
            brackets(true, "/", "/") {
                concept.concept.cell({ name })
            }
            "complete?".constant()
            // TODO checkbox
        }
//    editor(language.ModelsCoverageAssResult) {
//        //TODO
//    }
        editor(language.ModelsCoverageAssSummary) {
            "coverage".constant()
            concept.coverageRatio.cell()
        }
        editor(language.MutationEngine) {
            "# of mutations".constant()
            concept.numberOfMutations.cell()
            newLine()
            "keep all:".constant()
            concept.keepAll.cell()
            newLine()
            ifNotEmpty(concept.logs) {
                concept.logs.vertical()
            }
        }
        editor(language.MutationLog) {
            "->".constant()
            concept.newNode.cell({ concept.untyped().getShortName() })
        }
        editor(language.MuteEffect) {
            "mute".constant()
            noSpace()
            parentheses {
                concept.expr.cell()
            }
        }
//    editor(language.OldNodeAnnotation) {
//        //TODO
//    }
        editor(language.NamedAssertRef) {
            concept.item.cell({ name })
        }
        editor(language.NoneExpr) {
            "none".constant()
            noSpace()
            angleBrackets {
                concept.expr.cell()
            }
        }
        editor(language.OptExpression) {
            "some".constant()
            noSpace()
            angleBrackets {
                concept.expr.cell()
            }
        }
        editor(language.OutputValue) {
            concept.value.cell()
        }
        editor(language.RealEqualsTestOp) {
            "real-equals".constant {
                iets3keyword()
            }
            noSpace()
            squareBrackets {
                concept.decimals.cell()
            }
        }
        editor(language.ReportTestItem) {
            "report".constant {
                iets3keyword()
            }
            concept.actual.cell()
            "=>".constant()
            // TODO model access
        }
//    editor(language.StackTraceElement) {
//        //TODO
//    }
        editor(language.StructuralCoverageAssQuery) {
            foldable("structural coverage {...}") {
                "structural coverage".constant()
                "in".constant()
                concept.scope.cell()
                newLine()
                indented {
                    "limits:".constant()
                    newLine()
                    indented {
                        "min N    =".constant()
                        concept.minTestCount.cell()
                        newLine()
                        "min V    =".constant()
                        concept.minTestVolume.cell()
                        newLine()
                        "max MinH =".constant()
                        concept.maximalMinHetero.cell()
                        newLine()
                        "min MaxH =".constant()
                        concept.minimumMaxHetero.cell()
                    }
                    newLine()
                    "show limit errors:".constant()
                    // TODO checkbox
                    newLine()
                    "look outside suites:".constant()
                    // TODO checkbox
                    newLine()
                    "track properties:".constant()
                    // TODO checkbox
                    newLine()
                    "nodes filter:".constant()
                    concept.nodesFilter.cell()
                    newLine()
                    "languages:".constant()
                    concept.languages.vertical()
                    newLine()
                    "ignore".constant()
                    concept.ignoredConcepts.vertical()
                }
            }
        }
        editor(language.StructuralCoverageAssResult) {
            concept.concept.cell({ name })
            concept.comment.cell()
        }
        editor(language.StructuralCoverageAssSummary) {
            "coverage".constant()
            concept.coverageRatio.cell()
        }
        editor(language.TestCase) {
            "test case".constant {
                iets3keyword()
            }
            concept.name.cell()
            foldable("{...}") {
                // TODO test status
                optional {
                    "setup".constant()
                    concept.setup.cell()
                }
                ifEmpty(concept.setup) {
                    newLine()
                }
                curlyBrackets {
                    concept.items.vertical()
                }
            }
        }
        editor(language.TestCoverageAssQuery) {
            foldable("test coverage {...}") {
                "test coverage".constant()
                "in".constant()
                concept.scope.cell()
                newLine()
                indented {
                    "effective models:".constant()
                    // TODO custom cell
                    newLine()
                    "problems only:".constant()
                    // TODO checkbox
                    newLine()
                    "measure for:".constant()
                    // TODO calculate number of concepts
                    foldable("{X concepts}") {
                        concept.measureFor.vertical()
                    }
                    newLine()
                    "ignore:".constant()
                    foldable("{X ignored concepts") {
                        concept.ignoredConcepts.vertical()
                    }
                }
            }
        }
//    editor(language.TestItemVectorCollection) {
//        //TODO
//    }
        editor(language.TestSuite) {
            "test suite".constant()
            concept.name.cell()
            emptyLine()
            "-----------------------------------".constant()
            emptyLine()
            concept.contents.vertical()
        }
        editor(language.ValidOutcome) {
            "valid".constant()
            // TODO text color
        }
        editor(language.VectorTestItem) {
            "vectors".constant {
                iets3keyword()
            }
            concept.subject.cell()
            "->".constant()
            concept.vectors.cell()
        }
    }
