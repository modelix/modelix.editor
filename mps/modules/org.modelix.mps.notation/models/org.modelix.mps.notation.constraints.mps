<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1eb9d7a2-a9d5-4c85-befd-ebacc58c1884(org.modelix.mps.notation.constraints)">
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
    <devkit ref="00000000-0000-4000-0000-5604ebd4f22c(jetbrains.mps.devkit.aspect.constraints)" />
  </languages>
  <imports>
    <import index="lui2" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.module(MPS.OpenAPI/)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="35tq" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.scope(MPS.Core/)" />
    <import index="f8gn" ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)" implicit="true" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" implicit="true" />
    <import index="tpcn" ref="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" implicit="true" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1225271221393" name="jetbrains.mps.baseLanguage.structure.NPENotEqualsExpression" flags="nn" index="17QLQc" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
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
      <concept id="1213093968558" name="jetbrains.mps.lang.constraints.structure.ConceptConstraints" flags="ng" index="1M2fIO">
        <reference id="1213093996982" name="concept" index="1M2myG" />
        <child id="6702802731807737306" name="canBeChild" index="9Vyp8" />
        <child id="1213100494875" name="referent" index="1Mr941" />
      </concept>
      <concept id="1148687176410" name="jetbrains.mps.lang.constraints.structure.NodeReferentConstraint" flags="ng" index="1N5Pfh">
        <reference id="1148687202698" name="applicableLink" index="1N5Vy1" />
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
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="5045161044515397667" name="jetbrains.mps.lang.smodel.structure.Node_PointerOperation" flags="ng" index="iZEcu" />
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="7400021826771268254" name="jetbrains.mps.lang.smodel.structure.SNodePointerType" flags="ig" index="2sp9CU">
        <reference id="7400021826771268269" name="concept" index="2sp9C9" />
      </concept>
      <concept id="7400021826774799413" name="jetbrains.mps.lang.smodel.structure.NodePointerExpression" flags="ng" index="2tJFMh">
        <child id="7400021826774799510" name="ref" index="2tJFKM" />
      </concept>
      <concept id="4065387505485742749" name="jetbrains.mps.lang.smodel.structure.AbstractPointerResolveOperation" flags="ng" index="2yCiFS">
        <child id="3648723375513868575" name="repositoryArg" index="Vysub" />
      </concept>
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="3648723375513868532" name="jetbrains.mps.lang.smodel.structure.NodePointer_ResolveOperation" flags="ng" index="Vyspw" />
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1144100932627" name="jetbrains.mps.lang.smodel.structure.OperationParm_Inclusion" flags="ng" index="1xIGOp" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
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
      <concept id="1176906603202" name="jetbrains.mps.baseLanguage.collections.structure.BinaryOperation" flags="nn" index="56pJg">
        <child id="1176906787974" name="rightExpression" index="576Qk" />
      </concept>
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1176923520476" name="jetbrains.mps.baseLanguage.collections.structure.ExcludeOperation" flags="nn" index="66VNe" />
      <concept id="1226511727824" name="jetbrains.mps.baseLanguage.collections.structure.SetType" flags="in" index="2hMVRd">
        <child id="1226511765987" name="elementType" index="2hN53Y" />
      </concept>
      <concept id="1226516258405" name="jetbrains.mps.baseLanguage.collections.structure.HashSetCreator" flags="nn" index="2i4dXS" />
      <concept id="1151702311717" name="jetbrains.mps.baseLanguage.collections.structure.ToListOperation" flags="nn" index="ANE8D" />
      <concept id="1235573135402" name="jetbrains.mps.baseLanguage.collections.structure.SingletonSequenceCreator" flags="nn" index="2HTt$P">
        <child id="1235573175711" name="elementType" index="2HTBi0" />
        <child id="1235573187520" name="singletonValue" index="2HTEbv" />
      </concept>
      <concept id="1237721394592" name="jetbrains.mps.baseLanguage.collections.structure.AbstractContainerCreator" flags="nn" index="HWqM0">
        <child id="1237721435808" name="initValue" index="HW$Y0" />
        <child id="1237721435807" name="elementType" index="HW$YZ" />
      </concept>
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
      <concept id="1172254888721" name="jetbrains.mps.baseLanguage.collections.structure.ContainsOperation" flags="nn" index="3JPx81" />
    </language>
  </registry>
  <node concept="1M2fIO" id="CUW2QYKVoD">
    <ref role="1M2myG" to="f8gn:CUW2QYKUUq" resolve="PropertyCell" />
    <node concept="1N5Pfh" id="CUW2QYKVqm" role="1Mr941">
      <ref role="1N5Vy1" to="f8gn:CUW2QYKUZw" resolve="property" />
      <node concept="3dgokm" id="CUW2QYKVvN" role="1N6uqs">
        <node concept="3clFbS" id="CUW2QYKVvP" role="2VODD2">
          <node concept="3cpWs8" id="CUW2QYL9ms" role="3cqZAp">
            <node concept="3cpWsn" id="CUW2QYL9mt" role="3cpWs9">
              <property role="TrG5h" value="excludedProperties" />
              <node concept="2hMVRd" id="CUW2QYL9fP" role="1tU5fm">
                <node concept="2sp9CU" id="CUW2QYL9fS" role="2hN53Y">
                  <ref role="2sp9C9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
                </node>
              </node>
              <node concept="2ShNRf" id="CUW2QYL9mu" role="33vP2m">
                <node concept="2i4dXS" id="CUW2QYL9mv" role="2ShVmc">
                  <node concept="2sp9CU" id="CUW2QYL9mw" role="HW$YZ">
                    <ref role="2sp9C9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
                  </node>
                  <node concept="2tJFMh" id="CUW2QYL9mx" role="HW$Y0">
                    <node concept="ZC_QK" id="CUW2QYL9my" role="2tJFKM">
                      <ref role="2aWVGs" to="tpck:gw2VY9q" resolve="BaseConcept" />
                      <node concept="ZC_QK" id="CUW2QYL9mz" role="2aWVGa">
                        <ref role="2aWVGs" to="tpck:gOOYnlO" resolve="shortDescription" />
                      </node>
                    </node>
                  </node>
                  <node concept="2tJFMh" id="CUW2QYL9m$" role="HW$Y0">
                    <node concept="ZC_QK" id="CUW2QYL9m_" role="2tJFKM">
                      <ref role="2aWVGs" to="tpck:gw2VY9q" resolve="BaseConcept" />
                      <node concept="ZC_QK" id="CUW2QYL9mA" role="2aWVGa">
                        <ref role="2aWVGs" to="tpck:hnGE5uv" resolve="virtualPackage" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbF" id="CUW2QYL9Hg" role="3cqZAp">
            <node concept="2YIFZM" id="CUW2QYL9LY" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="CUW2QYLTji" role="37wK5m">
                <node concept="2OqwBi" id="CUW2QYLg3C" role="2Oq$k0">
                  <node concept="2OqwBi" id="CUW2QYLbaU" role="2Oq$k0">
                    <node concept="2OqwBi" id="CUW2QYLaBp" role="2Oq$k0">
                      <node concept="2OqwBi" id="CUW2QYLa2I" role="2Oq$k0">
                        <node concept="2rP1CM" id="CUW2QYL9QJ" role="2Oq$k0" />
                        <node concept="2Xjw5R" id="CUW2QYLad1" role="2OqNvi">
                          <node concept="1xMEDy" id="CUW2QYLad3" role="1xVPHs">
                            <node concept="chp4Y" id="CUW2QYLajW" role="ri$Ld">
                              <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                            </node>
                          </node>
                          <node concept="1xIGOp" id="CUW2QYLat0" role="1xVPHs" />
                        </node>
                      </node>
                      <node concept="3TrEf2" id="CUW2QYLaOR" role="2OqNvi">
                        <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                      </node>
                    </node>
                    <node concept="2qgKlT" id="CUW2QYLb_J" role="2OqNvi">
                      <ref role="37wK5l" to="tpcn:hEwILLM" resolve="getPropertyDeclarations" />
                    </node>
                  </node>
                  <node concept="3zZkjj" id="CUW2QYLmyu" role="2OqNvi">
                    <node concept="1bVj0M" id="CUW2QYLmyw" role="23t8la">
                      <node concept="3clFbS" id="CUW2QYLmyx" role="1bW5cS">
                        <node concept="3clFbF" id="CUW2QYLmMm" role="3cqZAp">
                          <node concept="3fqX7Q" id="CUW2QYMeM0" role="3clFbG">
                            <node concept="2OqwBi" id="CUW2QYMeM2" role="3fr31v">
                              <node concept="37vLTw" id="CUW2QYMeM3" role="2Oq$k0">
                                <ref role="3cqZAo" node="CUW2QYL9mt" resolve="excludedProperties" />
                              </node>
                              <node concept="3JPx81" id="CUW2QYMeM4" role="2OqNvi">
                                <node concept="2OqwBi" id="CUW2QYMeM5" role="25WWJ7">
                                  <node concept="37vLTw" id="CUW2QYMeM6" role="2Oq$k0">
                                    <ref role="3cqZAo" node="CUW2QYLmyy" resolve="it" />
                                  </node>
                                  <node concept="iZEcu" id="CUW2QYMeM7" role="2OqNvi" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="gl6BB" id="CUW2QYLmyy" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="CUW2QYLmyz" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="ANE8D" id="CUW2QYLUHN" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="CUW2QYMjfL">
    <ref role="1M2myG" to="f8gn:CUW2QYMiki" resolve="ChildrenCollectionCell" />
    <node concept="1N5Pfh" id="CUW2QYMjhu" role="1Mr941">
      <ref role="1N5Vy1" to="f8gn:CUW2QYMipn" resolve="link" />
      <node concept="3dgokm" id="CUW2QYMjAf" role="1N6uqs">
        <node concept="3clFbS" id="CUW2QYMjAh" role="2VODD2">
          <node concept="3clFbF" id="CUW2QYMjFp" role="3cqZAp">
            <node concept="2YIFZM" id="CUW2QYMjPw" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="CUW2QYMwA8" role="37wK5m">
                <node concept="2OqwBi" id="CUW2QYMpCN" role="2Oq$k0">
                  <node concept="2OqwBi" id="CUW2QYMlfW" role="2Oq$k0">
                    <node concept="2OqwBi" id="CUW2QYMkG3" role="2Oq$k0">
                      <node concept="2OqwBi" id="CUW2QYMk7t" role="2Oq$k0">
                        <node concept="2rP1CM" id="CUW2QYMjU0" role="2Oq$k0" />
                        <node concept="2Xjw5R" id="CUW2QYMkkb" role="2OqNvi">
                          <node concept="1xMEDy" id="CUW2QYMkkd" role="1xVPHs">
                            <node concept="chp4Y" id="CUW2QYMkqB" role="ri$Ld">
                              <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                            </node>
                          </node>
                          <node concept="1xIGOp" id="CUW2QYMkyN" role="1xVPHs" />
                        </node>
                      </node>
                      <node concept="3TrEf2" id="CUW2QYMkTL" role="2OqNvi">
                        <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                      </node>
                    </node>
                    <node concept="2qgKlT" id="CUW2QYMlCy" role="2OqNvi">
                      <ref role="37wK5l" to="tpcn:hEwILLp" resolve="getAggregationLinkDeclarations" />
                    </node>
                  </node>
                  <node concept="3zZkjj" id="CUW2QYMu1m" role="2OqNvi">
                    <node concept="1bVj0M" id="CUW2QYMu1o" role="23t8la">
                      <node concept="3clFbS" id="CUW2QYMu1p" role="1bW5cS">
                        <node concept="3clFbF" id="CUW2QYMuoC" role="3cqZAp">
                          <node concept="3fqX7Q" id="CUW2QYMuoA" role="3clFbG">
                            <node concept="2OqwBi" id="CUW2QYMv0f" role="3fr31v">
                              <node concept="37vLTw" id="CUW2QYMuoI" role="2Oq$k0">
                                <ref role="3cqZAo" node="CUW2QYMu1q" resolve="it" />
                              </node>
                              <node concept="2qgKlT" id="CUW2QYMvPC" role="2OqNvi">
                                <ref role="37wK5l" to="tpcn:hEwIfAt" resolve="isSingular" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="gl6BB" id="CUW2QYMu1q" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="CUW2QYMu1r" role="1tU5fm" />
                      </node>
                    </node>
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
  <node concept="1M2fIO" id="ziPuhE_FtT">
    <ref role="1M2myG" to="f8gn:ziPuhE_FrH" resolve="FlagCell" />
    <node concept="1N5Pfh" id="ziPuhE_FtU" role="1Mr941">
      <ref role="1N5Vy1" to="f8gn:ziPuhE_FrT" resolve="property" />
      <node concept="3dgokm" id="ziPuhE_Fvq" role="1N6uqs">
        <node concept="3clFbS" id="ziPuhE_Fvs" role="2VODD2">
          <node concept="3clFbF" id="ziPuhE_FLA" role="3cqZAp">
            <node concept="2YIFZM" id="ziPuhE_FRv" role="3clFbG">
              <ref role="37wK5l" to="o8zo:3jEbQoczdCs" resolve="forResolvableElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="ziPuhE_NAn" role="37wK5m">
                <node concept="2OqwBi" id="ziPuhE_JcZ" role="2Oq$k0">
                  <node concept="2OqwBi" id="ziPuhE_IoN" role="2Oq$k0">
                    <node concept="2OqwBi" id="ziPuhE_Ggn" role="2Oq$k0">
                      <node concept="2rP1CM" id="ziPuhE_FUk" role="2Oq$k0" />
                      <node concept="2Xjw5R" id="ziPuhE_I3q" role="2OqNvi">
                        <node concept="1xMEDy" id="ziPuhE_I3s" role="1xVPHs">
                          <node concept="chp4Y" id="ziPuhE_I8b" role="ri$Ld">
                            <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                          </node>
                        </node>
                        <node concept="1xIGOp" id="ziPuhE_Ify" role="1xVPHs" />
                      </node>
                    </node>
                    <node concept="3TrEf2" id="ziPuhE_ICF" role="2OqNvi">
                      <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                    </node>
                  </node>
                  <node concept="2qgKlT" id="ziPuhE_JAA" role="2OqNvi">
                    <ref role="37wK5l" to="tpcn:hEwILLM" resolve="getPropertyDeclarations" />
                  </node>
                </node>
                <node concept="3zZkjj" id="ziPuhE_S0f" role="2OqNvi">
                  <node concept="1bVj0M" id="ziPuhE_S0h" role="23t8la">
                    <node concept="3clFbS" id="ziPuhE_S0i" role="1bW5cS">
                      <node concept="3clFbF" id="ziPuhE_SbR" role="3cqZAp">
                        <node concept="2OqwBi" id="ziPuhE_Sx1" role="3clFbG">
                          <node concept="37vLTw" id="ziPuhE_SbQ" role="2Oq$k0">
                            <ref role="3cqZAo" node="ziPuhE_S0j" resolve="it" />
                          </node>
                          <node concept="2qgKlT" id="ziPuhE_Tkp" role="2OqNvi">
                            <ref role="37wK5l" to="tpcn:hT23T2l" resolve="isPrimitiveBoolean" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="gl6BB" id="ziPuhE_S0j" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="ziPuhE_S0k" role="1tU5fm" />
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
  <node concept="1M2fIO" id="ziPuhE_Tx4">
    <property role="3GE5qa" value="expressions" />
    <ref role="1M2myG" to="f8gn:ziPuhE_TwU" resolve="KT_NotationNodeExpression" />
    <node concept="9S07l" id="ziPuhE_Tx6" role="9Vyp8">
      <node concept="3clFbS" id="ziPuhE_Tx7" role="2VODD2">
        <node concept="3clFbF" id="ziPuhE_TWd" role="3cqZAp">
          <node concept="2OqwBi" id="ziPuhE_UHE" role="3clFbG">
            <node concept="2OqwBi" id="ziPuhE_UjM" role="2Oq$k0">
              <node concept="nLn13" id="ziPuhE_TWc" role="2Oq$k0" />
              <node concept="2Xjw5R" id="ziPuhE_Usr" role="2OqNvi">
                <node concept="1xMEDy" id="ziPuhE_Ust" role="1xVPHs">
                  <node concept="chp4Y" id="ziPuhE_Uv0" role="ri$Ld">
                    <ref role="cht4Q" to="f8gn:7dm8yUsM9Ro" resolve="NotationModule" />
                  </node>
                </node>
                <node concept="1xIGOp" id="ziPuhE_Uzh" role="1xVPHs" />
              </node>
            </node>
            <node concept="3x8VRR" id="ziPuhE_UTu" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="ziPuhEA2bg">
    <ref role="1M2myG" to="f8gn:ziPuhEA2a_" resolve="ReferenceCell" />
    <node concept="1N5Pfh" id="ziPuhEA2bi" role="1Mr941">
      <ref role="1N5Vy1" to="f8gn:ziPuhEA2aC" resolve="link" />
      <node concept="3dgokm" id="ziPuhEA2dt" role="1N6uqs">
        <node concept="3clFbS" id="ziPuhEA2dv" role="2VODD2">
          <node concept="3clFbF" id="ziPuhEA2h2" role="3cqZAp">
            <node concept="2YIFZM" id="ziPuhEA2ke" role="3clFbG">
              <ref role="37wK5l" to="o8zo:3jEbQoczdCs" resolve="forResolvableElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="ziPuhEA3JI" role="37wK5m">
                <node concept="2OqwBi" id="ziPuhEA32J" role="2Oq$k0">
                  <node concept="2OqwBi" id="ziPuhEA2zE" role="2Oq$k0">
                    <node concept="2rP1CM" id="ziPuhEA2n3" role="2Oq$k0" />
                    <node concept="2Xjw5R" id="ziPuhEA2Ho" role="2OqNvi">
                      <node concept="1xMEDy" id="ziPuhEA2Hq" role="1xVPHs">
                        <node concept="chp4Y" id="ziPuhEA2M9" role="ri$Ld">
                          <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                        </node>
                      </node>
                      <node concept="1xIGOp" id="ziPuhEA2Tv" role="1xVPHs" />
                    </node>
                  </node>
                  <node concept="3TrEf2" id="ziPuhEA3ht" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                  </node>
                </node>
                <node concept="2qgKlT" id="ziPuhEA49m" role="2OqNvi">
                  <ref role="37wK5l" to="tpcn:hEwILL0" resolve="getReferenceLinkDeclarations" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="ziPuhEA4pC">
    <ref role="1M2myG" to="f8gn:ziPuhEA4oI" resolve="SingleChildCell" />
    <node concept="1N5Pfh" id="ziPuhEA4pD" role="1Mr941">
      <ref role="1N5Vy1" to="f8gn:ziPuhEA4oM" resolve="link" />
      <node concept="3dgokm" id="ziPuhEA4r8" role="1N6uqs">
        <node concept="3clFbS" id="ziPuhEA4ra" role="2VODD2">
          <node concept="3clFbF" id="ziPuhEA4vs" role="3cqZAp">
            <node concept="2YIFZM" id="ziPuhEA4Ip" role="3clFbG">
              <ref role="37wK5l" to="o8zo:3jEbQoczdCs" resolve="forResolvableElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="ziPuhEAhPy" role="37wK5m">
                <node concept="2OqwBi" id="ziPuhEAbg8" role="2Oq$k0">
                  <node concept="2OqwBi" id="ziPuhEA66V" role="2Oq$k0">
                    <node concept="2OqwBi" id="ziPuhEA5z2" role="2Oq$k0">
                      <node concept="2OqwBi" id="ziPuhEA500" role="2Oq$k0">
                        <node concept="2rP1CM" id="ziPuhEA4Np" role="2Oq$k0" />
                        <node concept="2Xjw5R" id="ziPuhEA59I" role="2OqNvi">
                          <node concept="1xMEDy" id="ziPuhEA59K" role="1xVPHs">
                            <node concept="chp4Y" id="ziPuhEA5ev" role="ri$Ld">
                              <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                            </node>
                          </node>
                          <node concept="1xIGOp" id="ziPuhEA5pj" role="1xVPHs" />
                        </node>
                      </node>
                      <node concept="3TrEf2" id="ziPuhEA5KW" role="2OqNvi">
                        <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                      </node>
                    </node>
                    <node concept="2qgKlT" id="ziPuhEA6vI" role="2OqNvi">
                      <ref role="37wK5l" to="tpcn:hEwILLp" resolve="getAggregationLinkDeclarations" />
                    </node>
                  </node>
                  <node concept="3zZkjj" id="ziPuhEAfLl" role="2OqNvi">
                    <node concept="1bVj0M" id="ziPuhEAfLn" role="23t8la">
                      <node concept="3clFbS" id="ziPuhEAfLo" role="1bW5cS">
                        <node concept="3clFbF" id="ziPuhEAfYj" role="3cqZAp">
                          <node concept="2OqwBi" id="ziPuhEAgjt" role="3clFbG">
                            <node concept="37vLTw" id="ziPuhEAfYi" role="2Oq$k0">
                              <ref role="3cqZAo" node="ziPuhEAfLp" resolve="it" />
                            </node>
                            <node concept="2qgKlT" id="ziPuhEAh6P" role="2OqNvi">
                              <ref role="37wK5l" to="tpcn:hEwIfAt" resolve="isSingular" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="gl6BB" id="ziPuhEAfLp" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="ziPuhEAfLq" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="66VNe" id="ziPuhEAjwO" role="2OqNvi">
                  <node concept="2ShNRf" id="ziPuhEAjVZ" role="576Qk">
                    <node concept="2HTt$P" id="ziPuhEAo7E" role="2ShVmc">
                      <node concept="2OqwBi" id="ziPuhEAp_r" role="2HTEbv">
                        <node concept="2tJFMh" id="ziPuhEAoxe" role="2Oq$k0">
                          <node concept="ZC_QK" id="ziPuhEAoWc" role="2tJFKM">
                            <ref role="2aWVGs" to="tpck:gw2VY9q" resolve="BaseConcept" />
                            <node concept="ZC_QK" id="ziPuhEAp4m" role="2aWVGa">
                              <ref role="2aWVGs" to="tpck:4uZwTti3__2" resolve="smodelAttribute" />
                            </node>
                          </node>
                        </node>
                        <node concept="Vyspw" id="ziPuhEAqhL" role="2OqNvi">
                          <node concept="2OqwBi" id="ziPuhEAs92" role="Vysub">
                            <node concept="2OqwBi" id="ziPuhEArhF" role="2Oq$k0">
                              <node concept="2JrnkZ" id="ziPuhEAr5e" role="2Oq$k0">
                                <node concept="2OqwBi" id="ziPuhEAqAu" role="2JrQYb">
                                  <node concept="2rP1CM" id="ziPuhEAqnS" role="2Oq$k0" />
                                  <node concept="I4A8Y" id="ziPuhEAqOy" role="2OqNvi" />
                                </node>
                              </node>
                              <node concept="liA8E" id="ziPuhEArw5" role="2OqNvi">
                                <ref role="37wK5l" to="mhbf:~SModel.getModule()" resolve="getModule" />
                              </node>
                            </node>
                            <node concept="liA8E" id="ziPuhEAsqg" role="2OqNvi">
                              <ref role="37wK5l" to="lui2:~SModule.getRepository()" resolve="getRepository" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3Tqbb2" id="ziPuhEAolq" role="2HTBi0">
                        <ref role="ehGHo" to="tpce:f_TJgxE" resolve="LinkDeclaration" />
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
  </node>
  <node concept="1M2fIO" id="22f9nDgOIIm">
    <property role="3GE5qa" value="expressions" />
    <ref role="1M2myG" to="f8gn:22f9nDgOIIh" resolve="BL_ReferenceTargetExpression" />
    <node concept="9S07l" id="22f9nDgOIIn" role="9Vyp8">
      <node concept="3clFbS" id="22f9nDgOIIo" role="2VODD2">
        <node concept="3clFbF" id="22f9nDgOIW9" role="3cqZAp">
          <node concept="2OqwBi" id="22f9nDgOJIC" role="3clFbG">
            <node concept="2OqwBi" id="22f9nDgOJ71" role="2Oq$k0">
              <node concept="nLn13" id="22f9nDgOIW8" role="2Oq$k0" />
              <node concept="2Xjw5R" id="22f9nDgOJsI" role="2OqNvi">
                <node concept="1xMEDy" id="22f9nDgOJsK" role="1xVPHs">
                  <node concept="chp4Y" id="22f9nDgOJvc" role="ri$Ld">
                    <ref role="cht4Q" to="f8gn:ziPuhEA2a_" resolve="ReferenceCell" />
                  </node>
                </node>
                <node concept="1xIGOp" id="22f9nDgOJzu" role="1xVPHs" />
              </node>
            </node>
            <node concept="3x8VRR" id="22f9nDgOJY7" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="1nuEuAnq2Ao">
    <property role="3GE5qa" value="styles" />
    <ref role="1M2myG" to="f8gn:1nuEuAnpfoj" resolve="BL_ColorValue" />
    <node concept="9S07l" id="1nuEuAnq2Ap" role="9Vyp8">
      <node concept="3clFbS" id="1nuEuAnq2Aq" role="2VODD2">
        <node concept="3clFbF" id="1nuEuAnq2Ar" role="3cqZAp">
          <node concept="2OqwBi" id="1nuEuAnq2As" role="3clFbG">
            <node concept="2OqwBi" id="1nuEuAnq2At" role="2Oq$k0">
              <node concept="nLn13" id="1nuEuAnq2Au" role="2Oq$k0" />
              <node concept="2Xjw5R" id="1nuEuAnq2Av" role="2OqNvi">
                <node concept="1xMEDy" id="1nuEuAnq2Aw" role="1xVPHs">
                  <node concept="chp4Y" id="1nuEuAnq2Ax" role="ri$Ld">
                    <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                  </node>
                </node>
                <node concept="1xIGOp" id="1nuEuAnq2Ay" role="1xVPHs" />
              </node>
            </node>
            <node concept="3x8VRR" id="1nuEuAnq2Az" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="7QHj_JKmDFZ">
    <ref role="1M2myG" to="f8gn:7QHj_JKkmAq" resolve="ChoiceCell" />
    <node concept="1N5Pfh" id="7QHj_JKmDG0" role="1Mr941">
      <ref role="1N5Vy1" to="f8gn:7QHj_JKkmAr" resolve="property" />
      <node concept="3dgokm" id="7QHj_JKmDG1" role="1N6uqs">
        <node concept="3clFbS" id="7QHj_JKmDG2" role="2VODD2">
          <node concept="3cpWs8" id="7QHj_JKmDG3" role="3cqZAp">
            <node concept="3cpWsn" id="7QHj_JKmDG4" role="3cpWs9">
              <property role="TrG5h" value="excludedProperties" />
              <node concept="2hMVRd" id="7QHj_JKmDG5" role="1tU5fm">
                <node concept="2sp9CU" id="7QHj_JKmDG6" role="2hN53Y">
                  <ref role="2sp9C9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
                </node>
              </node>
              <node concept="2ShNRf" id="7QHj_JKmDG7" role="33vP2m">
                <node concept="2i4dXS" id="7QHj_JKmDG8" role="2ShVmc">
                  <node concept="2sp9CU" id="7QHj_JKmDG9" role="HW$YZ">
                    <ref role="2sp9C9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
                  </node>
                  <node concept="2tJFMh" id="7QHj_JKmDGa" role="HW$Y0">
                    <node concept="ZC_QK" id="7QHj_JKmDGb" role="2tJFKM">
                      <ref role="2aWVGs" to="tpck:gw2VY9q" resolve="BaseConcept" />
                      <node concept="ZC_QK" id="7QHj_JKmDGc" role="2aWVGa">
                        <ref role="2aWVGs" to="tpck:gOOYnlO" resolve="shortDescription" />
                      </node>
                    </node>
                  </node>
                  <node concept="2tJFMh" id="7QHj_JKmDGd" role="HW$Y0">
                    <node concept="ZC_QK" id="7QHj_JKmDGe" role="2tJFKM">
                      <ref role="2aWVGs" to="tpck:gw2VY9q" resolve="BaseConcept" />
                      <node concept="ZC_QK" id="7QHj_JKmDGf" role="2aWVGa">
                        <ref role="2aWVGs" to="tpck:hnGE5uv" resolve="virtualPackage" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbF" id="7QHj_JKmDGg" role="3cqZAp">
            <node concept="2YIFZM" id="7QHj_JKmDGh" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="7QHj_JKmDGi" role="37wK5m">
                <node concept="2OqwBi" id="7QHj_JKmDGj" role="2Oq$k0">
                  <node concept="2OqwBi" id="7QHj_JKmDGk" role="2Oq$k0">
                    <node concept="2OqwBi" id="7QHj_JKmDGl" role="2Oq$k0">
                      <node concept="2OqwBi" id="7QHj_JKmDGm" role="2Oq$k0">
                        <node concept="2rP1CM" id="7QHj_JKmDGn" role="2Oq$k0" />
                        <node concept="2Xjw5R" id="7QHj_JKmDGo" role="2OqNvi">
                          <node concept="1xMEDy" id="7QHj_JKmDGp" role="1xVPHs">
                            <node concept="chp4Y" id="7QHj_JKmDGq" role="ri$Ld">
                              <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                            </node>
                          </node>
                          <node concept="1xIGOp" id="7QHj_JKmDGr" role="1xVPHs" />
                        </node>
                      </node>
                      <node concept="3TrEf2" id="7QHj_JKmDGs" role="2OqNvi">
                        <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                      </node>
                    </node>
                    <node concept="2qgKlT" id="7QHj_JKmDGt" role="2OqNvi">
                      <ref role="37wK5l" to="tpcn:hEwILLM" resolve="getPropertyDeclarations" />
                    </node>
                  </node>
                  <node concept="3zZkjj" id="7QHj_JKmDGu" role="2OqNvi">
                    <node concept="1bVj0M" id="7QHj_JKmDGv" role="23t8la">
                      <node concept="3clFbS" id="7QHj_JKmDGw" role="1bW5cS">
                        <node concept="3clFbF" id="7QHj_JKmDGx" role="3cqZAp">
                          <node concept="3fqX7Q" id="7QHj_JKmDGy" role="3clFbG">
                            <node concept="2OqwBi" id="7QHj_JKmDGz" role="3fr31v">
                              <node concept="37vLTw" id="7QHj_JKmDG$" role="2Oq$k0">
                                <ref role="3cqZAo" node="7QHj_JKmDG4" resolve="excludedProperties" />
                              </node>
                              <node concept="3JPx81" id="7QHj_JKmDG_" role="2OqNvi">
                                <node concept="2OqwBi" id="7QHj_JKmDGA" role="25WWJ7">
                                  <node concept="37vLTw" id="7QHj_JKmDGB" role="2Oq$k0">
                                    <ref role="3cqZAo" node="7QHj_JKmDGD" resolve="it" />
                                  </node>
                                  <node concept="iZEcu" id="7QHj_JKmDGC" role="2OqNvi" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="gl6BB" id="7QHj_JKmDGD" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="7QHj_JKmDGE" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="ANE8D" id="7QHj_JKmDGF" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

