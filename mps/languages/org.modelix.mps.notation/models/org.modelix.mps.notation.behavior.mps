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
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="13h7C7" id="CUW2QYKKkf">
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
</model>

