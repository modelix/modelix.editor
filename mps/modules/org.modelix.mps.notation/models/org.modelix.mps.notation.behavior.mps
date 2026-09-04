<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:d1d5cd51-6710-43f8-bd5b-f958da6e1ca2(org.modelix.mps.notation.behavior)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <use id="df345b11-b8c7-4213-ac66-48d2a9b75d88" name="jetbrains.mps.baseLanguageInternal" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="f8gn" ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tp68" ref="r:00000000-0000-4000-0000-011c895903ac(jetbrains.mps.baseLanguageInternal.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" implicit="true" />
    <import index="tpcn" ref="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <property id="1225194472832" name="isVirtual" index="13i0it" />
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1076505808687" name="jetbrains.mps.baseLanguage.structure.WhileStatement" flags="nn" index="2$JKZl">
        <child id="1076505808688" name="condition" index="2$JKZa" />
      </concept>
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
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271369338" name="jetbrains.mps.baseLanguage.structure.IsEmptyOperation" flags="nn" index="17RlXB" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
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
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1079359253375" name="jetbrains.mps.baseLanguage.structure.ParenthesizedExpression" flags="nn" index="1eOMI4">
        <child id="1079359253376" name="expression" index="1eOMHV" />
      </concept>
      <concept id="1081506773034" name="jetbrains.mps.baseLanguage.structure.LessThanExpression" flags="nn" index="3eOVzh" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
      <concept id="1082113931046" name="jetbrains.mps.baseLanguage.structure.ContinueStatement" flags="nn" index="3N13vt" />
      <concept id="6329021646629104954" name="jetbrains.mps.baseLanguage.structure.SingleLineComment" flags="nn" index="3SKdUt">
        <child id="8356039341262087992" name="line" index="1aUNEU" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="5455284157994012186" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitLink" flags="ng" index="2pIpSj">
        <reference id="5455284157994012188" name="link" index="2pIpSl" />
        <child id="1595412875168045827" name="initValue" index="28nt2d" />
      </concept>
      <concept id="5455284157993911077" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitProperty" flags="ng" index="2pJxcG">
        <reference id="5455284157993911078" name="property" index="2pJxcJ" />
        <child id="1595412875168045201" name="initValue" index="28ntcv" />
      </concept>
      <concept id="5455284157993863837" name="jetbrains.mps.lang.quotation.structure.NodeBuilder" flags="nn" index="2pJPEk">
        <child id="5455284157993863838" name="quotedNode" index="2pJPEn" />
      </concept>
      <concept id="5455284157993863840" name="jetbrains.mps.lang.quotation.structure.NodeBuilderNode" flags="nn" index="2pJPED">
        <reference id="5455284157993910961" name="concept" index="2pJxaS" />
        <child id="5455284157993911099" name="values" index="2pJxcM" />
      </concept>
      <concept id="6985522012210254362" name="jetbrains.mps.lang.quotation.structure.NodeBuilderPropertyExpression" flags="nn" index="WxPPo">
        <child id="6985522012210254363" name="expression" index="WxPPp" />
      </concept>
      <concept id="8182547171709738802" name="jetbrains.mps.lang.quotation.structure.NodeBuilderList" flags="nn" index="36be1Y">
        <child id="8182547171709738803" name="nodes" index="36be1Z" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1173122760281" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorsOperation" flags="nn" index="z$bX8" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1171305280644" name="jetbrains.mps.lang.smodel.structure.Node_GetDescendantsOperation" flags="nn" index="2Rf3mk" />
      <concept id="1171500988903" name="jetbrains.mps.lang.smodel.structure.Node_GetChildrenOperation" flags="nn" index="32TBzR" />
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1144100932627" name="jetbrains.mps.lang.smodel.structure.OperationParm_Inclusion" flags="ng" index="1xIGOp" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI" />
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
    <language id="c7fb639f-be78-4307-89b0-b5959c3fa8c8" name="jetbrains.mps.lang.text">
      <concept id="155656958578482948" name="jetbrains.mps.lang.text.structure.Word" flags="nn" index="3oM_SD">
        <property id="155656958578482949" name="value" index="3oM_SC" />
      </concept>
      <concept id="2535923850359271782" name="jetbrains.mps.lang.text.structure.Line" flags="nn" index="1PaTwC">
        <child id="2535923850359271783" name="elements" index="1PaTwD" />
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
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
      <concept id="1162934736510" name="jetbrains.mps.baseLanguage.collections.structure.GetElementOperation" flags="nn" index="34jXtK" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
      <concept id="1165530316231" name="jetbrains.mps.baseLanguage.collections.structure.IsEmptyOperation" flags="nn" index="1v1jN8" />
      <concept id="1176501494711" name="jetbrains.mps.baseLanguage.collections.structure.IsNotEmptyOperation" flags="nn" index="3GX2aA" />
      <concept id="1172254888721" name="jetbrains.mps.baseLanguage.collections.structure.ContainsOperation" flags="nn" index="3JPx81" />
    </language>
  </registry>
  <node concept="13h7C7" id="CUW2QYKKkf">
    <property role="3GE5qa" value="layout" />
    <ref role="13h7C2" to="f8gn:CUW2QYKK2t" resolve="CollectionLayout" />
    <node concept="13i0hz" id="CUW2QYKKme" role="13h7CS">
      <property role="TrG5h" value="isVertical" />
      <property role="13i0it" value="true" />
      <node concept="3Tm1VV" id="CUW2QYKKmf" role="1B3o_S" />
      <node concept="10P_77" id="CUW2QYKKns" role="3clF45" />
      <node concept="3clFbS" id="CUW2QYKKmh" role="3clF47">
        <node concept="3clFbF" id="CUW2QYKKtk" role="3cqZAp">
          <node concept="3clFbT" id="CUW2QYKKtj" role="3clFbG" />
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="CUW2QYKKkg" role="13h7CW">
      <node concept="3clFbS" id="CUW2QYKKkh" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="CUW2QYKKFG">
    <property role="3GE5qa" value="layout" />
    <ref role="13h7C2" to="f8gn:CUW2QYKKdt" resolve="VerticalLayout" />
    <node concept="13hLZK" id="CUW2QYKKFH" role="13h7CW">
      <node concept="3clFbS" id="CUW2QYKKFI" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="CUW2QYKKIT" role="13h7CS">
      <property role="TrG5h" value="isVertical" />
      <ref role="13i0hy" node="CUW2QYKKme" resolve="isVertical" />
      <node concept="3Tm1VV" id="CUW2QYKKIU" role="1B3o_S" />
      <node concept="3clFbS" id="CUW2QYKKIZ" role="3clF47">
        <node concept="3clFbF" id="CUW2QYKKO0" role="3cqZAp">
          <node concept="3clFbT" id="CUW2QYKKNZ" role="3clFbG">
            <property role="3clFbU" value="true" />
          </node>
        </node>
      </node>
      <node concept="10P_77" id="CUW2QYKKJ0" role="3clF45" />
    </node>
  </node>
  <node concept="13h7C7" id="CUW2QYKL9d">
    <ref role="13h7C2" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
    <node concept="13i0hz" id="CUW2QYKLam" role="13h7CS">
      <property role="TrG5h" value="isVerticalLayout" />
      <node concept="3Tm1VV" id="CUW2QYKLan" role="1B3o_S" />
      <node concept="10P_77" id="CUW2QYKLcq" role="3clF45" />
      <node concept="3clFbS" id="CUW2QYKLap" role="3clF47">
        <node concept="3clFbF" id="CUW2QYKLg3" role="3cqZAp">
          <node concept="2OqwBi" id="CUW2QYKNwV" role="3clFbG">
            <node concept="2OqwBi" id="CUW2QYKLt8" role="2Oq$k0">
              <node concept="13iPFW" id="CUW2QYKLg1" role="2Oq$k0" />
              <node concept="3TrEf2" id="CUW2QYKNiD" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:CUW2QYKL5L" resolve="layout" />
              </node>
            </node>
            <node concept="2qgKlT" id="CUW2QYKNH1" role="2OqNvi">
              <ref role="37wK5l" node="CUW2QYKKme" resolve="isVertical" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="CUW2QYKL9e" role="13h7CW">
      <node concept="3clFbS" id="CUW2QYKL9f" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="1edLqv8PzNM">
    <property role="3GE5qa" value="expressions" />
    <ref role="13h7C2" to="f8gn:22f9nDgOIIh" resolve="BL_ReferenceTargetExpression" />
    <node concept="13hLZK" id="1edLqv8PzNN" role="13h7CW">
      <node concept="3clFbS" id="1edLqv8PzNO" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="6GdlvdUZcWQ">
    <ref role="13h7C2" to="f8gn:CUW2QYMiki" resolve="ChildrenCollectionCell" />
    <node concept="13hLZK" id="6GdlvdUZcWR" role="13h7CW">
      <node concept="3clFbS" id="6GdlvdUZcWS" role="2VODD2">
        <node concept="3clFbF" id="6GdlvdUZcZ2" role="3cqZAp">
          <node concept="37vLTI" id="6GdlvdUZdPG" role="3clFbG">
            <node concept="2OqwBi" id="6GdlvdUZdb6" role="37vLTJ">
              <node concept="13iPFW" id="6GdlvdUZcZ1" role="2Oq$k0" />
              <node concept="3TrEf2" id="6GdlvdUZdpc" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
              </node>
            </node>
            <node concept="2pJPEk" id="4BiPpBnM5tg" role="37vLTx">
              <node concept="2pJPED" id="4BiPpBnM5t8" role="2pJPEn">
                <ref role="2pJxaS" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
                <node concept="2pIpSj" id="4BiPpBnM5te" role="2pJxcM">
                  <ref role="2pIpSl" to="f8gn:CUW2QYKJ$J" resolve="cells" />
                  <node concept="36be1Y" id="4BiPpBnM5tf" role="28nt2d">
                    <node concept="2pJPED" id="4BiPpBnM5t9" role="36be1Z">
                      <ref role="2pJxaS" to="f8gn:ziPuhEA4oz" resolve="RemoveSpace" />
                    </node>
                    <node concept="2pJPED" id="4BiPpBnM5ta" role="36be1Z">
                      <ref role="2pJxaS" to="f8gn:7dm8yUsMxrq" resolve="ConstantCell" />
                      <node concept="2pJxcG" id="4BiPpBnM5tb" role="2pJxcM">
                        <ref role="2pJxcJ" to="f8gn:7dm8yUsMxD1" resolve="text" />
                        <node concept="WxPPo" id="4BiPpBnM5tc" role="28ntcv">
                          <node concept="Xl_RD" id="4BiPpBnM5td" role="WxPPp">
                            <property role="Xl_RC" value="," />
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
    </node>
  </node>
  <node concept="13h7C7" id="1nuEuAfolgs">
    <ref role="13h7C2" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
    <node concept="13hLZK" id="1nuEuAfolgv" role="13h7CW">
      <node concept="3clFbS" id="1nuEuAfolgx" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="1nuEuAfolgy" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="collectEffectiveItems" />
      <node concept="3Tm1VV" id="1nuEuAfolgA" role="1B3o_S" />
      <node concept="3cqZAl" id="1nuEuAfolgB" role="3clF45" />
      <node concept="37vLTG" id="1nuEuAfolgC" role="3clF46">
        <property role="TrG5h" value="result" />
        <node concept="_YKpA" id="1nuEuAfolgE" role="1tU5fm">
          <node concept="3Tqbb2" id="1nuEuAfolgG" role="_ZDj9">
            <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="1nuEuAfolgH" role="3clF46">
        <property role="TrG5h" value="visitedClasses" />
        <node concept="2hMVRd" id="1nuEuAfolgJ" role="1tU5fm">
          <node concept="3Tqbb2" id="1nuEuAfolgL" role="2hN53Y">
            <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
          </node>
        </node>
      </node>
      <node concept="3clFbS" id="1nuEuAfolgM" role="3clF47">
        <node concept="3clFbF" id="1nuEuAfolgN" role="3cqZAp">
          <node concept="2OqwBi" id="1nuEuAfolgP" role="3clFbG">
            <node concept="37vLTw" id="1nuEuAfolgS" role="2Oq$k0">
              <ref role="3cqZAo" node="1nuEuAfolgC" resolve="result" />
            </node>
            <node concept="TSZUe" id="1nuEuAfolgT" role="2OqNvi">
              <node concept="13iPFW" id="1nuEuAfolgV" role="25WWJ7" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1nuEuAfomtJ">
    <ref role="13h7C2" to="f8gn:1nuEuAfnjsA" resolve="ApplyStyleClass" />
    <node concept="13hLZK" id="1nuEuAfomtM" role="13h7CW">
      <node concept="3clFbS" id="1nuEuAfomtO" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="1nuEuAfomtP" role="13h7CS">
      <property role="TrG5h" value="collectEffectiveItems" />
      <ref role="13i0hy" node="1nuEuAfolgy" resolve="collectEffectiveItems" />
      <node concept="3Tm1VV" id="1nuEuAfomtT" role="1B3o_S" />
      <node concept="3cqZAl" id="1nuEuAfomtU" role="3clF45" />
      <node concept="37vLTG" id="1nuEuAfomtV" role="3clF46">
        <property role="TrG5h" value="result" />
        <node concept="_YKpA" id="1nuEuAfomtX" role="1tU5fm">
          <node concept="3Tqbb2" id="1nuEuAfomtZ" role="_ZDj9">
            <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="1nuEuAfomu0" role="3clF46">
        <property role="TrG5h" value="visitedClasses" />
        <node concept="2hMVRd" id="1nuEuAfomu2" role="1tU5fm">
          <node concept="3Tqbb2" id="1nuEuAfomu4" role="2hN53Y">
            <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
          </node>
        </node>
      </node>
      <node concept="3clFbS" id="1nuEuAfomu5" role="3clF47">
        <node concept="3cpWs8" id="1nuEuAfomu6" role="3cqZAp">
          <node concept="3cpWsn" id="1nuEuAfomu9" role="3cpWs9">
            <property role="TrG5h" value="styleClass" />
            <node concept="3Tqbb2" id="1nuEuAfomub" role="1tU5fm">
              <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
            </node>
            <node concept="2OqwBi" id="1nuEuAfomuc" role="33vP2m">
              <node concept="13iPFW" id="1nuEuAfomuf" role="2Oq$k0" />
              <node concept="3TrEf2" id="1nuEuAfomug" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:1nuEuAfnjsB" resolve="styleClass" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="1nuEuAfomuh" role="3cqZAp">
          <node concept="22lmx$" id="1nuEuAfomuk" role="3clFbw">
            <node concept="3clFbC" id="1nuEuAfomun" role="3uHU7B">
              <node concept="37vLTw" id="1nuEuAfomuq" role="3uHU7B">
                <ref role="3cqZAo" node="1nuEuAfomu9" resolve="styleClass" />
              </node>
              <node concept="10Nm6u" id="1nuEuAfomur" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="1nuEuAfomus" role="3uHU7w">
              <node concept="37vLTw" id="1nuEuAfomuv" role="2Oq$k0">
                <ref role="3cqZAo" node="1nuEuAfomu0" resolve="visitedClasses" />
              </node>
              <node concept="3JPx81" id="1nuEuAfomuw" role="2OqNvi">
                <node concept="37vLTw" id="1nuEuAfomuy" role="25WWJ7">
                  <ref role="3cqZAo" node="1nuEuAfomu9" resolve="styleClass" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="1nuEuAfomuz" role="3clFbx">
            <node concept="3cpWs6" id="1nuEuAfomu$" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbF" id="1nuEuAfomu_" role="3cqZAp">
          <node concept="2OqwBi" id="1nuEuAfomuB" role="3clFbG">
            <node concept="37vLTw" id="1nuEuAfomuE" role="2Oq$k0">
              <ref role="3cqZAo" node="1nuEuAfomu0" resolve="visitedClasses" />
            </node>
            <node concept="TSZUe" id="1nuEuAfomuF" role="2OqNvi">
              <node concept="37vLTw" id="1nuEuAfomuH" role="25WWJ7">
                <ref role="3cqZAo" node="1nuEuAfomu9" resolve="styleClass" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2Gpval" id="1nuEuAfomuI" role="3cqZAp">
          <node concept="2GrKxI" id="1nuEuAfomuM" role="2Gsz3X">
            <property role="TrG5h" value="item" />
          </node>
          <node concept="2OqwBi" id="1nuEuAfomuN" role="2GsD0m">
            <node concept="37vLTw" id="1nuEuAfomuQ" role="2Oq$k0">
              <ref role="3cqZAo" node="1nuEuAfomu9" resolve="styleClass" />
            </node>
            <node concept="3Tsc0h" id="1nuEuAfomuR" role="2OqNvi">
              <ref role="3TtcxE" to="f8gn:1nuEuAfnjrm" resolve="styleItems" />
            </node>
          </node>
          <node concept="3clFbS" id="1nuEuAfomuS" role="2LFqv$">
            <node concept="3clFbF" id="1nuEuAfomuT" role="3cqZAp">
              <node concept="2OqwBi" id="1nuEuAfomuV" role="3clFbG">
                <node concept="2GrUjf" id="1nuEuAfomuY" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="1nuEuAfomuM" resolve="item" />
                </node>
                <node concept="2qgKlT" id="1nuEuAfomuZ" role="2OqNvi">
                  <ref role="37wK5l" node="1nuEuAfolgy" resolve="collectEffectiveItems" />
                  <node concept="37vLTw" id="1nuEuAfomv0" role="37wK5m">
                    <ref role="3cqZAo" node="1nuEuAfomtV" resolve="result" />
                  </node>
                  <node concept="37vLTw" id="1nuEuAfomv1" role="37wK5m">
                    <ref role="3cqZAo" node="1nuEuAfomu0" resolve="visitedClasses" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1nuEuAfon$A">
    <ref role="13h7C2" to="f8gn:7dm8yUsMxww" resolve="Cell" />
    <node concept="13hLZK" id="1nuEuAfon$D" role="13h7CW">
      <node concept="3clFbS" id="1nuEuAfon$F" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="1nuEuAfon$G" role="13h7CS">
      <property role="TrG5h" value="getEffectiveStyleItems" />
      <node concept="3Tm1VV" id="1nuEuAfon$K" role="1B3o_S" />
      <node concept="_YKpA" id="1nuEuAfon$L" role="3clF45">
        <node concept="3Tqbb2" id="1nuEuAfon$N" role="_ZDj9">
          <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
        </node>
      </node>
      <node concept="3clFbS" id="1nuEuAfon$O" role="3clF47">
        <node concept="3cpWs8" id="1nuEuAfon$P" role="3cqZAp">
          <node concept="3cpWsn" id="1nuEuAfon$S" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <node concept="_YKpA" id="1nuEuAfon$U" role="1tU5fm">
              <node concept="3Tqbb2" id="1nuEuAfon$W" role="_ZDj9">
                <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
              </node>
            </node>
            <node concept="2ShNRf" id="1nuEuAfon$X" role="33vP2m">
              <node concept="Tc6Ow" id="1nuEuAfon$Z" role="2ShVmc">
                <node concept="3Tqbb2" id="1nuEuAfon_0" role="HW$YZ">
                  <ref role="ehGHo" to="f8gn:43rgS5P1XCO" resolve="StyleItem" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="1nuEuAfon_1" role="3cqZAp">
          <node concept="3cpWsn" id="1nuEuAfon_4" role="3cpWs9">
            <property role="TrG5h" value="visitedClasses" />
            <node concept="2hMVRd" id="1nuEuAfon_6" role="1tU5fm">
              <node concept="3Tqbb2" id="1nuEuAfon_8" role="2hN53Y">
                <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
              </node>
            </node>
            <node concept="2ShNRf" id="1nuEuAfon_9" role="33vP2m">
              <node concept="2i4dXS" id="1nuEuAfon_b" role="2ShVmc">
                <node concept="3Tqbb2" id="1nuEuAfon_c" role="HW$YZ">
                  <ref role="ehGHo" to="f8gn:1nuEuAfnjrj" resolve="StyleClass" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2Gpval" id="1nuEuAfon_d" role="3cqZAp">
          <node concept="2GrKxI" id="1nuEuAfon_h" role="2Gsz3X">
            <property role="TrG5h" value="item" />
          </node>
          <node concept="2OqwBi" id="1nuEuAfon_i" role="2GsD0m">
            <node concept="13iPFW" id="1nuEuAfon_l" role="2Oq$k0" />
            <node concept="3Tsc0h" id="1nuEuAfon_m" role="2OqNvi">
              <ref role="3TtcxE" to="f8gn:43rgS5P5dbz" resolve="styleItems" />
            </node>
          </node>
          <node concept="3clFbS" id="1nuEuAfon_n" role="2LFqv$">
            <node concept="3clFbF" id="1nuEuAfon_o" role="3cqZAp">
              <node concept="2OqwBi" id="1nuEuAfon_q" role="3clFbG">
                <node concept="2GrUjf" id="1nuEuAfon_t" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="1nuEuAfon_h" resolve="item" />
                </node>
                <node concept="2qgKlT" id="1nuEuAfon_u" role="2OqNvi">
                  <ref role="37wK5l" node="1nuEuAfolgy" resolve="collectEffectiveItems" />
                  <node concept="37vLTw" id="1nuEuAfon_v" role="37wK5m">
                    <ref role="3cqZAo" node="1nuEuAfon$S" resolve="result" />
                  </node>
                  <node concept="37vLTw" id="1nuEuAfon_w" role="37wK5m">
                    <ref role="3cqZAo" node="1nuEuAfon_4" resolve="visitedClasses" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1nuEuAfon_x" role="3cqZAp">
          <node concept="37vLTw" id="1nuEuAfon_y" role="3cqZAk">
            <ref role="3cqZAo" node="1nuEuAfon$S" resolve="result" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1nuEuAfonRN">
    <ref role="13h7C2" to="f8gn:43rgS5P5d5Q" resolve="ColorValue" />
    <node concept="13hLZK" id="1nuEuAfonRQ" role="13h7CW">
      <node concept="3clFbS" id="1nuEuAfonRS" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="1nuEuAfonRT" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="getCssValue" />
      <node concept="3Tm1VV" id="1nuEuAfonRX" role="1B3o_S" />
      <node concept="17QB3L" id="1nuEuAfonRY" role="3clF45" />
      <node concept="3clFbS" id="1nuEuAfonRZ" role="3clF47">
        <node concept="3clFbF" id="1nuEuAfonS0" role="3cqZAp">
          <node concept="10Nm6u" id="1nuEuAfonS2" role="3clFbG" />
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1nuEuAfophD">
    <ref role="13h7C2" to="f8gn:43rgS5P5d7J" resolve="HexColorValue" />
    <node concept="13hLZK" id="1nuEuAfophG" role="13h7CW">
      <node concept="3clFbS" id="1nuEuAfophI" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="1nuEuAfophJ" role="13h7CS">
      <property role="TrG5h" value="getCssValue" />
      <ref role="13i0hy" node="1nuEuAfonRT" resolve="getCssValue" />
      <node concept="3Tm1VV" id="1nuEuAfophN" role="1B3o_S" />
      <node concept="17QB3L" id="1nuEuAfophO" role="3clF45" />
      <node concept="3clFbS" id="1nuEuAfophP" role="3clF47">
        <node concept="3clFbJ" id="1nuEuAfophQ" role="3cqZAp">
          <node concept="2OqwBi" id="1nuEuAfophT" role="3clFbw">
            <node concept="2OqwBi" id="1nuEuAfophW" role="2Oq$k0">
              <node concept="13iPFW" id="1nuEuAfophZ" role="2Oq$k0" />
              <node concept="3TrcHB" id="1nuEuAfopi0" role="2OqNvi">
                <ref role="3TsBF5" to="f8gn:43rgS5P5d9C" resolve="value" />
              </node>
            </node>
            <node concept="17RlXB" id="1nuEuAfopi1" role="2OqNvi" />
          </node>
          <node concept="3clFbS" id="1nuEuAfopi2" role="3clFbx">
            <node concept="3cpWs6" id="1nuEuAfopi3" role="3cqZAp">
              <node concept="10Nm6u" id="1nuEuAfopi4" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1nuEuAfopi5" role="3cqZAp">
          <node concept="3cpWs3" id="1nuEuAfopi6" role="3cqZAk">
            <node concept="Xl_RD" id="1nuEuAfopi9" role="3uHU7B">
              <property role="Xl_RC" value="#" />
            </node>
            <node concept="2OqwBi" id="1nuEuAfopia" role="3uHU7w">
              <node concept="13iPFW" id="1nuEuAfopid" role="2Oq$k0" />
              <node concept="3TrcHB" id="1nuEuAfopie" role="2OqNvi">
                <ref role="3TsBF5" to="f8gn:43rgS5P5d9C" resolve="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1nuEuAfvz34">
    <ref role="13h7C2" to="f8gn:43rgS5P5d3X" resolve="ColorStyleItem" />
    <node concept="13hLZK" id="1nuEuAfvz37" role="13h7CW">
      <node concept="3clFbS" id="1nuEuAfvz39" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="1nuEuAfvz3a" role="13h7CS">
      <property role="TrG5h" value="getCssColor" />
      <node concept="3Tm1VV" id="1nuEuAfvz3e" role="1B3o_S" />
      <node concept="17QB3L" id="1nuEuAfvz3f" role="3clF45" />
      <node concept="3clFbS" id="1nuEuAfvz3g" role="3clF47">
        <node concept="3clFbJ" id="1nuEuAfvz3h" role="3cqZAp">
          <node concept="3clFbC" id="1nuEuAfvz3k" role="3clFbw">
            <node concept="2OqwBi" id="1nuEuAfvz3n" role="3uHU7B">
              <node concept="13iPFW" id="1nuEuAfvz3q" role="2Oq$k0" />
              <node concept="3TrEf2" id="1nuEuAfvz3r" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:43rgS5P5dby" resolve="color" />
              </node>
            </node>
            <node concept="10Nm6u" id="1nuEuAfvz3s" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="1nuEuAfvz3t" role="3clFbx">
            <node concept="3cpWs6" id="1nuEuAfvz3u" role="3cqZAp">
              <node concept="Xl_RD" id="1nuEuAfvz3v" role="3cqZAk">
                <property role="Xl_RC" value="" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="1nuEuAfvz3w" role="3cqZAp">
          <node concept="3cpWsn" id="1nuEuAfvz3z" role="3cpWs9">
            <property role="TrG5h" value="css" />
            <node concept="17QB3L" id="1nuEuAfvz3_" role="1tU5fm" />
            <node concept="2OqwBi" id="1nuEuAfvz3A" role="33vP2m">
              <node concept="2OqwBi" id="1nuEuAfvz3D" role="2Oq$k0">
                <node concept="13iPFW" id="1nuEuAfvz3G" role="2Oq$k0" />
                <node concept="3TrEf2" id="1nuEuAfvz3H" role="2OqNvi">
                  <ref role="3Tt5mk" to="f8gn:43rgS5P5dby" resolve="color" />
                </node>
              </node>
              <node concept="2qgKlT" id="1nuEuAfvz3I" role="2OqNvi">
                <ref role="37wK5l" node="1nuEuAfonRT" resolve="getCssValue" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1nuEuAfvz3J" role="3cqZAp">
          <node concept="1eOMI4" id="1nuEuAfvz3K" role="3cqZAk">
            <node concept="3K4zz7" id="1nuEuAfvz3M" role="1eOMHV">
              <node concept="3clFbC" id="1nuEuAfvz3Q" role="3K4Cdx">
                <node concept="37vLTw" id="1nuEuAfvz3T" role="3uHU7B">
                  <ref role="3cqZAo" node="1nuEuAfvz3z" resolve="css" />
                </node>
                <node concept="10Nm6u" id="1nuEuAfvz3U" role="3uHU7w" />
              </node>
              <node concept="Xl_RD" id="1nuEuAfvz3V" role="3K4E3e">
                <property role="Xl_RC" value="" />
              </node>
              <node concept="37vLTw" id="1nuEuAfvz3W" role="3K4GZi">
                <ref role="3cqZAo" node="1nuEuAfvz3z" resolve="css" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="4OG1auJF0Fh" role="13h7CS">
      <property role="TrG5h" value="isComputedColor" />
      <node concept="3Tm1VV" id="4OG1auJF0Fl" role="1B3o_S" />
      <node concept="10P_77" id="4OG1auJF0Fm" role="3clF45" />
      <node concept="3clFbS" id="4OG1auJF0Fn" role="3clF47">
        <node concept="3clFbF" id="4OG1auJF0Fo" role="3cqZAp">
          <node concept="2OqwBi" id="4OG1auJF0Fq" role="3clFbG">
            <node concept="2OqwBi" id="4OG1auJF0Ft" role="2Oq$k0">
              <node concept="13iPFW" id="4OG1auJF0Fw" role="2Oq$k0" />
              <node concept="3TrEf2" id="4OG1auJF0Fx" role="2OqNvi">
                <ref role="3Tt5mk" to="f8gn:43rgS5P5dby" resolve="color" />
              </node>
            </node>
            <node concept="1mIQ4w" id="4OG1auJF0Fy" role="2OqNvi">
              <node concept="chp4Y" id="4OG1auJF0F$" role="cj9EA">
                <ref role="cht4Q" to="f8gn:1nuEuAnpfoj" resolve="BL_ColorValue" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="4OG1auJF0F_" role="13h7CS">
      <property role="TrG5h" value="getComputedExpression" />
      <node concept="3Tm1VV" id="4OG1auJF0FD" role="1B3o_S" />
      <node concept="3Tqbb2" id="4OG1auJF0FE" role="3clF45" />
      <node concept="3clFbS" id="4OG1auJF0FF" role="3clF47">
        <node concept="3clFbJ" id="4OG1auJF0FG" role="3cqZAp">
          <node concept="3fqX7Q" id="4OG1auJF0FJ" role="3clFbw">
            <node concept="1eOMI4" id="4OG1auJF0FL" role="3fr31v">
              <node concept="2OqwBi" id="4OG1auJF0FN" role="1eOMHV">
                <node concept="2OqwBi" id="4OG1auJF0FQ" role="2Oq$k0">
                  <node concept="13iPFW" id="4OG1auJF0FT" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4OG1auJF0FU" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:43rgS5P5dby" resolve="color" />
                  </node>
                </node>
                <node concept="1mIQ4w" id="4OG1auJF0FV" role="2OqNvi">
                  <node concept="chp4Y" id="4OG1auJF0FX" role="cj9EA">
                    <ref role="cht4Q" to="f8gn:1nuEuAnpfoj" resolve="BL_ColorValue" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4OG1auJF0FY" role="3clFbx">
            <node concept="3cpWs6" id="4OG1auJF0FZ" role="3cqZAp">
              <node concept="10Nm6u" id="4OG1auJF0G0" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4OG1auJF0G1" role="3cqZAp">
          <node concept="2OqwBi" id="4OG1auJF0G3" role="3clFbG">
            <node concept="1eOMI4" id="4OG1auJF0G6" role="2Oq$k0">
              <node concept="1PxgMI" id="4OG1auJF0G8" role="1eOMHV">
                <node concept="2OqwBi" id="4OG1auJF0Gb" role="1m5AlR">
                  <node concept="13iPFW" id="4OG1auJF0Ge" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4OG1auJF0Gf" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:43rgS5P5dby" resolve="color" />
                  </node>
                </node>
                <node concept="chp4Y" id="4OG1auJF0Gg" role="3oSUPX">
                  <ref role="cht4Q" to="f8gn:1nuEuAnpfoj" resolve="BL_ColorValue" />
                </node>
              </node>
            </node>
            <node concept="3TrEf2" id="4OG1auJF0Gh" role="2OqNvi">
              <ref role="3Tt5mk" to="f8gn:1nuEuAnpfok" resolve="expression" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="312cEu" id="HgolRTUXeG">
    <property role="TrG5h" value="NotationGenUtil" />
    <node concept="3Tm1VV" id="HgolRTUXeI" role="1B3o_S" />
    <node concept="2YIFZL" id="HgolRTUXeJ" role="jymVt">
      <property role="TrG5h" value="findCellBuilder" />
      <node concept="3Tm1VV" id="HgolRTUXeN" role="1B3o_S" />
      <node concept="3Tqbb2" id="HgolRTUXeO" role="3clF45">
        <ref role="ehGHo" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
      </node>
      <node concept="37vLTG" id="HgolRTUXeP" role="3clF46">
        <property role="TrG5h" value="outputNode" />
        <node concept="3Tqbb2" id="HgolRTUXeR" role="1tU5fm" />
      </node>
      <node concept="3clFbS" id="HgolRTUXeS" role="3clF47">
        <node concept="2Gpval" id="HgolRTUXeT" role="3cqZAp">
          <node concept="2GrKxI" id="HgolRTUXeX" role="2Gsz3X">
            <property role="TrG5h" value="enclosing" />
          </node>
          <node concept="2OqwBi" id="HgolRTUXeY" role="2GsD0m">
            <node concept="37vLTw" id="HgolRTUXf1" role="2Oq$k0">
              <ref role="3cqZAo" node="HgolRTUXeP" resolve="outputNode" />
            </node>
            <node concept="z$bX8" id="HgolRTUXf2" role="2OqNvi">
              <node concept="1xMEDy" id="HgolRTUXf3" role="1xVPHs">
                <node concept="chp4Y" id="HgolRTUXf5" role="ri$Ld">
                  <ref role="cht4Q" to="tp68:2SO3lBM81WG" resolve="InternalLambdaExpression" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="HgolRTUXf6" role="2LFqv$">
            <node concept="2Gpval" id="HgolRTUXf7" role="3cqZAp">
              <node concept="2GrKxI" id="HgolRTUXfb" role="2Gsz3X">
                <property role="TrG5h" value="child" />
              </node>
              <node concept="2OqwBi" id="HgolRTUXfc" role="2GsD0m">
                <node concept="2GrUjf" id="HgolRTUXff" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="HgolRTUXeX" resolve="enclosing" />
                </node>
                <node concept="32TBzR" id="HgolRTZj6P" role="2OqNvi" />
              </node>
              <node concept="3clFbS" id="HgolRTUXfh" role="2LFqv$">
                <node concept="3clFbJ" id="HgolRTUXfi" role="3cqZAp">
                  <node concept="3fqX7Q" id="HgolRTZj6Q" role="3clFbw">
                    <node concept="1eOMI4" id="HgolRTZj6S" role="3fr31v">
                      <node concept="2OqwBi" id="HgolRTZj6U" role="1eOMHV">
                        <node concept="2GrUjf" id="HgolRTZj6X" role="2Oq$k0">
                          <ref role="2Gs0qQ" node="HgolRTUXfb" resolve="child" />
                        </node>
                        <node concept="1mIQ4w" id="HgolRTZj6Y" role="2OqNvi">
                          <node concept="chp4Y" id="HgolRTZj70" role="cj9EA">
                            <ref role="cht4Q" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="HgolRTUXfV" role="3clFbx">
                    <node concept="3N13vt" id="HgolRTZj71" role="3cqZAp" />
                  </node>
                </node>
                <node concept="3cpWs8" id="HgolRTZj72" role="3cqZAp">
                  <node concept="3cpWsn" id="HgolRTZj75" role="3cpWs9">
                    <property role="TrG5h" value="p" />
                    <node concept="3Tqbb2" id="HgolRTZj77" role="1tU5fm">
                      <ref role="ehGHo" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
                    </node>
                    <node concept="1PxgMI" id="HgolRTZj78" role="33vP2m">
                      <node concept="2GrUjf" id="HgolRTZj7b" role="1m5AlR">
                        <ref role="2Gs0qQ" node="HgolRTUXfb" resolve="child" />
                      </node>
                      <node concept="chp4Y" id="HgolRTZj7c" role="3oSUPX">
                        <ref role="cht4Q" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbJ" id="HgolRTZj7d" role="3cqZAp">
                  <node concept="1Wc70l" id="HgolRTZj7g" role="3clFbw">
                    <node concept="2OqwBi" id="HgolRTZj7j" role="3uHU7B">
                      <node concept="2OqwBi" id="HgolRTZj7m" role="2Oq$k0">
                        <node concept="37vLTw" id="HgolRTZj7p" role="2Oq$k0">
                          <ref role="3cqZAo" node="HgolRTZj75" resolve="p" />
                        </node>
                        <node concept="3TrEf2" id="HgolRTZj7q" role="2OqNvi">
                          <ref role="3Tt5mk" to="tpee:4VkOLwjf83e" resolve="type" />
                        </node>
                      </node>
                      <node concept="1mIQ4w" id="HgolRTZj7r" role="2OqNvi">
                        <node concept="chp4Y" id="HgolRTZj7t" role="cj9EA">
                          <ref role="cht4Q" to="tpee:g7uibYu" resolve="ClassifierType" />
                        </node>
                      </node>
                    </node>
                    <node concept="2OqwBi" id="HgolRTZj7u" role="3uHU7w">
                      <node concept="2OqwBi" id="HgolRTZj7x" role="2Oq$k0">
                        <node concept="2OqwBi" id="HgolRTZj7$" role="2Oq$k0">
                          <node concept="1eOMI4" id="HgolRTZj7B" role="2Oq$k0">
                            <node concept="1PxgMI" id="HgolRTZj7D" role="1eOMHV">
                              <node concept="2OqwBi" id="HgolRTZj7G" role="1m5AlR">
                                <node concept="37vLTw" id="HgolRTZj7J" role="2Oq$k0">
                                  <ref role="3cqZAo" node="HgolRTZj75" resolve="p" />
                                </node>
                                <node concept="3TrEf2" id="HgolRTZj7K" role="2OqNvi">
                                  <ref role="3Tt5mk" to="tpee:4VkOLwjf83e" resolve="type" />
                                </node>
                              </node>
                              <node concept="chp4Y" id="HgolRTZj7L" role="3oSUPX">
                                <ref role="cht4Q" to="tpee:g7uibYu" resolve="ClassifierType" />
                              </node>
                            </node>
                          </node>
                          <node concept="3TrEf2" id="HgolRTZj7M" role="2OqNvi">
                            <ref role="3Tt5mk" to="tpee:g7uigIF" resolve="classifier" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="HgolRTZj7N" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                      <node concept="liA8E" id="HgolRTZj7O" role="2OqNvi">
                        <ref role="37wK5l" to="wyt6:~String.endsWith(java.lang.String)" resolve="endsWith" />
                        <node concept="Xl_RD" id="HgolRTZj7P" role="37wK5m">
                          <property role="Xl_RC" value="CellTemplateBuilder" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="HgolRTZj7Q" role="3clFbx">
                    <node concept="3cpWs6" id="HgolRTZj7R" role="3cqZAp">
                      <node concept="37vLTw" id="HgolRTZj7S" role="3cqZAk">
                        <ref role="3cqZAo" node="HgolRTZj75" resolve="p" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="HgolRTUXfY" role="3cqZAp">
          <node concept="10Nm6u" id="HgolRTUXfZ" role="3cqZAk" />
        </node>
      </node>
    </node>
    <node concept="2YIFZL" id="HgolRTUXg0" role="jymVt">
      <property role="TrG5h" value="findUntypedNodeParameter" />
      <node concept="3Tm1VV" id="HgolRTUXg4" role="1B3o_S" />
      <node concept="3Tqbb2" id="HgolRTUXg5" role="3clF45">
        <ref role="ehGHo" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
      </node>
      <node concept="37vLTG" id="HgolRTUXg6" role="3clF46">
        <property role="TrG5h" value="outputNode" />
        <node concept="3Tqbb2" id="HgolRTUXg8" role="1tU5fm" />
      </node>
      <node concept="3clFbS" id="HgolRTUXg9" role="3clF47">
        <node concept="2Gpval" id="HgolRTUXga" role="3cqZAp">
          <node concept="2GrKxI" id="HgolRTUXge" role="2Gsz3X">
            <property role="TrG5h" value="enclosing" />
          </node>
          <node concept="2OqwBi" id="HgolRTUXgf" role="2GsD0m">
            <node concept="37vLTw" id="HgolRTUXgi" role="2Oq$k0">
              <ref role="3cqZAo" node="HgolRTUXg6" resolve="outputNode" />
            </node>
            <node concept="z$bX8" id="HgolRTUXgj" role="2OqNvi">
              <node concept="1xMEDy" id="HgolRTUXgk" role="1xVPHs">
                <node concept="chp4Y" id="HgolRTUXgm" role="ri$Ld">
                  <ref role="cht4Q" to="tp68:2SO3lBM81WG" resolve="InternalLambdaExpression" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="HgolRTUXgn" role="2LFqv$">
            <node concept="3clFbJ" id="HgolRTUXgo" role="3cqZAp">
              <node concept="3fqX7Q" id="HgolRTUXgr" role="3clFbw">
                <node concept="1eOMI4" id="HgolRTUXgt" role="3fr31v">
                  <node concept="2OqwBi" id="HgolRTUXgv" role="1eOMHV">
                    <node concept="2OqwBi" id="HgolRTUXgy" role="2Oq$k0">
                      <node concept="2GrUjf" id="HgolRTUXg_" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="HgolRTUXge" resolve="enclosing" />
                      </node>
                      <node concept="1mfA1w" id="HgolRTUXgA" role="2OqNvi" />
                    </node>
                    <node concept="1mIQ4w" id="HgolRTUXgB" role="2OqNvi">
                      <node concept="chp4Y" id="HgolRTUXgD" role="cj9EA">
                        <ref role="cht4Q" to="tpee:hwliAcM" resolve="InstanceMethodCallOperation" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="HgolRTUXgE" role="3clFbx">
                <node concept="3N13vt" id="HgolRTUXgF" role="3cqZAp" />
              </node>
            </node>
            <node concept="3cpWs8" id="HgolRTZj7T" role="3cqZAp">
              <node concept="3cpWsn" id="HgolRTZj7W" role="3cpWs9">
                <property role="TrG5h" value="methodName" />
                <node concept="17QB3L" id="HgolRTZj7Y" role="1tU5fm" />
                <node concept="2OqwBi" id="HgolRTZj7Z" role="33vP2m">
                  <node concept="2OqwBi" id="HgolRTZj82" role="2Oq$k0">
                    <node concept="1eOMI4" id="HgolRTZj85" role="2Oq$k0">
                      <node concept="1PxgMI" id="HgolRTZj87" role="1eOMHV">
                        <node concept="2OqwBi" id="HgolRTZj8a" role="1m5AlR">
                          <node concept="2GrUjf" id="HgolRTZj8d" role="2Oq$k0">
                            <ref role="2Gs0qQ" node="HgolRTUXge" resolve="enclosing" />
                          </node>
                          <node concept="1mfA1w" id="HgolRTZj8e" role="2OqNvi" />
                        </node>
                        <node concept="chp4Y" id="HgolRTZj8f" role="3oSUPX">
                          <ref role="cht4Q" to="tpee:hwliAcM" resolve="InstanceMethodCallOperation" />
                        </node>
                      </node>
                    </node>
                    <node concept="3TrEf2" id="HgolRTZj8g" role="2OqNvi">
                      <ref role="3Tt5mk" to="tpee:hwllgre" resolve="instanceMethodDeclaration" />
                    </node>
                  </node>
                  <node concept="3TrcHB" id="HgolRTZj8h" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="HgolRTZj8i" role="3cqZAp">
              <node concept="3fqX7Q" id="HgolRTZj8l" role="3clFbw">
                <node concept="1eOMI4" id="HgolRTZj8n" role="3fr31v">
                  <node concept="22lmx$" id="HgolRTZj8p" role="1eOMHV">
                    <node concept="2OqwBi" id="HgolRTZj8s" role="3uHU7B">
                      <node concept="Xl_RD" id="HgolRTZj8v" role="2Oq$k0">
                        <property role="Xl_RC" value="withUntypedNode" />
                      </node>
                      <node concept="liA8E" id="HgolRTZj8w" role="2OqNvi">
                        <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                        <node concept="37vLTw" id="HgolRTZj8x" role="37wK5m">
                          <ref role="3cqZAo" node="HgolRTZj7W" resolve="methodName" />
                        </node>
                      </node>
                    </node>
                    <node concept="2OqwBi" id="HgolRTZj8y" role="3uHU7w">
                      <node concept="Xl_RD" id="HgolRTZj8_" role="2Oq$k0">
                        <property role="Xl_RC" value="condition" />
                      </node>
                      <node concept="liA8E" id="HgolRTZj8A" role="2OqNvi">
                        <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                        <node concept="37vLTw" id="HgolRTZj8B" role="37wK5m">
                          <ref role="3cqZAo" node="HgolRTZj7W" resolve="methodName" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="HgolRTZj8C" role="3clFbx">
                <node concept="3N13vt" id="HgolRTZj8D" role="3cqZAp" />
              </node>
            </node>
            <node concept="2Gpval" id="HgolRTZj8E" role="3cqZAp">
              <node concept="2GrKxI" id="HgolRTZj8I" role="2Gsz3X">
                <property role="TrG5h" value="child" />
              </node>
              <node concept="2OqwBi" id="HgolRTZj8J" role="2GsD0m">
                <node concept="2GrUjf" id="HgolRTZj8M" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="HgolRTUXge" resolve="enclosing" />
                </node>
                <node concept="32TBzR" id="HgolRTZj8N" role="2OqNvi" />
              </node>
              <node concept="3clFbS" id="HgolRTZj8O" role="2LFqv$">
                <node concept="3clFbJ" id="HgolRTZj8P" role="3cqZAp">
                  <node concept="2OqwBi" id="HgolRTZj8S" role="3clFbw">
                    <node concept="2GrUjf" id="HgolRTZj8V" role="2Oq$k0">
                      <ref role="2Gs0qQ" node="HgolRTZj8I" resolve="child" />
                    </node>
                    <node concept="1mIQ4w" id="HgolRTZj8W" role="2OqNvi">
                      <node concept="chp4Y" id="HgolRTZj8Y" role="cj9EA">
                        <ref role="cht4Q" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="HgolRTZj8Z" role="3clFbx">
                    <node concept="3cpWs6" id="HgolRTZj90" role="3cqZAp">
                      <node concept="1PxgMI" id="HgolRTZj91" role="3cqZAk">
                        <node concept="2GrUjf" id="HgolRTZj94" role="1m5AlR">
                          <ref role="2Gs0qQ" node="HgolRTZj8I" resolve="child" />
                        </node>
                        <node concept="chp4Y" id="HgolRTZj95" role="3oSUPX">
                          <ref role="cht4Q" to="tpee:fz7vLUk" resolve="ParameterDeclaration" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="HgolRTUXhi" role="3cqZAp">
          <node concept="10Nm6u" id="HgolRTUXhj" role="3cqZAk" />
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="78kvCZcVyMC">
    <ref role="13h7C2" to="f8gn:ziPuhEA2a_" resolve="ReferenceCell" />
    <node concept="13hLZK" id="78kvCZcVyMF" role="13h7CW">
      <node concept="3clFbS" id="78kvCZcVyMH" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="78kvCZcVyMI" role="13h7CS">
      <property role="TrG5h" value="hasPlainRenderTarget" />
      <node concept="3Tm1VV" id="78kvCZcVyMM" role="1B3o_S" />
      <node concept="10P_77" id="78kvCZcVyMN" role="3clF45" />
      <node concept="3clFbS" id="78kvCZcVyMO" role="3clF47">
        <node concept="3SKdUt" id="78kvCZcVyMP" role="3cqZAp">
          <node concept="1PaTwC" id="78kvCZcVyMT" role="1aUNEU">
            <node concept="3oM_SD" id="78kvCZcVyMV" role="1PaTwD">
              <property role="3oM_SC" value="A" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyMW" role="1PaTwD">
              <property role="3oM_SC" value="notation" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyMX" role="1PaTwD">
              <property role="3oM_SC" value="that" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyMY" role="1PaTwD">
              <property role="3oM_SC" value="writes" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyMZ" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN0" role="1PaTwD">
              <property role="3oM_SC" value="target" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN1" role="1PaTwD">
              <property role="3oM_SC" value="from" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN2" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN3" role="1PaTwD">
              <property role="3oM_SC" value="target" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN4" role="1PaTwD">
              <property role="3oM_SC" value="alone." />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN5" role="1PaTwD">
              <property role="3oM_SC" value="The" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN6" role="1PaTwD">
              <property role="3oM_SC" value="editor" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN7" role="1PaTwD">
              <property role="3oM_SC" value="can" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN8" role="1PaTwD">
              <property role="3oM_SC" value="use" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyN9" role="1PaTwD">
              <property role="3oM_SC" value="it" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNa" role="1PaTwD">
              <property role="3oM_SC" value="everywhere," />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNb" role="1PaTwD">
              <property role="3oM_SC" value="completion" />
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="78kvCZcVyNc" role="3cqZAp">
          <node concept="1PaTwC" id="78kvCZcVyNg" role="1aUNEU">
            <node concept="3oM_SD" id="78kvCZcVyNi" role="1PaTwD">
              <property role="3oM_SC" value="included," />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNj" role="1PaTwD">
              <property role="3oM_SC" value="because" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNk" role="1PaTwD">
              <property role="3oM_SC" value="it" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNl" role="1PaTwD">
              <property role="3oM_SC" value="needs" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNm" role="1PaTwD">
              <property role="3oM_SC" value="nothing" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNn" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNo" role="1PaTwD">
              <property role="3oM_SC" value="completion" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNp" role="1PaTwD">
              <property role="3oM_SC" value="menu" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNq" role="1PaTwD">
              <property role="3oM_SC" value="does" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNr" role="1PaTwD">
              <property role="3oM_SC" value="not" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyNs" role="1PaTwD">
              <property role="3oM_SC" value="have." />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="78kvCZcVyNt" role="3cqZAp">
          <node concept="1Wc70l" id="78kvCZcVyNu" role="3cqZAk">
            <node concept="2OqwBi" id="78kvCZcVyNx" role="3uHU7B">
              <node concept="2OqwBi" id="78kvCZcVyN$" role="2Oq$k0">
                <node concept="13iPFW" id="78kvCZcVyNB" role="2Oq$k0" />
                <node concept="3TrEf2" id="78kvCZcVyNC" role="2OqNvi">
                  <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                </node>
              </node>
              <node concept="3x8VRR" id="78kvCZcVyND" role="2OqNvi" />
            </node>
            <node concept="2OqwBi" id="78kvCZcVyNE" role="3uHU7w">
              <node concept="2OqwBi" id="78kvCZcVyNH" role="2Oq$k0">
                <node concept="2OqwBi" id="78kvCZcVyNK" role="2Oq$k0">
                  <node concept="13iPFW" id="78kvCZcVyNN" role="2Oq$k0" />
                  <node concept="3TrEf2" id="78kvCZcVyNO" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                  </node>
                </node>
                <node concept="2Rf3mk" id="78kvCZcVyNP" role="2OqNvi">
                  <node concept="1xMEDy" id="78kvCZcVyNS" role="1xVPHs">
                    <node concept="chp4Y" id="78kvCZcVyNU" role="ri$Ld">
                      <ref role="cht4Q" to="f8gn:78kvCZcNHNJ" resolve="BL_ReferenceSourceExpression" />
                    </node>
                  </node>
                  <node concept="1xIGOp" id="78kvCZcVyNV" role="1xVPHs" />
                </node>
              </node>
              <node concept="1v1jN8" id="78kvCZcVyNW" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="78kvCZcVyNX" role="13h7CS">
      <property role="TrG5h" value="hasContextRenderTarget" />
      <node concept="3Tm1VV" id="78kvCZcVyO1" role="1B3o_S" />
      <node concept="10P_77" id="78kvCZcVyO2" role="3clF45" />
      <node concept="3clFbS" id="78kvCZcVyO3" role="3clF47">
        <node concept="3SKdUt" id="78kvCZcVyO4" role="3cqZAp">
          <node concept="1PaTwC" id="78kvCZcVyO8" role="1aUNEU">
            <node concept="3oM_SD" id="78kvCZcVyOa" role="1PaTwD">
              <property role="3oM_SC" value="A" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOb" role="1PaTwD">
              <property role="3oM_SC" value="notation" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOc" role="1PaTwD">
              <property role="3oM_SC" value="that" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOd" role="1PaTwD">
              <property role="3oM_SC" value="also" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOe" role="1PaTwD">
              <property role="3oM_SC" value="reads" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOf" role="1PaTwD">
              <property role="3oM_SC" value="`source`," />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOg" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOh" role="1PaTwD">
              <property role="3oM_SC" value="node" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOi" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOj" role="1PaTwD">
              <property role="3oM_SC" value="reference" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOk" role="1PaTwD">
              <property role="3oM_SC" value="is" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOl" role="1PaTwD">
              <property role="3oM_SC" value="written" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOm" role="1PaTwD">
              <property role="3oM_SC" value="on." />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOn" role="1PaTwD">
              <property role="3oM_SC" value="Only" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOo" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOp" role="1PaTwD">
              <property role="3oM_SC" value="rendered" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOq" role="1PaTwD">
              <property role="3oM_SC" value="cell" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOr" role="1PaTwD">
              <property role="3oM_SC" value="knows" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOs" role="1PaTwD">
              <property role="3oM_SC" value="it," />
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="78kvCZcVyOt" role="3cqZAp">
          <node concept="1PaTwC" id="78kvCZcVyOx" role="1aUNEU">
            <node concept="3oM_SD" id="78kvCZcVyOz" role="1PaTwD">
              <property role="3oM_SC" value="so" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyO$" role="1PaTwD">
              <property role="3oM_SC" value="this" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyO_" role="1PaTwD">
              <property role="3oM_SC" value="one" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOA" role="1PaTwD">
              <property role="3oM_SC" value="goes" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOB" role="1PaTwD">
              <property role="3oM_SC" value="to" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOC" role="1PaTwD">
              <property role="3oM_SC" value="presentationWithContext" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOD" role="1PaTwD">
              <property role="3oM_SC" value="and" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOE" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOF" role="1PaTwD">
              <property role="3oM_SC" value="completion" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOG" role="1PaTwD">
              <property role="3oM_SC" value="menu" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOH" role="1PaTwD">
              <property role="3oM_SC" value="falls" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOI" role="1PaTwD">
              <property role="3oM_SC" value="back" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOJ" role="1PaTwD">
              <property role="3oM_SC" value="to" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOK" role="1PaTwD">
              <property role="3oM_SC" value="MPS's" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOL" role="1PaTwD">
              <property role="3oM_SC" value="own" />
            </node>
            <node concept="3oM_SD" id="78kvCZcVyOM" role="1PaTwD">
              <property role="3oM_SC" value="presentation." />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="78kvCZcVyON" role="3cqZAp">
          <node concept="1Wc70l" id="78kvCZcVyOO" role="3cqZAk">
            <node concept="2OqwBi" id="78kvCZcVyOR" role="3uHU7B">
              <node concept="2OqwBi" id="78kvCZcVyOU" role="2Oq$k0">
                <node concept="13iPFW" id="78kvCZcVyOX" role="2Oq$k0" />
                <node concept="3TrEf2" id="78kvCZcVyOY" role="2OqNvi">
                  <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                </node>
              </node>
              <node concept="3x8VRR" id="78kvCZcVyOZ" role="2OqNvi" />
            </node>
            <node concept="2OqwBi" id="78kvCZcVyP0" role="3uHU7w">
              <node concept="2OqwBi" id="78kvCZcVyP3" role="2Oq$k0">
                <node concept="2OqwBi" id="78kvCZcVyP6" role="2Oq$k0">
                  <node concept="13iPFW" id="78kvCZcVyP9" role="2Oq$k0" />
                  <node concept="3TrEf2" id="78kvCZcVyPa" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                  </node>
                </node>
                <node concept="2Rf3mk" id="78kvCZcVyPb" role="2OqNvi">
                  <node concept="1xMEDy" id="78kvCZcVyPe" role="1xVPHs">
                    <node concept="chp4Y" id="78kvCZcVyPg" role="ri$Ld">
                      <ref role="cht4Q" to="f8gn:78kvCZcNHNJ" resolve="BL_ReferenceSourceExpression" />
                    </node>
                  </node>
                  <node concept="1xIGOp" id="78kvCZcVyPh" role="1xVPHs" />
                </node>
              </node>
              <node concept="3GX2aA" id="78kvCZcVyPi" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="3NQOi27v8de">
    <ref role="13h7C2" to="f8gn:3NQOi27s28c" resolve="ICellContainer" />
    <node concept="13hLZK" id="3NQOi27v8dh" role="13h7CW">
      <node concept="3clFbS" id="3NQOi27v8dj" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="3NQOi27v8dk" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="getContextConcept" />
      <node concept="3Tm1VV" id="3NQOi27v8do" role="1B3o_S" />
      <node concept="3Tqbb2" id="3NQOi27v8dp" role="3clF45">
        <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
      </node>
      <node concept="3clFbS" id="3NQOi27v8dq" role="3clF47">
        <node concept="3SKdUt" id="3NQOi27v8dr" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27v8dv" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27v8dx" role="1PaTwD">
              <property role="3oM_SC" value="The" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dy" role="1PaTwD">
              <property role="3oM_SC" value="concept" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dz" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8d$" role="1PaTwD">
              <property role="3oM_SC" value="cells" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8d_" role="1PaTwD">
              <property role="3oM_SC" value="below" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dA" role="1PaTwD">
              <property role="3oM_SC" value="this" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dB" role="1PaTwD">
              <property role="3oM_SC" value="node" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dC" role="1PaTwD">
              <property role="3oM_SC" value="are" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dD" role="1PaTwD">
              <property role="3oM_SC" value="written" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dE" role="1PaTwD">
              <property role="3oM_SC" value="against:" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dF" role="1PaTwD">
              <property role="3oM_SC" value="their" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dG" role="1PaTwD">
              <property role="3oM_SC" value="property," />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dH" role="1PaTwD">
              <property role="3oM_SC" value="link" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dI" role="1PaTwD">
              <property role="3oM_SC" value="and" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dJ" role="1PaTwD">
              <property role="3oM_SC" value="reference" />
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="3NQOi27v8dK" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27v8dO" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27v8dQ" role="1PaTwD">
              <property role="3oM_SC" value="cells" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dR" role="1PaTwD">
              <property role="3oM_SC" value="name" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dS" role="1PaTwD">
              <property role="3oM_SC" value="its" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dT" role="1PaTwD">
              <property role="3oM_SC" value="features," />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dU" role="1PaTwD">
              <property role="3oM_SC" value="and" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dV" role="1PaTwD">
              <property role="3oM_SC" value="*(...)" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dW" role="1PaTwD">
              <property role="3oM_SC" value="expressions" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dX" role="1PaTwD">
              <property role="3oM_SC" value="see" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dY" role="1PaTwD">
              <property role="3oM_SC" value="a" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8dZ" role="1PaTwD">
              <property role="3oM_SC" value="node" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8e0" role="1PaTwD">
              <property role="3oM_SC" value="of" />
            </node>
            <node concept="3oM_SD" id="3NQOi27v8e1" role="1PaTwD">
              <property role="3oM_SC" value="it." />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3NQOi27v8e2" role="3cqZAp">
          <node concept="10Nm6u" id="3NQOi27v8e4" role="3clFbG" />
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="3NQOi27v8FQ">
    <ref role="13h7C2" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
    <node concept="13hLZK" id="3NQOi27v8FT" role="13h7CW">
      <node concept="3clFbS" id="3NQOi27v8FV" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="3NQOi27v8FW" role="13h7CS">
      <property role="TrG5h" value="getContextConcept" />
      <ref role="13i0hy" node="3NQOi27v8dk" resolve="getContextConcept" />
      <node concept="3Tm1VV" id="3NQOi27v8G0" role="1B3o_S" />
      <node concept="3Tqbb2" id="3NQOi27v8G1" role="3clF45">
        <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
      </node>
      <node concept="3clFbS" id="3NQOi27v8G2" role="3clF47">
        <node concept="3clFbF" id="3NQOi27v8G3" role="3cqZAp">
          <node concept="2OqwBi" id="3NQOi27v8G5" role="3clFbG">
            <node concept="13iPFW" id="3NQOi27v8G8" role="2Oq$k0" />
            <node concept="3TrEf2" id="3NQOi27v8G9" role="2OqNvi">
              <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="3NQOi27v8VJ">
    <ref role="13h7C2" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
    <node concept="13hLZK" id="3NQOi27v8VM" role="13h7CW">
      <node concept="3clFbS" id="3NQOi27v8VO" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="3NQOi27v8VP" role="13h7CS">
      <property role="TrG5h" value="getContextConcept" />
      <ref role="13i0hy" node="3NQOi27v8dk" resolve="getContextConcept" />
      <node concept="3Tm1VV" id="3NQOi27v8VT" role="1B3o_S" />
      <node concept="3Tqbb2" id="3NQOi27v8VU" role="3clF45">
        <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
      </node>
      <node concept="3clFbS" id="3NQOi27v8VV" role="3clF47">
        <node concept="3clFbF" id="3NQOi27v8VW" role="3cqZAp">
          <node concept="2OqwBi" id="3NQOi27v8VY" role="3clFbG">
            <node concept="13iPFW" id="3NQOi27v8W1" role="2Oq$k0" />
            <node concept="3TrEf2" id="3NQOi27v8W2" role="2OqNvi">
              <ref role="3Tt5mk" to="f8gn:3NQOi27s29Y" resolve="concept" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="3NQOi27FxUI" role="13h7CS">
      <property role="TrG5h" value="isApplicableTo" />
      <node concept="3Tm1VV" id="3NQOi27FxUM" role="1B3o_S" />
      <node concept="10P_77" id="3NQOi27FxUN" role="3clF45" />
      <node concept="37vLTG" id="3NQOi27FxUO" role="3clF46">
        <property role="TrG5h" value="contextConcept" />
        <node concept="3Tqbb2" id="3NQOi27FxUQ" role="1tU5fm">
          <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
        </node>
      </node>
      <node concept="3clFbS" id="3NQOi27FxUR" role="3clF47">
        <node concept="3SKdUt" id="3NQOi27FxUS" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27FxUW" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27FxUY" role="1PaTwD">
              <property role="3oM_SC" value="A" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxUZ" role="1PaTwD">
              <property role="3oM_SC" value="component" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV0" role="1PaTwD">
              <property role="3oM_SC" value="may" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV1" role="1PaTwD">
              <property role="3oM_SC" value="be" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV2" role="1PaTwD">
              <property role="3oM_SC" value="used" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV3" role="1PaTwD">
              <property role="3oM_SC" value="wherever" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV4" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV5" role="1PaTwD">
              <property role="3oM_SC" value="surrounding" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV6" role="1PaTwD">
              <property role="3oM_SC" value="notation" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV7" role="1PaTwD">
              <property role="3oM_SC" value="is" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV8" role="1PaTwD">
              <property role="3oM_SC" value="written" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV9" role="1PaTwD">
              <property role="3oM_SC" value="for" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVa" role="1PaTwD">
              <property role="3oM_SC" value="its" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVb" role="1PaTwD">
              <property role="3oM_SC" value="own" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVc" role="1PaTwD">
              <property role="3oM_SC" value="concept" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVd" role="1PaTwD">
              <property role="3oM_SC" value="or" />
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="3NQOi27FxVe" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27FxVi" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27FxVk" role="1PaTwD">
              <property role="3oM_SC" value="for" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVl" role="1PaTwD">
              <property role="3oM_SC" value="a" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVm" role="1PaTwD">
              <property role="3oM_SC" value="subconcept" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVn" role="1PaTwD">
              <property role="3oM_SC" value="of" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVo" role="1PaTwD">
              <property role="3oM_SC" value="it," />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVp" role="1PaTwD">
              <property role="3oM_SC" value="so" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVq" role="1PaTwD">
              <property role="3oM_SC" value="that" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVr" role="1PaTwD">
              <property role="3oM_SC" value="every" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVs" role="1PaTwD">
              <property role="3oM_SC" value="property" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVt" role="1PaTwD">
              <property role="3oM_SC" value="and" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVu" role="1PaTwD">
              <property role="3oM_SC" value="link" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVv" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVw" role="1PaTwD">
              <property role="3oM_SC" value="component" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVx" role="1PaTwD">
              <property role="3oM_SC" value="names" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVy" role="1PaTwD">
              <property role="3oM_SC" value="is" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVz" role="1PaTwD">
              <property role="3oM_SC" value="really" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxV$" role="1PaTwD">
              <property role="3oM_SC" value="there." />
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="3NQOi27FxV_" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27FxVD" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27FxVF" role="1PaTwD">
              <property role="3oM_SC" value="getAllSuperConcepts" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVG" role="1PaTwD">
              <property role="3oM_SC" value="is" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVH" role="1PaTwD">
              <property role="3oM_SC" value="isSubconceptOf" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVI" role="1PaTwD">
              <property role="3oM_SC" value="without" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVJ" role="1PaTwD">
              <property role="3oM_SC" value="its" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVK" role="1PaTwD">
              <property role="3oM_SC" value="two" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVL" role="1PaTwD">
              <property role="3oM_SC" value="overloads," />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVM" role="1PaTwD">
              <property role="3oM_SC" value="which" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVN" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVO" role="1PaTwD">
              <property role="3oM_SC" value="notation" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVP" role="1PaTwD">
              <property role="3oM_SC" value="cannot" />
            </node>
            <node concept="3oM_SD" id="3NQOi27FxVQ" role="1PaTwD">
              <property role="3oM_SC" value="write." />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="3NQOi27FxVR" role="3cqZAp">
          <node concept="22lmx$" id="3NQOi27FxVU" role="3clFbw">
            <node concept="3clFbC" id="3NQOi27FxVX" role="3uHU7B">
              <node concept="37vLTw" id="3NQOi27FxW0" role="3uHU7B">
                <ref role="3cqZAo" node="3NQOi27FxUO" resolve="contextConcept" />
              </node>
              <node concept="10Nm6u" id="3NQOi27FxW1" role="3uHU7w" />
            </node>
            <node concept="3clFbC" id="3NQOi27FxW2" role="3uHU7w">
              <node concept="2OqwBi" id="3NQOi27FxW5" role="3uHU7B">
                <node concept="13iPFW" id="3NQOi27FxW8" role="2Oq$k0" />
                <node concept="3TrEf2" id="3NQOi27FxW9" role="2OqNvi">
                  <ref role="3Tt5mk" to="f8gn:3NQOi27s29Y" resolve="concept" />
                </node>
              </node>
              <node concept="10Nm6u" id="3NQOi27FxWa" role="3uHU7w" />
            </node>
          </node>
          <node concept="3clFbS" id="3NQOi27FxWb" role="3clFbx">
            <node concept="3cpWs6" id="3NQOi27FxWc" role="3cqZAp">
              <node concept="3clFbT" id="3NQOi27FxWd" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="3NQOi27FxWe" role="3cqZAp">
          <node concept="2OqwBi" id="3NQOi27FxWf" role="3cqZAk">
            <node concept="2OqwBi" id="3NQOi27FxWi" role="2Oq$k0">
              <node concept="37vLTw" id="3NQOi27FxWl" role="2Oq$k0">
                <ref role="3cqZAo" node="3NQOi27FxUO" resolve="contextConcept" />
              </node>
              <node concept="2qgKlT" id="3NQOi27FxWm" role="2OqNvi">
                <ref role="37wK5l" to="tpcn:2A8AB0rAWpG" resolve="getAllSuperConcepts" />
                <node concept="3clFbT" id="3NQOi27FxWn" role="37wK5m">
                  <property role="3clFbU" value="true" />
                </node>
              </node>
            </node>
            <node concept="3JPx81" id="3NQOi27FxWo" role="2OqNvi">
              <node concept="2OqwBi" id="3NQOi27FxWq" role="25WWJ7">
                <node concept="13iPFW" id="3NQOi27FxWt" role="2Oq$k0" />
                <node concept="3TrEf2" id="3NQOi27FxWu" role="2OqNvi">
                  <ref role="3Tt5mk" to="f8gn:3NQOi27s29Y" resolve="concept" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="3NQOi27Bcku" role="13h7CS">
      <property role="TrG5h" value="getIncludedComponentsRecursively" />
      <node concept="3Tm1VV" id="3NQOi27Bcky" role="1B3o_S" />
      <node concept="2hMVRd" id="3NQOi27Bckz" role="3clF45">
        <node concept="3Tqbb2" id="3NQOi27Bck_" role="2hN53Y">
          <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
        </node>
      </node>
      <node concept="3clFbS" id="3NQOi27BckA" role="3clF47">
        <node concept="3SKdUt" id="3NQOi27BckB" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27BckF" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27BckH" role="1PaTwD">
              <property role="3oM_SC" value="Every" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckI" role="1PaTwD">
              <property role="3oM_SC" value="component" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckJ" role="1PaTwD">
              <property role="3oM_SC" value="this" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckK" role="1PaTwD">
              <property role="3oM_SC" value="one" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckL" role="1PaTwD">
              <property role="3oM_SC" value="reaches" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckM" role="1PaTwD">
              <property role="3oM_SC" value="through" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckN" role="1PaTwD">
              <property role="3oM_SC" value="a" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckO" role="1PaTwD">
              <property role="3oM_SC" value="ComponentCell," />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckP" role="1PaTwD">
              <property role="3oM_SC" value="at" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckQ" role="1PaTwD">
              <property role="3oM_SC" value="any" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckR" role="1PaTwD">
              <property role="3oM_SC" value="depth." />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckS" role="1PaTwD">
              <property role="3oM_SC" value="Written" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckT" role="1PaTwD">
              <property role="3oM_SC" value="as" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckU" role="1PaTwD">
              <property role="3oM_SC" value="a" />
            </node>
            <node concept="3oM_SD" id="3NQOi27BckV" role="1PaTwD">
              <property role="3oM_SC" value="worklist" />
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="3NQOi27BckW" role="3cqZAp">
          <node concept="1PaTwC" id="3NQOi27Bcl0" role="1aUNEU">
            <node concept="3oM_SD" id="3NQOi27Bcl2" role="1PaTwD">
              <property role="3oM_SC" value="rather" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl3" role="1PaTwD">
              <property role="3oM_SC" value="than" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl4" role="1PaTwD">
              <property role="3oM_SC" value="recursively" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl5" role="1PaTwD">
              <property role="3oM_SC" value="so" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl6" role="1PaTwD">
              <property role="3oM_SC" value="that" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl7" role="1PaTwD">
              <property role="3oM_SC" value="a" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl8" role="1PaTwD">
              <property role="3oM_SC" value="cycle" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcl9" role="1PaTwD">
              <property role="3oM_SC" value="already" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcla" role="1PaTwD">
              <property role="3oM_SC" value="in" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bclb" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bclc" role="1PaTwD">
              <property role="3oM_SC" value="model" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcld" role="1PaTwD">
              <property role="3oM_SC" value="does" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bcle" role="1PaTwD">
              <property role="3oM_SC" value="not" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bclf" role="1PaTwD">
              <property role="3oM_SC" value="hang" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bclg" role="1PaTwD">
              <property role="3oM_SC" value="the" />
            </node>
            <node concept="3oM_SD" id="3NQOi27Bclh" role="1PaTwD">
              <property role="3oM_SC" value="checker." />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="3NQOi27Bcli" role="3cqZAp">
          <node concept="3cpWsn" id="3NQOi27Bcll" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <node concept="2hMVRd" id="3NQOi27Bcln" role="1tU5fm">
              <node concept="3Tqbb2" id="3NQOi27Bclp" role="2hN53Y">
                <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
              </node>
            </node>
            <node concept="2ShNRf" id="3NQOi27Bclq" role="33vP2m">
              <node concept="2i4dXS" id="3NQOi27Bcls" role="2ShVmc">
                <node concept="3Tqbb2" id="3NQOi27Bclt" role="HW$YZ">
                  <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="3NQOi27Bclu" role="3cqZAp">
          <node concept="3cpWsn" id="3NQOi27Bclx" role="3cpWs9">
            <property role="TrG5h" value="queue" />
            <node concept="_YKpA" id="3NQOi27Bclz" role="1tU5fm">
              <node concept="3Tqbb2" id="3NQOi27Bcl_" role="_ZDj9">
                <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
              </node>
            </node>
            <node concept="2ShNRf" id="3NQOi27BclA" role="33vP2m">
              <node concept="Tc6Ow" id="3NQOi27BclC" role="2ShVmc">
                <node concept="3Tqbb2" id="3NQOi27BclD" role="HW$YZ">
                  <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3NQOi27BclE" role="3cqZAp">
          <node concept="2OqwBi" id="3NQOi27BclG" role="3clFbG">
            <node concept="37vLTw" id="3NQOi27BclJ" role="2Oq$k0">
              <ref role="3cqZAo" node="3NQOi27Bclx" resolve="queue" />
            </node>
            <node concept="TSZUe" id="3NQOi27BclK" role="2OqNvi">
              <node concept="13iPFW" id="3NQOi27BclM" role="25WWJ7" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="3NQOi27BclN" role="3cqZAp">
          <node concept="3cpWsn" id="3NQOi27BclQ" role="3cpWs9">
            <property role="TrG5h" value="i" />
            <node concept="10Oyi0" id="3NQOi27BclS" role="1tU5fm" />
            <node concept="3cmrfG" id="3NQOi27BclT" role="33vP2m">
              <property role="3cmrfH" value="0" />
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="3NQOi27BclU" role="3cqZAp">
          <node concept="3eOVzh" id="3NQOi27BclX" role="2$JKZa">
            <node concept="37vLTw" id="3NQOi27Bcm0" role="3uHU7B">
              <ref role="3cqZAo" node="3NQOi27BclQ" resolve="i" />
            </node>
            <node concept="2OqwBi" id="3NQOi27Bcm1" role="3uHU7w">
              <node concept="37vLTw" id="3NQOi27Bcm4" role="2Oq$k0">
                <ref role="3cqZAo" node="3NQOi27Bclx" resolve="queue" />
              </node>
              <node concept="34oBXx" id="3NQOi27Bcm5" role="2OqNvi" />
            </node>
          </node>
          <node concept="3clFbS" id="3NQOi27Bcm6" role="2LFqv$">
            <node concept="3cpWs8" id="3NQOi27Bcm7" role="3cqZAp">
              <node concept="3cpWsn" id="3NQOi27Bcma" role="3cpWs9">
                <property role="TrG5h" value="current" />
                <node concept="3Tqbb2" id="3NQOi27Bcmc" role="1tU5fm">
                  <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
                </node>
                <node concept="2OqwBi" id="3NQOi27Bcmd" role="33vP2m">
                  <node concept="37vLTw" id="3NQOi27Bcmg" role="2Oq$k0">
                    <ref role="3cqZAo" node="3NQOi27Bclx" resolve="queue" />
                  </node>
                  <node concept="34jXtK" id="3NQOi27Bcmh" role="2OqNvi">
                    <node concept="37vLTw" id="3NQOi27Bcmj" role="25WWJ7">
                      <ref role="3cqZAo" node="3NQOi27BclQ" resolve="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="3NQOi27Bcmk" role="3cqZAp">
              <node concept="37vLTI" id="3NQOi27Bcmm" role="3clFbG">
                <node concept="37vLTw" id="3NQOi27Bcmp" role="37vLTJ">
                  <ref role="3cqZAo" node="3NQOi27BclQ" resolve="i" />
                </node>
                <node concept="3cpWs3" id="3NQOi27Bcmq" role="37vLTx">
                  <node concept="37vLTw" id="3NQOi27Bcmt" role="3uHU7B">
                    <ref role="3cqZAo" node="3NQOi27BclQ" resolve="i" />
                  </node>
                  <node concept="3cmrfG" id="3NQOi27Bcmu" role="3uHU7w">
                    <property role="3cmrfH" value="1" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="3NQOi27Bcmv" role="3cqZAp">
              <node concept="3clFbC" id="3NQOi27Bcmy" role="3clFbw">
                <node concept="2OqwBi" id="3NQOi27Bcm_" role="3uHU7B">
                  <node concept="37vLTw" id="3NQOi27BcmC" role="2Oq$k0">
                    <ref role="3cqZAo" node="3NQOi27Bcma" resolve="current" />
                  </node>
                  <node concept="3TrEf2" id="3NQOi27BcmD" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:3NQOi27s29X" resolve="cell" />
                  </node>
                </node>
                <node concept="10Nm6u" id="3NQOi27BcmE" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="3NQOi27BcmF" role="3clFbx">
                <node concept="3N13vt" id="3NQOi27BcmG" role="3cqZAp" />
              </node>
            </node>
            <node concept="2Gpval" id="3NQOi27BcmH" role="3cqZAp">
              <node concept="2GrKxI" id="3NQOi27BcmL" role="2Gsz3X">
                <property role="TrG5h" value="usage" />
              </node>
              <node concept="2OqwBi" id="3NQOi27BcmM" role="2GsD0m">
                <node concept="2OqwBi" id="3NQOi27BcmP" role="2Oq$k0">
                  <node concept="37vLTw" id="3NQOi27BcmS" role="2Oq$k0">
                    <ref role="3cqZAo" node="3NQOi27Bcma" resolve="current" />
                  </node>
                  <node concept="3TrEf2" id="3NQOi27BcmT" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:3NQOi27s29X" resolve="cell" />
                  </node>
                </node>
                <node concept="2Rf3mk" id="3NQOi27BcmU" role="2OqNvi">
                  <node concept="1xMEDy" id="3NQOi27BcmX" role="1xVPHs">
                    <node concept="chp4Y" id="3NQOi27BcmZ" role="ri$Ld">
                      <ref role="cht4Q" to="f8gn:3NQOi27s2bH" resolve="ComponentCell" />
                    </node>
                  </node>
                  <node concept="1xIGOp" id="3NQOi27Bcn0" role="1xVPHs" />
                </node>
              </node>
              <node concept="3clFbS" id="3NQOi27Bcn1" role="2LFqv$">
                <node concept="3cpWs8" id="3NQOi27Bcn2" role="3cqZAp">
                  <node concept="3cpWsn" id="3NQOi27Bcn5" role="3cpWs9">
                    <property role="TrG5h" value="target" />
                    <node concept="3Tqbb2" id="3NQOi27Bcn7" role="1tU5fm">
                      <ref role="ehGHo" to="f8gn:3NQOi27s29T" resolve="NotationComponent" />
                    </node>
                    <node concept="2OqwBi" id="3NQOi27Bcn8" role="33vP2m">
                      <node concept="2GrUjf" id="3NQOi27Bcnb" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="3NQOi27BcmL" resolve="usage" />
                      </node>
                      <node concept="3TrEf2" id="3NQOi27Bcnc" role="2OqNvi">
                        <ref role="3Tt5mk" to="f8gn:3NQOi27s2bI" resolve="component" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbJ" id="3NQOi27Bcnd" role="3cqZAp">
                  <node concept="22lmx$" id="3NQOi27Bcng" role="3clFbw">
                    <node concept="3clFbC" id="3NQOi27Bcnj" role="3uHU7B">
                      <node concept="37vLTw" id="3NQOi27Bcnm" role="3uHU7B">
                        <ref role="3cqZAo" node="3NQOi27Bcn5" resolve="target" />
                      </node>
                      <node concept="10Nm6u" id="3NQOi27Bcnn" role="3uHU7w" />
                    </node>
                    <node concept="2OqwBi" id="3NQOi27Bcno" role="3uHU7w">
                      <node concept="37vLTw" id="3NQOi27Bcnr" role="2Oq$k0">
                        <ref role="3cqZAo" node="3NQOi27Bcll" resolve="result" />
                      </node>
                      <node concept="3JPx81" id="3NQOi27Bcns" role="2OqNvi">
                        <node concept="37vLTw" id="3NQOi27Bcnu" role="25WWJ7">
                          <ref role="3cqZAo" node="3NQOi27Bcn5" resolve="target" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="3NQOi27Bcnv" role="3clFbx">
                    <node concept="3N13vt" id="3NQOi27Bcnw" role="3cqZAp" />
                  </node>
                </node>
                <node concept="3clFbF" id="3NQOi27Bcnx" role="3cqZAp">
                  <node concept="2OqwBi" id="3NQOi27Bcnz" role="3clFbG">
                    <node concept="37vLTw" id="3NQOi27BcnA" role="2Oq$k0">
                      <ref role="3cqZAo" node="3NQOi27Bcll" resolve="result" />
                    </node>
                    <node concept="TSZUe" id="3NQOi27BcnB" role="2OqNvi">
                      <node concept="37vLTw" id="3NQOi27BcnD" role="25WWJ7">
                        <ref role="3cqZAo" node="3NQOi27Bcn5" resolve="target" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="3NQOi27BcnE" role="3cqZAp">
                  <node concept="2OqwBi" id="3NQOi27BcnG" role="3clFbG">
                    <node concept="37vLTw" id="3NQOi27BcnJ" role="2Oq$k0">
                      <ref role="3cqZAo" node="3NQOi27Bclx" resolve="queue" />
                    </node>
                    <node concept="TSZUe" id="3NQOi27BcnK" role="2OqNvi">
                      <node concept="37vLTw" id="3NQOi27BcnM" role="25WWJ7">
                        <ref role="3cqZAo" node="3NQOi27Bcn5" resolve="target" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="3NQOi27BcnN" role="3cqZAp">
          <node concept="37vLTw" id="3NQOi27BcnO" role="3cqZAk">
            <ref role="3cqZAo" node="3NQOi27Bcll" resolve="result" />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

