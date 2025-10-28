<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4ee90d89-861f-4bf3-9fa8-cf4ca2342e77(org.modelix.mps.react.muicomponents.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <use id="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" name="jetbrains.mps.lang.actions" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="vpip" ref="r:fcc69b83-3584-4a79-833a-d9dc948b6fd7(org.modelix.mps.react.editor)" />
    <import index="zaxg" ref="r:c4183f14-1033-4ade-be7c-1beadb184134(org.modelix.mps.react.muicomponents.structure)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" />
    <import index="7923" ref="r:2c5a8407-fd65-4ea4-b95e-a8f8fee129c0(org.modelix.mps.react.muicomponents.behavior)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="dxuu" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:javax.swing(JDK/)" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1402906326895675325" name="jetbrains.mps.lang.editor.structure.CellActionMap_FunctionParm_selectedNode" flags="nn" index="0IXxy" />
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
      </concept>
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <property id="1140524450557" name="separatorText" index="2czwfO" />
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237307900041" name="jetbrains.mps.lang.editor.structure.IndentLayoutIndentStyleClassItem" flags="ln" index="lj46D" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1237385578942" name="jetbrains.mps.lang.editor.structure.IndentLayoutOnNewLineStyleClassItem" flags="ln" index="pVoyu" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1239814640496" name="jetbrains.mps.lang.editor.structure.CellLayout_VerticalGrid" flags="nn" index="2EHx9g" />
      <concept id="1160493135005" name="jetbrains.mps.lang.editor.structure.CellMenuPart_PropertyValues_GetValues" flags="in" index="MLZmj" />
      <concept id="1164824717996" name="jetbrains.mps.lang.editor.structure.CellMenuDescriptor" flags="ng" index="OXEIz">
        <child id="1164824815888" name="cellMenuPart" index="OY2wv" />
      </concept>
      <concept id="1164833692343" name="jetbrains.mps.lang.editor.structure.CellMenuPart_PropertyValues" flags="ng" index="PvTIS">
        <child id="1164833692344" name="valuesFunction" index="PvTIR" />
      </concept>
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1149850725784" name="jetbrains.mps.lang.editor.structure.CellModel_AttributedNodeCell" flags="ng" index="2SsqMj" />
      <concept id="1186403694788" name="jetbrains.mps.lang.editor.structure.ColorStyleClassItem" flags="ln" index="VaVBg">
        <child id="1186403803051" name="query" index="VblUZ" />
      </concept>
      <concept id="1186404549998" name="jetbrains.mps.lang.editor.structure.ForegroundColorStyleClassItem" flags="ln" index="VechU" />
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
        <child id="1223387335081" name="query" index="3n$kyP" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1186414949600" name="jetbrains.mps.lang.editor.structure.AutoDeletableStyleClassItem" flags="ln" index="VPRnO" />
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1233759184865" name="jetbrains.mps.lang.editor.structure.PunctuationRightStyleClassItem" flags="ln" index="11LMrY" />
      <concept id="1139535219966" name="jetbrains.mps.lang.editor.structure.CellActionMapDeclaration" flags="ig" index="1h_SRR">
        <reference id="1139535219968" name="applicableConcept" index="1h_SK9" />
        <child id="1139535219969" name="item" index="1h_SK8" />
      </concept>
      <concept id="1139535280617" name="jetbrains.mps.lang.editor.structure.CellActionMapItem" flags="lg" index="1hA7zw">
        <property id="1139535298778" name="actionId" index="1hAc7j" />
        <child id="1139535280620" name="executeFunction" index="1hA7z_" />
      </concept>
      <concept id="1139535439104" name="jetbrains.mps.lang.editor.structure.CellActionMap_ExecuteFunction" flags="in" index="1hAIg9" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ngI" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1223387125302" name="jetbrains.mps.lang.editor.structure.QueryFunction_Boolean" flags="in" index="3nzxsE" />
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <property id="1140114345053" name="allowEmptyText" index="1O74Pk" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <reference id="1139959269582" name="actionMap" index="1ERwB7" />
        <child id="1142887637401" name="renderingCondition" index="pqm2j" />
        <child id="1164826688380" name="menuDescriptor" index="P5bDN" />
      </concept>
      <concept id="1073389446423" name="jetbrains.mps.lang.editor.structure.CellModel_Collection" flags="sn" stub="3013115976261988961" index="3EZMnI">
        <property id="1160590353935" name="usesFolding" index="S$Qs1" />
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="7723470090030138869" name="foldedCellModel" index="AHCbl" />
        <child id="1073389446424" name="childCellModel" index="3EZMnx" />
      </concept>
      <concept id="1073389577006" name="jetbrains.mps.lang.editor.structure.CellModel_Constant" flags="sn" stub="3610246225209162225" index="3F0ifn">
        <property id="1082639509531" name="nullText" index="ilYzB" />
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ngI" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1225898583838" name="jetbrains.mps.lang.editor.structure.ReadOnlyModelAccessor" flags="ng" index="1HfYo3">
        <child id="1225898971709" name="getter" index="1Hhtcw" />
      </concept>
      <concept id="1225900081164" name="jetbrains.mps.lang.editor.structure.CellModel_ReadOnlyModelAccessor" flags="sg" stub="3708815482283559694" index="1HlG4h">
        <child id="1225900141900" name="modelAccessor" index="1HlULh" />
      </concept>
      <concept id="1176717841777" name="jetbrains.mps.lang.editor.structure.QueryFunction_ModelAccess_Getter" flags="in" index="3TQlhw" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
      <concept id="1176809959526" name="jetbrains.mps.lang.editor.structure.QueryFunction_Color" flags="in" index="3ZlJ5R" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="8118189177080264853" name="jetbrains.mps.baseLanguage.structure.AlternativeType" flags="ig" index="nSUau">
        <child id="8118189177080264854" name="alternative" index="nSUat" />
      </concept>
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
      <concept id="4952749571008284462" name="jetbrains.mps.baseLanguage.structure.CatchVariable" flags="ng" index="XOnhg" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
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
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="3093926081414150598" name="jetbrains.mps.baseLanguage.structure.MultipleCatchClause" flags="ng" index="3uVAMA">
        <child id="8276990574895933173" name="catchBody" index="1zc67A" />
        <child id="8276990574895933172" name="throwable" index="1zc67B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="5351203823916750322" name="jetbrains.mps.baseLanguage.structure.TryUniversalStatement" flags="nn" index="3J1_TO">
        <child id="8276990574886367510" name="catchClause" index="1zxBo5" />
        <child id="8276990574886367508" name="body" index="1zxBo7" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1228341669568" name="jetbrains.mps.lang.smodel.structure.Node_DetachOperation" flags="nn" index="3YRAZt" />
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
  <node concept="24kQdi" id="2vPZMAmvsgt">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:2vPZMAmvnIB" resolve="TextField" />
    <node concept="3EZMnI" id="2vPZMAmvsgy" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmvsgz" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAmvsgv" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F0ifn" id="1LliyakUIVf" role="3EZMnx">
        <property role="3F0ifm" value="[" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        <node concept="11L4FC" id="1LliyakUKEx" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="1LliyakULfB" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="1LliyakUMGn" role="3EZMnx">
        <property role="1$x2rV" value="&lt;none&gt;" />
        <ref role="1NtTu8" to="zaxg:1LliyakUHuy" resolve="valueConverter" />
      </node>
      <node concept="3F0ifn" id="1LliyakUJwm" role="3EZMnx">
        <property role="3F0ifm" value="]" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        <node concept="11L4FC" id="1LliyakUJMU" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="2vPZMAmvsgA" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmvsgs" resolve="data" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmvsgC">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:2vPZMAmvsgl" resolve="NodePropRef" />
    <node concept="3EZMnI" id="2vPZMAmvsgG" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmvsgH" role="2iSdaV" />
      <node concept="3F1sOY" id="2vPZMAmvsgE" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmvsgm" resolve="node" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmvsgJ" role="3EZMnx">
        <property role="3F0ifm" value="-&gt;" />
        <node concept="11L4FC" id="2vPZMAmx_GB" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="2vPZMAmx_GD" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="1iCGBv" id="2vPZMAmvsgM" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmvsgn" resolve="property" />
        <node concept="1sVBvm" id="2vPZMAmvsgO" role="1sWHZn">
          <node concept="3F0A7n" id="2vPZMAmvsgS" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            <ref role="1k5W1q" to="vpip:5KtU3pYyDEg" resolve="RFeature" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmDmtU">
    <property role="3GE5qa" value="output" />
    <ref role="1XX52x" to="zaxg:2vPZMAmDmtP" resolve="Label" />
    <node concept="3EZMnI" id="2vPZMAmDmtW" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmDmtX" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAmDmtY" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F0ifn" id="2vPZMAn_7Nq" role="3EZMnx">
        <property role="3F0ifm" value="[" />
        <node concept="11L4FC" id="2vPZMAn_7Ny" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="2vPZMAn_7N$" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="G39ofC9Ay1" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:G39ofC8uZm" resolve="typography" />
      </node>
      <node concept="3F0ifn" id="2vPZMAn_7Nt" role="3EZMnx">
        <property role="3F0ifm" value="]" />
        <node concept="11L4FC" id="2vPZMAn_7NA" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="2vPZMAmDmtZ" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmDsnU" resolve="value" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmEWcY">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:2vPZMAmEVPF" resolve="LayoutHorizontal" />
    <node concept="3EZMnI" id="2vPZMAmEWd8" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAmEWd9" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAmEWd3" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAmEWd4" role="2iSdaV" />
        <node concept="PMmxH" id="cqTc8J2sSU" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="cqTc8J2sSV" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="11L4FC" id="cqTc8J2sSW" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="cqTc8J2sSX" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F1sOY" id="cqTc8J2sSY" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:cqTc8J2sSH" resolve="align" />
        </node>
        <node concept="3F0ifn" id="cqTc8J2sSZ" role="3EZMnx">
          <property role="3F0ifm" value="gap:" />
          <ref role="1k5W1q" to="vpip:cqTc8J2jIR" resolve="RComponentProperty" />
        </node>
        <node concept="3F0A7n" id="cqTc8J2sT0" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <property role="1$x2rV" value="&lt;none&gt;" />
          <ref role="1NtTu8" to="zaxg:cqTc8J2sSJ" resolve="gap" />
          <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
        </node>
        <node concept="3F0ifn" id="cqTc8J2sT1" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="11L4FC" id="cqTc8J2sT2" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="cqTc8J2sT3" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="2vPZMAmEWdc" role="3EZMnx">
        <node concept="VPM3Z" id="2vPZMAmEWde" role="3F10Kt" />
        <node concept="3XFhqQ" id="2vPZMAmEWdi" role="3EZMnx" />
        <node concept="3F2HdR" id="2vPZMAmEWdl" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAmEVPK" resolve="children" />
          <node concept="2iRkQZ" id="2vPZMAmEWdq" role="2czzBx" />
        </node>
        <node concept="2iRfu4" id="2vPZMAmEWdh" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmEWda" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmGCtm">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:2vPZMAmGCtk" resolve="LayoutVertical" />
    <node concept="3EZMnI" id="2vPZMAmGCto" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAmGCtp" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAmGCtq" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAmGCtr" role="2iSdaV" />
        <node concept="PMmxH" id="2vPZMAmGCts" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="cqTc8J1QvT" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="11L4FC" id="cqTc8J1QvV" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="cqTc8J1QvX" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F1sOY" id="cqTc8J2oWO" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:cqTc8J2l4k" resolve="align" />
        </node>
        <node concept="3F0ifn" id="cqTc8J2oWR" role="3EZMnx">
          <property role="3F0ifm" value="gap:" />
          <ref role="1k5W1q" to="vpip:cqTc8J2jIR" resolve="RComponentProperty" />
        </node>
        <node concept="3F0A7n" id="2vPZMAmGN8z" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <property role="1$x2rV" value="&lt;none&gt;" />
          <ref role="1NtTu8" to="zaxg:2vPZMAmGN8u" resolve="gap" />
          <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
        </node>
        <node concept="3F0ifn" id="cqTc8J1Qw3" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="11L4FC" id="cqTc8J1Qw5" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="2vPZMAmGCtt" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="2vPZMAmGCtu" role="3EZMnx">
        <node concept="VPM3Z" id="2vPZMAmGCtv" role="3F10Kt" />
        <node concept="3XFhqQ" id="2vPZMAmGCtw" role="3EZMnx" />
        <node concept="3F2HdR" id="2vPZMAmGCtx" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAmEVPK" resolve="children" />
          <node concept="2iRkQZ" id="2vPZMAmGCty" role="2czzBx" />
        </node>
        <node concept="2iRfu4" id="2vPZMAmGCtz" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmGCt$" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmJaEL">
    <property role="3GE5qa" value="output" />
    <ref role="1XX52x" to="zaxg:2vPZMAmJaEH" resolve="Header" />
    <node concept="3EZMnI" id="2vPZMAmJaEP" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmJaEQ" role="2iSdaV" />
      <node concept="3F0ifn" id="2vPZMAmJaEN" role="3EZMnx">
        <property role="3F0ifm" value="header" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmJaES" role="3EZMnx">
        <property role="3F0ifm" value="[" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        <node concept="11L4FC" id="2vPZMAmJaF0" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="2vPZMAmJaF4" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="2vPZMAmJaEY" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmJaEJ" resolve="level" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
      <node concept="3F0ifn" id="G39ofCeKl3" role="3EZMnx">
        <property role="3F0ifm" value="|" />
        <node concept="11L4FC" id="G39ofCf_dV" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="G39ofCf_dX" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="G39ofCeKl6" role="3EZMnx">
        <property role="1$x2rV" value="&lt;default&gt;" />
        <ref role="1NtTu8" to="zaxg:G39ofCeJi6" resolve="typography" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmJaEW" role="3EZMnx">
        <property role="3F0ifm" value="]" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        <node concept="11L4FC" id="2vPZMAmJaF6" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="2vPZMAmJaF8" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmJaEK" resolve="text" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmMpdP">
    <property role="3GE5qa" value="output" />
    <ref role="1XX52x" to="zaxg:2vPZMAmMlUm" resolve="Space" />
    <node concept="PMmxH" id="2vPZMAmMpdT" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmYEOd">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:2vPZMAmYEOb" resolve="ButtonLabelText" />
    <node concept="3EZMnI" id="2vPZMAmYEOg" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmYEOh" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAmYEOf" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmYEOj" role="3EZMnx">
        <property role="3F0ifm" value="[" />
        <node concept="11L4FC" id="2vPZMAmYEOr" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="2vPZMAmYEOw" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="2vPZMAmYEOp" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmYEOc" resolve="text" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmYEOm" role="3EZMnx">
        <property role="3F0ifm" value="]" />
        <node concept="11L4FC" id="2vPZMAmYEOy" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmYWc2">
    <property role="3GE5qa" value="action" />
    <ref role="1XX52x" to="zaxg:2vPZMAmYEO_" resolve="Button" />
    <node concept="3EZMnI" id="2vPZMAmYWc5" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmYWc6" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAmYWc4" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F1sOY" id="2vPZMAmYWc8" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmYEOB" resolve="label" />
      </node>
      <node concept="3F1sOY" id="2vPZMAneuaU" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAneuaN" resolve="command" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAn8wH8">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:2vPZMAn8wb$" resolve="ButtonLabelIcon" />
    <node concept="3EZMnI" id="2vPZMAn8wHa" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAn8wHb" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAn8wHc" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F0ifn" id="2vPZMAn8wHd" role="3EZMnx">
        <property role="3F0ifm" value="[" />
        <node concept="11L4FC" id="2vPZMAn8wHe" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="2vPZMAn8wHf" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="2vPZMAnBVXu" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAnBVHD" resolve="icon" />
      </node>
      <node concept="3F0ifn" id="2vPZMAn8wHh" role="3EZMnx">
        <property role="3F0ifm" value="]" />
        <node concept="11L4FC" id="2vPZMAn8wHi" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAneuaD">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:2vPZMAneuaB" resolve="Command" />
    <node concept="3EZMnI" id="2vPZMAnhbMR" role="2wV5jI">
      <ref role="1k5W1q" to="vpip:2vPZMAn1cgK" resolve="RBehaviorCode" />
      <node concept="2iRfu4" id="2vPZMAnhbMS" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAneuaI" role="3EZMnx">
        <node concept="l2Vlx" id="2vPZMAngqbn" role="2iSdaV" />
        <node concept="PMmxH" id="2vPZMAneuaH" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
        <node concept="3F0ifn" id="2vPZMAngqbq" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <node concept="pkWqt" id="2vPZMAngqbs" role="pqm2j">
            <node concept="3clFbS" id="2vPZMAngqbt" role="2VODD2">
              <node concept="3clFbF" id="2vPZMAngqoZ" role="3cqZAp">
                <node concept="2OqwBi" id="2vPZMAngYWV" role="3clFbG">
                  <node concept="pncrf" id="2vPZMAngY$v" role="2Oq$k0" />
                  <node concept="2qgKlT" id="2vPZMAngZh2" role="2OqNvi">
                    <ref role="37wK5l" to="7923:2vPZMAngLCS" resolve="layoutMultiline" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F1sOY" id="2vPZMAneuaL" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAneuaC" resolve="statements" />
          <node concept="lj46D" id="2vPZMAnh16u" role="3F10Kt">
            <property role="VOm3f" value="true" />
            <node concept="3nzxsE" id="2vPZMAnh19F" role="3n$kyP">
              <node concept="3clFbS" id="2vPZMAnh19G" role="2VODD2">
                <node concept="3clFbF" id="2vPZMAnh19I" role="3cqZAp">
                  <node concept="2OqwBi" id="2vPZMAnh19K" role="3clFbG">
                    <node concept="pncrf" id="2vPZMAnh19L" role="2Oq$k0" />
                    <node concept="2qgKlT" id="2vPZMAnh19M" role="2OqNvi">
                      <ref role="37wK5l" to="7923:2vPZMAngLCS" resolve="layoutMultiline" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="pVoyu" id="2vPZMAngZZo" role="3F10Kt">
            <property role="VOm3f" value="true" />
            <node concept="3nzxsE" id="2vPZMAngZZp" role="3n$kyP">
              <node concept="3clFbS" id="2vPZMAngZZq" role="2VODD2">
                <node concept="3clFbF" id="2vPZMAnh0cU" role="3cqZAp">
                  <node concept="2OqwBi" id="2vPZMAnh0cV" role="3clFbG">
                    <node concept="pncrf" id="2vPZMAnh0cW" role="2Oq$k0" />
                    <node concept="2qgKlT" id="2vPZMAnh0cX" role="2OqNvi">
                      <ref role="37wK5l" to="7923:2vPZMAngLCS" resolve="layoutMultiline" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F0ifn" id="2vPZMAngZy3" role="3EZMnx">
          <property role="3F0ifm" value="}" />
          <node concept="pkWqt" id="2vPZMAngZyQ" role="pqm2j">
            <node concept="3clFbS" id="2vPZMAngZyR" role="2VODD2">
              <node concept="3clFbF" id="2vPZMAngZyT" role="3cqZAp">
                <node concept="2OqwBi" id="2vPZMAngZyU" role="3clFbG">
                  <node concept="pncrf" id="2vPZMAngZyV" role="2Oq$k0" />
                  <node concept="2qgKlT" id="2vPZMAngZyW" role="2OqNvi">
                    <ref role="37wK5l" to="7923:2vPZMAngLCS" resolve="layoutMultiline" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="pVoyu" id="2vPZMAngZYA" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAnBVdW">
    <property role="3GE5qa" value="output" />
    <ref role="1XX52x" to="zaxg:2vPZMAnBVdU" resolve="Icon" />
    <node concept="3EZMnI" id="2vPZMAnBVdZ" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAnBVe0" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAnBVdY" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F0ifn" id="2vPZMAnBVe2" role="3EZMnx">
        <property role="3F0ifm" value="/" />
        <node concept="11L4FC" id="2vPZMAnBVe8" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="2vPZMAnBVea" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="2vPZMAnBVed" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAnBVdV" resolve="name" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
        <node concept="OXEIz" id="2vPZMAnBVtQ" role="P5bDN">
          <node concept="PvTIS" id="2vPZMAnBVtR" role="OY2wv">
            <node concept="MLZmj" id="2vPZMAnBVtS" role="PvTIR">
              <node concept="3clFbS" id="2vPZMAnBVtT" role="2VODD2">
                <node concept="3clFbF" id="2vPZMAnBVtU" role="3cqZAp">
                  <node concept="2YIFZM" id="2vPZMAnBVtV" role="3clFbG">
                    <ref role="37wK5l" to="vpip:2vPZMAn8yu1" resolve="listOfReactComponentNamesStartingWith" />
                    <ref role="1Pybhc" to="vpip:2vPZMAn8x2M" resolve="ReactComponentProvider" />
                    <node concept="Xl_RD" id="2vPZMAnBVtW" role="37wK5m">
                      <property role="Xl_RC" value="mui.icons" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="2vPZMAnBVe5" role="3EZMnx">
        <property role="3F0ifm" value="/" />
        <node concept="11L4FC" id="2vPZMAnBVe7" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAnEQ4m">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:2vPZMAnBVdN" resolve="Accordion" />
    <node concept="3EZMnI" id="2vPZMAnEQ4p" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAnEQ4q" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAnEQ4o" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3EZMnI" id="2vPZMAnEQ4$" role="3EZMnx">
        <node concept="2iRkQZ" id="2vPZMAnEQ4_" role="2iSdaV" />
        <node concept="3EZMnI" id="2vPZMAnEQ4K" role="3EZMnx">
          <node concept="2iRfu4" id="2vPZMAnEQ4L" role="2iSdaV" />
          <node concept="3F0ifn" id="2vPZMAnEQ4M" role="3EZMnx">
            <property role="3F0ifm" value="icon:   " />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F1sOY" id="2vPZMAnEQ4P" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2vPZMAnEJvM" resolve="icon" />
          </node>
        </node>
        <node concept="3EZMnI" id="2vPZMAnEQ4y" role="3EZMnx">
          <node concept="2iRfu4" id="2vPZMAnEQ4z" role="2iSdaV" />
          <node concept="3F0ifn" id="2vPZMAnEQ4s" role="3EZMnx">
            <property role="3F0ifm" value="summary:" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F1sOY" id="2vPZMAnEQ4v" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2vPZMAnBVdP" resolve="summary" />
          </node>
        </node>
        <node concept="3EZMnI" id="2vPZMAnEQ4A" role="3EZMnx">
          <node concept="2iRfu4" id="2vPZMAnEQ4B" role="2iSdaV" />
          <node concept="3F0ifn" id="2vPZMAnEQ4C" role="3EZMnx">
            <property role="3F0ifm" value="details:" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F2HdR" id="2vPZMAnEQ4F" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2vPZMAmEVPK" resolve="children" />
            <node concept="2iRkQZ" id="2vPZMAnEQ4I" role="2czzBx" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAnIc9d">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:2vPZMAnIaRS" resolve="Box" />
    <node concept="3EZMnI" id="2vPZMAnK4v$" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAnK4v_" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAnIc9k" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAnIc9l" role="2iSdaV" />
        <node concept="PMmxH" id="2vPZMAnIc9j" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="G39ofDaI5Y" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="11L4FC" id="G39ofDbcvY" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="G39ofDbd55" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F1sOY" id="G39ofDbbUR" role="3EZMnx">
          <property role="1$x2rV" value="&lt;none&gt;" />
          <ref role="1NtTu8" to="zaxg:G39ofDbatJ" resolve="borderAndShade" />
        </node>
        <node concept="3F0ifn" id="G39ofDaIF5" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="11L4FC" id="G39ofDbdnD" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="2vPZMAnIc9n" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
      </node>
      <node concept="3EZMnI" id="2vPZMAnK4vB" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAnK4vC" role="2iSdaV" />
        <node concept="3XFhqQ" id="2vPZMAnK4vE" role="3EZMnx" />
        <node concept="3F1sOY" id="2vPZMAnIc9q" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAnIaRX" resolve="child" />
        </node>
      </node>
      <node concept="3F0ifn" id="2vPZMAnK4vA" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAnZ0cq">
    <property role="3GE5qa" value="action" />
    <ref role="1XX52x" to="zaxg:2vPZMAnZ0ck" resolve="State" />
    <node concept="3EZMnI" id="2vPZMAnZ0cz" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAnZ0c$" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAnZ1Ao" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAnZ1Ap" role="2iSdaV" />
        <node concept="3EZMnI" id="2vPZMAnZ0cu" role="3EZMnx">
          <ref role="1k5W1q" to="vpip:2vPZMAn1cgK" resolve="RBehaviorCode" />
          <node concept="2iRfu4" id="2vPZMAnZ0cv" role="2iSdaV" />
          <node concept="3F0ifn" id="2vPZMAnZ0cs" role="3EZMnx">
            <property role="3F0ifm" value="state" />
            <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
          </node>
          <node concept="3F2HdR" id="2vPZMAnZ0cK" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2vPZMAnZ0cp" resolve="variables" />
            <node concept="2EHx9g" id="2vPZMAnZ0cN" role="2czzBx" />
            <node concept="3F0ifn" id="2vPZMAnZ0cP" role="2czzBI">
              <property role="3F0ifm" value="" />
              <property role="ilYzB" value="&lt;variables&gt;" />
            </node>
          </node>
        </node>
        <node concept="3F0ifn" id="2vPZMAnZ0cx" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="2vPZMAnZ0cB" role="3EZMnx">
        <node concept="VPM3Z" id="2vPZMAnZ0cD" role="3F10Kt" />
        <node concept="3XFhqQ" id="2vPZMAnZ0cH" role="3EZMnx" />
        <node concept="2iRfu4" id="2vPZMAnZ0cG" role="2iSdaV" />
        <node concept="3F2HdR" id="2vPZMAnZ0cR" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAmEVPK" resolve="children" />
          <node concept="2iRkQZ" id="2vPZMAnZ0cU" role="2czzBx" />
        </node>
      </node>
      <node concept="3F0ifn" id="2vPZMAnZ0c_" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAolrZf">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:2vPZMAolrZd" resolve="ShowAndEdit" />
    <node concept="3EZMnI" id="2vPZMAolrZq" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAolrZr" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAolrZk" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAolrZl" role="2iSdaV" />
        <node concept="PMmxH" id="2vPZMAolrZj" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="2vPZMAolrZo" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="2vPZMAolrZw" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAolrZx" role="2iSdaV" />
        <node concept="3XFhqQ" id="2vPZMAolrZt" role="3EZMnx" />
        <node concept="3F1sOY" id="2vPZMAorDiK" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAnIaRX" resolve="child" />
        </node>
      </node>
      <node concept="3F0ifn" id="2vPZMAolrZv" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAonvg$">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:2vPZMAonvgy" resolve="PlainDiv" />
    <node concept="3EZMnI" id="2vPZMAonvgB" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAonvgC" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAonvgD" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAonvgE" role="2iSdaV" />
        <node concept="3F0ifn" id="7gSxYrNjfjp" role="3EZMnx">
          <property role="3F0ifm" value="seq" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
        <node concept="3F0ifn" id="2vPZMAonvgG" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="2vPZMAonvgH" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAonvgI" role="2iSdaV" />
        <node concept="3XFhqQ" id="2vPZMAonvgJ" role="3EZMnx" />
        <node concept="3F2HdR" id="2vPZMAonvgK" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAmEVPK" resolve="children" />
          <node concept="2iRkQZ" id="2vPZMAonvgL" role="2czzBx" />
        </node>
      </node>
      <node concept="3F0ifn" id="2vPZMAonvgM" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAoGIbs">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:2vPZMAoGIbo" resolve="LabelWidgetPair" />
    <node concept="3EZMnI" id="2vPZMAoGIbx" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAoGIby" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAoGIbw" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F1sOY" id="2vPZMAoGIb$" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAoGIbq" resolve="label" />
      </node>
      <node concept="3F0ifn" id="2vPZMAoGIbB" role="3EZMnx">
        <property role="3F0ifm" value="with" />
        <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
      </node>
      <node concept="3F1sOY" id="2vPZMAoGIbE" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAoGIbr" resolve="widget" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="cqTc8J2hYA">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:cqTc8J2hYz" resolve="Alignment" />
    <node concept="3EZMnI" id="cqTc8J2hYE" role="2wV5jI">
      <node concept="2iRfu4" id="cqTc8J2hYF" role="2iSdaV" />
      <node concept="3F0ifn" id="cqTc8J2hYC" role="3EZMnx">
        <property role="3F0ifm" value="vertical:" />
        <ref role="1k5W1q" to="vpip:cqTc8J2jIR" resolve="RComponentProperty" />
      </node>
      <node concept="3F0A7n" id="cqTc8J2jJm" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:cqTc8J2hY$" resolve="vertical" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
      <node concept="3F0ifn" id="cqTc8J2jJp" role="3EZMnx">
        <property role="3F0ifm" value="horizontal:" />
        <ref role="1k5W1q" to="vpip:cqTc8J2jIR" resolve="RComponentProperty" />
      </node>
      <node concept="3F0A7n" id="cqTc8J2jJv" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:cqTc8J2hY_" resolve="horizontal" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="G39ofC7ZUv">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:cqTc8Jo1wo" resolve="Typography" />
    <node concept="3EZMnI" id="G39ofC7ZUx" role="2wV5jI">
      <node concept="2iRfu4" id="G39ofC7ZUy" role="2iSdaV" />
      <node concept="3F0ifn" id="G39ofC9AxJ" role="3EZMnx">
        <property role="3F0ifm" value="typography" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F0A7n" id="G39ofC9AxM" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCR0" resolve="RIdentifier" />
      </node>
      <node concept="3F0ifn" id="G39ofC7ZUP" role="3EZMnx">
        <property role="3F0ifm" value="color:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F1sOY" id="G39ofC7ZUO" role="3EZMnx">
        <property role="1$x2rV" value="&lt;none&gt;" />
        <ref role="1NtTu8" to="zaxg:cqTc8Jo1wr" resolve="color" />
      </node>
      <node concept="3F0ifn" id="G39ofC7ZUU" role="3EZMnx">
        <property role="3F0ifm" value="style:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F0A7n" id="G39ofC7ZUR" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:G39ofC6yKY" resolve="style" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
      <node concept="3F0ifn" id="G39ofC7ZUX" role="3EZMnx">
        <property role="3F0ifm" value="size:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F0A7n" id="G39ofC7ZV0" role="3EZMnx">
        <property role="1$x2rV" value="&lt;default&gt;" />
        <property role="1O74Pk" value="true" />
        <ref role="1NtTu8" to="zaxg:G39ofC7ZUu" resolve="size" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="G39ofC7ZUE">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:cqTc8Jo1wp" resolve="Color" />
    <node concept="3EZMnI" id="G39ofC7ZUI" role="2wV5jI">
      <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      <node concept="2iRfu4" id="G39ofC7ZUJ" role="2iSdaV" />
      <node concept="3F0ifn" id="G39ofC7ZUL" role="3EZMnx">
        <property role="3F0ifm" value="#" />
        <ref role="1k5W1q" to="vpip:2vPZMAn1cgK" resolve="RBehaviorCode" />
        <node concept="11LMrY" id="G39ofCfd5p" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="G39ofC7ZUG" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:cqTc8Jo1wq" resolve="value" />
      </node>
      <node concept="3F0ifn" id="G39ofCxwf6" role="3EZMnx">
        <property role="3F0ifm" value="█" />
        <ref role="1ERwB7" node="G39ofCIpd7" resolve="selectColor" />
        <node concept="VechU" id="G39ofCxxRr" role="3F10Kt">
          <node concept="3ZlJ5R" id="G39ofCxxRt" role="VblUZ">
            <node concept="3clFbS" id="G39ofCxxRu" role="2VODD2">
              <node concept="3J1_TO" id="G39ofC$SiI" role="3cqZAp">
                <node concept="3uVAMA" id="G39ofC$UBt" role="1zxBo5">
                  <node concept="XOnhg" id="G39ofC$UBu" role="1zc67B">
                    <property role="TrG5h" value="t" />
                    <node concept="nSUau" id="G39ofC$UBv" role="1tU5fm">
                      <node concept="3uibUv" id="G39ofC$UVn" role="nSUat">
                        <ref role="3uigEE" to="wyt6:~Throwable" resolve="Throwable" />
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="G39ofC$UBw" role="1zc67A">
                    <node concept="3cpWs6" id="G39ofC$V$d" role="3cqZAp">
                      <node concept="10M0yZ" id="G39ofC$Wbo" role="3cqZAk">
                        <ref role="3cqZAo" to="z60i:~Color.black" resolve="black" />
                        <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbS" id="G39ofC$SiK" role="1zxBo7">
                  <node concept="3cpWs8" id="G39ofC$QK7" role="3cqZAp">
                    <node concept="3cpWsn" id="G39ofC$QK8" role="3cpWs9">
                      <property role="TrG5h" value="cc" />
                      <node concept="17QB3L" id="G39ofC$QGp" role="1tU5fm" />
                      <node concept="2OqwBi" id="G39ofC$QK9" role="33vP2m">
                        <node concept="pncrf" id="G39ofC$QKa" role="2Oq$k0" />
                        <node concept="3TrcHB" id="G39ofC$QKb" role="2OqNvi">
                          <ref role="3TsBF5" to="zaxg:cqTc8Jo1wq" resolve="value" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3cpWs6" id="G39ofC$T5T" role="3cqZAp">
                    <node concept="2YIFZM" id="G39ofC$T5V" role="3cqZAk">
                      <ref role="37wK5l" to="z60i:~Color.decode(java.lang.String)" resolve="decode" />
                      <ref role="1Pybhc" to="z60i:~Color" resolve="Color" />
                      <node concept="3cpWs3" id="G39ofC$T5W" role="37wK5m">
                        <node concept="37vLTw" id="G39ofC$T5X" role="3uHU7w">
                          <ref role="3cqZAo" node="G39ofC$QK8" resolve="cc" />
                        </node>
                        <node concept="Xl_RD" id="G39ofC$T5Y" role="3uHU7B">
                          <property role="Xl_RC" value="#" />
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
  <node concept="24kQdi" id="G39ofC9AxQ">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:G39ofC9AxO" resolve="TypographyRef" />
    <node concept="1iCGBv" id="G39ofC9AxS" role="2wV5jI">
      <ref role="1NtTu8" to="zaxg:G39ofC9AxP" resolve="typography" />
      <node concept="1sVBvm" id="G39ofC9AxU" role="1sWHZn">
        <node concept="3F0A7n" id="G39ofCdbZH" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCR0" resolve="RIdentifier" />
        </node>
      </node>
    </node>
  </node>
  <node concept="1h_SRR" id="G39ofCIpd7">
    <property role="3GE5qa" value="util" />
    <property role="TrG5h" value="selectColor" />
    <ref role="1h_SK9" to="zaxg:cqTc8Jo1wp" resolve="Color" />
    <node concept="1hA7zw" id="G39ofCIpvE" role="1h_SK8">
      <property role="1hAc7j" value="1FSxSwWqMNJ/click_action_id" />
      <node concept="1hAIg9" id="G39ofCIpvF" role="1hA7z_">
        <node concept="3clFbS" id="G39ofCIpvG" role="2VODD2">
          <node concept="3cpWs8" id="G39ofCIqWD" role="3cqZAp">
            <node concept="3cpWsn" id="G39ofCIqWC" role="3cpWs9">
              <property role="TrG5h" value="selectedColor" />
              <node concept="3uibUv" id="G39ofCIqWE" role="1tU5fm">
                <ref role="3uigEE" to="z60i:~Color" resolve="Color" />
              </node>
              <node concept="2YIFZM" id="G39ofCIyzV" role="33vP2m">
                <ref role="1Pybhc" to="dxuu:~JColorChooser" resolve="JColorChooser" />
                <ref role="37wK5l" to="dxuu:~JColorChooser.showDialog(java.awt.Component,java.lang.String,java.awt.Color)" resolve="showDialog" />
                <node concept="10Nm6u" id="G39ofCIAr4" role="37wK5m" />
                <node concept="Xl_RD" id="G39ofCIyzX" role="37wK5m">
                  <property role="Xl_RC" value="Pick a Color" />
                </node>
                <node concept="2OqwBi" id="G39ofCISsr" role="37wK5m">
                  <node concept="0IXxy" id="G39ofCISin" role="2Oq$k0" />
                  <node concept="2qgKlT" id="G39ofCISVV" role="2OqNvi">
                    <ref role="37wK5l" to="7923:G39ofCILfK" resolve="color" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbJ" id="G39ofCIqWJ" role="3cqZAp">
            <node concept="3y3z36" id="G39ofCIqWK" role="3clFbw">
              <node concept="37vLTw" id="G39ofCIqWL" role="3uHU7B">
                <ref role="3cqZAo" node="G39ofCIqWC" resolve="selectedColor" />
              </node>
              <node concept="10Nm6u" id="G39ofCIqWM" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="G39ofCIqWO" role="3clFbx">
              <node concept="3cpWs8" id="G39ofCJ0cX" role="3cqZAp">
                <node concept="3cpWsn" id="G39ofCJ0cW" role="3cpWs9">
                  <property role="TrG5h" value="hexColor" />
                  <node concept="17QB3L" id="G39ofCJ9Jy" role="1tU5fm" />
                  <node concept="2YIFZM" id="G39ofCJ0Bq" role="33vP2m">
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <ref role="37wK5l" to="wyt6:~String.format(java.lang.String,java.lang.Object...)" resolve="format" />
                    <node concept="Xl_RD" id="G39ofCJ0Br" role="37wK5m">
                      <property role="Xl_RC" value="%02x%02x%02x" />
                    </node>
                    <node concept="2OqwBi" id="G39ofCJ4zn" role="37wK5m">
                      <node concept="37vLTw" id="G39ofCJ4dv" role="2Oq$k0">
                        <ref role="3cqZAo" node="G39ofCIqWC" resolve="selectedColor" />
                      </node>
                      <node concept="liA8E" id="G39ofCJ4zo" role="2OqNvi">
                        <ref role="37wK5l" to="z60i:~Color.getRed()" resolve="getRed" />
                      </node>
                    </node>
                    <node concept="2OqwBi" id="G39ofCJ57j" role="37wK5m">
                      <node concept="37vLTw" id="G39ofCJ4zp" role="2Oq$k0">
                        <ref role="3cqZAo" node="G39ofCIqWC" resolve="selectedColor" />
                      </node>
                      <node concept="liA8E" id="G39ofCJ57k" role="2OqNvi">
                        <ref role="37wK5l" to="z60i:~Color.getGreen()" resolve="getGreen" />
                      </node>
                    </node>
                    <node concept="2OqwBi" id="G39ofCJ6HG" role="37wK5m">
                      <node concept="37vLTw" id="G39ofCJ57l" role="2Oq$k0">
                        <ref role="3cqZAo" node="G39ofCIqWC" resolve="selectedColor" />
                      </node>
                      <node concept="liA8E" id="G39ofCJ6HH" role="2OqNvi">
                        <ref role="37wK5l" to="z60i:~Color.getBlue()" resolve="getBlue" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbF" id="G39ofCIU0Y" role="3cqZAp">
                <node concept="37vLTI" id="G39ofCIW_d" role="3clFbG">
                  <node concept="37vLTw" id="G39ofCJ8HH" role="37vLTx">
                    <ref role="3cqZAo" node="G39ofCJ0cW" resolve="hexColor" />
                  </node>
                  <node concept="2OqwBi" id="G39ofCIUao" role="37vLTJ">
                    <node concept="0IXxy" id="G39ofCIU0X" role="2Oq$k0" />
                    <node concept="3TrcHB" id="G39ofCIUAC" role="2OqNvi">
                      <ref role="3TsBF5" to="zaxg:cqTc8Jo1wq" resolve="value" />
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
  <node concept="24kQdi" id="G39ofD9SQQ">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:G39ofD9OMC" resolve="BorderAndShade" />
    <node concept="3EZMnI" id="G39ofD9T9q" role="2wV5jI">
      <node concept="2iRfu4" id="G39ofD9T9r" role="2iSdaV" />
      <node concept="3F0ifn" id="G39ofD9T9s" role="3EZMnx">
        <property role="3F0ifm" value="border and shade" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F0A7n" id="G39ofD9T9t" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCR0" resolve="RIdentifier" />
      </node>
      <node concept="3F0ifn" id="G39ofD9T9u" role="3EZMnx">
        <property role="3F0ifm" value="padding:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F0A7n" id="G39ofD9U1d" role="3EZMnx">
        <property role="1O74Pk" value="true" />
        <property role="1$x2rV" value="&lt;none&gt;" />
        <ref role="1NtTu8" to="zaxg:G39ofD9Qyy" resolve="padding" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
      <node concept="3F0ifn" id="G39ofDh5AL" role="3EZMnx">
        <property role="3F0ifm" value="margin:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F0A7n" id="G39ofDh5AK" role="3EZMnx">
        <property role="1O74Pk" value="true" />
        <property role="1$x2rV" value="&lt;none&gt;" />
        <ref role="1NtTu8" to="zaxg:G39ofDh217" resolve="margin" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
      <node concept="3F0ifn" id="G39ofD9T9y" role="3EZMnx">
        <property role="3F0ifm" value="border width:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F0A7n" id="G39ofD9T9z" role="3EZMnx">
        <property role="1$x2rV" value="&lt;default&gt;" />
        <property role="1O74Pk" value="true" />
        <ref role="1NtTu8" to="zaxg:G39ofD9Po3" resolve="borderWidth" />
        <ref role="1k5W1q" to="vpip:2vPZMAnwE1f" resolve="RHTMLOrJsOrCSS" />
      </node>
      <node concept="3F0ifn" id="G39ofD9Vbq" role="3EZMnx">
        <property role="3F0ifm" value="border color:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F1sOY" id="G39ofD9UAj" role="3EZMnx">
        <property role="1$x2rV" value="&lt;none&gt;" />
        <ref role="1NtTu8" to="zaxg:G39ofD9Rq9" resolve="borderColor" />
      </node>
      <node concept="3F0ifn" id="G39ofDaohz" role="3EZMnx">
        <property role="3F0ifm" value="shade color:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
      </node>
      <node concept="3F1sOY" id="G39ofDaohy" role="3EZMnx">
        <property role="1$x2rV" value="&lt;none&gt;" />
        <ref role="1NtTu8" to="zaxg:G39ofD9RZe" resolve="shadeColor" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="G39ofDaKqm">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:G39ofDaJgc" resolve="BorderAndShadeRef" />
    <node concept="1iCGBv" id="G39ofDaKGU" role="2wV5jI">
      <ref role="1NtTu8" to="zaxg:G39ofDaJPh" resolve="borderAndShade" />
      <node concept="1sVBvm" id="G39ofDaKGW" role="1sWHZn">
        <node concept="3F0A7n" id="G39ofDaKZy" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCR0" resolve="RIdentifier" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2NkZbYeZYCG">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:2NkZbYeZWAz" resolve="TreeNode" />
    <node concept="3EZMnI" id="2NkZbYeZYVg" role="2wV5jI">
      <node concept="PMmxH" id="2NkZbYf1JEM" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3EZMnI" id="2NkZbYf027n" role="3EZMnx">
        <node concept="2EHx9g" id="2NkZbYf03hF" role="2iSdaV" />
        <node concept="3EZMnI" id="2NkZbYf01fJ" role="3EZMnx">
          <node concept="2iRfu4" id="2NkZbYf01fK" role="2iSdaV" />
          <node concept="3F0ifn" id="2NkZbYeZZMX" role="3EZMnx">
            <property role="3F0ifm" value="id" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F0ifn" id="2NkZbYf00o4" role="3EZMnx">
            <property role="3F0ifm" value="=" />
          </node>
          <node concept="3F1sOY" id="2NkZbYf00Xb" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2NkZbYeZXux" resolve="idExpr" />
          </node>
        </node>
        <node concept="3EZMnI" id="2NkZbYf02pV" role="3EZMnx">
          <node concept="2iRfu4" id="2NkZbYf02pW" role="2iSdaV" />
          <node concept="3F0ifn" id="2NkZbYf02pX" role="3EZMnx">
            <property role="3F0ifm" value="label" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F0ifn" id="2NkZbYf02pY" role="3EZMnx">
            <property role="3F0ifm" value="=" />
          </node>
          <node concept="3F1sOY" id="2NkZbYf02pZ" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2NkZbYeZY3A" resolve="labelExpr" />
          </node>
        </node>
        <node concept="3EZMnI" id="2NkZbYfIwdG" role="3EZMnx">
          <node concept="2iRfu4" id="2NkZbYfIwdH" role="2iSdaV" />
          <node concept="3F0ifn" id="2NkZbYfIwdI" role="3EZMnx">
            <property role="3F0ifm" value="typography" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F0ifn" id="6r1E9h1rJih" role="3EZMnx">
            <property role="3F0ifm" value=":" />
          </node>
          <node concept="3F1sOY" id="2NkZbYfIx5o" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2NkZbYfIvCh" resolve="typography" />
          </node>
        </node>
        <node concept="3EZMnI" id="2NkZbYf02Gy" role="3EZMnx">
          <node concept="2iRfu4" id="2NkZbYf02Gz" role="2iSdaV" />
          <node concept="3F0ifn" id="2NkZbYf02G$" role="3EZMnx">
            <property role="3F0ifm" value="children" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F0ifn" id="2NkZbYf02G_" role="3EZMnx">
            <property role="3F0ifm" value="=" />
          </node>
          <node concept="3F1sOY" id="2NkZbYf02GA" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:2NkZbYeZYm9" resolve="childrenExpr" />
          </node>
        </node>
      </node>
      <node concept="2iRfu4" id="2NkZbYeZYVj" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2NkZbYfayiC">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:2NkZbYfax87" resolve="TreeView" />
    <node concept="3EZMnI" id="2NkZbYfaAml" role="2wV5jI">
      <node concept="2iRkQZ" id="2NkZbYfaAmm" role="2iSdaV" />
      <node concept="3EZMnI" id="2NkZbYfazsP" role="3EZMnx">
        <node concept="2iRfu4" id="2NkZbYfazsQ" role="2iSdaV" />
        <node concept="PMmxH" id="2NkZbYfayRK" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="2NkZbYfaCF7" role="3EZMnx">
          <property role="3F0ifm" value="selection state tracker:" />
          <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
        </node>
        <node concept="3F1sOY" id="2NkZbYfaEH0" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2NkZbYfaDge" resolve="selectionStateTracker" />
        </node>
        <node concept="3F0ifn" id="2NkZbYfa$B3" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="2NkZbYfaBe0" role="3EZMnx">
        <node concept="2iRfu4" id="2NkZbYfaBe1" role="2iSdaV" />
        <node concept="3XFhqQ" id="2NkZbYfaAVs" role="3EZMnx" />
        <node concept="3F2HdR" id="1XYAF4MexJY" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAmEVPK" resolve="children" />
          <node concept="2iRkQZ" id="1XYAF4Mey2V" role="2czzBx" />
        </node>
      </node>
      <node concept="3F0ifn" id="2NkZbYfaBNv" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2iVdnDeRYZv">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:2iVdnDeRY63" resolve="Checkbox" />
    <node concept="3EZMnI" id="2iVdnDeRZSg" role="2wV5jI">
      <node concept="2iRfu4" id="2iVdnDeRZSh" role="2iSdaV" />
      <node concept="PMmxH" id="2iVdnDeRZir" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F1sOY" id="2iVdnDeS0bd" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmvsgs" resolve="data" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1LliyakH35Q">
    <property role="3GE5qa" value="values" />
    <ref role="1XX52x" to="zaxg:1Lliyak$MAq" resolve="ValueConverter" />
    <node concept="3EZMnI" id="1LliyakH5qC" role="2wV5jI">
      <property role="S$Qs1" value="true" />
      <node concept="2iRkQZ" id="1LliyakH5qD" role="2iSdaV" />
      <node concept="3EZMnI" id="1LliyakH3Fk" role="3EZMnx">
        <node concept="2iRfu4" id="1LliyakH3Fl" role="2iSdaV" />
        <node concept="PMmxH" id="1LliyakH3XS" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
        <node concept="3F0A7n" id="1LliyakH584" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
      </node>
      <node concept="3EZMnI" id="1LliyakH5ZJ" role="3EZMnx">
        <node concept="VPM3Z" id="1LliyakH5ZL" role="3F10Kt" />
        <node concept="3XFhqQ" id="1LliyakH6in" role="3EZMnx" />
        <node concept="3EZMnI" id="1LliyakH6Ru" role="3EZMnx">
          <node concept="VPM3Z" id="1LliyakH6Rw" role="3F10Kt" />
          <node concept="3EZMnI" id="1LliyakH7sE" role="3EZMnx">
            <node concept="2iRfu4" id="1LliyakH7sF" role="2iSdaV" />
            <node concept="3F0ifn" id="1LliyakH7a6" role="3EZMnx">
              <property role="3F0ifm" value="model type:" />
              <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
            </node>
            <node concept="3F1sOY" id="1LliyakH7Jf" role="3EZMnx">
              <ref role="1NtTu8" to="zaxg:1Lliyak$Nuo" resolve="modelType" />
            </node>
          </node>
          <node concept="3EZMnI" id="1LliyakHbdK" role="3EZMnx">
            <node concept="2iRfu4" id="1LliyakHbdL" role="2iSdaV" />
            <node concept="3F0ifn" id="1LliyakHbdM" role="3EZMnx">
              <property role="3F0ifm" value="widget type:" />
              <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
            </node>
            <node concept="3F1sOY" id="1LliyakHbdN" role="3EZMnx">
              <ref role="1NtTu8" to="zaxg:1Lliyak$O3t" resolve="widgetType" />
            </node>
          </node>
          <node concept="3EZMnI" id="1LliyakHfHS" role="3EZMnx">
            <node concept="2iRfu4" id="1LliyakHfHT" role="2iSdaV" />
            <node concept="3F0ifn" id="1LliyakHfHU" role="3EZMnx">
              <property role="3F0ifm" value="model-&gt;widget:" />
              <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
            </node>
            <node concept="3F1sOY" id="1LliyakHfHV" role="3EZMnx">
              <ref role="1NtTu8" to="zaxg:1LliyakH2ee" resolve="modelToWidget" />
              <ref role="1k5W1q" to="vpip:2vPZMAn1cgK" resolve="RBehaviorCode" />
            </node>
          </node>
          <node concept="3EZMnI" id="1LliyakHgS7" role="3EZMnx">
            <node concept="2iRfu4" id="1LliyakHgS8" role="2iSdaV" />
            <node concept="3F0ifn" id="1LliyakLN24" role="3EZMnx">
              <property role="3F0ifm" value="widget-&gt;model:" />
              <ref role="1k5W1q" to="vpip:2vPZMAnFe33" resolve="RKeywordSub" />
            </node>
            <node concept="3F1sOY" id="1LliyakHgSb" role="3EZMnx">
              <ref role="1NtTu8" to="zaxg:1LliyakH1D8" resolve="widgetToModel" />
              <ref role="1k5W1q" to="vpip:2vPZMAn1cgK" resolve="RBehaviorCode" />
            </node>
          </node>
          <node concept="2EHx9g" id="1LliyakIqL6" role="2iSdaV" />
        </node>
        <node concept="2iRfu4" id="1LliyakH5ZO" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="5KtU3pY_1G4" role="AHCbl">
        <node concept="2iRfu4" id="5KtU3pY_1G5" role="2iSdaV" />
        <node concept="PMmxH" id="5KtU3pY_1G6" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
        <node concept="3F0A7n" id="5KtU3pY_1G7" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="5KtU3pY_2hd" role="3EZMnx">
          <property role="3F0ifm" value="{...}" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1LliyakMr3o">
    <property role="3GE5qa" value="values" />
    <ref role="1XX52x" to="zaxg:1LliyakMqbL" resolve="ItFunctionIt" />
    <node concept="PMmxH" id="1LliyakMrCw" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <ref role="1k5W1q" to="vpip:2vPZMAmxCR0" resolve="RIdentifier" />
    </node>
  </node>
  <node concept="24kQdi" id="1LliyakMKYk">
    <property role="3GE5qa" value="values" />
    <ref role="1XX52x" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
    <node concept="3EZMnI" id="1LliyakMMr3" role="2wV5jI">
      <ref role="1k5W1q" to="vpip:2vPZMAn1cgK" resolve="RBehaviorCode" />
      <node concept="2iRfu4" id="1LliyakMMr4" role="2iSdaV" />
      <node concept="PMmxH" id="1LliyakNs86" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F0ifn" id="1LliyakMMHC" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        <node concept="11L4FC" id="1LliyakMQcg" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="1LliyakMQuO" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="1LliyakMNRQ" role="3EZMnx">
        <property role="3F0ifm" value="it" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F0ifn" id="1LliyakMNiJ" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        <node concept="11L4FC" id="1LliyakMR3U" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="1LliyakMOsX" role="3EZMnx">
        <property role="3F0ifm" value="=" />
      </node>
      <node concept="3F1sOY" id="1LliyakMPkC" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:1LliyakMhIr" resolve="body" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1LliyakUEA9">
    <property role="3GE5qa" value="values" />
    <ref role="1XX52x" to="zaxg:1LliyakUDrD" resolve="ValueConverterRef" />
    <node concept="1iCGBv" id="1LliyakUESH" role="2wV5jI">
      <ref role="1NtTu8" to="zaxg:1LliyakUE14" resolve="valueConverter" />
      <node concept="1sVBvm" id="1LliyakUESJ" role="1sWHZn">
        <node concept="3F0A7n" id="1LliyakUFbl" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCR0" resolve="RIdentifier" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2D6UMN610Y3">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:2D6UMN5ZxG9" resolve="Dropdown" />
    <node concept="3EZMnI" id="2D6UMN613hi" role="2wV5jI">
      <node concept="2iRkQZ" id="2D6UMN613hj" role="2iSdaV" />
      <node concept="3EZMnI" id="2D6UMN611Ra" role="3EZMnx">
        <node concept="2iRfu4" id="2D6UMN611Rb" role="2iSdaV" />
        <node concept="PMmxH" id="2D6UMN611hl" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F1sOY" id="2D6UMN612t1" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAmvsgs" resolve="data" />
        </node>
      </node>
      <node concept="3EZMnI" id="2D6UMN613Rv" role="3EZMnx">
        <node concept="VPM3Z" id="2D6UMN613Rx" role="3F10Kt" />
        <node concept="3XFhqQ" id="2D6UMN614av" role="3EZMnx" />
        <node concept="3F1sOY" id="2D6UMN616fi" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2D6UMN615Dt" resolve="choices" />
        </node>
        <node concept="2iRfu4" id="2D6UMN613R$" role="2iSdaV" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2D6UMN62OiI">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:2D6UMN62NpD" resolve="StringChoiceSpecifierStatic" />
    <node concept="3EZMnI" id="2D6UMN62XEC" role="2wV5jI">
      <node concept="2iRfu4" id="2D6UMN62XED" role="2iSdaV" />
      <node concept="PMmxH" id="2D6UMN62O_E" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:cqTc8J2jIR" resolve="RComponentProperty" />
      </node>
      <node concept="3F2HdR" id="2D6UMN62XX_" role="3EZMnx">
        <property role="2czwfO" value="," />
        <ref role="1NtTu8" to="zaxg:2D6UMN62UHo" resolve="choices" />
        <node concept="2iRfu4" id="2D6UMN62XXB" role="2czzBx" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2D6UMN62VT5">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:2D6UMN62V0l" resolve="ChoiceEntry" />
    <node concept="3F0A7n" id="2D6UMN62Wc1" role="2wV5jI">
      <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      <node concept="VPRnO" id="2D6UMN62WuX" role="3F10Kt">
        <property role="VOm3f" value="true" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="gNsEGB5FHi">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:gNsEGB5DCe" resolve="StringChoiceSpecifierDynamic" />
    <node concept="3EZMnI" id="gNsEGB5G0$" role="2wV5jI">
      <node concept="2iRfu4" id="gNsEGB5G0_" role="2iSdaV" />
      <node concept="PMmxH" id="gNsEGB5G0A" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:cqTc8J2jIR" resolve="RComponentProperty" />
      </node>
      <node concept="3F1sOY" id="gNsEGB5GTo" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:gNsEGB5DCf" resolve="choices" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5KtU3pY8zI5">
    <property role="3GE5qa" value="widgets" />
    <ref role="1XX52x" to="zaxg:5KtU3pY8yh1" resolve="ReferenceTargetChooser" />
    <node concept="3EZMnI" id="5KtU3pY8$Si" role="2wV5jI">
      <node concept="2iRfu4" id="5KtU3pY8$Sj" role="2iSdaV" />
      <node concept="PMmxH" id="5KtU3pY8$jd" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F1sOY" id="5KtU3pY8_aR" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:5KtU3pYaLL$" resolve="data" />
      </node>
      <node concept="3F0ifn" id="5KtU3pYnmHD" role="3EZMnx">
        <property role="3F0ifm" value="label:" />
        <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
      </node>
      <node concept="3F1sOY" id="5KtU3pYnniK" role="3EZMnx">
        <property role="1$x2rV" value="&lt;default&gt;" />
        <ref role="1NtTu8" to="zaxg:5KtU3pYn7YK" resolve="labelFun" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5KtU3pY9S07">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:5KtU3pY9R88" resolve="NodeReferenceRef" />
    <node concept="3EZMnI" id="5KtU3pY9SiF" role="2wV5jI">
      <node concept="2iRfu4" id="5KtU3pY9SiG" role="2iSdaV" />
      <node concept="3F1sOY" id="5KtU3pY9SiH" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:5KtU3pY9R89" resolve="node" />
      </node>
      <node concept="3F0ifn" id="5KtU3pY9SiI" role="3EZMnx">
        <property role="3F0ifm" value="-&gt;" />
        <node concept="11L4FC" id="5KtU3pY9SiJ" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="5KtU3pY9SiK" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="1iCGBv" id="5KtU3pY9SiL" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:5KtU3pY9R8a" resolve="reference" />
        <node concept="1sVBvm" id="5KtU3pY9SiM" role="1sWHZn">
          <node concept="3F0A7n" id="5KtU3pY9SiN" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            <ref role="1k5W1q" to="vpip:5KtU3pYyDEg" resolve="RFeature" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5KtU3pZ8GbA">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:5KtU3pZ8Esn" resolve="GridItem" />
    <node concept="3EZMnI" id="5KtU3pZ8GKH" role="2wV5jI">
      <node concept="2iRfu4" id="5KtU3pZ8GKI" role="2iSdaV" />
      <node concept="PMmxH" id="5KtU3pZ8Gua" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F0ifn" id="5KtU3pZ8HCp" role="3EZMnx">
        <property role="3F0ifm" value="[" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        <node concept="11L4FC" id="5KtU3pZ8JEk" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="5KtU3pZ8JWS" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="5KtU3pZ8Id$" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:5KtU3pZ8F1s" resolve="cols" />
      </node>
      <node concept="3F0ifn" id="5KtU3pZ8Iw9" role="3EZMnx">
        <property role="3F0ifm" value="]" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        <node concept="11L4FC" id="5KtU3pZ8IMH" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="5KtU3pZ8H3i" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAnIaRX" resolve="child" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5KtU3pZ8LG9">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="zaxg:5KtU3pZ8DQW" resolve="Grid" />
    <node concept="3EZMnI" id="5KtU3pZ8LZ3" role="2wV5jI">
      <node concept="2iRkQZ" id="5KtU3pZ8LZ4" role="2iSdaV" />
      <node concept="3EZMnI" id="5KtU3pZ8LZ5" role="3EZMnx">
        <node concept="2iRfu4" id="5KtU3pZ8LZ6" role="2iSdaV" />
        <node concept="PMmxH" id="5KtU3pZ8LZ7" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="5KtU3pZ8LZ8" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="11L4FC" id="5KtU3pZ8LZ9" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="5KtU3pZ8LZa" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0A7n" id="5KtU3pZ8MQV" role="3EZMnx">
          <property role="1$x2rV" value="&lt;none&gt;" />
          <property role="1O74Pk" value="true" />
          <ref role="1NtTu8" to="zaxg:5KtU3pZ8KOy" resolve="spacing" />
        </node>
        <node concept="3F0ifn" id="5KtU3pZ8LZc" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="11L4FC" id="5KtU3pZ8LZd" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="5KtU3pZ8LZe" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
      </node>
      <node concept="3EZMnI" id="5KtU3pZ8LZf" role="3EZMnx">
        <node concept="2iRfu4" id="5KtU3pZ8LZg" role="2iSdaV" />
        <node concept="3XFhqQ" id="5KtU3pZ8LZh" role="3EZMnx" />
        <node concept="3F2HdR" id="5KtU3pZ8O16" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:5KtU3pZ8Kft" resolve="items" />
          <node concept="2EHx9g" id="5KtU3pZ8OjF" role="2czzBx" />
        </node>
      </node>
      <node concept="3F0ifn" id="5KtU3pZ8LZj" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1u3TjKPQ0Hq">
    <property role="3GE5qa" value="output" />
    <ref role="1XX52x" to="zaxg:1u3TjKPP4K6" resolve="ErrorLabel" />
    <node concept="3EZMnI" id="1u3TjKPQ10k" role="2wV5jI">
      <node concept="2iRfu4" id="1u3TjKPQ10l" role="2iSdaV" />
      <node concept="PMmxH" id="1u3TjKPQ10m" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3F1sOY" id="1u3TjKPQ10t" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:1u3TjKPQ0qR" resolve="value" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="7$1mkeArB8r">
    <property role="3GE5qa" value="output" />
    <ref role="1XX52x" to="zaxg:7$1mkeArAgt" resolve="ErrorReporting" />
    <node concept="3EZMnI" id="7HYB$0ndCng" role="2wV5jI">
      <node concept="2iRkQZ" id="7HYB$0ndCnh" role="2iSdaV" />
      <node concept="3EZMnI" id="7$1mkeArBHS" role="3EZMnx">
        <node concept="2iRfu4" id="7$1mkeArBHT" role="2iSdaV" />
        <node concept="PMmxH" id="7$1mkeArBrl" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F0ifn" id="2xzaHpg18Hz" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="11L4FC" id="7HYB$0nfOKJ" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="7HYB$0nfPm_" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0A7n" id="2xzaHpg1bXI" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2xzaHpg1aM4" resolve="onlyGlobalErrors" />
        </node>
        <node concept="3F0ifn" id="2xzaHpg1cz_" role="3EZMnx">
          <property role="3F0ifm" value="|" />
          <node concept="11L4FC" id="2xzaHpg1cQx" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="2xzaHpg1dJj" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0A7n" id="2xzaHpg1acb" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <property role="1$x2rV" value="&lt;none&gt;" />
          <ref role="1NtTu8" to="zaxg:2CLPJ2uDwEt" resolve="restrictToFeature" />
        </node>
        <node concept="3F0ifn" id="2xzaHpg1av8" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="11L4FC" id="7HYB$0nfPDx" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="7HYB$0ndC4k" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
      </node>
      <node concept="3EZMnI" id="7HYB$0ndDgo" role="3EZMnx">
        <node concept="VPM3Z" id="7HYB$0ndDgq" role="3F10Kt" />
        <node concept="3XFhqQ" id="7HYB$0ndDzo" role="3EZMnx" />
        <node concept="3F1sOY" id="7$1mkeArC0t" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:2vPZMAnIaRX" resolve="child" />
        </node>
        <node concept="2iRfu4" id="7HYB$0ndDgt" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="7HYB$0ndCEc" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2xzaHpfUreG">
    <ref role="1XX52x" to="zaxg:2xzaHpfUqlh" resolve="ErrorReportingAnnotation" />
    <node concept="3EZMnI" id="2xzaHpfUrxC" role="2wV5jI">
      <node concept="3EZMnI" id="7HYB$0nDZm_" role="3EZMnx">
        <ref role="1k5W1q" to="vpip:7HYB$0nCMSd" resolve="RErrorKeyword" />
        <node concept="2iRfu4" id="7HYB$0nDZmA" role="2iSdaV" />
        <node concept="3F0ifn" id="2xzaHpfUrOA" role="3EZMnx">
          <property role="3F0ifm" value="E" />
          <ref role="1ERwB7" node="2xzaHpg0t$R" resolve="genericDeleteNode" />
          <ref role="1k5W1q" to="vpip:7HYB$0nCMSd" resolve="RErrorKeyword" />
        </node>
        <node concept="3F0ifn" id="7HYB$0nz6G4" role="3EZMnx">
          <property role="3F0ifm" value="/" />
          <ref role="1k5W1q" to="vpip:2CLPJ2uBhsn" resolve="RProjected" />
          <node concept="11L4FC" id="7HYB$0nz8tY" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="11LMrY" id="7HYB$0nz93O" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="1HlG4h" id="7HYB$0nz9DE" role="3EZMnx">
          <ref role="1k5W1q" to="vpip:2CLPJ2uBhsn" resolve="RProjected" />
          <node concept="1HfYo3" id="7HYB$0nz9DH" role="1HlULh">
            <node concept="3TQlhw" id="7HYB$0nz9DK" role="1Hhtcw">
              <node concept="3clFbS" id="7HYB$0nz9DN" role="2VODD2">
                <node concept="3clFbF" id="7HYB$0nzdpT" role="3cqZAp">
                  <node concept="2OqwBi" id="7HYB$0nzdQN" role="3clFbG">
                    <node concept="pncrf" id="7HYB$0nzdpS" role="2Oq$k0" />
                    <node concept="2qgKlT" id="7HYB$0nzeOU" role="2OqNvi">
                      <ref role="37wK5l" to="7923:7HYB$0nzf_j" resolve="shortInfoString" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F0ifn" id="7HYB$0nz7ih" role="3EZMnx">
          <property role="3F0ifm" value="/" />
          <ref role="1k5W1q" to="vpip:2CLPJ2uBhsn" resolve="RProjected" />
          <node concept="11L4FC" id="7HYB$0nz7_d" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
      </node>
      <node concept="2SsqMj" id="2xzaHpfUt0k" role="3EZMnx" />
      <node concept="2iRfu4" id="2xzaHpfUrxF" role="2iSdaV" />
    </node>
    <node concept="3EZMnI" id="7HYB$0ntmay" role="6VMZX">
      <node concept="3EZMnI" id="7HYB$0ntmKs" role="3EZMnx">
        <node concept="VPM3Z" id="7HYB$0ntmKu" role="3F10Kt" />
        <node concept="3F0ifn" id="7HYB$0ntmKw" role="3EZMnx">
          <property role="3F0ifm" value="detected feature of child:   " />
        </node>
        <node concept="1HlG4h" id="7HYB$0ntnmn" role="3EZMnx">
          <node concept="1HfYo3" id="7HYB$0ntnmp" role="1HlULh">
            <node concept="3TQlhw" id="7HYB$0ntnmr" role="1Hhtcw">
              <node concept="3clFbS" id="7HYB$0ntnmt" role="2VODD2">
                <node concept="3clFbF" id="7HYB$0ntnTn" role="3cqZAp">
                  <node concept="2OqwBi" id="7HYB$0ntomh" role="3clFbG">
                    <node concept="pncrf" id="7HYB$0ntnTm" role="2Oq$k0" />
                    <node concept="2qgKlT" id="7HYB$0ntp4$" role="2OqNvi">
                      <ref role="37wK5l" to="7923:7HYB$0nt995" resolve="detectedFeature" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2iRfu4" id="7HYB$0ntmKx" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="7HYB$0ntLUe" role="3EZMnx">
        <node concept="VPM3Z" id="7HYB$0ntLUf" role="3F10Kt" />
        <node concept="3F0ifn" id="7HYB$0ntLUg" role="3EZMnx">
          <property role="3F0ifm" value="override: only global errors:" />
        </node>
        <node concept="3F0A7n" id="7HYB$0ntNxy" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:7HYB$0ntKF4" resolve="overrideReportOnlyGlobal" />
        </node>
        <node concept="2iRfu4" id="7HYB$0ntLUq" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="7HYB$0ntMfE" role="3EZMnx">
        <node concept="VPM3Z" id="7HYB$0ntMfF" role="3F10Kt" />
        <node concept="3F0ifn" id="7HYB$0ntMfG" role="3EZMnx">
          <property role="3F0ifm" value="override: any errors:        " />
        </node>
        <node concept="3F0A7n" id="7HYB$0ntOIj" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:7HYB$0ntJMl" resolve="overrideReportAnyFeature" />
        </node>
        <node concept="2iRfu4" id="7HYB$0ntMfQ" role="2iSdaV" />
      </node>
      <node concept="2iRkQZ" id="7HYB$0ntma_" role="2iSdaV" />
      <node concept="3F0ifn" id="7HYB$0ntG84" role="3EZMnx">
        <ref role="1k5W1q" to="vpip:2vPZMAmAxFf" resolve="RHalfVerticalSpace" />
      </node>
      <node concept="1HlG4h" id="7HYB$0ntH37" role="3EZMnx">
        <node concept="1HfYo3" id="7HYB$0ntH39" role="1HlULh">
          <node concept="3TQlhw" id="7HYB$0ntH3b" role="1Hhtcw">
            <node concept="3clFbS" id="7HYB$0ntH3d" role="2VODD2">
              <node concept="3clFbF" id="7HYB$0ntHnv" role="3cqZAp">
                <node concept="2OqwBi" id="7HYB$0ntHOp" role="3clFbG">
                  <node concept="pncrf" id="7HYB$0ntHnu" role="2Oq$k0" />
                  <node concept="2qgKlT" id="7HYB$0ntJrf" role="2OqNvi">
                    <ref role="37wK5l" to="7923:7HYB$0ntvVC" resolve="infoString" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1h_SRR" id="2xzaHpg0t$R">
    <property role="TrG5h" value="genericDeleteNode" />
    <node concept="1hA7zw" id="2xzaHpg0vmm" role="1h_SK8">
      <property role="1hAc7j" value="7P1WhNABvta/backspace_action_id" />
      <node concept="1hAIg9" id="2xzaHpg0vmn" role="1hA7z_">
        <node concept="3clFbS" id="2xzaHpg0vmo" role="2VODD2">
          <node concept="3clFbF" id="2xzaHpg0vDH" role="3cqZAp">
            <node concept="2OqwBi" id="2xzaHpg0vMl" role="3clFbG">
              <node concept="0IXxy" id="2xzaHpg0vDG" role="2Oq$k0" />
              <node concept="3YRAZt" id="2xzaHpg0wdN" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1hA7zw" id="2xzaHpg0wxz" role="1h_SK8">
      <property role="1hAc7j" value="g_hAxAO/delete_action_id" />
      <node concept="1hAIg9" id="2xzaHpg0wx$" role="1hA7z_">
        <node concept="3clFbS" id="2xzaHpg0wx_" role="2VODD2">
          <node concept="3clFbF" id="2xzaHpg0wxA" role="3cqZAp">
            <node concept="2OqwBi" id="2xzaHpg0wxB" role="3clFbG">
              <node concept="0IXxy" id="2xzaHpg0wxC" role="2Oq$k0" />
              <node concept="3YRAZt" id="2xzaHpg0wxD" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5Qmp_LAQ4JA">
    <ref role="1XX52x" to="zaxg:5Qmp_LAQ2pv" resolve="NodeFactory" />
    <node concept="3EZMnI" id="5Qmp_LAQ5B_" role="2wV5jI">
      <node concept="2iRfu4" id="5Qmp_LAQ5BA" role="2iSdaV" />
      <node concept="PMmxH" id="5Qmp_LAQ52w" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
      </node>
      <node concept="3EZMnI" id="5Qmp_LAQ8xu" role="3EZMnx">
        <node concept="2EHx9g" id="5Qmp_LAQ96C" role="2iSdaV" />
        <node concept="3EZMnI" id="5Qmp_LAQ7ng" role="3EZMnx">
          <node concept="2iRfu4" id="5Qmp_LAQ7nh" role="2iSdaV" />
          <node concept="3F0ifn" id="5Qmp_LAQ5Ua" role="3EZMnx">
            <property role="3F0ifm" value="data:" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F1sOY" id="5Qmp_LAQ6vh" role="3EZMnx">
            <ref role="1NtTu8" to="zaxg:5Qmp_LAVe3i" resolve="data" />
          </node>
        </node>
        <node concept="3EZMnI" id="5Qmp_LATCTc" role="3EZMnx">
          <node concept="2iRfu4" id="5Qmp_LATCTd" role="2iSdaV" />
          <node concept="3F0ifn" id="5Qmp_LATCTe" role="3EZMnx">
            <property role="3F0ifm" value="concepts:" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F1sOY" id="5Qmp_LATCTf" role="3EZMnx">
            <property role="1$x2rV" value="&lt;subconcepts&gt;" />
            <ref role="1NtTu8" to="zaxg:5Qmp_LAQ3ic" resolve="concepts" />
          </node>
        </node>
        <node concept="3EZMnI" id="5Qmp_LAQ8O2" role="3EZMnx">
          <node concept="2iRfu4" id="5Qmp_LAQ8O3" role="2iSdaV" />
          <node concept="3F0ifn" id="5Qmp_LAQ8O4" role="3EZMnx">
            <property role="3F0ifm" value="label:" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F1sOY" id="5Qmp_LAQ9YF" role="3EZMnx">
            <property role="1$x2rV" value="&lt;alias, then name&gt;" />
            <ref role="1NtTu8" to="zaxg:5Qmp_LAQ3RB" resolve="labelFun" />
          </node>
        </node>
        <node concept="3EZMnI" id="5Qmp_LAQ9pc" role="3EZMnx">
          <node concept="2iRfu4" id="5Qmp_LAQ9pd" role="2iSdaV" />
          <node concept="3F0ifn" id="5Qmp_LAQ9pe" role="3EZMnx">
            <property role="3F0ifm" value="create:" />
            <ref role="1k5W1q" to="vpip:2vPZMAnQeIL" resolve="RComponentSub" />
          </node>
          <node concept="3F1sOY" id="5Qmp_LAQ9pf" role="3EZMnx">
            <property role="1$x2rV" value="&lt;new instance&gt;" />
            <ref role="1NtTu8" to="zaxg:5Qmp_LAQ4t2" resolve="createFun" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5Qmp_LAUUr6">
    <property role="3GE5qa" value="util" />
    <ref role="1XX52x" to="zaxg:5Qmp_LAUTgf" resolve="NodeChildRef" />
    <node concept="3EZMnI" id="5Qmp_LAUUHE" role="2wV5jI">
      <node concept="2iRfu4" id="5Qmp_LAUUHF" role="2iSdaV" />
      <node concept="3F1sOY" id="5Qmp_LAUUHG" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:5Qmp_LAUTPE" resolve="node" />
      </node>
      <node concept="3F0ifn" id="5Qmp_LAUUHH" role="3EZMnx">
        <property role="3F0ifm" value="-&gt;" />
        <node concept="11L4FC" id="5Qmp_LAUUHI" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="5Qmp_LAUUHJ" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="1iCGBv" id="5Qmp_LAUUHK" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:5Qmp_LAUU8d" resolve="child" />
        <node concept="1sVBvm" id="5Qmp_LAUUHL" role="1sWHZn">
          <node concept="3F0A7n" id="5Qmp_LAUUHM" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            <ref role="1k5W1q" to="vpip:5KtU3pYyDEg" resolve="RFeature" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="af0_0CS$L2">
    <ref role="1XX52x" to="zaxg:af0_0CR$4e" resolve="CreateDeleteRenderChild" />
    <node concept="3EZMnI" id="af0_0CSANh" role="2wV5jI">
      <node concept="2iRkQZ" id="af0_0CSANi" role="2iSdaV" />
      <node concept="3EZMnI" id="af0_0CS_m9" role="3EZMnx">
        <node concept="2iRfu4" id="af0_0CS_ma" role="2iSdaV" />
        <node concept="PMmxH" id="af0_0CS_3A" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAnOoz_" resolve="RComponent" />
        </node>
        <node concept="3F1sOY" id="af0_0CS_Vg" role="3EZMnx">
          <ref role="1NtTu8" to="zaxg:5Qmp_LAVe3i" resolve="data" />
        </node>
      </node>
    </node>
  </node>
</model>

