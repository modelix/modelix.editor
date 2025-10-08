<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:28aee31b-7eb2-4b8c-9af2-7c3ea4880b2d(ReactDemoLanguage.constraints)">
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
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="oyym" ref="r:1570828e-e9a4-47ff-95d9-80c800704647(ReactDemoLanguage.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
    </language>
    <language id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints">
      <concept id="6702802731807351367" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_CanBeAChild" flags="in" index="9S07l" />
      <concept id="6702802731807420587" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_CanBeAParent" flags="ig" index="9SLcT" />
      <concept id="6702802731807424858" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_CanBeAnAncestor" flags="in" index="9SQb8" />
      <concept id="1202989658459" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_parentNode" flags="nn" index="nLn13" />
      <concept id="8966504967485224688" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_contextNode" flags="nn" index="2rP1CM" />
      <concept id="4303308395523096213" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_childConcept" flags="ng" index="2DD5aU" />
      <concept id="1147467115080" name="jetbrains.mps.lang.constraints.structure.NodePropertyConstraint" flags="ng" index="EnEH3">
        <reference id="1147467295099" name="applicableProperty" index="EomxK" />
        <child id="1212097481299" name="propertyValidator" index="QCWH9" />
      </concept>
      <concept id="1147468365020" name="jetbrains.mps.lang.constraints.structure.ConstraintsFunctionParameter_node" flags="nn" index="EsrRn" />
      <concept id="1212096972063" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_PropertyValidator" flags="in" index="QB0g5" />
      <concept id="5564765827938091039" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_ReferentSearchScope_Scope" flags="ig" index="3dgokm" />
      <concept id="1213093968558" name="jetbrains.mps.lang.constraints.structure.ConceptConstraints" flags="ng" index="1M2fIO">
        <reference id="1213093996982" name="concept" index="1M2myG" />
        <child id="6702802731807532730" name="canBeAncestor" index="9SGkC" />
        <child id="6702802731807532712" name="canBeParent" index="9SGkU" />
        <child id="6702802731807737306" name="canBeChild" index="9Vyp8" />
        <child id="1213098023997" name="property" index="1MhHOB" />
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
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1171323947159" name="jetbrains.mps.lang.smodel.structure.Model_NodesOperation" flags="nn" index="2SmgA7">
        <child id="1758937410080001570" name="conceptArgument" index="1dBWTz" />
      </concept>
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1180031783296" name="jetbrains.mps.lang.smodel.structure.Concept_IsSubConceptOfOperation" flags="nn" index="2Zo12i">
        <child id="1180031783297" name="conceptArgument" index="2Zo12j" />
      </concept>
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1144100932627" name="jetbrains.mps.lang.smodel.structure.OperationParm_Inclusion" flags="ng" index="1xIGOp" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
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
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
    </language>
  </registry>
  <node concept="1M2fIO" id="5KtU3pY3EwG">
    <ref role="1M2myG" to="oyym:5KtU3pXuL15" resolve="RefTest" />
    <node concept="1N5Pfh" id="5KtU3pY3ENf" role="1Mr941">
      <ref role="1N5Vy1" to="oyym:5KtU3pXwbBQ" resolve="target" />
      <node concept="3dgokm" id="5KtU3pY3F6o" role="1N6uqs">
        <node concept="3clFbS" id="5KtU3pY3F6p" role="2VODD2">
          <node concept="3clFbF" id="5KtU3pY3Xd3" role="3cqZAp">
            <node concept="2YIFZM" id="5KtU3pY42Bl" role="3clFbG">
              <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
              <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
              <node concept="2OqwBi" id="5KtU3pY3NNK" role="37wK5m">
                <node concept="2OqwBi" id="5KtU3pY3GNY" role="2Oq$k0">
                  <node concept="2OqwBi" id="5KtU3pY3FTc" role="2Oq$k0">
                    <node concept="2rP1CM" id="5KtU3pY3Fsa" role="2Oq$k0" />
                    <node concept="I4A8Y" id="5KtU3pY3Gme" role="2OqNvi" />
                  </node>
                  <node concept="2SmgA7" id="5KtU3pY3Hgx" role="2OqNvi">
                    <node concept="chp4Y" id="5KtU3pY3KiO" role="1dBWTz">
                      <ref role="cht4Q" to="oyym:5KtU3pXuL15" resolve="RefTest" />
                    </node>
                  </node>
                </node>
                <node concept="3zZkjj" id="5KtU3pY3QOl" role="2OqNvi">
                  <node concept="1bVj0M" id="5KtU3pY3QOn" role="23t8la">
                    <node concept="3clFbS" id="5KtU3pY3QOo" role="1bW5cS">
                      <node concept="3clFbF" id="5KtU3pY3QOu" role="3cqZAp">
                        <node concept="2OqwBi" id="5KtU3pY3TQW" role="3clFbG">
                          <node concept="2OqwBi" id="5KtU3pY3ReF" role="2Oq$k0">
                            <node concept="37vLTw" id="5KtU3pY3QOt" role="2Oq$k0">
                              <ref role="3cqZAo" node="5KtU3pY3QOp" resolve="it" />
                            </node>
                            <node concept="3TrcHB" id="5KtU3pY3RVK" role="2OqNvi">
                              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                            </node>
                          </node>
                          <node concept="liA8E" id="5KtU3pY3W1F" role="2OqNvi">
                            <ref role="37wK5l" to="wyt6:~String.startsWith(java.lang.String)" resolve="startsWith" />
                            <node concept="Xl_RD" id="5KtU3pY3W1I" role="37wK5m">
                              <property role="Xl_RC" value="R" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="gl6BB" id="5KtU3pY3QOp" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="5KtU3pY3QOq" role="1tU5fm" />
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
  <node concept="1M2fIO" id="7pCqlJiMr3J">
    <property role="3GE5qa" value="constraints" />
    <ref role="1M2myG" to="oyym:7pCqlJiMr3I" resolve="ConstraintCannotBeChild" />
    <node concept="9S07l" id="7pCqlJiMr3K" role="9Vyp8">
      <node concept="3clFbS" id="7pCqlJiMr3L" role="2VODD2">
        <node concept="3clFbF" id="7pCqlJiMrhm" role="3cqZAp">
          <node concept="2OqwBi" id="7pCqlJiMrP_" role="3clFbG">
            <node concept="2OqwBi" id="7pCqlJiMrsG" role="2Oq$k0">
              <node concept="nLn13" id="7pCqlJiMrhl" role="2Oq$k0" />
              <node concept="2Xjw5R" id="7pCqlJiMr_S" role="2OqNvi">
                <node concept="1xMEDy" id="7pCqlJiMr_U" role="1xVPHs">
                  <node concept="chp4Y" id="7pCqlJiMrCl" role="ri$Ld">
                    <ref role="cht4Q" to="oyym:7pCqlJiMr3E" resolve="ConstraintRoot" />
                  </node>
                </node>
                <node concept="1xIGOp" id="7pCqlJiMrFA" role="1xVPHs" />
              </node>
            </node>
            <node concept="3w_OXm" id="7pCqlJiMsd6" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="7pCqlJiMshP">
    <property role="3GE5qa" value="constraints" />
    <ref role="1M2myG" to="oyym:7pCqlJiMr3E" resolve="ConstraintRoot" />
    <node concept="9SLcT" id="7pCqlJiMshQ" role="9SGkU">
      <node concept="3clFbS" id="7pCqlJiMshR" role="2VODD2">
        <node concept="3clFbF" id="7pCqlJiMWiU" role="3cqZAp">
          <node concept="3fqX7Q" id="7pCqlJiMYhs" role="3clFbG">
            <node concept="2OqwBi" id="7pCqlJiMYhu" role="3fr31v">
              <node concept="2DD5aU" id="7pCqlJiMYhv" role="2Oq$k0" />
              <node concept="2Zo12i" id="7pCqlJiMYhw" role="2OqNvi">
                <node concept="chp4Y" id="7pCqlJiMYhx" role="2Zo12j">
                  <ref role="cht4Q" to="oyym:7pCqlJiMshO" resolve="ConstraintChildCannotBeParent" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="9SQb8" id="7pCqlJiMuhw" role="9SGkC">
      <node concept="3clFbS" id="7pCqlJiMuhx" role="2VODD2">
        <node concept="3clFbF" id="7pCqlJiMuv4" role="3cqZAp">
          <node concept="3fqX7Q" id="7pCqlJiMST7" role="3clFbG">
            <node concept="2OqwBi" id="7pCqlJiMST9" role="3fr31v">
              <node concept="2DD5aU" id="7pCqlJiMSTa" role="2Oq$k0" />
              <node concept="2Zo12i" id="7pCqlJiMSTb" role="2OqNvi">
                <node concept="chp4Y" id="7pCqlJiMSTc" role="2Zo12j">
                  <ref role="cht4Q" to="oyym:7pCqlJiMtWS" resolve="ConstraintChildCannotBeAncestor" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="8yek82NQmG">
    <ref role="1M2myG" to="oyym:3d2g73CmXYi" resolve="ErrorChecking" />
    <node concept="EnEH3" id="8yek82NQmH" role="1MhHOB">
      <ref role="EomxK" to="oyym:7$1mkeAymFe" resolve="s" />
      <node concept="QB0g5" id="8yek82NQnm" role="QCWH9">
        <node concept="3clFbS" id="8yek82NQnn" role="2VODD2">
          <node concept="3clFbF" id="8yek82NQ_$" role="3cqZAp">
            <node concept="3fqX7Q" id="8yek82NVsw" role="3clFbG">
              <node concept="2OqwBi" id="8yek82NVsy" role="3fr31v">
                <node concept="2OqwBi" id="8yek82NVsz" role="2Oq$k0">
                  <node concept="EsrRn" id="8yek82NVs$" role="2Oq$k0" />
                  <node concept="3TrcHB" id="8yek82NVs_" role="2OqNvi">
                    <ref role="3TsBF5" to="oyym:7$1mkeAymFe" resolve="s" />
                  </node>
                </node>
                <node concept="liA8E" id="8yek82NVsA" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
                  <node concept="Xl_RD" id="8yek82NVsB" role="37wK5m">
                    <property role="Xl_RC" value="x" />
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

