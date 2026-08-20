<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:d1d5cd51-6710-43f8-bd5b-f958da6e1ca2(org.modelix.mps.notation.behavior)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="f8gn" ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)" />
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
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
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
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
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
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
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
</model>

