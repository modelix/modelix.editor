package org.modelix.editor.kernelf

import jetbrains.mps.lang.core.N_BaseConcept
import org.iets3.core.expr.base.CN_BinaryExpression
import org.iets3.core.expr.base.C_IRef
import org.iets3.core.expr.base.C_ISingleSymbolRef
import org.iets3.core.expr.base.N_IRef
import org.iets3.core.expr.base.N_ISingleSymbolRef
import org.modelix.aspects.behavior.buildPolymorphicFunction

val binaryExpressionSymbols by buildPolymorphicFunction()
    .returns<String>()
    .forConcept<CN_BinaryExpression>()
    .defaultValue { it.alias ?: ":${it.untyped().getShortName()}:" }
    .delegate()

val ISingleSymbolRef_getSymbolName by buildPolymorphicFunction().returns<String>().forNode(C_ISingleSymbolRef).delegate()

fun N_ISingleSymbolRef.getSymbolName() = ISingleSymbolRef_getSymbolName(this)

val IRef_target by buildPolymorphicFunction().returns<N_BaseConcept>().forNode(C_IRef).delegate()

fun N_IRef.target() = IRef_target(this)
