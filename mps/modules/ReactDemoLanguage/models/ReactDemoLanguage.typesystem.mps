<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:cbee52f2-fd64-4c0b-85a5-0f8e551b805a(ReactDemoLanguage.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="oyym" ref="r:1570828e-e9a4-47ff-95d9-80c800704647(ReactDemoLanguage.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1225271369338" name="jetbrains.mps.baseLanguage.structure.IsEmptyOperation" flags="nn" index="17RlXB" />
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
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
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1207055528241" name="jetbrains.mps.lang.typesystem.structure.WarningStatement" flags="nn" index="a7r0C">
        <child id="1207055552304" name="warningText" index="a7wSD" />
      </concept>
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1227096498176" name="jetbrains.mps.lang.typesystem.structure.PropertyMessageTarget" flags="ng" index="2ODE4t">
        <reference id="1227096521710" name="propertyDeclaration" index="2ODJFN" />
      </concept>
      <concept id="1227096620180" name="jetbrains.mps.lang.typesystem.structure.ReferenceMessageTarget" flags="ng" index="2OE7Q9">
        <reference id="1227096645744" name="linkDeclaration" index="2OEe5H" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246643443" name="messageTarget" index="1urrC5" />
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
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
  <node concept="18kY7G" id="3d2g73CmYRo">
    <property role="TrG5h" value="check_ErrorChecking" />
    <node concept="3clFbS" id="3d2g73CmYRp" role="18ibNy">
      <node concept="3clFbJ" id="2CLPJ2uzd5u" role="3cqZAp">
        <node concept="3clFbS" id="2CLPJ2uzd5w" role="3clFbx">
          <node concept="2MkqsV" id="2CLPJ2uzz36" role="3cqZAp">
            <node concept="Xl_RD" id="2CLPJ2uzz37" role="2MkJ7o">
              <property role="Xl_RC" value="neither can be 'error'" />
            </node>
            <node concept="1YBJjd" id="2CLPJ2uzz38" role="1urrMF">
              <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
            </node>
          </node>
        </node>
        <node concept="1Wc70l" id="2CLPJ2uzur4" role="3clFbw">
          <node concept="2OqwBi" id="2CLPJ2uzwUT" role="3uHU7w">
            <node concept="2OqwBi" id="2CLPJ2uzuXk" role="2Oq$k0">
              <node concept="1YBJjd" id="2CLPJ2uzuL4" role="2Oq$k0">
                <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
              </node>
              <node concept="3TrcHB" id="2CLPJ2uzvtV" role="2OqNvi">
                <ref role="3TsBF5" to="oyym:7$1mkeAymFe" resolve="s" />
              </node>
            </node>
            <node concept="liA8E" id="2CLPJ2uzybh" role="2OqNvi">
              <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
              <node concept="Xl_RD" id="2CLPJ2uzyxA" role="37wK5m">
                <property role="Xl_RC" value="error" />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="2CLPJ2uzglv" role="3uHU7B">
            <node concept="2OqwBi" id="2CLPJ2uzdRn" role="2Oq$k0">
              <node concept="1YBJjd" id="2CLPJ2uzdql" role="2Oq$k0">
                <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
              </node>
              <node concept="3TrcHB" id="2CLPJ2uze_R" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
            <node concept="liA8E" id="2CLPJ2uzirN" role="2OqNvi">
              <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
              <node concept="Xl_RD" id="2CLPJ2uzirP" role="37wK5m">
                <property role="Xl_RC" value="error" />
              </node>
            </node>
          </node>
        </node>
        <node concept="9aQIb" id="2CLPJ2uzANn" role="9aQIa">
          <node concept="3clFbS" id="2CLPJ2uzANo" role="9aQI4">
            <node concept="3clFbJ" id="3d2g73CmZaq" role="3cqZAp">
              <node concept="2OqwBi" id="3d2g73Cn1NB" role="3clFbw">
                <node concept="2OqwBi" id="3d2g73CmZUv" role="2Oq$k0">
                  <node concept="1YBJjd" id="3d2g73CmZtt" role="2Oq$k0">
                    <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
                  </node>
                  <node concept="3TrcHB" id="3d2g73Cn0oI" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
                <node concept="liA8E" id="3d2g73Cn33p" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
                  <node concept="Xl_RD" id="3d2g73Cn33r" role="37wK5m">
                    <property role="Xl_RC" value="error" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="3d2g73CmZas" role="3clFbx">
                <node concept="2MkqsV" id="3d2g73Cn3x9" role="3cqZAp">
                  <node concept="Xl_RD" id="3d2g73Cn3Oc" role="2MkJ7o">
                    <property role="Xl_RC" value="name cannot be 'error'" />
                  </node>
                  <node concept="1YBJjd" id="3d2g73Cn47y" role="1urrMF">
                    <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
                  </node>
                  <node concept="2ODE4t" id="7wB4nlI45YT" role="1urrC5">
                    <ref role="2ODJFN" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="2CLPJ2uz9p2" role="3cqZAp">
              <node concept="2OqwBi" id="2CLPJ2uz9p3" role="3clFbw">
                <node concept="2OqwBi" id="2CLPJ2uz9p4" role="2Oq$k0">
                  <node concept="1YBJjd" id="2CLPJ2uz9p5" role="2Oq$k0">
                    <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
                  </node>
                  <node concept="3TrcHB" id="2CLPJ2uz9p6" role="2OqNvi">
                    <ref role="3TsBF5" to="oyym:7$1mkeAymFe" resolve="s" />
                  </node>
                </node>
                <node concept="liA8E" id="2CLPJ2uz9p7" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.contains(java.lang.CharSequence)" resolve="contains" />
                  <node concept="Xl_RD" id="2CLPJ2uz9p8" role="37wK5m">
                    <property role="Xl_RC" value="error" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2CLPJ2uz9p9" role="3clFbx">
                <node concept="a7r0C" id="2CLPJ2uz9pe" role="3cqZAp">
                  <node concept="Xl_RD" id="2CLPJ2uz9pf" role="a7wSD">
                    <property role="Xl_RC" value="s should not be 'error'" />
                  </node>
                  <node concept="1YBJjd" id="2CLPJ2uz9pg" role="1urrMF">
                    <ref role="1YBMHb" node="3d2g73CmYRr" resolve="errorChecking" />
                  </node>
                  <node concept="2ODE4t" id="2CLPJ2uz9ph" role="1urrC5">
                    <ref role="2ODJFN" to="oyym:7$1mkeAymFe" resolve="s" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3d2g73CmYRr" role="1YuTPh">
      <property role="TrG5h" value="errorChecking" />
      <ref role="1YaFvo" to="oyym:3d2g73CmXYi" resolve="ErrorChecking" />
    </node>
  </node>
  <node concept="18kY7G" id="69AB$B3iUDZ">
    <property role="TrG5h" value="check_TreeNode" />
    <node concept="3clFbS" id="69AB$B3iUE0" role="18ibNy">
      <node concept="3clFbJ" id="69AB$B3iUX0" role="3cqZAp">
        <node concept="2OqwBi" id="69AB$B3iX_w" role="3clFbw">
          <node concept="2OqwBi" id="69AB$B3iVq9" role="2Oq$k0">
            <node concept="1YBJjd" id="69AB$B3iVg1" role="2Oq$k0">
              <ref role="1YBMHb" node="69AB$B3iUE2" resolve="treeNode" />
            </node>
            <node concept="3TrcHB" id="69AB$B3iVS0" role="2OqNvi">
              <ref role="3TsBF5" to="oyym:2vPZMAnR$xd" resolve="a" />
            </node>
          </node>
          <node concept="liA8E" id="69AB$B3n2SD" role="2OqNvi">
            <ref role="37wK5l" to="wyt6:~String.startsWith(java.lang.String)" resolve="startsWith" />
            <node concept="Xl_RD" id="69AB$B3n2SF" role="37wK5m">
              <property role="Xl_RC" value="error" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="69AB$B3iUX2" role="3clFbx">
          <node concept="2MkqsV" id="69AB$B3j0gI" role="3cqZAp">
            <node concept="Xl_RD" id="69AB$B3j0zp" role="2MkJ7o">
              <property role="Xl_RC" value="a cannot be 'error'" />
            </node>
            <node concept="1YBJjd" id="69AB$B3j0Qn" role="1urrMF">
              <ref role="1YBMHb" node="69AB$B3iUE2" resolve="treeNode" />
            </node>
            <node concept="2ODE4t" id="69AB$B3j19f" role="1urrC5">
              <ref role="2ODJFN" to="oyym:2vPZMAnR$xd" resolve="a" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="69AB$B3iUE2" role="1YuTPh">
      <property role="TrG5h" value="treeNode" />
      <ref role="1YaFvo" to="oyym:2vPZMAnpuJg" resolve="TreeNode" />
    </node>
  </node>
  <node concept="18kY7G" id="af0_0D_f95">
    <property role="TrG5h" value="check_Member" />
    <property role="3GE5qa" value="record" />
    <node concept="3clFbS" id="af0_0D_f96" role="18ibNy">
      <node concept="3clFbJ" id="af0_0DnY$V" role="3cqZAp">
        <node concept="2OqwBi" id="af0_0Do1d5" role="3clFbw">
          <node concept="2OqwBi" id="af0_0DnZ1I" role="2Oq$k0">
            <node concept="1YBJjd" id="af0_0DnYRA" role="2Oq$k0">
              <ref role="1YBMHb" node="af0_0D_f98" resolve="member" />
            </node>
            <node concept="3TrcHB" id="af0_0DnZv_" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
          <node concept="17RlXB" id="af0_0Do2pp" role="2OqNvi" />
        </node>
        <node concept="3clFbS" id="af0_0DnY$X" role="3clFbx">
          <node concept="2MkqsV" id="af0_0Do2Gk" role="3cqZAp">
            <node concept="Xl_RD" id="af0_0Do2YZ" role="2MkJ7o">
              <property role="Xl_RC" value="Name cannot be empty" />
            </node>
            <node concept="1YBJjd" id="af0_0Do3hZ" role="1urrMF">
              <ref role="1YBMHb" node="af0_0D_f98" resolve="member" />
            </node>
            <node concept="2ODE4t" id="af0_0Do3_5" role="1urrC5">
              <ref role="2ODJFN" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="af0_0DFC$N" role="3cqZAp">
        <node concept="2OqwBi" id="af0_0DFC$O" role="3clFbw">
          <node concept="2OqwBi" id="af0_0DFC$P" role="2Oq$k0">
            <node concept="1YBJjd" id="af0_0DFC$Q" role="2Oq$k0">
              <ref role="1YBMHb" node="af0_0D_f98" resolve="member" />
            </node>
            <node concept="3TrEf2" id="af0_0DFD3u" role="2OqNvi">
              <ref role="3Tt5mk" to="oyym:1XYAF4MuUxD" resolve="type" />
            </node>
          </node>
          <node concept="3w_OXm" id="af0_0DFE0N" role="2OqNvi" />
        </node>
        <node concept="3clFbS" id="af0_0DFC$T" role="3clFbx">
          <node concept="2MkqsV" id="af0_0DFC$U" role="3cqZAp">
            <node concept="Xl_RD" id="af0_0DFC$V" role="2MkJ7o">
              <property role="Xl_RC" value="Type cannot be empty" />
            </node>
            <node concept="1YBJjd" id="af0_0DFC$W" role="1urrMF">
              <ref role="1YBMHb" node="af0_0D_f98" resolve="member" />
            </node>
            <node concept="2OE7Q9" id="af0_0E1LSf" role="1urrC5">
              <ref role="2OEe5H" to="oyym:1XYAF4MuUxD" resolve="type" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="af0_0D_f98" role="1YuTPh">
      <property role="TrG5h" value="member" />
      <ref role="1YaFvo" to="oyym:1XYAF4MuQ5s" resolve="Inner" />
    </node>
  </node>
  <node concept="18kY7G" id="af0_0DnYif">
    <property role="TrG5h" value="check_Record" />
    <property role="3GE5qa" value="record" />
    <node concept="3clFbS" id="af0_0DnYig" role="18ibNy" />
    <node concept="1YaCAy" id="af0_0DnYii" role="1YuTPh">
      <property role="TrG5h" value="record" />
      <ref role="1YaFvo" to="oyym:1XYAF4MuPcd" resolve="Outer" />
    </node>
  </node>
</model>

