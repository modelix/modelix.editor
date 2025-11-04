<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:44e47501-1389-4b40-ad1c-bb8c47922510(org.modelix.mps.notation.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <use id="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" name="jetbrains.mps.lang.actions" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="18ew" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.util(MPS.Core/)" />
    <import index="f8gn" ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="wsib" ref="r:d1d5cd51-6710-43f8-bd5b-f958da6e1ca2(org.modelix.mps.notation.behavior)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
      </concept>
      <concept id="1176897764478" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeFactory" flags="in" index="4$FPG" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1176897874615" name="nodeFactory" index="4_6I_" />
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186403694788" name="jetbrains.mps.lang.editor.structure.ColorStyleClassItem" flags="ln" index="VaVBg">
        <property id="1186403713874" name="color" index="Vb096" />
        <child id="1186403803051" name="query" index="VblUZ" />
      </concept>
      <concept id="1186403751766" name="jetbrains.mps.lang.editor.structure.FontStyleStyleClassItem" flags="ln" index="Vb9p2">
        <property id="1186403771423" name="style" index="Vbekb" />
      </concept>
      <concept id="1186404549998" name="jetbrains.mps.lang.editor.structure.ForegroundColorStyleClassItem" flags="ln" index="VechU" />
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414860679" name="jetbrains.mps.lang.editor.structure.EditableStyleClassItem" flags="ln" index="VPxyj" />
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1186414999511" name="jetbrains.mps.lang.editor.structure.UnderlinedStyleClassItem" flags="ln" index="VQ3r3">
        <child id="1221219051630" name="query" index="1mkY_M" />
      </concept>
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1233759184865" name="jetbrains.mps.lang.editor.structure.PunctuationRightStyleClassItem" flags="ln" index="11LMrY" />
      <concept id="1221062700015" name="jetbrains.mps.lang.editor.structure.QueryFunction_Underlined" flags="in" index="1d0yFN" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1225456267680" name="jetbrains.mps.lang.editor.structure.RGBColor" flags="ng" index="1iSF2X">
        <property id="1225456424731" name="value" index="1iTho6" />
      </concept>
      <concept id="1236262245656" name="jetbrains.mps.lang.editor.structure.MatchingLabelStyleClassItem" flags="ln" index="3mYdg7">
        <property id="1238091709220" name="labelName" index="1413C4" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <property id="1140114345053" name="allowEmptyText" index="1O74Pk" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <child id="1142887637401" name="renderingCondition" index="pqm2j" />
      </concept>
      <concept id="1073389446423" name="jetbrains.mps.lang.editor.structure.CellModel_Collection" flags="sn" stub="3013115976261988961" index="3EZMnI">
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="1073389446424" name="childCellModel" index="3EZMnx" />
      </concept>
      <concept id="1073389577006" name="jetbrains.mps.lang.editor.structure.CellModel_Constant" flags="sn" stub="3610246225209162225" index="3F0ifn">
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ngI" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1088612959204" name="jetbrains.mps.lang.editor.structure.CellModel_Alternation" flags="sg" stub="8104358048506729361" index="1QoScp">
        <property id="1088613081987" name="vertical" index="1QpmdY" />
        <child id="1145918517974" name="alternationCondition" index="3e4ffs" />
        <child id="1088612958265" name="ifTrueCellModel" index="1QoS34" />
        <child id="1088612973955" name="ifFalseCellModel" index="1QoVPY" />
      </concept>
      <concept id="625126330682908270" name="jetbrains.mps.lang.editor.structure.CellModel_ReferencePresentation" flags="sg" stub="730538219795961225" index="3SHvHV" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
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
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1225271369338" name="jetbrains.mps.baseLanguage.structure.IsEmptyOperation" flags="nn" index="17RlXB" />
      <concept id="1225271408483" name="jetbrains.mps.baseLanguage.structure.IsNotEmptyOperation" flags="nn" index="17RvpY" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
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
    </language>
  </registry>
  <node concept="24kQdi" id="3DO$SWhXWmz">
    <ref role="1XX52x" to="f8gn:7dm8yUsM9Ro" resolve="NotationModule" />
    <node concept="3EZMnI" id="3DO$SWhXWoh" role="2wV5jI">
      <node concept="3EZMnI" id="3DO$SWhXWpe" role="3EZMnx">
        <node concept="VPM3Z" id="3DO$SWhXWpg" role="3F10Kt" />
        <node concept="3F0ifn" id="3DO$SWhXWqe" role="3EZMnx">
          <property role="3F0ifm" value="notation module" />
        </node>
        <node concept="3F0A7n" id="3DO$SWhXWs0" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="2iRfu4" id="3DO$SWhXWpj" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="3DO$SWhXWs4" role="3EZMnx">
        <property role="3F0ifm" value="------------------------------------" />
      </node>
      <node concept="3F2HdR" id="3DO$SWhXWwx" role="3EZMnx">
        <ref role="1NtTu8" to="f8gn:7dm8yUsMfq9" resolve="content" />
        <node concept="2iRkQZ" id="3DO$SWhXWwz" role="2czzBx" />
        <node concept="4$FPG" id="ziPuhECJMW" role="4_6I_">
          <node concept="3clFbS" id="ziPuhECJMX" role="2VODD2">
            <node concept="3clFbF" id="ziPuhECJP5" role="3cqZAp">
              <node concept="2ShNRf" id="ziPuhECJP3" role="3clFbG">
                <node concept="3zrR0B" id="ziPuhECK0s" role="2ShVmc">
                  <node concept="3Tqbb2" id="ziPuhECK0u" role="3zrR0E">
                    <ref role="ehGHo" to="f8gn:7dm8yUsMf_c" resolve="EmptyLine" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2iRkQZ" id="3DO$SWhXWok" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="3DO$SWhXWzf">
    <ref role="1XX52x" to="f8gn:7dm8yUsMf_c" resolve="EmptyLine" />
    <node concept="3F0ifn" id="3DO$SWhXW$X" role="2wV5jI">
      <node concept="VPxyj" id="3DO$SWhXWAG" role="3F10Kt">
        <property role="VOm3f" value="true" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="3DO$SWhXWE7">
    <ref role="1XX52x" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
    <node concept="3EZMnI" id="3DO$SWhXWFP" role="2wV5jI">
      <node concept="PMmxH" id="3DO$SWhXWHC" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F0ifn" id="3DO$SWhXWRX" role="3EZMnx">
        <property role="3F0ifm" value="?" />
        <node concept="Vb9p2" id="3DO$SWhXWTM" role="3F10Kt" />
        <node concept="11L4FC" id="3DO$SWhXWUH" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pkWqt" id="3DO$SWhXWWt" role="pqm2j">
          <node concept="3clFbS" id="3DO$SWhXWWu" role="2VODD2">
            <node concept="3clFbF" id="3DO$SWhY43Q" role="3cqZAp">
              <node concept="2OqwBi" id="3DO$SWhY7Ee" role="3clFbG">
                <node concept="2OqwBi" id="3DO$SWhY58_" role="2Oq$k0">
                  <node concept="pncrf" id="3DO$SWhY43P" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3DO$SWhY7lD" role="2OqNvi">
                    <ref role="3Tt5mk" to="f8gn:7dm8yUsMfZC" resolve="condition" />
                  </node>
                </node>
                <node concept="3x8VRR" id="3DO$SWhY81Q" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1iCGBv" id="3DO$SWhXWKj" role="3EZMnx">
        <ref role="1NtTu8" to="f8gn:7dm8yUsMfNE" resolve="concept" />
        <node concept="1sVBvm" id="3DO$SWhXWKl" role="1sWHZn">
          <node concept="3SHvHV" id="3DO$SWhXWM9" role="2wV5jI" />
        </node>
      </node>
      <node concept="3F0ifn" id="262MKauAEZ3" role="3EZMnx">
        <property role="3F0ifm" value="+" />
        <node concept="pkWqt" id="262MKauAF08" role="pqm2j">
          <node concept="3clFbS" id="262MKauAF09" role="2VODD2">
            <node concept="3clFbF" id="262MKauAF0C" role="3cqZAp">
              <node concept="2OqwBi" id="262MKauAFpZ" role="3clFbG">
                <node concept="pncrf" id="262MKauAF0B" role="2Oq$k0" />
                <node concept="3TrcHB" id="262MKauAHf_" role="2OqNvi">
                  <ref role="3TsBF5" to="f8gn:1zXwHaHuRnq" resolve="applicableToSubconcepts" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="11L4FC" id="262MKauAHtr" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="3DO$SWhXWN8" role="3EZMnx">
        <property role="3F0ifm" value=":" />
      </node>
      <node concept="3F1sOY" id="3DO$SWhXWQ0" role="3EZMnx">
        <ref role="1NtTu8" to="f8gn:7dm8yUsMfYJ" resolve="cell" />
      </node>
      <node concept="l2Vlx" id="3DO$SWhXWFS" role="2iSdaV" />
    </node>
    <node concept="3EZMnI" id="3DO$SWhY8vi" role="6VMZX">
      <node concept="3EZMnI" id="3DO$SWhY8x0" role="3EZMnx">
        <node concept="3F0ifn" id="3DO$SWhY8y0" role="3EZMnx">
          <property role="3F0ifm" value="condition:" />
        </node>
        <node concept="3F1sOY" id="3DO$SWhY8_y" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:7dm8yUsMfZC" resolve="condition" />
        </node>
        <node concept="2iRfu4" id="3DO$SWhY8x5" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="1zXwHaHvloB" role="3EZMnx">
        <node concept="3F0ifn" id="1zXwHaHvloC" role="3EZMnx">
          <property role="3F0ifm" value="applicable to subconcepts:" />
        </node>
        <node concept="3F0A7n" id="1zXwHaHvloW" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:1zXwHaHuRnq" resolve="applicableToSubconcepts" />
        </node>
        <node concept="2iRfu4" id="1zXwHaHvloE" role="2iSdaV" />
      </node>
      <node concept="2iRkQZ" id="3DO$SWhY8vl" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="3DO$SWhY8Lt">
    <ref role="1XX52x" to="f8gn:7dm8yUsMxrq" resolve="ConstantCell" />
    <node concept="3EZMnI" id="3DO$SWhY8Nb" role="2wV5jI">
      <node concept="3F0A7n" id="3DO$SWhY8PR" role="3EZMnx">
        <property role="1$x2rV" value="&lt;empty constant&gt;" />
        <property role="1O74Pk" value="true" />
        <ref role="1NtTu8" to="f8gn:7dm8yUsMxD1" resolve="text" />
        <node concept="VechU" id="3DO$SWhY8V1" role="3F10Kt">
          <node concept="1iSF2X" id="3DO$SWhY8WK" role="VblUZ">
            <property role="1iTho6" value="008300" />
          </node>
        </node>
        <node concept="VQ3r3" id="3DO$SWhY90e" role="3F10Kt">
          <node concept="1d0yFN" id="3DO$SWhY91Z" role="1mkY_M">
            <node concept="3clFbS" id="3DO$SWhY920" role="2VODD2">
              <node concept="3clFbF" id="3DO$SWhY9fz" role="3cqZAp">
                <node concept="1Wc70l" id="3DO$SWhYf1y" role="3clFbG">
                  <node concept="2OqwBi" id="3DO$SWhYh9T" role="3uHU7w">
                    <node concept="2OqwBi" id="3DO$SWhYfEB" role="2Oq$k0">
                      <node concept="pncrf" id="3DO$SWhYfhZ" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3DO$SWhYfTk" role="2OqNvi">
                        <ref role="3TsBF5" to="f8gn:7dm8yUsMxD1" resolve="text" />
                      </node>
                    </node>
                    <node concept="liA8E" id="3DO$SWhYi4X" role="2OqNvi">
                      <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
                      <node concept="Xl_RD" id="3DO$SWhYi7_" role="37wK5m">
                        <property role="Xl_RC" value=" " />
                      </node>
                    </node>
                  </node>
                  <node concept="2OqwBi" id="3DO$SWhYcPH" role="3uHU7B">
                    <node concept="2OqwBi" id="3DO$SWhY9FO" role="2Oq$k0">
                      <node concept="pncrf" id="3DO$SWhY9fy" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3DO$SWhYa76" role="2OqNvi">
                        <ref role="3TsBF5" to="f8gn:7dm8yUsMxD1" resolve="text" />
                      </node>
                    </node>
                    <node concept="17RvpY" id="3DO$SWhYdKe" role="2OqNvi" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2iRfu4" id="3DO$SWhY8Ne" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="CUW2QYKJDU">
    <ref role="1XX52x" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
    <node concept="1QoScp" id="CUW2QYKNQ9" role="2wV5jI">
      <property role="1QpmdY" value="true" />
      <node concept="3EZMnI" id="CUW2QYKO6z" role="1QoS34">
        <node concept="3F0ifn" id="CUW2QYKOaV" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="VechU" id="CUW2QYKOaW" role="3F10Kt">
            <node concept="1iSF2X" id="CUW2QYKOaX" role="VblUZ">
              <property role="1iTho6" value="cccccc" />
            </node>
          </node>
          <node concept="3mYdg7" id="4cpiv6ojESd" role="3F10Kt">
            <property role="1413C4" value="square" />
          </node>
        </node>
        <node concept="3EZMnI" id="CUW2QYKOgt" role="3EZMnx">
          <node concept="VPM3Z" id="CUW2QYKOgv" role="3F10Kt" />
          <node concept="3XFhqQ" id="CUW2QYKOk5" role="3EZMnx" />
          <node concept="3F2HdR" id="CUW2QYKOlR" role="3EZMnx">
            <ref role="1NtTu8" to="f8gn:CUW2QYKJ$J" resolve="cells" />
            <node concept="2iRkQZ" id="CUW2QYKOnD" role="2czzBx" />
          </node>
          <node concept="2iRfu4" id="CUW2QYKOgy" role="2iSdaV" />
        </node>
        <node concept="3F0ifn" id="CUW2QYKOb0" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="VechU" id="CUW2QYKOb1" role="3F10Kt">
            <node concept="1iSF2X" id="CUW2QYKOb2" role="VblUZ">
              <property role="1iTho6" value="cccccc" />
            </node>
          </node>
          <node concept="3mYdg7" id="4cpiv6ojESi" role="3F10Kt">
            <property role="1413C4" value="square" />
          </node>
        </node>
        <node concept="2iRkQZ" id="CUW2QYKO6A" role="2iSdaV" />
      </node>
      <node concept="pkWqt" id="CUW2QYKNQc" role="3e4ffs">
        <node concept="3clFbS" id="CUW2QYKNQe" role="2VODD2">
          <node concept="3clFbF" id="CUW2QYKOqh" role="3cqZAp">
            <node concept="2OqwBi" id="CUW2QYKOOy" role="3clFbG">
              <node concept="pncrf" id="CUW2QYKOqg" role="2Oq$k0" />
              <node concept="2qgKlT" id="CUW2QYKPgp" role="2OqNvi">
                <ref role="37wK5l" to="wsib:CUW2QYKLam" resolve="isVerticalLayout" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3EZMnI" id="CUW2QYKJFC" role="1QoVPY">
        <node concept="3F0ifn" id="CUW2QYKJG_" role="3EZMnx">
          <property role="3F0ifm" value="[" />
          <node concept="VechU" id="CUW2QYKJMG" role="3F10Kt">
            <node concept="1iSF2X" id="CUW2QYKJN$" role="VblUZ">
              <property role="1iTho6" value="cccccc" />
            </node>
          </node>
          <node concept="3mYdg7" id="4cpiv6ojESm" role="3F10Kt">
            <property role="1413C4" value="square" />
          </node>
        </node>
        <node concept="3F2HdR" id="CUW2QYKJVx" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:CUW2QYKJ$J" resolve="cells" />
          <node concept="l2Vlx" id="22f9nDgRtdl" role="2czzBx" />
        </node>
        <node concept="3F0ifn" id="CUW2QYKJIn" role="3EZMnx">
          <property role="3F0ifm" value="]" />
          <node concept="VechU" id="CUW2QYKJRO" role="3F10Kt">
            <node concept="1iSF2X" id="CUW2QYKJRP" role="VblUZ">
              <property role="1iTho6" value="cccccc" />
            </node>
          </node>
          <node concept="3mYdg7" id="4cpiv6ojESq" role="3F10Kt">
            <property role="1413C4" value="square" />
          </node>
        </node>
        <node concept="l2Vlx" id="22f9nDgRdCZ" role="2iSdaV" />
      </node>
    </node>
    <node concept="3EZMnI" id="CUW2QYMNNa" role="6VMZX">
      <node concept="2iRkQZ" id="CUW2QYMNNb" role="2iSdaV" />
      <node concept="3EZMnI" id="CUW2QYMNPF" role="3EZMnx">
        <node concept="2iRfu4" id="CUW2QYMNPG" role="2iSdaV" />
        <node concept="VPM3Z" id="CUW2QYMNPH" role="3F10Kt" />
        <node concept="3F0ifn" id="CUW2QYMNPL" role="3EZMnx">
          <property role="3F0ifm" value="layout:" />
        </node>
        <node concept="3F1sOY" id="CUW2QYMNSs" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:CUW2QYKL5L" resolve="layout" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="CUW2QYKV4B">
    <ref role="1XX52x" to="f8gn:CUW2QYKUUq" resolve="PropertyCell" />
    <node concept="1iCGBv" id="CUW2QYKVaC" role="2wV5jI">
      <ref role="1NtTu8" to="f8gn:CUW2QYKUZw" resolve="property" />
      <node concept="1sVBvm" id="CUW2QYKVaE" role="1sWHZn">
        <node concept="3F0A7n" id="CUW2QYKVbE" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          <node concept="VechU" id="CUW2QYKVfY" role="3F10Kt">
            <node concept="1iSF2X" id="CUW2QYKVg1" role="VblUZ">
              <property role="1iTho6" value="2356a8" />
            </node>
          </node>
          <node concept="Vb9p2" id="CUW2QYKVkl" role="3F10Kt">
            <property role="Vbekb" value="g1_kEg4/ITALIC" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="CUW2QYMiG6">
    <ref role="1XX52x" to="f8gn:CUW2QYMiki" resolve="ChildrenCollectionCell" />
    <node concept="1iCGBv" id="CUW2QYMiJy" role="2wV5jI">
      <ref role="1NtTu8" to="f8gn:CUW2QYMipn" resolve="link" />
      <node concept="1sVBvm" id="CUW2QYMiJ$" role="1sWHZn">
        <node concept="3SHvHV" id="CUW2QYMjuG" role="2wV5jI" />
      </node>
    </node>
    <node concept="3EZMnI" id="CUW2QYMiV0" role="6VMZX">
      <node concept="2iRkQZ" id="CUW2QYMiV1" role="2iSdaV" />
      <node concept="3EZMnI" id="CUW2QYMiWK" role="3EZMnx">
        <node concept="2iRfu4" id="CUW2QYMiWL" role="2iSdaV" />
        <node concept="VPM3Z" id="CUW2QYMiWM" role="3F10Kt" />
        <node concept="3F0ifn" id="CUW2QYMiWQ" role="3EZMnx">
          <property role="3F0ifm" value="layout:" />
        </node>
        <node concept="3F1sOY" id="CUW2QYMiYB" role="3EZMnx">
          <property role="1$x2rV" value="horizontal" />
          <ref role="1NtTu8" to="f8gn:CUW2QYMi$q" resolve="layout" />
        </node>
      </node>
      <node concept="3EZMnI" id="CUW2QYMj24" role="3EZMnx">
        <node concept="2iRfu4" id="CUW2QYMj25" role="2iSdaV" />
        <node concept="VPM3Z" id="CUW2QYMj26" role="3F10Kt" />
        <node concept="3F0ifn" id="CUW2QYMj27" role="3EZMnx">
          <property role="3F0ifm" value="separator:" />
        </node>
        <node concept="3F0A7n" id="CUW2QYMj6W" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <ref role="1NtTu8" to="f8gn:CUW2QYMiCG" resolve="separator" />
        </node>
        <node concept="pkWqt" id="6xJrM0Nsm2N" role="pqm2j">
          <node concept="3clFbS" id="6xJrM0Nsm2O" role="2VODD2">
            <node concept="3clFbF" id="6xJrM0Nsmgn" role="3cqZAp">
              <node concept="22lmx$" id="6xJrM0Nsq$S" role="3clFbG">
                <node concept="2OqwBi" id="6xJrM0NsqP1" role="3uHU7w">
                  <node concept="2OqwBi" id="6xJrM0NsqB4" role="2Oq$k0">
                    <node concept="pncrf" id="6xJrM0NsqAc" role="2Oq$k0" />
                    <node concept="3TrEf2" id="6xJrM0NsqDy" role="2OqNvi">
                      <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
                    </node>
                  </node>
                  <node concept="3w_OXm" id="6xJrM0NsrqY" role="2OqNvi" />
                </node>
                <node concept="2OqwBi" id="6xJrM0Nsooq" role="3uHU7B">
                  <node concept="2OqwBi" id="6xJrM0NsmEC" role="2Oq$k0">
                    <node concept="pncrf" id="6xJrM0Nsmgm" role="2Oq$k0" />
                    <node concept="3TrcHB" id="6xJrM0NsmS_" role="2OqNvi">
                      <ref role="3TsBF5" to="f8gn:CUW2QYMiCG" resolve="separator" />
                    </node>
                  </node>
                  <node concept="17RvpY" id="6xJrM0Nspkk" role="2OqNvi" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3EZMnI" id="6xJrM0NrOsi" role="3EZMnx">
        <node concept="2iRfu4" id="6xJrM0NrOsj" role="2iSdaV" />
        <node concept="VPM3Z" id="6xJrM0NrOsk" role="3F10Kt" />
        <node concept="3F0ifn" id="6xJrM0NrOsl" role="3EZMnx">
          <property role="3F0ifm" value="separator cell:" />
        </node>
        <node concept="3F1sOY" id="6xJrM0NrOsL" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
        </node>
        <node concept="pkWqt" id="6xJrM0Nsrsh" role="pqm2j">
          <node concept="3clFbS" id="6xJrM0Nsrsi" role="2VODD2">
            <node concept="3clFbF" id="6xJrM0NsrsL" role="3cqZAp">
              <node concept="22lmx$" id="6xJrM0NstG4" role="3clFbG">
                <node concept="2OqwBi" id="6xJrM0Nsv14" role="3uHU7w">
                  <node concept="2OqwBi" id="6xJrM0NstIa" role="2Oq$k0">
                    <node concept="pncrf" id="6xJrM0NstHo" role="2Oq$k0" />
                    <node concept="3TrcHB" id="6xJrM0NstK_" role="2OqNvi">
                      <ref role="3TsBF5" to="f8gn:CUW2QYMiCG" resolve="separator" />
                    </node>
                  </node>
                  <node concept="17RlXB" id="6xJrM0NsvVf" role="2OqNvi" />
                </node>
                <node concept="2OqwBi" id="6xJrM0Nsshm" role="3uHU7B">
                  <node concept="2OqwBi" id="6xJrM0NsrR2" role="2Oq$k0">
                    <node concept="pncrf" id="6xJrM0NsrsK" role="2Oq$k0" />
                    <node concept="3TrEf2" id="6xJrM0Nss4n" role="2OqNvi">
                      <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
                    </node>
                  </node>
                  <node concept="3x8VRR" id="6xJrM0NsssZ" role="2OqNvi" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3EZMnI" id="CUW2QYMj2j" role="3EZMnx">
        <node concept="2iRfu4" id="CUW2QYMj2k" role="2iSdaV" />
        <node concept="VPM3Z" id="CUW2QYMj2l" role="3F10Kt" />
        <node concept="3F0ifn" id="CUW2QYMj2m" role="3EZMnx">
          <property role="3F0ifm" value="sub-concept for new nodes:" />
        </node>
        <node concept="1iCGBv" id="CUW2QYMjc8" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:CUW2QYMiut" resolve="subconceptToInsert" />
          <node concept="1sVBvm" id="CUW2QYMjca" role="1sWHZn">
            <node concept="3SHvHV" id="CUW2QYMjxm" role="2wV5jI" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="CUW2QYMXit">
    <ref role="1XX52x" to="f8gn:CUW2QYMXaO" resolve="IndentCell" />
    <node concept="PMmxH" id="CUW2QYMXkb" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <node concept="VechU" id="CUW2QYMXnA" role="3F10Kt">
        <property role="Vb096" value="fLJRk5_/gray" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="CUW2QYNsmB">
    <property role="3GE5qa" value="layout" />
    <ref role="1XX52x" to="f8gn:CUW2QYKK2t" resolve="CollectionLayout" />
    <node concept="PMmxH" id="CUW2QYNsol" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
    </node>
  </node>
  <node concept="24kQdi" id="CUW2QYOnla">
    <ref role="1XX52x" to="f8gn:CUW2QYOmUP" resolve="WithIndentCell" />
    <node concept="3EZMnI" id="CUW2QYOnw_" role="2wV5jI">
      <node concept="3EZMnI" id="CUW2QYOnys" role="3EZMnx">
        <node concept="VPM3Z" id="CUW2QYOnyu" role="3F10Kt" />
        <node concept="PMmxH" id="CUW2QYOnzs" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        </node>
        <node concept="3F0ifn" id="CUW2QYOn$n" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
        <node concept="2iRfu4" id="CUW2QYOnyx" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="CUW2QYOnJA" role="3EZMnx">
        <node concept="VPM3Z" id="CUW2QYOnJC" role="3F10Kt" />
        <node concept="3XFhqQ" id="CUW2QYOnL_" role="3EZMnx" />
        <node concept="3F2HdR" id="CUW2QYOnE0" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:CUW2QYOnl8" resolve="cells" />
          <node concept="2iRkQZ" id="CUW2QYOnE2" role="2czzBx" />
        </node>
        <node concept="2iRfu4" id="CUW2QYOnJF" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="CUW2QYOnBU" role="3EZMnx">
        <node concept="VPM3Z" id="CUW2QYOnBW" role="3F10Kt" />
        <node concept="3F0ifn" id="CUW2QYOnBY" role="3EZMnx">
          <property role="3F0ifm" value="}" />
        </node>
        <node concept="2iRfu4" id="CUW2QYOnBZ" role="2iSdaV" />
      </node>
      <node concept="2iRkQZ" id="CUW2QYOnwC" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhE_FoQ">
    <ref role="1XX52x" to="f8gn:ziPuhE_FoM" resolve="ConceptAliasCell" />
    <node concept="PMmxH" id="ziPuhE_FoS" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <node concept="Vb9p2" id="ziPuhE_FoV" role="3F10Kt">
        <property role="Vbekb" value="g1_k_vY/BOLD" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhE_FqT">
    <ref role="1XX52x" to="f8gn:ziPuhE_FoY" resolve="BL_ExpressionCell" />
    <node concept="3EZMnI" id="ziPuhE_FqW" role="2wV5jI">
      <node concept="3F0ifn" id="ziPuhE_Fr4" role="3EZMnx">
        <property role="3F0ifm" value="*(" />
        <node concept="3mYdg7" id="ziPuhE_Frp" role="3F10Kt">
          <property role="1413C4" value="p" />
        </node>
        <node concept="11LMrY" id="ziPuhE_Frv" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="ziPuhE_Frb" role="3EZMnx">
        <ref role="1NtTu8" to="f8gn:ziPuhE_Fp2" resolve="expression" />
      </node>
      <node concept="3F0ifn" id="ziPuhE_Frj" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <node concept="3mYdg7" id="ziPuhE_Fr$" role="3F10Kt">
          <property role="1413C4" value="p" />
        </node>
        <node concept="11L4FC" id="ziPuhE_FrC" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="l2Vlx" id="ziPuhE_FqZ" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhE_FrX">
    <ref role="1XX52x" to="f8gn:ziPuhE_FrH" resolve="FlagCell" />
    <node concept="3EZMnI" id="ziPuhE_Fs0" role="2wV5jI">
      <node concept="PMmxH" id="ziPuhE_Fs8" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F0ifn" id="ziPuhE_Fse" role="3EZMnx">
        <property role="3F0ifm" value="/" />
        <node concept="11L4FC" id="ziPuhE_FsI" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="ziPuhE_FsN" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="1iCGBv" id="ziPuhE_Fsv" role="3EZMnx">
        <ref role="1NtTu8" to="f8gn:ziPuhE_FrT" resolve="property" />
        <node concept="1sVBvm" id="ziPuhE_Fsx" role="1sWHZn">
          <node concept="3SHvHV" id="ziPuhE_FsE" role="2wV5jI" />
        </node>
      </node>
      <node concept="2iRfu4" id="ziPuhE_Fs3" role="2iSdaV" />
    </node>
    <node concept="3EZMnI" id="ziPuhE_FsS" role="6VMZX">
      <node concept="2iRkQZ" id="ziPuhE_FsT" role="2iSdaV" />
      <node concept="3EZMnI" id="ziPuhE_FsX" role="3EZMnx">
        <node concept="2iRfu4" id="ziPuhE_FsY" role="2iSdaV" />
        <node concept="VPM3Z" id="ziPuhE_FsZ" role="3F10Kt" />
        <node concept="3F0ifn" id="ziPuhE_Ft4" role="3EZMnx">
          <property role="3F0ifm" value="text:" />
        </node>
        <node concept="3F0A7n" id="ziPuhE_Fte" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <ref role="1NtTu8" to="f8gn:ziPuhE_FrL" resolve="text" />
        </node>
      </node>
      <node concept="3EZMnI" id="ziPuhE_Ftw" role="3EZMnx">
        <node concept="VPM3Z" id="ziPuhE_Fty" role="3F10Kt" />
        <node concept="3F0ifn" id="ziPuhE_Ft$" role="3EZMnx">
          <property role="3F0ifm" value="inverted:" />
        </node>
        <node concept="3F0A7n" id="ziPuhE_FtO" role="3EZMnx">
          <ref role="1NtTu8" to="f8gn:ziPuhE_FrO" resolve="inverted" />
        </node>
        <node concept="2iRfu4" id="ziPuhE_Ft_" role="2iSdaV" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhE_TwZ">
    <property role="3GE5qa" value="expressions" />
    <ref role="1XX52x" to="f8gn:ziPuhE_TwU" resolve="KT_NotationNodeExpression" />
    <node concept="PMmxH" id="ziPuhE_Tx1" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhE_Vc2">
    <ref role="1XX52x" to="f8gn:ziPuhE_VbT" resolve="OptionalCell" />
    <node concept="3EZMnI" id="ziPuhE_Vc5" role="2wV5jI">
      <node concept="PMmxH" id="ziPuhE_Vcd" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="VechU" id="ziPuhE_Vcu" role="3F10Kt">
          <node concept="1iSF2X" id="ziPuhEA2av" role="VblUZ">
            <property role="1iTho6" value="2261a3" />
          </node>
        </node>
      </node>
      <node concept="3F1sOY" id="ziPuhE_Vcn" role="3EZMnx">
        <ref role="1NtTu8" to="f8gn:ziPuhE_VbX" resolve="cell" />
      </node>
      <node concept="l2Vlx" id="4cpiv6oknH3" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhEA2aH">
    <ref role="1XX52x" to="f8gn:ziPuhEA2a_" resolve="ReferenceCell" />
    <node concept="1iCGBv" id="ziPuhEA2aK" role="2wV5jI">
      <ref role="1NtTu8" to="f8gn:ziPuhEA2aC" resolve="link" />
      <node concept="1sVBvm" id="ziPuhEA2aM" role="1sWHZn">
        <node concept="3SHvHV" id="ziPuhEA2aU" role="2wV5jI">
          <node concept="VechU" id="ziPuhEA2aY" role="3F10Kt">
            <node concept="1iSF2X" id="ziPuhEA2b1" role="VblUZ">
              <property role="1iTho6" value="945721" />
            </node>
          </node>
          <node concept="Vb9p2" id="ziPuhEA2ba" role="3F10Kt">
            <property role="Vbekb" value="g1_kEg4/ITALIC" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3EZMnI" id="22f9nDgMtg1" role="6VMZX">
      <node concept="3F0ifn" id="22f9nDgMtg8" role="3EZMnx">
        <property role="3F0ifm" value="render target:" />
      </node>
      <node concept="3F1sOY" id="22f9nDgMtge" role="3EZMnx">
        <property role="1$x2rV" value="target.name" />
        <ref role="1NtTu8" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
      </node>
      <node concept="2iRfu4" id="22f9nDgMtg4" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhEA4oD">
    <ref role="1XX52x" to="f8gn:ziPuhEA4oz" resolve="RemoveSpace" />
    <node concept="PMmxH" id="ziPuhEA4oF" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <node concept="VechU" id="ziPuhEDfnk" role="3F10Kt">
        <property role="Vb096" value="fLJRk5A/lightGray" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhEA4oQ">
    <ref role="1XX52x" to="f8gn:ziPuhEA4oI" resolve="SingleChildCell" />
    <node concept="1iCGBv" id="ziPuhEA4oW" role="2wV5jI">
      <ref role="1NtTu8" to="f8gn:ziPuhEA4oM" resolve="link" />
      <node concept="1sVBvm" id="ziPuhEA4oY" role="1sWHZn">
        <node concept="3SHvHV" id="ziPuhEA4p6" role="2wV5jI">
          <node concept="VechU" id="ziPuhEA4pc" role="3F10Kt">
            <node concept="1iSF2X" id="ziPuhEA4pf" role="VblUZ">
              <property role="1iTho6" value="b32462" />
            </node>
          </node>
          <node concept="Vb9p2" id="ziPuhEA4py" role="3F10Kt">
            <property role="Vbekb" value="g1_kEg4/ITALIC" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="ziPuhEAsOE">
    <ref role="1XX52x" to="f8gn:ziPuhEAsOy" resolve="SubstituteCell" />
    <node concept="3EZMnI" id="ziPuhEAsOH" role="2wV5jI">
      <node concept="PMmxH" id="ziPuhEAsOS" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F0ifn" id="ziPuhEAsOX" role="3EZMnx">
        <property role="3F0ifm" value="/" />
        <node concept="11L4FC" id="ziPuhEAsPj" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="11LMrY" id="ziPuhEAsPq" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="ziPuhEAsPb" role="3EZMnx">
        <property role="1$x2rV" value="&lt;hide&gt;" />
        <property role="1O74Pk" value="true" />
        <ref role="1NtTu8" to="f8gn:ziPuhEAsOB" resolve="text" />
        <node concept="VechU" id="ziPuhEAsPy" role="3F10Kt">
          <node concept="1iSF2X" id="ziPuhEAsPD" role="VblUZ">
            <property role="1iTho6" value="008300" />
          </node>
        </node>
        <node concept="VQ3r3" id="ziPuhEAsPL" role="3F10Kt">
          <node concept="1d0yFN" id="ziPuhEAsPR" role="1mkY_M">
            <node concept="3clFbS" id="ziPuhEAsPS" role="2VODD2">
              <node concept="3clFbF" id="ziPuhEAt3s" role="3cqZAp">
                <node concept="1Wc70l" id="ziPuhEAyF6" role="3clFbG">
                  <node concept="2OqwBi" id="ziPuhEA$UQ" role="3uHU7w">
                    <node concept="2OqwBi" id="ziPuhEAzgv" role="2Oq$k0">
                      <node concept="pncrf" id="ziPuhEAyGr" role="2Oq$k0" />
                      <node concept="3TrcHB" id="ziPuhEAzDQ" role="2OqNvi">
                        <ref role="3TsBF5" to="f8gn:ziPuhEAsOB" resolve="text" />
                      </node>
                    </node>
                    <node concept="liA8E" id="ziPuhEA_P4" role="2OqNvi">
                      <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
                      <node concept="Xl_RD" id="ziPuhEA_P9" role="37wK5m">
                        <property role="Xl_RC" value=" " />
                      </node>
                    </node>
                  </node>
                  <node concept="2OqwBi" id="ziPuhEAwwW" role="3uHU7B">
                    <node concept="2OqwBi" id="ziPuhEAtrT" role="2Oq$k0">
                      <node concept="pncrf" id="ziPuhEAt3r" role="2Oq$k0" />
                      <node concept="3TrcHB" id="ziPuhEAtMV" role="2OqNvi">
                        <ref role="3TsBF5" to="f8gn:ziPuhEAsOB" resolve="text" />
                      </node>
                    </node>
                    <node concept="17RvpY" id="ziPuhEAxqC" role="2OqNvi" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2iRfu4" id="ziPuhEAsOK" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="4dQjfTHYohF">
    <ref role="1XX52x" to="f8gn:4dQjfTHYohE" resolve="NewLineCell" />
    <node concept="PMmxH" id="4dQjfTHYohH" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <node concept="VechU" id="4dQjfTHYohJ" role="3F10Kt">
        <property role="Vb096" value="fLJRk5A/lightGray" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="22f9nDgO5h2">
    <property role="3GE5qa" value="expressions" />
    <ref role="1XX52x" to="f8gn:22f9nDgNr2y" resolve="BL_NotationNodeExpression" />
    <node concept="PMmxH" id="22f9nDgO5h4" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
    </node>
  </node>
  <node concept="24kQdi" id="22f9nDgOIIi">
    <property role="3GE5qa" value="expressions" />
    <ref role="1XX52x" to="f8gn:22f9nDgOIIh" resolve="BL_ReferenceTargetExpression" />
    <node concept="PMmxH" id="22f9nDgOIIk" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
    </node>
  </node>
</model>

