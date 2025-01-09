<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4ee90d89-861f-4bf3-9fa8-cf4ca2342e77(org.modelix.mps.react.muicomponents.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <use id="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" name="jetbrains.mps.lang.actions" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="zaxg" ref="r:c4183f14-1033-4ade-be7c-1beadb184134(org.modelix.mps.react.muicomponents.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
    <import index="vpip" ref="r:fcc69b83-3584-4a79-833a-d9dc948b6fd7(org.modelix.mps.react.editor)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1233759184865" name="jetbrains.mps.lang.editor.structure.PunctuationRightStyleClassItem" flags="ln" index="11LMrY" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ngI" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <property id="1140114345053" name="allowEmptyText" index="1O74Pk" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
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
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="2vPZMAmvsgt">
    <ref role="1XX52x" to="zaxg:2vPZMAmvnIB" resolve="TextField" />
    <node concept="3EZMnI" id="2vPZMAmvsgy" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmvsgz" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAmvsgv" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F1sOY" id="2vPZMAmvsgA" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmvsgs" resolve="data" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmvsgC">
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
            <ref role="1k5W1q" to="vpip:2vPZMAmxCQV" resolve="RConcept" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmDmtU">
    <ref role="1XX52x" to="zaxg:2vPZMAmDmtP" resolve="Label" />
    <node concept="3EZMnI" id="2vPZMAmDmtW" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmDmtX" role="2iSdaV" />
      <node concept="PMmxH" id="2vPZMAmDmtY" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F1sOY" id="2vPZMAmDmtZ" role="3EZMnx">
        <ref role="1NtTu8" to="zaxg:2vPZMAmDsnU" resolve="value" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2vPZMAmEWcY">
    <ref role="1XX52x" to="zaxg:2vPZMAmEVPF" resolve="LayoutHorizontal" />
    <node concept="3EZMnI" id="2vPZMAmEWd8" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAmEWd9" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAmEWd3" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAmEWd4" role="2iSdaV" />
        <node concept="PMmxH" id="2vPZMAmEWd2" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
        <node concept="3F0ifn" id="2vPZMAmEWd6" role="3EZMnx">
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
    <ref role="1XX52x" to="zaxg:2vPZMAmGCtk" resolve="LayoutVertical" />
    <node concept="3EZMnI" id="2vPZMAmGCto" role="2wV5jI">
      <node concept="2iRkQZ" id="2vPZMAmGCtp" role="2iSdaV" />
      <node concept="3EZMnI" id="2vPZMAmGCtq" role="3EZMnx">
        <node concept="2iRfu4" id="2vPZMAmGCtr" role="2iSdaV" />
        <node concept="PMmxH" id="2vPZMAmGCts" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
          <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
        </node>
        <node concept="3F0A7n" id="2vPZMAmGN8z" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <ref role="1NtTu8" to="zaxg:2vPZMAmGN8u" resolve="gap" />
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
    <ref role="1XX52x" to="zaxg:2vPZMAmJaEH" resolve="Header" />
    <node concept="3EZMnI" id="2vPZMAmJaEP" role="2wV5jI">
      <node concept="2iRfu4" id="2vPZMAmJaEQ" role="2iSdaV" />
      <node concept="3F0ifn" id="2vPZMAmJaEN" role="3EZMnx">
        <property role="3F0ifm" value="header" />
        <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
      </node>
      <node concept="3F0ifn" id="2vPZMAmJaES" role="3EZMnx">
        <property role="3F0ifm" value="&lt;" />
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
      </node>
      <node concept="3F0ifn" id="2vPZMAmJaEW" role="3EZMnx">
        <property role="3F0ifm" value="&gt;" />
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
    <ref role="1XX52x" to="zaxg:2vPZMAmMlUm" resolve="Space" />
    <node concept="PMmxH" id="2vPZMAmMpdT" role="2wV5jI">
      <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      <ref role="1k5W1q" to="vpip:2vPZMAmxCQO" resolve="RKeyword" />
    </node>
  </node>
</model>

