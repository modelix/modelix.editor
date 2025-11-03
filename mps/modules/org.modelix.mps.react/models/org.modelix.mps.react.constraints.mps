<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:49ee38a4-a610-43f0-b2c9-c47a6930a83b(org.modelix.mps.react.constraints)">
  <persistence version="9" />
  <languages>
    <use id="5dae8159-ab99-46bb-a40d-0cee30ee7018" name="jetbrains.mps.lang.constraints.rules.kinds" version="0" />
    <use id="ea3159bf-f48e-4720-bde2-86dba75f0d34" name="jetbrains.mps.lang.context.defs" version="0" />
    <use id="e51810c5-7308-4642-bcb6-469e61b5dd18" name="jetbrains.mps.lang.constraints.msg.specification" version="0" />
    <use id="134c38d4-e3af-4d9e-b069-1c7df0a4005d" name="jetbrains.mps.lang.constraints.rules.skeleton" version="0" />
    <use id="b3551702-269c-4f05-ba61-58060cef4292" name="jetbrains.mps.lang.rulesAndMessages" version="0" />
    <use id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints" version="6" />
    <use id="13744753-c81f-424a-9c1b-cf8943bf4e86" name="jetbrains.mps.lang.sharedConcepts" version="0" />
    <use id="3ad5badc-1d9c-461c-b7b1-fa2fcd0a0ae7" name="jetbrains.mps.lang.context" version="0" />
    <use id="ad93155d-79b2-4759-b10c-55123e763903" name="jetbrains.mps.lang.messages" version="0" />
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-5604ebd4f22c(jetbrains.mps.devkit.aspect.constraints)" />
  </languages>
  <imports>
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="tpcn" ref="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" />
    <import index="8xo1" ref="r:41b64586-29ed-47f5-b907-44be07261bbc(org.modelix.mps.react.structure)" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" implicit="true" />
    <import index="tp25" ref="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271221393" name="jetbrains.mps.baseLanguage.structure.NPENotEqualsExpression" flags="nn" index="17QLQc" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
    </language>
    <language id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints">
      <concept id="6702802731807351367" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_CanBeAChild" flags="in" index="9S07l" />
      <concept id="1202989658459" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_parentNode" flags="nn" index="nLn13" />
      <concept id="8966504967485224688" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_contextNode" flags="nn" index="2rP1CM" />
      <concept id="5564765827938091039" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_ReferentSearchScope_Scope" flags="ig" index="3dgokm" />
      <concept id="8401916545537438642" name="jetbrains.mps.lang.constraints.structure.InheritedNodeScopeFactory" flags="ng" index="1dDu$B">
        <reference id="8401916545537438643" name="kind" index="1dDu$A" />
      </concept>
      <concept id="1163200368514" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_ReferentSetHandler" flags="in" index="3k9gUc" />
      <concept id="1163200647017" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_referenceNode" flags="nn" index="3kakTB" />
      <concept id="1163202640154" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_newReferentNode" flags="nn" index="3khVwk" />
      <concept id="1213093968558" name="jetbrains.mps.lang.constraints.structure.ConceptConstraints" flags="ng" index="1M2fIO">
        <reference id="1213093996982" name="concept" index="1M2myG" />
        <child id="6702802731807737306" name="canBeChild" index="9Vyp8" />
        <child id="1213100494875" name="referent" index="1Mr941" />
      </concept>
      <concept id="1148687176410" name="jetbrains.mps.lang.constraints.structure.NodeReferentConstraint" flags="ng" index="1N5Pfh">
        <reference id="1148687202698" name="applicableLink" index="1N5Vy1" />
        <child id="1163203787401" name="referentSetHandler" index="3kmjI7" />
        <child id="1148687345559" name="searchScopeFactory" index="1N6uqs" />
      </concept>
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="2524418899405758586" name="jetbrains.mps.baseLanguage.closures.structure.InferredClosureParameterDeclaration" flags="ig" index="gl6BB" />
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="446c26eb-2b7b-4bf0-9b35-f83fa582753e" name="jetbrains.mps.lang.modelapi">
      <concept id="4733039728785194814" name="jetbrains.mps.lang.modelapi.structure.NamedNodeReference" flags="ng" index="ZC_QK">
        <reference id="7256306938026143658" name="target" index="2aWVGs" />
        <child id="7256306938026143676" name="child" index="2aWVGa" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1176544042499" name="jetbrains.mps.lang.typesystem.structure.Node_TypeOperation" flags="nn" index="3JvlWi" />
      <concept id="1178870617262" name="jetbrains.mps.lang.typesystem.structure.CoerceExpression" flags="nn" index="1UaxmW">
        <child id="1178870894644" name="pattern" index="1Ub_4A" />
        <child id="1178870894645" name="nodeToCoerce" index="1Ub_4B" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="5045161044515397667" name="jetbrains.mps.lang.smodel.structure.Node_PointerOperation" flags="ng" index="iZEcu" />
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="7400021826774799413" name="jetbrains.mps.lang.smodel.structure.NodePointerExpression" flags="ng" index="2tJFMh">
        <child id="7400021826774799510" name="ref" index="2tJFKM" />
      </concept>
      <concept id="4693937538533521280" name="jetbrains.mps.lang.smodel.structure.OfConceptOperation" flags="ng" index="v3k3i">
        <child id="4693937538533538124" name="requestedConcept" index="v3oSu" />
      </concept>
      <concept id="1173122760281" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorsOperation" flags="nn" index="z$bX8" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1144100932627" name="jetbrains.mps.lang.smodel.structure.OperationParm_Inclusion" flags="ng" index="1xIGOp" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1144146199828" name="jetbrains.mps.lang.smodel.structure.Node_CopyOperation" flags="nn" index="1$rogu" />
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <property id="1238684351431" name="asCast" index="1BlNFB" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1160666733551" name="jetbrains.mps.baseLanguage.collections.structure.AddAllElementsOperation" flags="nn" index="X8dFx" />
      <concept id="1165530316231" name="jetbrains.mps.baseLanguage.collections.structure.IsEmptyOperation" flags="nn" index="1v1jN8" />
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
      <concept id="1202128969694" name="jetbrains.mps.baseLanguage.collections.structure.SelectOperation" flags="nn" index="3$u5V9" />
    </language>
  </registry>
  <node concept="1M2fIO" id="7GLg2tFsx0$">
    <ref role="1M2myG" to="8xo1:7GLg2tFsmVl" resolve="ChildrenComponent" />
    <node concept="1N5Pfh" id="CUW2QYMjhu" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:7GLg2tFsmV_" resolve="link" />
      <node concept="3dgokm" id="CUW2QYMjAf" role="1N6uqs">
        <node concept="3clFbS" id="CUW2QYMjAh" role="2VODD2">
          <node concept="3clFbF" id="CUW2QYMjFp" role="3cqZAp">
            <node concept="2YIFZM" id="CUW2QYMjPw" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="CUW2QYMwA8" role="37wK5m">
                <node concept="2OqwBi" id="CUW2QYMlfW" role="2Oq$k0">
                  <node concept="2OqwBi" id="CUW2QYMkG3" role="2Oq$k0">
                    <node concept="2OqwBi" id="CUW2QYMk7t" role="2Oq$k0">
                      <node concept="2rP1CM" id="CUW2QYMjU0" role="2Oq$k0" />
                      <node concept="2Xjw5R" id="CUW2QYMkkb" role="2OqNvi">
                        <node concept="1xMEDy" id="CUW2QYMkkd" role="1xVPHs">
                          <node concept="chp4Y" id="CUW2QYMkqB" role="ri$Ld">
                            <ref role="cht4Q" to="8xo1:7GLg2tFqfQu" resolve="ConceptRenderer" />
                          </node>
                        </node>
                        <node concept="1xIGOp" id="CUW2QYMkyN" role="1xVPHs" />
                      </node>
                    </node>
                    <node concept="3TrEf2" id="CUW2QYMkTL" role="2OqNvi">
                      <ref role="3Tt5mk" to="8xo1:7dm8yUsMfNE" resolve="concept" />
                    </node>
                  </node>
                  <node concept="2qgKlT" id="CUW2QYMlCy" role="2OqNvi">
                    <ref role="37wK5l" to="tpcn:hEwILLp" resolve="getAggregationLinkDeclarations" />
                  </node>
                </node>
                <node concept="3zZkjj" id="CUW2QYMyuB" role="2OqNvi">
                  <node concept="1bVj0M" id="CUW2QYMyuE" role="23t8la">
                    <node concept="3clFbS" id="CUW2QYMyuF" role="1bW5cS">
                      <node concept="3clFbF" id="CUW2QYMyAY" role="3cqZAp">
                        <node concept="17QLQc" id="CUW2QYMzUJ" role="3clFbG">
                          <node concept="2tJFMh" id="CUW2QYM$fH" role="3uHU7w">
                            <node concept="ZC_QK" id="CUW2QYM$AG" role="2tJFKM">
                              <ref role="2aWVGs" to="tpck:gw2VY9q" resolve="BaseConcept" />
                              <node concept="ZC_QK" id="CUW2QYM_06" role="2aWVGa">
                                <ref role="2aWVGs" to="tpck:4uZwTti3__2" resolve="smodelAttribute" />
                              </node>
                            </node>
                          </node>
                          <node concept="2OqwBi" id="CUW2QYMyN$" role="3uHU7B">
                            <node concept="37vLTw" id="CUW2QYMyAX" role="2Oq$k0">
                              <ref role="3cqZAo" node="CUW2QYMyuG" resolve="it" />
                            </node>
                            <node concept="iZEcu" id="CUW2QYMzdd" role="2OqNvi" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="gl6BB" id="CUW2QYMyuG" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="CUW2QYMyuH" role="1tU5fm" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="7GLg2tFsN7S">
    <ref role="1M2myG" to="8xo1:7GLg2tFsMII" resolve="ComponentNodeExpression" />
    <node concept="9S07l" id="7GLg2tFsNm8" role="9Vyp8">
      <node concept="3clFbS" id="7GLg2tFsNm9" role="2VODD2">
        <node concept="3clFbF" id="7GLg2tFsNmG" role="3cqZAp">
          <node concept="2OqwBi" id="7GLg2tFsOlm" role="3clFbG">
            <node concept="2OqwBi" id="7GLg2tFsNx$" role="2Oq$k0">
              <node concept="nLn13" id="7GLg2tFsNmF" role="2Oq$k0" />
              <node concept="2Xjw5R" id="7GLg2tFsO4l" role="2OqNvi">
                <node concept="1xMEDy" id="7GLg2tFsO4n" role="1xVPHs">
                  <node concept="chp4Y" id="7GLg2tFsO6N" role="ri$Ld">
                    <ref role="cht4Q" to="8xo1:7GLg2tFqfQu" resolve="ConceptRenderer" />
                  </node>
                </node>
                <node concept="1xIGOp" id="7GLg2tFsOaY" role="1xVPHs" />
              </node>
            </node>
            <node concept="3x8VRR" id="7GLg2tFsOxa" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="7GLg2tFuaDO">
    <property role="3GE5qa" value="function" />
    <ref role="1M2myG" to="8xo1:7GLg2tFtr2m" resolve="PropertyChangeHandler" />
    <node concept="1N5Pfh" id="7GLg2tFuaE4" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:7GLg2tFtsLo" resolve="property" />
      <node concept="3dgokm" id="7GLg2tFuaFA" role="1N6uqs">
        <node concept="3clFbS" id="7GLg2tFuaFB" role="2VODD2">
          <node concept="3cpWs8" id="7GLg2tFuaJ7" role="3cqZAp">
            <node concept="3cpWsn" id="7GLg2tFuaJa" role="3cpWs9">
              <property role="TrG5h" value="concept" />
              <node concept="3Tqbb2" id="7GLg2tFuaJ6" role="1tU5fm">
                <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
              </node>
            </node>
          </node>
          <node concept="3clFbJ" id="7GLg2tFuaPv" role="3cqZAp">
            <node concept="3clFbS" id="7GLg2tFuaPx" role="3clFbx">
              <node concept="3clFbF" id="7GLg2tFubD0" role="3cqZAp">
                <node concept="37vLTI" id="7GLg2tFubYz" role="3clFbG">
                  <node concept="2OqwBi" id="7GLg2tFuco2" role="37vLTx">
                    <node concept="2OqwBi" id="7GLg2tFuc4M" role="2Oq$k0">
                      <node concept="3kakTB" id="7GLg2tFuc1I" role="2Oq$k0" />
                      <node concept="2Xjw5R" id="7GLg2tFuc71" role="2OqNvi">
                        <node concept="1xMEDy" id="7GLg2tFuc73" role="1xVPHs">
                          <node concept="chp4Y" id="7GLg2tFuc9R" role="ri$Ld">
                            <ref role="cht4Q" to="8xo1:7GLg2tFqfQu" resolve="ConceptRenderer" />
                          </node>
                        </node>
                        <node concept="1xIGOp" id="7GLg2tFuceG" role="1xVPHs" />
                      </node>
                    </node>
                    <node concept="3TrEf2" id="7GLg2tFuc$r" role="2OqNvi">
                      <ref role="3Tt5mk" to="8xo1:7dm8yUsMfNE" resolve="concept" />
                    </node>
                  </node>
                  <node concept="37vLTw" id="7GLg2tFubCY" role="37vLTJ">
                    <ref role="3cqZAo" node="7GLg2tFuaJa" resolve="concept" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="7GLg2tFuboL" role="3clFbw">
              <node concept="2OqwBi" id="7GLg2tFub0L" role="2Oq$k0">
                <node concept="3kakTB" id="7GLg2tFuaQc" role="2Oq$k0" />
                <node concept="3TrEf2" id="7GLg2tFubca" role="2OqNvi">
                  <ref role="3Tt5mk" to="8xo1:7GLg2tFtsLs" resolve="node" />
                </node>
              </node>
              <node concept="3w_OXm" id="7GLg2tFub$t" role="2OqNvi" />
            </node>
            <node concept="9aQIb" id="7GLg2tFucBK" role="9aQIa">
              <node concept="3clFbS" id="7GLg2tFucBL" role="9aQI4">
                <node concept="3clFbF" id="7GLg2tFucD4" role="3cqZAp">
                  <node concept="37vLTI" id="7GLg2tFucMU" role="3clFbG">
                    <node concept="1PxgMI" id="7GLg2tFudYV" role="37vLTx">
                      <property role="1BlNFB" value="true" />
                      <node concept="chp4Y" id="7GLg2tFue27" role="3oSUPX">
                        <ref role="cht4Q" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
                      </node>
                      <node concept="2OqwBi" id="7GLg2tFudtD" role="1m5AlR">
                        <node concept="1UaxmW" id="7GLg2tFud5U" role="2Oq$k0">
                          <node concept="1YaCAy" id="7GLg2tFudcg" role="1Ub_4A">
                            <property role="TrG5h" value="sNodeType" />
                            <ref role="1YaFvo" to="tp25:gzTqbfa" resolve="SNodeType" />
                          </node>
                          <node concept="2OqwBi" id="7GLg2tFucXw" role="1Ub_4B">
                            <node concept="2OqwBi" id="7GLg2tFucRs" role="2Oq$k0">
                              <node concept="3kakTB" id="7GLg2tFucOn" role="2Oq$k0" />
                              <node concept="3TrEf2" id="7GLg2tFucTz" role="2OqNvi">
                                <ref role="3Tt5mk" to="8xo1:7GLg2tFtsLs" resolve="node" />
                              </node>
                            </node>
                            <node concept="3JvlWi" id="7GLg2tFud1p" role="2OqNvi" />
                          </node>
                        </node>
                        <node concept="3TrEf2" id="7GLg2tFudHH" role="2OqNvi">
                          <ref role="3Tt5mk" to="tp25:g$ehGDh" resolve="concept" />
                        </node>
                      </node>
                    </node>
                    <node concept="37vLTw" id="7GLg2tFucD3" role="37vLTJ">
                      <ref role="3cqZAo" node="7GLg2tFuaJa" resolve="concept" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbF" id="7GLg2tFug_q" role="3cqZAp">
            <node concept="2YIFZM" id="7GLg2tFugF7" role="3clFbG">
              <ref role="37wK5l" to="o8zo:3jEbQoczdCs" resolve="forResolvableElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="7GLg2tFuf7Z" role="37wK5m">
                <node concept="37vLTw" id="7GLg2tFueL2" role="2Oq$k0">
                  <ref role="3cqZAo" node="7GLg2tFuaJa" resolve="concept" />
                </node>
                <node concept="2qgKlT" id="7GLg2tFufvp" role="2OqNvi">
                  <ref role="37wK5l" to="tpcn:hEwILLM" resolve="getPropertyDeclarations" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="1pvyisddd6u">
    <ref role="1M2myG" to="8xo1:1pvyisddd6d" resolve="ForEachInteratorVariableReference" />
    <node concept="1N5Pfh" id="1pvyisddd6v" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:1pvyisddd6e" resolve="forEach" />
      <node concept="3dgokm" id="1pvyisddd7j" role="1N6uqs">
        <node concept="3clFbS" id="1pvyisddd7k" role="2VODD2">
          <node concept="3clFbF" id="1pvyisddlre" role="3cqZAp">
            <node concept="2YIFZM" id="1pvyisddluV" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="1pvyisdddlK" role="37wK5m">
                <node concept="2rP1CM" id="1pvyisdddaR" role="2Oq$k0" />
                <node concept="z$bX8" id="1pvyisdddw$" role="2OqNvi">
                  <node concept="1xMEDy" id="1pvyisddgc6" role="1xVPHs">
                    <node concept="chp4Y" id="1pvyisddgd0" role="ri$Ld">
                      <ref role="cht4Q" to="8xo1:1pvyisdcGJV" resolve="ForEachComponent" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="4Dhs5NhTy8I">
    <property role="3GE5qa" value="named-renderer" />
    <ref role="1M2myG" to="8xo1:4Dhs5NhTbdW" resolve="NamedRendererParameterReference" />
    <node concept="1N5Pfh" id="4Dhs5NhTy8J" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:4Dhs5NhTbdX" resolve="decl" />
      <node concept="3dgokm" id="4Dhs5NhTy8L" role="1N6uqs">
        <node concept="3clFbS" id="4Dhs5NhTy8M" role="2VODD2">
          <node concept="3clFbF" id="4Dhs5NhTyr5" role="3cqZAp">
            <node concept="2YIFZM" id="4Dhs5NhTyuM" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="4Dhs5NhTztM" role="37wK5m">
                <node concept="2OqwBi" id="4Dhs5NhTyHK" role="2Oq$k0">
                  <node concept="2rP1CM" id="4Dhs5NhTyxa" role="2Oq$k0" />
                  <node concept="2Xjw5R" id="4Dhs5NhTyUk" role="2OqNvi">
                    <node concept="1xMEDy" id="4Dhs5NhTyUm" role="1xVPHs">
                      <node concept="chp4Y" id="4Dhs5NhTyZ8" role="ri$Ld">
                        <ref role="cht4Q" to="8xo1:4Dhs5NhTz4H" resolve="NamedRendererBase" />
                      </node>
                    </node>
                    <node concept="1xIGOp" id="4Dhs5NhTzW0" role="1xVPHs" />
                  </node>
                </node>
                <node concept="3Tsc0h" id="4Dhs5NhTzJz" role="2OqNvi">
                  <ref role="3TtcxE" to="8xo1:4Dhs5NhTz4L" resolve="parameters" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="4Dhs5NhURAy">
    <property role="3GE5qa" value="function" />
    <ref role="1M2myG" to="8xo1:4Dhs5NhURAh" resolve="CustomHandlerParameterReference" />
    <node concept="1N5Pfh" id="4Dhs5NhURAz" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:4Dhs5NhURAi" resolve="decl" />
      <node concept="3dgokm" id="4Dhs5NhURA_" role="1N6uqs">
        <node concept="3clFbS" id="4Dhs5NhURAA" role="2VODD2">
          <node concept="3clFbF" id="4Dhs5NhUREh" role="3cqZAp">
            <node concept="2YIFZM" id="4Dhs5NhURHY" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="4Dhs5NhUSs9" role="37wK5m">
                <node concept="2OqwBi" id="4Dhs5NhURWW" role="2Oq$k0">
                  <node concept="2rP1CM" id="4Dhs5NhURKm" role="2Oq$k0" />
                  <node concept="2Xjw5R" id="4Dhs5NhUS6K" role="2OqNvi">
                    <node concept="1xMEDy" id="4Dhs5NhUS6M" role="1xVPHs">
                      <node concept="chp4Y" id="4Dhs5NhUSb$" role="ri$Ld">
                        <ref role="cht4Q" to="8xo1:4_K3r3dnx5v" resolve="CustomHandler" />
                      </node>
                    </node>
                    <node concept="1xIGOp" id="4Dhs5NhUSil" role="1xVPHs" />
                  </node>
                </node>
                <node concept="3Tsc0h" id="4Dhs5NhUSEj" role="2OqNvi">
                  <ref role="3TtcxE" to="8xo1:4_K3r3dn$YW" resolve="serverSideParameters" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="4Dhs5Nim6n6">
    <ref role="1M2myG" to="8xo1:4Dhs5NilDPI" resolve="StateVariableReference" />
    <node concept="1N5Pfh" id="4Dhs5Nim6nd" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:4Dhs5NilDPP" resolve="decl" />
      <node concept="1dDu$B" id="6Ddb4_fPGnX" role="1N6uqs">
        <ref role="1dDu$A" to="8xo1:4Dhs5NildkH" resolve="StateVariable" />
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="1hCkroLwZKq">
    <property role="3GE5qa" value="incrementalFunction" />
    <ref role="1M2myG" to="8xo1:1hCkroLrV87" resolve="IncrementalPolymorhpicFunctionOverload" />
    <node concept="1N5Pfh" id="1hCkroLwZKr" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:1hCkroLrV8C" resolve="overloaded" />
      <node concept="3k9gUc" id="1hCkroLwZM7" role="3kmjI7">
        <node concept="3clFbS" id="1hCkroLwZM8" role="2VODD2">
          <node concept="3clFbJ" id="1hCkroLwZNo" role="3cqZAp">
            <node concept="2OqwBi" id="1hCkroLx2UV" role="3clFbw">
              <node concept="2OqwBi" id="1hCkroLx005" role="2Oq$k0">
                <node concept="3kakTB" id="1hCkroLwZNO" role="2Oq$k0" />
                <node concept="3Tsc0h" id="1hCkroLx0fT" role="2OqNvi">
                  <ref role="3TtcxE" to="8xo1:1hCkroLrV8x" resolve="parameters" />
                </node>
              </node>
              <node concept="1v1jN8" id="1hCkroLx5Ay" role="2OqNvi" />
            </node>
            <node concept="3clFbS" id="1hCkroLwZNq" role="3clFbx">
              <node concept="3clFbF" id="1hCkroLx5CK" role="3cqZAp">
                <node concept="2OqwBi" id="1hCkroLx6mx" role="3clFbG">
                  <node concept="2OqwBi" id="1hCkroLx5Fu" role="2Oq$k0">
                    <node concept="3kakTB" id="1hCkroLx5CJ" role="2Oq$k0" />
                    <node concept="3Tsc0h" id="1hCkroLx5Hc" role="2OqNvi">
                      <ref role="3TtcxE" to="8xo1:1hCkroLrV8x" resolve="parameters" />
                    </node>
                  </node>
                  <node concept="X8dFx" id="1hCkroLx7gb" role="2OqNvi">
                    <node concept="2OqwBi" id="1hCkroLx96d" role="25WWJ7">
                      <node concept="2OqwBi" id="1hCkroLx89S" role="2Oq$k0">
                        <node concept="3khVwk" id="1hCkroLx7kC" role="2Oq$k0" />
                        <node concept="3Tsc0h" id="1hCkroLx8t6" role="2OqNvi">
                          <ref role="3TtcxE" to="8xo1:1hCkroLrV8x" resolve="parameters" />
                        </node>
                      </node>
                      <node concept="3$u5V9" id="1hCkroLxa0M" role="2OqNvi">
                        <node concept="1bVj0M" id="1hCkroLxa0O" role="23t8la">
                          <node concept="3clFbS" id="1hCkroLxa0P" role="1bW5cS">
                            <node concept="3clFbF" id="1hCkroLxa5R" role="3cqZAp">
                              <node concept="2OqwBi" id="1hCkroLxaj5" role="3clFbG">
                                <node concept="37vLTw" id="1hCkroLxa5Q" role="2Oq$k0">
                                  <ref role="3cqZAo" node="1hCkroLxa0Q" resolve="it" />
                                </node>
                                <node concept="1$rogu" id="1hCkroLxaSm" role="2OqNvi" />
                              </node>
                            </node>
                          </node>
                          <node concept="gl6BB" id="1hCkroLxa0Q" role="1bW2Oz">
                            <property role="TrG5h" value="it" />
                            <node concept="2jxLKc" id="1hCkroLxa0R" role="1tU5fm" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbF" id="1hCkroLxeDi" role="3cqZAp">
            <node concept="37vLTI" id="1hCkroLxfu2" role="3clFbG">
              <node concept="3khVwk" id="1hCkroLxfx9" role="37vLTx" />
              <node concept="2OqwBi" id="1hCkroLxeYl" role="37vLTJ">
                <node concept="3kakTB" id="1hCkroLxeDh" role="2Oq$k0" />
                <node concept="3TrEf2" id="1hCkroLxffX" role="2OqNvi">
                  <ref role="3Tt5mk" to="8xo1:1hCkroLrV8C" resolve="overloaded" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="1hCkroLxROU">
    <property role="3GE5qa" value="incrementalFunction" />
    <ref role="1M2myG" to="8xo1:1hCkroLrV8u" resolve="IncrementalPolymorhpicFunctionParameterReference" />
    <node concept="1N5Pfh" id="1hCkroLxROV" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:1hCkroLxGy4" resolve="decl" />
      <node concept="3dgokm" id="1hCkroLxROX" role="1N6uqs">
        <node concept="3clFbS" id="1hCkroLxROY" role="2VODD2">
          <node concept="3clFbF" id="1hCkroLxS7p" role="3cqZAp">
            <node concept="2YIFZM" id="1hCkroLxSb6" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="1hCkroLxSX$" role="37wK5m">
                <node concept="2OqwBi" id="1hCkroLxSr6" role="2Oq$k0">
                  <node concept="2rP1CM" id="1hCkroLxSdZ" role="2Oq$k0" />
                  <node concept="2Xjw5R" id="1hCkroLxSCb" role="2OqNvi">
                    <node concept="1xMEDy" id="1hCkroLxSCd" role="1xVPHs">
                      <node concept="chp4Y" id="1hCkroLxSGZ" role="ri$Ld">
                        <ref role="cht4Q" to="8xo1:1hCkroLrV8d" resolve="IncrementalPolymorhpicFunctionBase" />
                      </node>
                    </node>
                    <node concept="1xIGOp" id="1hCkroLxSNK" role="1xVPHs" />
                  </node>
                </node>
                <node concept="3Tsc0h" id="1hCkroLxTcf" role="2OqNvi">
                  <ref role="3TtcxE" to="8xo1:1hCkroLrV8x" resolve="parameters" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="6eUjE42h7Dh">
    <property role="3GE5qa" value="pages" />
    <ref role="1M2myG" to="8xo1:6eUjE42h5St" resolve="ContextRepositoryExpression" />
    <node concept="9S07l" id="6eUjE42h7Di" role="9Vyp8">
      <node concept="3clFbS" id="6eUjE42h7Dj" role="2VODD2">
        <node concept="3clFbF" id="6eUjE42h7R8" role="3cqZAp">
          <node concept="2OqwBi" id="6eUjE42hbg1" role="3clFbG">
            <node concept="2OqwBi" id="6eUjE42h8kJ" role="2Oq$k0">
              <node concept="nLn13" id="6eUjE42h7R7" role="2Oq$k0" />
              <node concept="2Xjw5R" id="6eUjE42hakT" role="2OqNvi">
                <node concept="1xMEDy" id="6eUjE42hakV" role="1xVPHs">
                  <node concept="chp4Y" id="6eUjE42ha$y" role="ri$Ld">
                    <ref role="cht4Q" to="8xo1:6eUjE42h0Dj" resolve="Page" />
                  </node>
                </node>
                <node concept="1xIGOp" id="6eUjE42hb2g" role="1xVPHs" />
              </node>
            </node>
            <node concept="3x8VRR" id="6eUjE42hbGd" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="2UuChTN9p$K">
    <property role="3GE5qa" value="pages" />
    <ref role="1M2myG" to="8xo1:2UuChTN9p$I" resolve="PagePathVariableReference" />
    <node concept="1N5Pfh" id="2UuChTN9p$L" role="1Mr941">
      <ref role="1N5Vy1" to="8xo1:2UuChTN9p$J" />
      <node concept="3dgokm" id="2UuChTN9pH6" role="1N6uqs">
        <node concept="3clFbS" id="2UuChTN9pH7" role="2VODD2">
          <node concept="3clFbF" id="2UuChTN9yDp" role="3cqZAp">
            <node concept="2YIFZM" id="2UuChTN9_S0" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="2UuChTN9_S1" role="37wK5m">
                <node concept="2OqwBi" id="2UuChTN9_S2" role="2Oq$k0">
                  <node concept="2OqwBi" id="2UuChTN9_S3" role="2Oq$k0">
                    <node concept="2OqwBi" id="2UuChTN9_S4" role="2Oq$k0">
                      <node concept="2rP1CM" id="2UuChTN9_S5" role="2Oq$k0" />
                      <node concept="2Xjw5R" id="2UuChTN9_S6" role="2OqNvi">
                        <node concept="1xMEDy" id="2UuChTN9_S7" role="1xVPHs">
                          <node concept="chp4Y" id="2UuChTN9_S8" role="ri$Ld">
                            <ref role="cht4Q" to="8xo1:6eUjE42h0Dj" resolve="Page" />
                          </node>
                        </node>
                        <node concept="1xIGOp" id="2UuChTN9_S9" role="1xVPHs" />
                      </node>
                    </node>
                    <node concept="3TrEf2" id="2UuChTN9_Sa" role="2OqNvi">
                      <ref role="3Tt5mk" to="8xo1:6eUjE42iNFO" resolve="path" />
                    </node>
                  </node>
                  <node concept="3Tsc0h" id="2UuChTN9_Sb" role="2OqNvi">
                    <ref role="3TtcxE" to="8xo1:6eUjE42hnWE" resolve="parts" />
                  </node>
                </node>
                <node concept="v3k3i" id="2UuChTN9_Sc" role="2OqNvi">
                  <node concept="chp4Y" id="2UuChTN9_Sd" role="v3oSu">
                    <ref role="cht4Q" to="8xo1:6eUjE42hnWB" resolve="VariablePagePathPart" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

