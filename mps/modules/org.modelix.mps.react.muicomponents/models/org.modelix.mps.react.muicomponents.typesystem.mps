<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:85d6c7b2-9d55-4c1f-8c9b-e9fb64542a11(org.modelix.mps.react.muicomponents.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="tp25" ref="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" />
    <import index="zaxg" ref="r:c4183f14-1033-4ade-be7c-1beadb184134(org.modelix.mps.react.muicomponents.structure)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="7923" ref="r:2c5a8407-fd65-4ea4-b95e-a8f8fee129c0(org.modelix.mps.react.muicomponents.behavior)" implicit="true" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="guwi" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.io(JDK/)" implicit="true" />
    <import index="tpcn" ref="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" implicit="true" />
    <import index="tp2q" ref="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
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
        <child id="1206060520071" name="elsifClauses" index="3eNLev" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1206060495898" name="jetbrains.mps.baseLanguage.structure.ElsifClause" flags="ng" index="3eNFk2">
        <child id="1206060619838" name="condition" index="3eO9$A" />
        <child id="1206060644605" name="statementList" index="3eOfB_" />
      </concept>
      <concept id="1079359253375" name="jetbrains.mps.baseLanguage.structure.ParenthesizedExpression" flags="nn" index="1eOMI4">
        <child id="1079359253376" name="expression" index="1eOMHV" />
      </concept>
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
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="5455284157994012186" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitLink" flags="ng" index="2pIpSj">
        <reference id="5455284157994012188" name="link" index="2pIpSl" />
        <child id="1595412875168045827" name="initValue" index="28nt2d" />
      </concept>
      <concept id="5455284157993863837" name="jetbrains.mps.lang.quotation.structure.NodeBuilder" flags="nn" index="2pJPEk">
        <child id="5455284157993863838" name="quotedNode" index="2pJPEn" />
      </concept>
      <concept id="5455284157993863840" name="jetbrains.mps.lang.quotation.structure.NodeBuilderNode" flags="nn" index="2pJPED">
        <reference id="5455284157993910961" name="concept" index="2pJxaS" />
        <child id="5455284157993911099" name="values" index="2pJxcM" />
      </concept>
      <concept id="8182547171709752110" name="jetbrains.mps.lang.quotation.structure.NodeBuilderExpression" flags="nn" index="36biLy">
        <child id="8182547171709752112" name="expression" index="36biLW" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1185805035213" name="jetbrains.mps.lang.typesystem.structure.WhenConcreteStatement" flags="nn" index="nvevp">
        <child id="1185805047793" name="body" index="nvhr_" />
        <child id="1185805056450" name="argument" index="nvjzm" />
        <child id="1205761991995" name="argumentRepresentator" index="2X0Ygz" />
      </concept>
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1205762105978" name="jetbrains.mps.lang.typesystem.structure.WhenConcreteVariableDeclaration" flags="ng" index="2X1qdy" />
      <concept id="1205762656241" name="jetbrains.mps.lang.typesystem.structure.WhenConcreteVariableReference" flags="nn" index="2X3wrD">
        <reference id="1205762683928" name="whenConcreteVar" index="2X3Bk0" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
      <concept id="1176544042499" name="jetbrains.mps.lang.typesystem.structure.Node_TypeOperation" flags="nn" index="3JvlWi" />
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF" />
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
      <concept id="1174657487114" name="jetbrains.mps.lang.typesystem.structure.TypeOfExpression" flags="nn" index="1Z2H0r">
        <child id="1174657509053" name="term" index="1Z2MuG" />
      </concept>
      <concept id="1174658326157" name="jetbrains.mps.lang.typesystem.structure.CreateEquationStatement" flags="nn" index="1Z5TYs" />
      <concept id="1174660718586" name="jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement" flags="nn" index="1Zf1VF">
        <property id="1206359757216" name="checkOnly" index="3wDh2S" />
        <child id="1174660783413" name="leftExpression" index="1ZfhK$" />
        <child id="1174660783414" name="rightExpression" index="1ZfhKB" />
      </concept>
      <concept id="1174663118805" name="jetbrains.mps.lang.typesystem.structure.CreateLessThanInequationStatement" flags="nn" index="1ZobV4" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
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
  </registry>
  <node concept="18kY7G" id="2vPZMAmv$Ba">
    <property role="TrG5h" value="check_NodePropRef" />
    <property role="3GE5qa" value="util" />
    <node concept="3clFbS" id="2vPZMAmv$Bb" role="18ibNy">
      <node concept="3clFbJ" id="2vPZMAmv$CL" role="3cqZAp">
        <node concept="3fqX7Q" id="2vPZMAmv_jV" role="3clFbw">
          <node concept="2OqwBi" id="2vPZMAmv_jX" role="3fr31v">
            <node concept="2OqwBi" id="2vPZMAmv_jY" role="2Oq$k0">
              <node concept="2OqwBi" id="2vPZMAmzZB3" role="2Oq$k0">
                <node concept="1YBJjd" id="2vPZMAmv_jZ" role="2Oq$k0">
                  <ref role="1YBMHb" node="2vPZMAmv$Bd" resolve="npr" />
                </node>
                <node concept="3TrEf2" id="2vPZMAmzZLF" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgm" resolve="node" />
                </node>
              </node>
              <node concept="3JvlWi" id="2vPZMAmv_k0" role="2OqNvi" />
            </node>
            <node concept="1mIQ4w" id="2vPZMAmv_k1" role="2OqNvi">
              <node concept="chp4Y" id="2vPZMAmv_k2" role="cj9EA">
                <ref role="cht4Q" to="tp25:gzTqbfa" resolve="SNodeType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="2vPZMAmv$CN" role="3clFbx">
          <node concept="2MkqsV" id="2vPZMAmv_kE" role="3cqZAp">
            <node concept="Xl_RD" id="2vPZMAmv_kN" role="2MkJ7o">
              <property role="Xl_RC" value="must be a node" />
            </node>
            <node concept="2OqwBi" id="2vPZMAmv_sU" role="1urrMF">
              <node concept="1YBJjd" id="2vPZMAmv_l6" role="2Oq$k0">
                <ref role="1YBMHb" node="2vPZMAmv$Bd" resolve="npr" />
              </node>
              <node concept="3TrEf2" id="2vPZMAmv_AN" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgm" resolve="node" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="2vPZMAmv$Bd" role="1YuTPh">
      <property role="TrG5h" value="npr" />
      <ref role="1YaFvo" to="zaxg:2vPZMAmvsgl" resolve="NodePropRef" />
    </node>
  </node>
  <node concept="1YbPZF" id="2NkZbYf050T">
    <property role="TrG5h" value="typeof_TreeNode" />
    <property role="3GE5qa" value="layout" />
    <node concept="3clFbS" id="2NkZbYf050U" role="18ibNy">
      <node concept="1ZobV4" id="2NkZbYf07O$" role="3cqZAp">
        <node concept="mw_s8" id="2NkZbYf087C" role="1ZfhKB">
          <node concept="2pJPEk" id="2NkZbYf087$" role="mwGJk">
            <node concept="2pJPED" id="2NkZbYf087A" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="2NkZbYf07OB" role="1ZfhK$">
          <node concept="1Z2H0r" id="2NkZbYf05A9" role="mwGJk">
            <node concept="2OqwBi" id="2NkZbYf06jQ" role="1Z2MuG">
              <node concept="1YBJjd" id="2NkZbYf05SS" role="2Oq$k0">
                <ref role="1YBMHb" node="2NkZbYf050W" resolve="tn" />
              </node>
              <node concept="3TrEf2" id="2NkZbYf06LK" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2NkZbYeZXux" resolve="idExpr" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="2NkZbYf08H2" role="3cqZAp">
        <node concept="mw_s8" id="2NkZbYf08H3" role="1ZfhKB">
          <node concept="2pJPEk" id="2NkZbYf08H4" role="mwGJk">
            <node concept="2pJPED" id="2NkZbYf08H5" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="2NkZbYf08H6" role="1ZfhK$">
          <node concept="1Z2H0r" id="2NkZbYf08H7" role="mwGJk">
            <node concept="2OqwBi" id="2NkZbYf08H8" role="1Z2MuG">
              <node concept="1YBJjd" id="2NkZbYf08H9" role="2Oq$k0">
                <ref role="1YBMHb" node="2NkZbYf050W" resolve="tn" />
              </node>
              <node concept="3TrEf2" id="2NkZbYf08Ha" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2NkZbYeZY3A" resolve="labelExpr" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="nvevp" id="2NkZbYf09NR" role="3cqZAp">
        <node concept="3clFbS" id="2NkZbYf09NT" role="nvhr_">
          <node concept="3clFbJ" id="2NkZbYf0bTJ" role="3cqZAp">
            <node concept="3fqX7Q" id="2NkZbYf0iEO" role="3clFbw">
              <node concept="1eOMI4" id="2NkZbYf0iF2" role="3fr31v">
                <node concept="2OqwBi" id="2NkZbYf0cDo" role="1eOMHV">
                  <node concept="2X3wrD" id="2NkZbYf0cwN" role="2Oq$k0">
                    <ref role="2X3Bk0" node="2NkZbYf09NX" resolve="ct" />
                  </node>
                  <node concept="1mIQ4w" id="2NkZbYf0d45" role="2OqNvi">
                    <node concept="chp4Y" id="2NkZbYf0do_" role="cj9EA">
                      <ref role="cht4Q" to="tp25:gEI9FSM" resolve="SNodeListType" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbS" id="2NkZbYf0bTL" role="3clFbx">
              <node concept="2MkqsV" id="2NkZbYf0iZi" role="3cqZAp">
                <node concept="Xl_RD" id="2NkZbYf0jhX" role="2MkJ7o">
                  <property role="Xl_RC" value="must be a sequence of nodes" />
                </node>
                <node concept="2OqwBi" id="2NkZbYf0jZT" role="1urrMF">
                  <node concept="1YBJjd" id="2NkZbYf0j$V" role="2Oq$k0">
                    <ref role="1YBMHb" node="2NkZbYf050W" resolve="tn" />
                  </node>
                  <node concept="3TrEf2" id="2NkZbYf0kz4" role="2OqNvi">
                    <ref role="3Tt5mk" to="zaxg:2NkZbYeZYm9" resolve="childrenExpr" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1Z2H0r" id="2NkZbYf0a6D" role="nvjzm">
          <node concept="2OqwBi" id="2NkZbYf0aOM" role="1Z2MuG">
            <node concept="1YBJjd" id="2NkZbYf0ap_" role="2Oq$k0">
              <ref role="1YBMHb" node="2NkZbYf050W" resolve="tn" />
            </node>
            <node concept="3TrEf2" id="2NkZbYf0bjz" role="2OqNvi">
              <ref role="3Tt5mk" to="zaxg:2NkZbYeZYm9" resolve="childrenExpr" />
            </node>
          </node>
        </node>
        <node concept="2X1qdy" id="2NkZbYf09NX" role="2X0Ygz">
          <property role="TrG5h" value="ct" />
          <node concept="2jxLKc" id="2NkZbYf09NY" role="1tU5fm" />
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="2NkZbYf050W" role="1YuTPh">
      <property role="TrG5h" value="tn" />
      <ref role="1YaFvo" to="zaxg:2NkZbYeZWAz" resolve="TreeNode" />
    </node>
  </node>
  <node concept="1YbPZF" id="2NkZbYfb8sO">
    <property role="TrG5h" value="typeof_TreeView" />
    <property role="3GE5qa" value="layout" />
    <node concept="3clFbS" id="2NkZbYfb8sP" role="18ibNy">
      <node concept="1ZobV4" id="2NkZbYfbbRJ" role="3cqZAp">
        <node concept="mw_s8" id="2NkZbYfbcaN" role="1ZfhKB">
          <node concept="2pJPEk" id="2NkZbYfbcaJ" role="mwGJk">
            <node concept="2pJPED" id="2NkZbYfbcaL" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="2NkZbYfbbRM" role="1ZfhK$">
          <node concept="1Z2H0r" id="2NkZbYfb8Jz" role="mwGJk">
            <node concept="2OqwBi" id="2NkZbYfb9em" role="1Z2MuG">
              <node concept="1YBJjd" id="2NkZbYfb93W" role="2Oq$k0">
                <ref role="1YBMHb" node="2NkZbYfb8sR" resolve="treeView" />
              </node>
              <node concept="3TrEf2" id="2NkZbYfb9L8" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2NkZbYfaDge" resolve="selectionStateTracker" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="2NkZbYfb8sR" role="1YuTPh">
      <property role="TrG5h" value="treeView" />
      <ref role="1YaFvo" to="zaxg:2NkZbYfax87" resolve="TreeView" />
    </node>
  </node>
  <node concept="1YbPZF" id="1LliyakMwyh">
    <property role="TrG5h" value="typeof_ItFunctionIt" />
    <property role="3GE5qa" value="values" />
    <node concept="3clFbS" id="1LliyakMwyi" role="18ibNy">
      <node concept="3cpWs8" id="1LliyakMzjg" role="3cqZAp">
        <node concept="3cpWsn" id="1LliyakMzjh" role="3cpWs9">
          <property role="TrG5h" value="fun" />
          <node concept="3Tqbb2" id="1LliyakMz0F" role="1tU5fm">
            <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
          </node>
          <node concept="2OqwBi" id="1LliyakMzji" role="33vP2m">
            <node concept="1YBJjd" id="1LliyakMzjj" role="2Oq$k0">
              <ref role="1YBMHb" node="1LliyakMwyk" resolve="it" />
            </node>
            <node concept="2Xjw5R" id="1LliyakMzjk" role="2OqNvi">
              <node concept="1xMEDy" id="1LliyakMzjl" role="1xVPHs">
                <node concept="chp4Y" id="1LliyakMzjm" role="ri$Ld">
                  <ref role="cht4Q" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3cpWs8" id="1LliyakM_7E" role="3cqZAp">
        <node concept="3cpWsn" id="1LliyakM_7F" role="3cpWs9">
          <property role="TrG5h" value="ctx" />
          <node concept="3Tqbb2" id="1LliyakM$P5" role="1tU5fm">
            <ref role="ehGHo" to="zaxg:1LliyakMlNn" resolve="IItFunctionContext" />
          </node>
          <node concept="2OqwBi" id="1LliyakM_7G" role="33vP2m">
            <node concept="1YBJjd" id="1LliyakM_7H" role="2Oq$k0">
              <ref role="1YBMHb" node="1LliyakMwyk" resolve="it" />
            </node>
            <node concept="2Xjw5R" id="1LliyakM_7I" role="2OqNvi">
              <node concept="1xMEDy" id="1LliyakM_7J" role="1xVPHs">
                <node concept="chp4Y" id="1LliyakM_7K" role="ri$Ld">
                  <ref role="cht4Q" to="zaxg:1LliyakMlNn" resolve="IItFunctionContext" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1Z5TYs" id="1LliyakMB11" role="3cqZAp">
        <node concept="mw_s8" id="1LliyakMBk3" role="1ZfhKB">
          <node concept="2OqwBi" id="1LliyakMBrE" role="mwGJk">
            <node concept="37vLTw" id="1LliyakMBk1" role="2Oq$k0">
              <ref role="3cqZAo" node="1LliyakM_7F" resolve="ctx" />
            </node>
            <node concept="2qgKlT" id="1LliyakMBRx" role="2OqNvi">
              <ref role="37wK5l" to="7923:1LliyakMmFh" resolve="itType" />
              <node concept="37vLTw" id="1LliyakMCe2" role="37wK5m">
                <ref role="3cqZAo" node="1LliyakMzjh" resolve="fun" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="1LliyakMB14" role="1ZfhK$">
          <node concept="1Z2H0r" id="1LliyakMA_w" role="mwGJk">
            <node concept="1YBJjd" id="1LliyakMA_A" role="1Z2MuG">
              <ref role="1YBMHb" node="1LliyakMwyk" resolve="it" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1LliyakMwyk" role="1YuTPh">
      <property role="TrG5h" value="it" />
      <ref role="1YaFvo" to="zaxg:1LliyakMqbL" resolve="ItFunctionIt" />
    </node>
  </node>
  <node concept="1YbPZF" id="1LliyakMCC5">
    <property role="TrG5h" value="typeof_ItFunction" />
    <property role="3GE5qa" value="values" />
    <node concept="3clFbS" id="1LliyakMCC6" role="18ibNy">
      <node concept="3cpWs8" id="1LliyakMCUQ" role="3cqZAp">
        <node concept="3cpWsn" id="1LliyakMCUR" role="3cpWs9">
          <property role="TrG5h" value="ctx" />
          <node concept="3Tqbb2" id="1LliyakMCUS" role="1tU5fm">
            <ref role="ehGHo" to="zaxg:1LliyakMlNn" resolve="IItFunctionContext" />
          </node>
          <node concept="2OqwBi" id="1LliyakMCUT" role="33vP2m">
            <node concept="1YBJjd" id="1LliyakMCUU" role="2Oq$k0">
              <ref role="1YBMHb" node="1LliyakMCC8" resolve="fun" />
            </node>
            <node concept="2Xjw5R" id="1LliyakMCUV" role="2OqNvi">
              <node concept="1xMEDy" id="1LliyakMCUW" role="1xVPHs">
                <node concept="chp4Y" id="1LliyakMCUX" role="ri$Ld">
                  <ref role="cht4Q" to="zaxg:1LliyakMlNn" resolve="IItFunctionContext" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3cpWs8" id="1LliyakMGTG" role="3cqZAp">
        <node concept="3cpWsn" id="1LliyakMGTH" role="3cpWs9">
          <property role="TrG5h" value="resType" />
          <node concept="3Tqbb2" id="1LliyakMGB0" role="1tU5fm">
            <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
          </node>
          <node concept="2OqwBi" id="1LliyakMGTI" role="33vP2m">
            <node concept="37vLTw" id="1LliyakMGTJ" role="2Oq$k0">
              <ref role="3cqZAo" node="1LliyakMCUR" resolve="ctx" />
            </node>
            <node concept="2qgKlT" id="1LliyakMGTK" role="2OqNvi">
              <ref role="37wK5l" to="7923:1LliyakMp10" resolve="resultType" />
              <node concept="1YBJjd" id="1LliyakMGTL" role="37wK5m">
                <ref role="1YBMHb" node="1LliyakMCC8" resolve="fun" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1Z5TYs" id="1LliyakMCUY" role="3cqZAp">
        <node concept="mw_s8" id="1LliyakMJ8K" role="1ZfhKB">
          <node concept="37vLTw" id="1LliyakMJ8E" role="mwGJk">
            <ref role="3cqZAo" node="1LliyakMGTH" resolve="resType" />
          </node>
        </node>
        <node concept="mw_s8" id="1LliyakMCV4" role="1ZfhK$">
          <node concept="1Z2H0r" id="1LliyakMCV5" role="mwGJk">
            <node concept="1YBJjd" id="1LliyakMCV6" role="1Z2MuG">
              <ref role="1YBMHb" node="1LliyakMCC8" resolve="fun" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="1LliyakMKEr" role="3cqZAp">
        <node concept="mw_s8" id="1LliyakMKEv" role="1ZfhK$">
          <node concept="1Z2H0r" id="1LliyakMKEw" role="mwGJk">
            <node concept="2OqwBi" id="1LliyakMKEx" role="1Z2MuG">
              <node concept="1YBJjd" id="1LliyakMKEy" role="2Oq$k0">
                <ref role="1YBMHb" node="1LliyakMCC8" resolve="fun" />
              </node>
              <node concept="3TrEf2" id="1LliyakMKEz" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:1LliyakMhIr" resolve="body" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="1LliyakMKEt" role="1ZfhKB">
          <node concept="37vLTw" id="1LliyakMKEu" role="mwGJk">
            <ref role="3cqZAo" node="1LliyakMGTH" resolve="resType" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1LliyakMCC8" role="1YuTPh">
      <property role="TrG5h" value="fun" />
      <ref role="1YaFvo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
    </node>
  </node>
  <node concept="1YbPZF" id="1LliyakXFEQ">
    <property role="TrG5h" value="typeof_TextField" />
    <property role="3GE5qa" value="widgets" />
    <node concept="3clFbS" id="1LliyakXFER" role="18ibNy">
      <node concept="3cpWs8" id="1LliyakY5K7" role="3cqZAp">
        <node concept="3cpWsn" id="1LliyakY5K8" role="3cpWs9">
          <property role="TrG5h" value="vcr" />
          <node concept="3Tqbb2" id="1LliyakY5sQ" role="1tU5fm">
            <ref role="ehGHo" to="zaxg:1LliyakUDrD" resolve="ValueConverterRef" />
          </node>
          <node concept="2OqwBi" id="1LliyakY5K9" role="33vP2m">
            <node concept="1YBJjd" id="1LliyakY5Ka" role="2Oq$k0">
              <ref role="1YBMHb" node="1LliyakXFET" resolve="tf" />
            </node>
            <node concept="3TrEf2" id="1LliyakY5Kb" role="2OqNvi">
              <ref role="3Tt5mk" to="zaxg:1LliyakUHuy" resolve="valueConverter" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="1LliyakXGga" role="3cqZAp">
        <node concept="2OqwBi" id="1LliyakXJcO" role="3clFbw">
          <node concept="37vLTw" id="1LliyakY5Kc" role="2Oq$k0">
            <ref role="3cqZAo" node="1LliyakY5K8" resolve="vcr" />
          </node>
          <node concept="3w_OXm" id="1LliyakXJG7" role="2OqNvi" />
        </node>
        <node concept="3clFbS" id="1LliyakXGgc" role="3clFbx">
          <node concept="1ZobV4" id="1LliyakXPzZ" role="3cqZAp">
            <property role="3wDh2S" value="true" />
            <node concept="mw_s8" id="1LliyakXPR0" role="1ZfhKB">
              <node concept="2pJPEk" id="1LliyakXPQW" role="mwGJk">
                <node concept="2pJPED" id="1LliyakXPQY" role="2pJPEn">
                  <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
                </node>
              </node>
            </node>
            <node concept="mw_s8" id="1LliyakXP$2" role="1ZfhK$">
              <node concept="1Z2H0r" id="1LliyakXK38" role="mwGJk">
                <node concept="2OqwBi" id="1LliyakXKOt" role="1Z2MuG">
                  <node concept="1YBJjd" id="1LliyakXKnx" role="2Oq$k0">
                    <ref role="1YBMHb" node="1LliyakXFET" resolve="tf" />
                  </node>
                  <node concept="3TrEf2" id="1LliyakXLnv" role="2OqNvi">
                    <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgs" resolve="data" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="9aQIb" id="1LliyakXSnn" role="9aQIa">
          <node concept="3clFbS" id="1LliyakXSno" role="9aQI4">
            <node concept="3cpWs8" id="1LliyakY6oK" role="3cqZAp">
              <node concept="3cpWsn" id="1LliyakY6oL" role="3cpWs9">
                <property role="TrG5h" value="vc" />
                <node concept="3Tqbb2" id="1LliyakY65w" role="1tU5fm">
                  <ref role="ehGHo" to="zaxg:1Lliyak$MAq" resolve="ValueConverter" />
                </node>
                <node concept="2OqwBi" id="1LliyakY6oM" role="33vP2m">
                  <node concept="37vLTw" id="1LliyakY6oN" role="2Oq$k0">
                    <ref role="3cqZAo" node="1LliyakY5K8" resolve="vcr" />
                  </node>
                  <node concept="3TrEf2" id="1LliyakY6oO" role="2OqNvi">
                    <ref role="3Tt5mk" to="zaxg:1LliyakUE14" resolve="valueConverter" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="1ZobV4" id="1LliyakXY6M" role="3cqZAp">
              <property role="3wDh2S" value="true" />
              <node concept="mw_s8" id="1LliyakXZ$X" role="1ZfhKB">
                <node concept="2pJPEk" id="1LliyakXZ$N" role="mwGJk">
                  <node concept="2pJPED" id="1LliyakXZ$S" role="2pJPEn">
                    <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
                  </node>
                </node>
              </node>
              <node concept="mw_s8" id="1LliyakXY6P" role="1ZfhK$">
                <node concept="2OqwBi" id="1LliyakXUYT" role="mwGJk">
                  <node concept="37vLTw" id="1LliyakY6oP" role="2Oq$k0">
                    <ref role="3cqZAo" node="1LliyakY6oL" resolve="vc" />
                  </node>
                  <node concept="3TrEf2" id="1LliyakXVyA" role="2OqNvi">
                    <ref role="3Tt5mk" to="zaxg:1Lliyak$O3t" resolve="widgetType" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="1ZobV4" id="1LliyakY0Jk" role="3cqZAp">
              <property role="3wDh2S" value="true" />
              <node concept="mw_s8" id="1LliyakY1BP" role="1ZfhKB">
                <node concept="2OqwBi" id="1LliyakY4x5" role="mwGJk">
                  <node concept="37vLTw" id="1LliyakY6oQ" role="2Oq$k0">
                    <ref role="3cqZAo" node="1LliyakY6oL" resolve="vc" />
                  </node>
                  <node concept="3TrEf2" id="1LliyakY575" role="2OqNvi">
                    <ref role="3Tt5mk" to="zaxg:1Lliyak$Nuo" resolve="modelType" />
                  </node>
                </node>
              </node>
              <node concept="mw_s8" id="1LliyakY0Jo" role="1ZfhK$">
                <node concept="1Z2H0r" id="1LliyakY0Jp" role="mwGJk">
                  <node concept="2OqwBi" id="1LliyakY0Js" role="1Z2MuG">
                    <node concept="1YBJjd" id="1LliyakY0Jt" role="2Oq$k0">
                      <ref role="1YBMHb" node="1LliyakXFET" resolve="tf" />
                    </node>
                    <node concept="3TrEf2" id="1LliyakY0Ju" role="2OqNvi">
                      <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgs" resolve="data" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1LliyakXFET" role="1YuTPh">
      <property role="TrG5h" value="tf" />
      <ref role="1YaFvo" to="zaxg:2vPZMAmvnIB" resolve="TextField" />
    </node>
  </node>
  <node concept="1YbPZF" id="1Lliyal6NHl">
    <property role="TrG5h" value="typeof_NodePropRef" />
    <property role="3GE5qa" value="util" />
    <node concept="3clFbS" id="1Lliyal6NHm" role="18ibNy">
      <node concept="3cpWs8" id="1Lliyal6Bmz" role="3cqZAp">
        <node concept="3cpWsn" id="1Lliyal6Bm$" role="3cpWs9">
          <property role="TrG5h" value="dtn" />
          <node concept="17QB3L" id="1Lliyal6B3m" role="1tU5fm" />
          <node concept="2OqwBi" id="1Lliyal6Bm_" role="33vP2m">
            <node concept="2OqwBi" id="1Lliyal6BmA" role="2Oq$k0">
              <node concept="2OqwBi" id="1Lliyal6BmB" role="2Oq$k0">
                <node concept="1YBJjd" id="1Lliyal6BmC" role="2Oq$k0">
                  <ref role="1YBMHb" node="1Lliyal6NHo" resolve="npr" />
                </node>
                <node concept="3TrEf2" id="1Lliyal6BmD" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgn" resolve="property" />
                </node>
              </node>
              <node concept="3TrEf2" id="1Lliyal6BmE" role="2OqNvi">
                <ref role="3Tt5mk" to="tpce:fKAX2Z_" resolve="dataType" />
              </node>
            </node>
            <node concept="3TrcHB" id="1Lliyal6BmF" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbF" id="1LliyalaVzX" role="3cqZAp">
        <node concept="2OqwBi" id="1LliyalaVzU" role="3clFbG">
          <node concept="10M0yZ" id="1LliyalaVzV" role="2Oq$k0">
            <ref role="1PxDUh" to="wyt6:~System" resolve="System" />
            <ref role="3cqZAo" to="wyt6:~System.err" resolve="err" />
          </node>
          <node concept="liA8E" id="1LliyalaVzW" role="2OqNvi">
            <ref role="37wK5l" to="guwi:~PrintStream.println(java.lang.String)" resolve="println" />
            <node concept="37vLTw" id="1LliyalaVRm" role="37wK5m">
              <ref role="3cqZAo" node="1Lliyal6Bm$" resolve="dtn" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="1Lliyal6B2O" role="3cqZAp">
        <node concept="3clFbS" id="1Lliyal6B2Q" role="3clFbx">
          <node concept="1Z5TYs" id="1Lliyal6PCB" role="3cqZAp">
            <node concept="mw_s8" id="1Lliyal6PVF" role="1ZfhKB">
              <node concept="2pJPEk" id="1Lliyal6PVB" role="mwGJk">
                <node concept="2pJPED" id="1Lliyal6PVD" role="2pJPEn">
                  <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
                </node>
              </node>
            </node>
            <node concept="mw_s8" id="1Lliyal6PCE" role="1ZfhK$">
              <node concept="1Z2H0r" id="1Lliyal6Jwu" role="mwGJk">
                <node concept="1YBJjd" id="1Lliyal6JNf" role="1Z2MuG">
                  <ref role="1YBMHb" node="1Lliyal6NHo" resolve="npr" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="17R0WA" id="1Lliyal6IU5" role="3clFbw">
          <node concept="Xl_RD" id="1Lliyal6Jda" role="3uHU7w">
            <property role="Xl_RC" value="string" />
          </node>
          <node concept="37vLTw" id="1Lliyal6CBr" role="3uHU7B">
            <ref role="3cqZAo" node="1Lliyal6Bm$" resolve="dtn" />
          </node>
        </node>
        <node concept="3eNFk2" id="1Lliyal6SBZ" role="3eNLev">
          <node concept="3clFbS" id="1Lliyal6SC1" role="3eOfB_">
            <node concept="1Z5TYs" id="1Lliyal6TeE" role="3cqZAp">
              <node concept="mw_s8" id="1Lliyal6TeF" role="1ZfhKB">
                <node concept="2pJPEk" id="1Lliyal6TeG" role="mwGJk">
                  <node concept="2pJPED" id="1Lliyal6TeH" role="2pJPEn">
                    <ref role="2pJxaS" to="tpee:f_0OyhT" resolve="IntegerType" />
                  </node>
                </node>
              </node>
              <node concept="mw_s8" id="1Lliyal6TeI" role="1ZfhK$">
                <node concept="1Z2H0r" id="1Lliyal6TeJ" role="mwGJk">
                  <node concept="1YBJjd" id="1Lliyal6TeK" role="1Z2MuG">
                    <ref role="1YBMHb" node="1Lliyal6NHo" resolve="npr" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="17R0WA" id="1Lliyal6SVj" role="3eO9$A">
            <node concept="Xl_RD" id="1Lliyal6SVk" role="3uHU7w">
              <property role="Xl_RC" value="integer" />
            </node>
            <node concept="37vLTw" id="1Lliyal6SVl" role="3uHU7B">
              <ref role="3cqZAo" node="1Lliyal6Bm$" resolve="dtn" />
            </node>
          </node>
        </node>
        <node concept="3eNFk2" id="1Lliyal6U8S" role="3eNLev">
          <node concept="3clFbS" id="1Lliyal6U8T" role="3eOfB_">
            <node concept="1Z5TYs" id="1Lliyal6U8U" role="3cqZAp">
              <node concept="mw_s8" id="1Lliyal6U8V" role="1ZfhKB">
                <node concept="2pJPEk" id="1Lliyal6U8W" role="mwGJk">
                  <node concept="2pJPED" id="1Lliyal6U8X" role="2pJPEn">
                    <ref role="2pJxaS" to="tpee:f_0P_4Y" resolve="BooleanType" />
                  </node>
                </node>
              </node>
              <node concept="mw_s8" id="1Lliyal6U8Y" role="1ZfhK$">
                <node concept="1Z2H0r" id="1Lliyal6U8Z" role="mwGJk">
                  <node concept="1YBJjd" id="1Lliyal6U90" role="1Z2MuG">
                    <ref role="1YBMHb" node="1Lliyal6NHo" resolve="npr" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="17R0WA" id="1Lliyal6U91" role="3eO9$A">
            <node concept="Xl_RD" id="1Lliyal6U92" role="3uHU7w">
              <property role="Xl_RC" value="boolean" />
            </node>
            <node concept="37vLTw" id="1Lliyal6U93" role="3uHU7B">
              <ref role="3cqZAo" node="1Lliyal6Bm$" resolve="dtn" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1Lliyal6NHo" role="1YuTPh">
      <property role="TrG5h" value="npr" />
      <ref role="1YaFvo" to="zaxg:2vPZMAmvsgl" resolve="NodePropRef" />
    </node>
  </node>
  <node concept="18kY7G" id="5KtU3pYaBlq">
    <property role="TrG5h" value="check_NodeRefRef" />
    <property role="3GE5qa" value="util" />
    <node concept="3clFbS" id="5KtU3pYaBlr" role="18ibNy">
      <node concept="3clFbJ" id="5KtU3pYaBC3" role="3cqZAp">
        <node concept="3fqX7Q" id="5KtU3pYaBC4" role="3clFbw">
          <node concept="2OqwBi" id="5KtU3pYaBC5" role="3fr31v">
            <node concept="2OqwBi" id="5KtU3pYaBC6" role="2Oq$k0">
              <node concept="2OqwBi" id="5KtU3pYaBC7" role="2Oq$k0">
                <node concept="1YBJjd" id="5KtU3pYaBC8" role="2Oq$k0">
                  <ref role="1YBMHb" node="5KtU3pYaBlt" resolve="nrr" />
                </node>
                <node concept="3TrEf2" id="5KtU3pYaBC9" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:5KtU3pY9R89" resolve="node" />
                </node>
              </node>
              <node concept="3JvlWi" id="5KtU3pYaBCa" role="2OqNvi" />
            </node>
            <node concept="1mIQ4w" id="5KtU3pYaBCb" role="2OqNvi">
              <node concept="chp4Y" id="5KtU3pYaBCc" role="cj9EA">
                <ref role="cht4Q" to="tp25:gzTqbfa" resolve="SNodeType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="5KtU3pYaBCd" role="3clFbx">
          <node concept="2MkqsV" id="5KtU3pYaBCe" role="3cqZAp">
            <node concept="Xl_RD" id="5KtU3pYaBCf" role="2MkJ7o">
              <property role="Xl_RC" value="must be a node" />
            </node>
            <node concept="2OqwBi" id="5KtU3pYaBCg" role="1urrMF">
              <node concept="1YBJjd" id="5KtU3pYaBCh" role="2Oq$k0">
                <ref role="1YBMHb" node="5KtU3pYaBlt" resolve="nrr" />
              </node>
              <node concept="3TrEf2" id="5KtU3pYaBCi" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:5KtU3pY9R89" resolve="node" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="5KtU3pYaBlt" role="1YuTPh">
      <property role="TrG5h" value="nrr" />
      <ref role="1YaFvo" to="zaxg:5KtU3pY9R88" resolve="NodeReferenceRef" />
    </node>
  </node>
  <node concept="1YbPZF" id="5KtU3pYaE4W">
    <property role="TrG5h" value="typeof_NodeRefRef" />
    <property role="3GE5qa" value="util" />
    <node concept="3clFbS" id="5KtU3pYaE4X" role="18ibNy">
      <node concept="1Z5TYs" id="5KtU3pYaHfx" role="3cqZAp">
        <node concept="mw_s8" id="5KtU3pYaHzn" role="1ZfhKB">
          <node concept="2pJPEk" id="5KtU3pYaHzj" role="mwGJk">
            <node concept="2pJPED" id="5KtU3pYaHzl" role="2pJPEn">
              <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
              <node concept="2pIpSj" id="5KtU3pYaHQ1" role="2pJxcM">
                <ref role="2pIpSl" to="tp25:g$ehGDh" resolve="concept" />
                <node concept="36biLy" id="5KtU3pYaI8I" role="28nt2d">
                  <node concept="2OqwBi" id="5KtU3pYaJHk" role="36biLW">
                    <node concept="2OqwBi" id="5KtU3pYaI$L" role="2Oq$k0">
                      <node concept="1YBJjd" id="5KtU3pYaIrp" role="2Oq$k0">
                        <ref role="1YBMHb" node="5KtU3pYaE4Z" resolve="nrr" />
                      </node>
                      <node concept="3TrEf2" id="5KtU3pYaJ1H" role="2OqNvi">
                        <ref role="3Tt5mk" to="zaxg:5KtU3pY9R8a" resolve="reference" />
                      </node>
                    </node>
                    <node concept="3TrEf2" id="5KtU3pYaKnn" role="2OqNvi">
                      <ref role="3Tt5mk" to="tpce:fA0lvVK" resolve="target" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="5KtU3pYaHf$" role="1ZfhK$">
          <node concept="1Z2H0r" id="5KtU3pYaG0m" role="mwGJk">
            <node concept="1YBJjd" id="5KtU3pYaGlz" role="1Z2MuG">
              <ref role="1YBMHb" node="5KtU3pYaE4Z" resolve="nrr" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="5KtU3pYaE4Z" role="1YuTPh">
      <property role="TrG5h" value="nrr" />
      <ref role="1YaFvo" to="zaxg:5KtU3pY9R88" resolve="NodeReferenceRef" />
    </node>
  </node>
  <node concept="18kY7G" id="5Qmp_LAV1fP">
    <property role="TrG5h" value="check_NodeChildRef" />
    <property role="3GE5qa" value="util" />
    <node concept="3clFbS" id="5Qmp_LAV1fQ" role="18ibNy">
      <node concept="3clFbJ" id="5Qmp_LAV1yu" role="3cqZAp">
        <node concept="3fqX7Q" id="5Qmp_LAV1yv" role="3clFbw">
          <node concept="2OqwBi" id="5Qmp_LAV1yw" role="3fr31v">
            <node concept="2OqwBi" id="5Qmp_LAV1yx" role="2Oq$k0">
              <node concept="2OqwBi" id="5Qmp_LAV1yy" role="2Oq$k0">
                <node concept="1YBJjd" id="5Qmp_LAV1yz" role="2Oq$k0">
                  <ref role="1YBMHb" node="5Qmp_LAV1fS" resolve="ncr" />
                </node>
                <node concept="3TrEf2" id="5Qmp_LAV1y$" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:5Qmp_LAUTPE" resolve="node" />
                </node>
              </node>
              <node concept="3JvlWi" id="5Qmp_LAV1y_" role="2OqNvi" />
            </node>
            <node concept="1mIQ4w" id="5Qmp_LAV1yA" role="2OqNvi">
              <node concept="chp4Y" id="5Qmp_LAV1yB" role="cj9EA">
                <ref role="cht4Q" to="tp25:gzTqbfa" resolve="SNodeType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="5Qmp_LAV1yC" role="3clFbx">
          <node concept="2MkqsV" id="5Qmp_LAV1yD" role="3cqZAp">
            <node concept="Xl_RD" id="5Qmp_LAV1yE" role="2MkJ7o">
              <property role="Xl_RC" value="must be a node" />
            </node>
            <node concept="2OqwBi" id="5Qmp_LAV1yF" role="1urrMF">
              <node concept="1YBJjd" id="5Qmp_LAV1yG" role="2Oq$k0">
                <ref role="1YBMHb" node="5Qmp_LAV1fS" resolve="ncr" />
              </node>
              <node concept="3TrEf2" id="5Qmp_LAV1yH" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:5Qmp_LAUTPE" resolve="node" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="5Qmp_LAV1fS" role="1YuTPh">
      <property role="TrG5h" value="ncr" />
      <ref role="1YaFvo" to="zaxg:5Qmp_LAUTgf" resolve="NodeChildRef" />
    </node>
  </node>
  <node concept="1YbPZF" id="5Qmp_LAV4aN">
    <property role="TrG5h" value="typeof_NodeChildRef" />
    <property role="3GE5qa" value="util" />
    <node concept="3clFbS" id="5Qmp_LAV4aO" role="18ibNy">
      <node concept="3clFbJ" id="5Qmp_LAV62Z" role="3cqZAp">
        <node concept="3clFbS" id="5Qmp_LAV631" role="3clFbx">
          <node concept="1Z5TYs" id="5Qmp_LAV52A" role="3cqZAp">
            <node concept="mw_s8" id="5Qmp_LAV52B" role="1ZfhKB">
              <node concept="2pJPEk" id="5Qmp_LAV52C" role="mwGJk">
                <node concept="2pJPED" id="5Qmp_LAV52D" role="2pJPEn">
                  <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
                  <node concept="2pIpSj" id="5Qmp_LAV52E" role="2pJxcM">
                    <ref role="2pIpSl" to="tp25:g$ehGDh" resolve="concept" />
                    <node concept="36biLy" id="5Qmp_LAV52F" role="28nt2d">
                      <node concept="2OqwBi" id="5Qmp_LAV52G" role="36biLW">
                        <node concept="2OqwBi" id="5Qmp_LAV52H" role="2Oq$k0">
                          <node concept="1YBJjd" id="5Qmp_LAV52I" role="2Oq$k0">
                            <ref role="1YBMHb" node="5Qmp_LAV4aQ" resolve="ncr" />
                          </node>
                          <node concept="3TrEf2" id="5Qmp_LAV52J" role="2OqNvi">
                            <ref role="3Tt5mk" to="zaxg:5Qmp_LAUU8d" resolve="child" />
                          </node>
                        </node>
                        <node concept="3TrEf2" id="5Qmp_LAV52K" role="2OqNvi">
                          <ref role="3Tt5mk" to="tpce:fA0lvVK" resolve="target" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="mw_s8" id="5Qmp_LAV52L" role="1ZfhK$">
              <node concept="1Z2H0r" id="5Qmp_LAV52M" role="mwGJk">
                <node concept="1YBJjd" id="5Qmp_LAV52N" role="1Z2MuG">
                  <ref role="1YBMHb" node="5Qmp_LAV4aQ" resolve="ncr" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2OqwBi" id="5Qmp_LAV7lD" role="3clFbw">
          <node concept="2OqwBi" id="5Qmp_LAV6v6" role="2Oq$k0">
            <node concept="1YBJjd" id="5Qmp_LAV6lK" role="2Oq$k0">
              <ref role="1YBMHb" node="5Qmp_LAV4aQ" resolve="ncr" />
            </node>
            <node concept="3TrEf2" id="5Qmp_LAV6WG" role="2OqNvi">
              <ref role="3Tt5mk" to="zaxg:5Qmp_LAUU8d" resolve="child" />
            </node>
          </node>
          <node concept="2qgKlT" id="5Qmp_LAV8os" role="2OqNvi">
            <ref role="37wK5l" to="tpcn:hEwIfAt" resolve="isSingular" />
          </node>
        </node>
        <node concept="9aQIb" id="5Qmp_LAVadO" role="9aQIa">
          <node concept="3clFbS" id="5Qmp_LAVadP" role="9aQI4">
            <node concept="1Z5TYs" id="5Qmp_LAVayd" role="3cqZAp">
              <node concept="mw_s8" id="5Qmp_LAVaye" role="1ZfhKB">
                <node concept="2pJPEk" id="5Qmp_LAVayf" role="mwGJk">
                  <node concept="2pJPED" id="5Qmp_LAVban" role="2pJPEn">
                    <ref role="2pJxaS" to="tp2q:gKA3Dh4" resolve="SequenceType" />
                    <node concept="2pIpSj" id="5Qmp_LAVbuf" role="2pJxcM">
                      <ref role="2pIpSl" to="tp2q:gKA3Ige" resolve="elementType" />
                      <node concept="2pJPED" id="5Qmp_LAVayg" role="28nt2d">
                        <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
                        <node concept="2pIpSj" id="5Qmp_LAVayh" role="2pJxcM">
                          <ref role="2pIpSl" to="tp25:g$ehGDh" resolve="concept" />
                          <node concept="36biLy" id="5Qmp_LAVayi" role="28nt2d">
                            <node concept="2OqwBi" id="5Qmp_LAVayj" role="36biLW">
                              <node concept="2OqwBi" id="5Qmp_LAVayk" role="2Oq$k0">
                                <node concept="1YBJjd" id="5Qmp_LAVayl" role="2Oq$k0">
                                  <ref role="1YBMHb" node="5Qmp_LAV4aQ" resolve="ncr" />
                                </node>
                                <node concept="3TrEf2" id="5Qmp_LAVaym" role="2OqNvi">
                                  <ref role="3Tt5mk" to="zaxg:5Qmp_LAUU8d" resolve="child" />
                                </node>
                              </node>
                              <node concept="3TrEf2" id="5Qmp_LAVayn" role="2OqNvi">
                                <ref role="3Tt5mk" to="tpce:fA0lvVK" resolve="target" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="mw_s8" id="5Qmp_LAVayo" role="1ZfhK$">
                <node concept="1Z2H0r" id="5Qmp_LAVayp" role="mwGJk">
                  <node concept="1YBJjd" id="5Qmp_LAVayq" role="1Z2MuG">
                    <ref role="1YBMHb" node="5Qmp_LAV4aQ" resolve="ncr" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="5Qmp_LAV4aQ" role="1YuTPh">
      <property role="TrG5h" value="ncr" />
      <ref role="1YaFvo" to="zaxg:5Qmp_LAUTgf" resolve="NodeChildRef" />
    </node>
  </node>
</model>

