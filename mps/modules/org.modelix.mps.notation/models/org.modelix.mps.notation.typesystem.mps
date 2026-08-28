<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2f03a0c4-ecda-4da5-926b-92cba019727a(org.modelix.mps.notation.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" />
    <import index="tp25" ref="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" />
    <import index="f8gn" ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="wsib" ref="r:d1d5cd51-6710-43f8-bd5b-f958da6e1ca2(org.modelix.mps.notation.behavior)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271221393" name="jetbrains.mps.baseLanguage.structure.NPENotEqualsExpression" flags="nn" index="17QLQc" />
      <concept id="1225271369338" name="jetbrains.mps.baseLanguage.structure.IsEmptyOperation" flags="nn" index="17RlXB" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1079359253375" name="jetbrains.mps.baseLanguage.structure.ParenthesizedExpression" flags="nn" index="1eOMI4">
        <child id="1079359253376" name="expression" index="1eOMHV" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="1196350785113" name="jetbrains.mps.lang.quotation.structure.Quotation" flags="nn" index="2c44tf">
        <child id="1196350785114" name="quotedNode" index="2c44tc" />
      </concept>
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
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
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
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1144100932627" name="jetbrains.mps.lang.smodel.structure.OperationParm_Inclusion" flags="ng" index="1xIGOp" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <property id="1238684351431" name="asCast" index="1BlNFB" />
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
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1226511727824" name="jetbrains.mps.baseLanguage.collections.structure.SetType" flags="in" index="2hMVRd">
        <child id="1226511765987" name="elementType" index="2hN53Y" />
      </concept>
      <concept id="1226516258405" name="jetbrains.mps.baseLanguage.collections.structure.HashSetCreator" flags="nn" index="2i4dXS" />
      <concept id="1151688443754" name="jetbrains.mps.baseLanguage.collections.structure.ListType" flags="in" index="_YKpA">
        <child id="1151688676805" name="elementType" index="_ZDj9" />
      </concept>
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
      <concept id="1237721394592" name="jetbrains.mps.baseLanguage.collections.structure.AbstractContainerCreator" flags="nn" index="HWqM0">
        <child id="1237721435807" name="elementType" index="HW$YZ" />
      </concept>
      <concept id="1160600644654" name="jetbrains.mps.baseLanguage.collections.structure.ListCreatorWithInit" flags="nn" index="Tc6Ow" />
      <concept id="1165525191778" name="jetbrains.mps.baseLanguage.collections.structure.GetFirstOperation" flags="nn" index="1uHKPH" />
      <concept id="1165530316231" name="jetbrains.mps.baseLanguage.collections.structure.IsEmptyOperation" flags="nn" index="1v1jN8" />
      <concept id="1172254888721" name="jetbrains.mps.baseLanguage.collections.structure.ContainsOperation" flags="nn" index="3JPx81" />
    </language>
  </registry>
  <node concept="1YbPZF" id="22f9nDgOFCs">
    <property role="TrG5h" value="typeof_BL_NotationNodeExpression" />
    <property role="3GE5qa" value="expressions" />
    <node concept="3clFbS" id="22f9nDgOFCt" role="18ibNy">
      <node concept="3cpWs8" id="22f9nDgOGz$" role="3cqZAp">
        <node concept="3cpWsn" id="22f9nDgOGz_" role="3cpWs9">
          <property role="TrG5h" value="concept" />
          <node concept="3Tqbb2" id="22f9nDgOGxm" role="1tU5fm">
            <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
          </node>
          <node concept="2OqwBi" id="22f9nDgOGzA" role="33vP2m">
            <node concept="2OqwBi" id="22f9nDgOGzB" role="2Oq$k0">
              <node concept="1YBJjd" id="22f9nDgOGzC" role="2Oq$k0">
                <ref role="1YBMHb" node="22f9nDgOFCv" resolve="n" />
              </node>
              <node concept="2Xjw5R" id="22f9nDgOGzD" role="2OqNvi">
                <node concept="1xMEDy" id="22f9nDgOGzE" role="1xVPHs">
                  <node concept="chp4Y" id="22f9nDgOGzF" role="ri$Ld">
                    <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3TrEf2" id="22f9nDgOGzG" role="2OqNvi">
              <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1Z5TYs" id="22f9nDgOFOj" role="3cqZAp">
        <node concept="mw_s8" id="22f9nDgOFO_" role="1ZfhKB">
          <node concept="2pJPEk" id="22f9nDgOG$K" role="mwGJk">
            <node concept="2pJPED" id="22f9nDgOG$M" role="2pJPEn">
              <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
              <node concept="2pIpSj" id="22f9nDgOGFi" role="2pJxcM">
                <ref role="2pIpSl" to="tp25:g$ehGDh" resolve="concept" />
                <node concept="36biLy" id="22f9nDgOGFv" role="28nt2d">
                  <node concept="37vLTw" id="22f9nDgOGFE" role="36biLW">
                    <ref role="3cqZAo" node="22f9nDgOGz_" resolve="concept" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="22f9nDgOFOm" role="1ZfhK$">
          <node concept="1Z2H0r" id="22f9nDgOFCC" role="mwGJk">
            <node concept="1YBJjd" id="22f9nDgOFEy" role="1Z2MuG">
              <ref role="1YBMHb" node="22f9nDgOFCv" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="22f9nDgOFCv" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:22f9nDgNr2y" resolve="BL_NotationNodeExpression" />
    </node>
  </node>
  <node concept="1YbPZF" id="22f9nDgOKgd">
    <property role="TrG5h" value="typeof_BL_ReferenceTargetExpression" />
    <property role="3GE5qa" value="expressions" />
    <node concept="3clFbS" id="22f9nDgOKge" role="18ibNy">
      <node concept="3cpWs8" id="22f9nDgOLNX" role="3cqZAp">
        <node concept="3cpWsn" id="22f9nDgOLNY" role="3cpWs9">
          <property role="TrG5h" value="targetConcept" />
          <node concept="3Tqbb2" id="22f9nDgOLNU" role="1tU5fm">
            <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
          </node>
          <node concept="2OqwBi" id="22f9nDgOLNZ" role="33vP2m">
            <node concept="2OqwBi" id="22f9nDgOLO0" role="2Oq$k0">
              <node concept="2OqwBi" id="22f9nDgOLO1" role="2Oq$k0">
                <node concept="1YBJjd" id="22f9nDgOLO2" role="2Oq$k0">
                  <ref role="1YBMHb" node="22f9nDgOKgg" resolve="n" />
                </node>
                <node concept="2Xjw5R" id="22f9nDgOLO3" role="2OqNvi">
                  <node concept="1xMEDy" id="22f9nDgOLO4" role="1xVPHs">
                    <node concept="chp4Y" id="22f9nDgOLO5" role="ri$Ld">
                      <ref role="cht4Q" to="f8gn:ziPuhEA2a_" resolve="ReferenceCell" />
                    </node>
                  </node>
                  <node concept="1xIGOp" id="22f9nDgOLO6" role="1xVPHs" />
                </node>
              </node>
              <node concept="3TrEf2" id="22f9nDgOLO7" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:ziPuhEA2aC" resolve="link" />
              </node>
            </node>
            <node concept="3TrEf2" id="22f9nDgOLO8" role="2OqNvi">
              <ref role="3Tt5mk" to="tpce:fA0lvVK" resolve="target" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1Z5TYs" id="22f9nDgOLYl" role="3cqZAp">
        <node concept="mw_s8" id="22f9nDgOLYQ" role="1ZfhKB">
          <node concept="2pJPEk" id="22f9nDgOLYM" role="mwGJk">
            <node concept="2pJPED" id="22f9nDgOLYO" role="2pJPEn">
              <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
              <node concept="2pIpSj" id="22f9nDgOLZ1" role="2pJxcM">
                <ref role="2pIpSl" to="tp25:g$ehGDh" resolve="concept" />
                <node concept="36biLy" id="22f9nDgOM0e" role="28nt2d">
                  <node concept="37vLTw" id="22f9nDgOM0p" role="36biLW">
                    <ref role="3cqZAo" node="22f9nDgOLNY" resolve="targetConcept" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="22f9nDgOLYo" role="1ZfhK$">
          <node concept="1Z2H0r" id="22f9nDgOKgt" role="mwGJk">
            <node concept="1YBJjd" id="22f9nDgOKin" role="1Z2MuG">
              <ref role="1YBMHb" node="22f9nDgOKgg" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="22f9nDgOKgg" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:22f9nDgOIIh" resolve="BL_ReferenceTargetExpression" />
    </node>
  </node>
  <node concept="18kY7G" id="4cpiv6osU2Y">
    <property role="TrG5h" value="check_IndentCell" />
    <node concept="3clFbS" id="4cpiv6osU2Z" role="18ibNy">
      <node concept="3clFbJ" id="4cpiv6osU3b" role="3cqZAp">
        <node concept="17QLQc" id="4cpiv6osZvW" role="3clFbw">
          <node concept="1YBJjd" id="4cpiv6osZxA" role="3uHU7w">
            <ref role="1YBMHb" node="4cpiv6osU31" resolve="n" />
          </node>
          <node concept="2OqwBi" id="4cpiv6osXhh" role="3uHU7B">
            <node concept="2OqwBi" id="4cpiv6osV13" role="2Oq$k0">
              <node concept="1PxgMI" id="4cpiv6osUAj" role="2Oq$k0">
                <property role="1BlNFB" value="true" />
                <node concept="chp4Y" id="4cpiv6osUPY" role="3oSUPX">
                  <ref role="cht4Q" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
                </node>
                <node concept="2OqwBi" id="4cpiv6osUeh" role="1m5AlR">
                  <node concept="1YBJjd" id="4cpiv6osU3n" role="2Oq$k0">
                    <ref role="1YBMHb" node="4cpiv6osU31" resolve="n" />
                  </node>
                  <node concept="1mfA1w" id="4cpiv6osUr_" role="2OqNvi" />
                </node>
              </node>
              <node concept="3Tsc0h" id="4cpiv6osVfl" role="2OqNvi">
                <ref role="3TtcxE" to="f8gn:CUW2QYKJ$J" resolve="cells" />
              </node>
            </node>
            <node concept="1uHKPH" id="4cpiv6osYXD" role="2OqNvi" />
          </node>
        </node>
        <node concept="3clFbS" id="4cpiv6osU3d" role="3clFbx">
          <node concept="2MkqsV" id="4cpiv6osZyY" role="3cqZAp">
            <node concept="Xl_RD" id="4cpiv6osZza" role="2MkJ7o">
              <property role="Xl_RC" value="Must be the first cell in a static collection" />
            </node>
            <node concept="1YBJjd" id="4cpiv6osZzT" role="1urrMF">
              <ref role="1YBMHb" node="4cpiv6osU31" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4cpiv6osU31" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:CUW2QYMXaO" resolve="IndentCell" />
    </node>
  </node>
  <node concept="18kY7G" id="1nuEuAgghpJ">
    <property role="TrG5h" value="check_HexColorValue" />
    <property role="3GE5qa" value="styles" />
    <node concept="3clFbS" id="1nuEuAgghpM" role="18ibNy">
      <node concept="3cpWs8" id="1nuEuAgghpN" role="3cqZAp">
        <node concept="3cpWsn" id="1nuEuAgghpQ" role="3cpWs9">
          <property role="TrG5h" value="value" />
          <node concept="17QB3L" id="1nuEuAgghpS" role="1tU5fm" />
          <node concept="2OqwBi" id="1nuEuAgghpT" role="33vP2m">
            <node concept="1YBJjd" id="1nuEuAgghpW" role="2Oq$k0">
              <ref role="1YBMHb" node="1nuEuAgghqA" resolve="n" />
            </node>
            <node concept="3TrcHB" id="1nuEuAgghpX" role="2OqNvi">
              <ref role="3TsBF5" to="f8gn:43rgS5P5d9C" resolve="value" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="1nuEuAgghpY" role="3cqZAp">
        <node concept="22lmx$" id="1nuEuAgghq1" role="3clFbw">
          <node concept="3clFbC" id="1nuEuAgghq4" role="3uHU7B">
            <node concept="37vLTw" id="1nuEuAgghq7" role="3uHU7B">
              <ref role="3cqZAo" node="1nuEuAgghpQ" resolve="value" />
            </node>
            <node concept="10Nm6u" id="1nuEuAgghq8" role="3uHU7w" />
          </node>
          <node concept="1eOMI4" id="1nuEuAgghq9" role="3uHU7w">
            <node concept="1Wc70l" id="1nuEuAgghqb" role="1eOMHV">
              <node concept="3y3z36" id="1nuEuAgghqe" role="3uHU7B">
                <node concept="2OqwBi" id="1nuEuAgghqh" role="3uHU7B">
                  <node concept="37vLTw" id="1nuEuAgghqk" role="2Oq$k0">
                    <ref role="3cqZAo" node="1nuEuAgghpQ" resolve="value" />
                  </node>
                  <node concept="liA8E" id="1nuEuAgghql" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.length()" resolve="length" />
                  </node>
                </node>
                <node concept="3cmrfG" id="1nuEuAgghqm" role="3uHU7w">
                  <property role="3cmrfH" value="3" />
                </node>
              </node>
              <node concept="3y3z36" id="1nuEuAgghqn" role="3uHU7w">
                <node concept="2OqwBi" id="1nuEuAgghqq" role="3uHU7B">
                  <node concept="37vLTw" id="1nuEuAgghqt" role="2Oq$k0">
                    <ref role="3cqZAo" node="1nuEuAgghpQ" resolve="value" />
                  </node>
                  <node concept="liA8E" id="1nuEuAgghqu" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.length()" resolve="length" />
                  </node>
                </node>
                <node concept="3cmrfG" id="1nuEuAgghqv" role="3uHU7w">
                  <property role="3cmrfH" value="6" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="1nuEuAgghqw" role="3clFbx">
          <node concept="2MkqsV" id="1nuEuAgghqx" role="3cqZAp">
            <node concept="Xl_RD" id="1nuEuAgghq$" role="2MkJ7o">
              <property role="Xl_RC" value="A color needs 3 or 6 hexadecimal digits" />
            </node>
            <node concept="1YBJjd" id="1nuEuAgghq_" role="1urrMF">
              <ref role="1YBMHb" node="1nuEuAgghqA" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1nuEuAgghqA" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:43rgS5P5d7J" resolve="HexColorValue" />
    </node>
  </node>
  <node concept="18kY7G" id="1nuEuAggiO1">
    <property role="TrG5h" value="check_ColorStyleItem" />
    <property role="3GE5qa" value="styles" />
    <node concept="3clFbS" id="1nuEuAggiO4" role="18ibNy">
      <node concept="3clFbJ" id="1nuEuAggiO5" role="3cqZAp">
        <node concept="3clFbC" id="1nuEuAggiO8" role="3clFbw">
          <node concept="2OqwBi" id="1nuEuAggiOb" role="3uHU7B">
            <node concept="1YBJjd" id="1nuEuAggiOe" role="2Oq$k0">
              <ref role="1YBMHb" node="1nuEuAggiOn" resolve="n" />
            </node>
            <node concept="3TrEf2" id="1nuEuAggiOf" role="2OqNvi">
              <ref role="3Tt5mk" to="f8gn:43rgS5P5dby" resolve="color" />
            </node>
          </node>
          <node concept="10Nm6u" id="1nuEuAggiOg" role="3uHU7w" />
        </node>
        <node concept="3clFbS" id="1nuEuAggiOh" role="3clFbx">
          <node concept="2MkqsV" id="1nuEuAggiOi" role="3cqZAp">
            <node concept="Xl_RD" id="1nuEuAggiOl" role="2MkJ7o">
              <property role="Xl_RC" value="No color specified" />
            </node>
            <node concept="1YBJjd" id="1nuEuAggiOm" role="1urrMF">
              <ref role="1YBMHb" node="1nuEuAggiOn" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1nuEuAggiOn" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:43rgS5P5d3X" resolve="ColorStyleItem" />
    </node>
  </node>
  <node concept="18kY7G" id="1nuEuAggjqh">
    <property role="TrG5h" value="check_ApplyStyleClass" />
    <property role="3GE5qa" value="styles" />
    <node concept="3clFbS" id="1nuEuAggjqk" role="18ibNy">
      <node concept="3cpWs8" id="1nuEuAggjql" role="3cqZAp">
        <node concept="3cpWsn" id="1nuEuAggjqo" role="3cpWs9">
          <property role="TrG5h" value="owner" />
          <node concept="3Tqbb2" id="1nuEuAggjqq" role="1tU5fm">
            <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
          </node>
          <node concept="2OqwBi" id="1nuEuAggjqr" role="33vP2m">
            <node concept="1YBJjd" id="1nuEuAggjqu" role="2Oq$k0">
              <ref role="1YBMHb" node="1nuEuAggjrx" resolve="n" />
            </node>
            <node concept="2Xjw5R" id="1nuEuAggjqv" role="2OqNvi">
              <node concept="1xMEDy" id="1nuEuAggjqy" role="1xVPHs">
                <node concept="chp4Y" id="1nuEuAggjq$" role="ri$Ld">
                  <ref role="cht4Q" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
                </node>
              </node>
              <node concept="1xIGOp" id="1nuEuAggjq_" role="1xVPHs" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="1nuEuAggjqA" role="3cqZAp">
        <node concept="3clFbC" id="1nuEuAggjqD" role="3clFbw">
          <node concept="37vLTw" id="1nuEuAggjqG" role="3uHU7B">
            <ref role="3cqZAo" node="1nuEuAggjqo" resolve="owner" />
          </node>
          <node concept="10Nm6u" id="1nuEuAggjqH" role="3uHU7w" />
        </node>
        <node concept="3clFbS" id="1nuEuAggjqI" role="3clFbx">
          <node concept="3cpWs6" id="1nuEuAggjqJ" role="3cqZAp" />
        </node>
      </node>
      <node concept="3cpWs8" id="1nuEuAggjqK" role="3cqZAp">
        <node concept="3cpWsn" id="1nuEuAggjqN" role="3cpWs9">
          <property role="TrG5h" value="items" />
          <node concept="_YKpA" id="1nuEuAggjqP" role="1tU5fm">
            <node concept="3Tqbb2" id="1nuEuAggjqR" role="_ZDj9">
              <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
            </node>
          </node>
          <node concept="2ShNRf" id="1nuEuAggjqS" role="33vP2m">
            <node concept="Tc6Ow" id="1nuEuAggjqU" role="2ShVmc">
              <node concept="3Tqbb2" id="1nuEuAggjqV" role="HW$YZ">
                <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3cpWs8" id="1nuEuAggjqW" role="3cqZAp">
        <node concept="3cpWsn" id="1nuEuAggjqZ" role="3cpWs9">
          <property role="TrG5h" value="visitedClasses" />
          <node concept="2hMVRd" id="1nuEuAggjr1" role="1tU5fm">
            <node concept="3Tqbb2" id="1nuEuAggjr3" role="2hN53Y">
              <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
            </node>
          </node>
          <node concept="2ShNRf" id="1nuEuAggjr4" role="33vP2m">
            <node concept="2i4dXS" id="1nuEuAggjr6" role="2ShVmc">
              <node concept="3Tqbb2" id="1nuEuAggjr7" role="HW$YZ">
                <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbF" id="1nuEuAggjr8" role="3cqZAp">
        <node concept="2OqwBi" id="1nuEuAggjra" role="3clFbG">
          <node concept="1YBJjd" id="1nuEuAggjrd" role="2Oq$k0">
            <ref role="1YBMHb" node="1nuEuAggjrx" resolve="n" />
          </node>
          <node concept="2qgKlT" id="1nuEuAggjre" role="2OqNvi">
            <ref role="37wK5l" to="wsib:1nuEuAfolgy" resolve="collectEffectiveItems" />
            <node concept="37vLTw" id="1nuEuAggjrf" role="37wK5m">
              <ref role="3cqZAo" node="1nuEuAggjqN" resolve="items" />
            </node>
            <node concept="37vLTw" id="1nuEuAggjrg" role="37wK5m">
              <ref role="3cqZAo" node="1nuEuAggjqZ" resolve="visitedClasses" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="1nuEuAggjrh" role="3cqZAp">
        <node concept="2OqwBi" id="1nuEuAggjrk" role="3clFbw">
          <node concept="37vLTw" id="1nuEuAggjrn" role="2Oq$k0">
            <ref role="3cqZAo" node="1nuEuAggjqZ" resolve="visitedClasses" />
          </node>
          <node concept="3JPx81" id="1nuEuAggjro" role="2OqNvi">
            <node concept="37vLTw" id="1nuEuAggjrq" role="25WWJ7">
              <ref role="3cqZAo" node="1nuEuAggjqo" resolve="owner" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="1nuEuAggjrr" role="3clFbx">
          <node concept="2MkqsV" id="1nuEuAggjrs" role="3cqZAp">
            <node concept="Xl_RD" id="1nuEuAggjrv" role="2MkJ7o">
              <property role="Xl_RC" value="Cyclic style class reference" />
            </node>
            <node concept="1YBJjd" id="1nuEuAggjrw" role="1urrMF">
              <ref role="1YBMHb" node="1nuEuAggjrx" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1nuEuAggjrx" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:1nuEuAfnjsA" resolve="ApplyStyleClass" />
    </node>
  </node>
  <node concept="18kY7G" id="1nuEuAgyYzn">
    <property role="TrG5h" value="check_StyleItemsAreSupported" />
    <property role="3GE5qa" value="styles" />
    <node concept="3clFbS" id="1nuEuAgyYzq" role="18ibNy">
      <node concept="3clFbJ" id="1nuEuAgyYzr" role="3cqZAp">
        <node concept="2OqwBi" id="1nuEuAgyYzu" role="3clFbw">
          <node concept="2OqwBi" id="1nuEuAgyYzx" role="2Oq$k0">
            <node concept="1YBJjd" id="1nuEuAgyYz$" role="2Oq$k0">
              <ref role="1YBMHb" node="1nuEuAgyY$o" resolve="n" />
            </node>
            <node concept="3Tsc0h" id="1nuEuAgyYz_" role="2OqNvi">
              <ref role="3TtcxE" to="f8gn:43rgS5P5dbz" resolve="styleItems" />
            </node>
          </node>
          <node concept="1v1jN8" id="1nuEuAgyYzA" role="2OqNvi" />
        </node>
        <node concept="3clFbS" id="1nuEuAgyYzB" role="3clFbx">
          <node concept="3cpWs6" id="1nuEuAgyYzC" role="3cqZAp" />
        </node>
      </node>
      <node concept="3clFbJ" id="1nuEuAgyYzD" role="3cqZAp">
        <node concept="22lmx$" id="1nuEuAgyYzG" role="3clFbw">
          <node concept="22lmx$" id="1nuEuAgyYzJ" role="3uHU7B">
            <node concept="2OqwBi" id="1nuEuAgyYzM" role="3uHU7B">
              <node concept="1YBJjd" id="1nuEuAgyYzP" role="2Oq$k0">
                <ref role="1YBMHb" node="1nuEuAgyY$o" resolve="n" />
              </node>
              <node concept="1mIQ4w" id="1nuEuAgyYzQ" role="2OqNvi">
                <node concept="chp4Y" id="1nuEuAgyYzS" role="cj9EA">
                  <ref role="cht4Q" to="f8gn:4dQjfTHYohE" resolve="NewLineCell" />
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="1nuEuAgyYzT" role="3uHU7w">
              <node concept="1YBJjd" id="1nuEuAgyYzW" role="2Oq$k0">
                <ref role="1YBMHb" node="1nuEuAgyY$o" resolve="n" />
              </node>
              <node concept="1mIQ4w" id="1nuEuAgyYzX" role="2OqNvi">
                <node concept="chp4Y" id="1nuEuAgyYzZ" role="cj9EA">
                  <ref role="cht4Q" to="f8gn:CUW2QYMXaO" resolve="IndentCell" />
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="1nuEuAgyY$0" role="3uHU7w">
            <node concept="1YBJjd" id="1nuEuAgyY$3" role="2Oq$k0">
              <ref role="1YBMHb" node="1nuEuAgyY$o" resolve="n" />
            </node>
            <node concept="1mIQ4w" id="1nuEuAgyY$4" role="2OqNvi">
              <node concept="chp4Y" id="1nuEuAgyY$6" role="cj9EA">
                <ref role="cht4Q" to="f8gn:ziPuhEAsOy" resolve="SubstituteCell" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="1nuEuAgyY$7" role="3clFbx">
          <node concept="2Gpval" id="1nuEuAgyY$8" role="3cqZAp">
            <node concept="2GrKxI" id="1nuEuAgyY$c" role="2Gsz3X">
              <property role="TrG5h" value="item" />
            </node>
            <node concept="2OqwBi" id="1nuEuAgyY$d" role="2GsD0m">
              <node concept="1YBJjd" id="1nuEuAgyY$g" role="2Oq$k0">
                <ref role="1YBMHb" node="1nuEuAgyY$o" resolve="n" />
              </node>
              <node concept="3Tsc0h" id="1nuEuAgyY$h" role="2OqNvi">
                <ref role="3TtcxE" to="f8gn:43rgS5P5dbz" resolve="styleItems" />
              </node>
            </node>
            <node concept="3clFbS" id="1nuEuAgyY$i" role="2LFqv$">
              <node concept="2MkqsV" id="1nuEuAgyY$j" role="3cqZAp">
                <node concept="Xl_RD" id="1nuEuAgyY$m" role="2MkJ7o">
                  <property role="Xl_RC" value="This cell doesn't produce a visible cell. Style items have no effect here." />
                </node>
                <node concept="2GrUjf" id="1nuEuAgyY$n" role="1urrMF">
                  <ref role="2Gs0qQ" node="1nuEuAgyY$c" resolve="item" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1nuEuAgyY$o" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:7dm8yUsMxww" resolve="Cell" />
    </node>
  </node>
  <node concept="18kY7G" id="4DCI_D3lEu_">
    <property role="TrG5h" value="check_FontFamilyStyleItem" />
    <property role="3GE5qa" value="styles" />
    <node concept="3clFbS" id="4DCI_D3lEuC" role="18ibNy">
      <node concept="3clFbJ" id="4DCI_D3lEuD" role="3cqZAp">
        <node concept="2OqwBi" id="4DCI_D3lEuG" role="3clFbw">
          <node concept="2OqwBi" id="4DCI_D3lEuJ" role="2Oq$k0">
            <node concept="1YBJjd" id="4DCI_D3lEuM" role="2Oq$k0">
              <ref role="1YBMHb" node="4DCI_D3lEuV" resolve="n" />
            </node>
            <node concept="3TrcHB" id="4DCI_D3lEuN" role="2OqNvi">
              <ref role="3TsBF5" to="f8gn:4DCI_D3jAqm" resolve="family" />
            </node>
          </node>
          <node concept="17RlXB" id="4DCI_D3lEuO" role="2OqNvi" />
        </node>
        <node concept="3clFbS" id="4DCI_D3lEuP" role="3clFbx">
          <node concept="2MkqsV" id="4DCI_D3lEuQ" role="3cqZAp">
            <node concept="Xl_RD" id="4DCI_D3lEuT" role="2MkJ7o">
              <property role="Xl_RC" value="No font family specified" />
            </node>
            <node concept="1YBJjd" id="4DCI_D3lEuU" role="1urrMF">
              <ref role="1YBMHb" node="4DCI_D3lEuV" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4DCI_D3lEuV" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:4DCI_D3jAql" resolve="FontFamilyStyleItem" />
    </node>
  </node>
  <node concept="18kY7G" id="4DCI_D3lFCt">
    <property role="TrG5h" value="check_FontSizeStyleItem" />
    <property role="3GE5qa" value="styles" />
    <node concept="3clFbS" id="4DCI_D3lFCw" role="18ibNy">
      <node concept="3clFbJ" id="4DCI_D3lFCx" role="3cqZAp">
        <node concept="2OqwBi" id="4DCI_D3lFC$" role="3clFbw">
          <node concept="2OqwBi" id="4DCI_D3lFCB" role="2Oq$k0">
            <node concept="1YBJjd" id="4DCI_D3lFCE" role="2Oq$k0">
              <ref role="1YBMHb" node="4DCI_D3lFCN" resolve="n" />
            </node>
            <node concept="3TrcHB" id="4DCI_D3lFCF" role="2OqNvi">
              <ref role="3TsBF5" to="f8gn:4DCI_D3jAtA" resolve="size" />
            </node>
          </node>
          <node concept="17RlXB" id="4DCI_D3lFCG" role="2OqNvi" />
        </node>
        <node concept="3clFbS" id="4DCI_D3lFCH" role="3clFbx">
          <node concept="2MkqsV" id="4DCI_D3lFCI" role="3cqZAp">
            <node concept="Xl_RD" id="4DCI_D3lFCL" role="2MkJ7o">
              <property role="Xl_RC" value="No font size specified" />
            </node>
            <node concept="1YBJjd" id="4DCI_D3lFCM" role="1urrMF">
              <ref role="1YBMHb" node="4DCI_D3lFCN" resolve="n" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4DCI_D3lFCN" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:4DCI_D3jAt_" resolve="FontSizeStyleItem" />
    </node>
  </node>
  <node concept="1YbPZF" id="2eHudJqbdFJ">
    <property role="TrG5h" value="typeof_LabelCell" />
    <node concept="3clFbS" id="2eHudJqbdFM" role="18ibNy">
      <node concept="1ZobV4" id="2eHudJqbdFN" role="3cqZAp">
        <node concept="mw_s8" id="2eHudJqbdFQ" role="1ZfhKB">
          <node concept="2c44tf" id="2eHudJqbdFS" role="mwGJk">
            <node concept="17QB3L" id="2eHudJqbdFU" role="2c44tc" />
          </node>
        </node>
        <node concept="mw_s8" id="2eHudJqbdFV" role="1ZfhK$">
          <node concept="1Z2H0r" id="2eHudJqbdFX" role="mwGJk">
            <node concept="2OqwBi" id="2eHudJqbdFZ" role="1Z2MuG">
              <node concept="1YBJjd" id="2eHudJqbdG2" role="2Oq$k0">
                <ref role="1YBMHb" node="2eHudJqbdG4" resolve="n" />
              </node>
              <node concept="3TrEf2" id="2eHudJqbdG3" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:2eHudJpH2xj" resolve="text" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="2eHudJqbdG4" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:2eHudJpH2xi" resolve="LabelCell" />
    </node>
  </node>
  <node concept="1YbPZF" id="4RYBXc0s1BV">
    <property role="TrG5h" value="typeof_ChildCell" />
    <node concept="3clFbS" id="4RYBXc0s1BY" role="18ibNy">
      <node concept="3clFbJ" id="4RYBXc0s1BZ" role="3cqZAp">
        <node concept="3y3z36" id="4RYBXc0s1C2" role="3clFbw">
          <node concept="2OqwBi" id="4RYBXc0s1C5" role="3uHU7B">
            <node concept="1YBJjd" id="4RYBXc0s1C8" role="2Oq$k0">
              <ref role="1YBMHb" node="4RYBXc0s1Ct" resolve="n" />
            </node>
            <node concept="3TrEf2" id="4RYBXc0s1C9" role="2OqNvi">
              <ref role="3Tt5mk" to="f8gn:4RYBXc0s1K4" resolve="placeholderText" />
            </node>
          </node>
          <node concept="10Nm6u" id="4RYBXc0s1Ca" role="3uHU7w" />
        </node>
        <node concept="3clFbS" id="4RYBXc0s1Cb" role="3clFbx">
          <node concept="1ZobV4" id="4RYBXc0s1Cc" role="3cqZAp">
            <node concept="mw_s8" id="4RYBXc0s1Cf" role="1ZfhKB">
              <node concept="2c44tf" id="4RYBXc0s1Ch" role="mwGJk">
                <node concept="17QB3L" id="4RYBXc0s1Cj" role="2c44tc" />
              </node>
            </node>
            <node concept="mw_s8" id="4RYBXc0s1Ck" role="1ZfhK$">
              <node concept="1Z2H0r" id="4RYBXc0s1Cm" role="mwGJk">
                <node concept="2OqwBi" id="4RYBXc0s1Co" role="1Z2MuG">
                  <node concept="1YBJjd" id="4RYBXc0s1Cr" role="2Oq$k0">
                    <ref role="1YBMHb" node="4RYBXc0s1Ct" resolve="n" />
                  </node>
                  <node concept="3TrEf2" id="4RYBXc0s1Cs" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:4RYBXc0s1K4" resolve="placeholderText" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4RYBXc0s1Ct" role="1YuTPh">
      <property role="TrG5h" value="n" />
      <ref role="1YaFvo" to="f8gn:4RYBXc0s1K3" resolve="ChildCell" />
    </node>
  </node>
</model>

