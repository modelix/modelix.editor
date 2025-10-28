<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4c160db5-bc9c-4bc1-851d-ffe0160083f0(org.modelix.mps.react.ide.plugin)">
  <persistence version="9" />
  <languages>
    <use id="28f9e497-3b42-4291-aeba-0a1039153ab1" name="jetbrains.mps.lang.plugin" version="6" />
    <use id="ef7bf5ac-d06c-4342-b11d-e42104eb9343" name="jetbrains.mps.lang.plugin.standalone" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="63650c59-16c8-498a-99c8-005c7ee9515d" name="jetbrains.mps.lang.access" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="817e4e70-961e-4a95-98a1-15e9f32231f1" name="jetbrains.mps.ide.httpsupport" version="0" />
    <use id="443f4c36-fcf5-4eb6-9500-8d06ed259e3e" name="jetbrains.mps.baseLanguage.classifiers" version="0" />
    <use id="c7fb639f-be78-4307-89b0-b5959c3fa8c8" name="jetbrains.mps.lang.text" version="0" />
  </languages>
  <imports>
    <import index="e11" ref="83a7cbdc-dd9d-4dad-be97-957aa1b07375/java:org.modelix.react.ssr.mps(org.modelix.mps.react.ssr.stubs/)" />
    <import index="afa5" ref="r:cfccec82-df72-4483-9807-88776b4673ab(jetbrains.mps.ide.make.actions)" />
    <import index="tprs" ref="r:00000000-0000-4000-0000-011c895904a4(jetbrains.mps.ide.actions)" />
    <import index="guwi" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.io(JDK/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="kt01" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt.datatransfer(JDK/)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
  </imports>
  <registry>
    <language id="28f9e497-3b42-4291-aeba-0a1039153ab1" name="jetbrains.mps.lang.plugin">
      <concept id="1204908117386" name="jetbrains.mps.lang.plugin.structure.Separator" flags="ng" index="2a7GMi" />
      <concept id="1207145163717" name="jetbrains.mps.lang.plugin.structure.ElementListContents" flags="ng" index="ftmFs">
        <child id="1207145201301" name="reference" index="ftvYc" />
      </concept>
      <concept id="1203071646776" name="jetbrains.mps.lang.plugin.structure.ActionDeclaration" flags="ng" index="sE7Ow">
        <property id="1205250923097" name="caption" index="2uzpH1" />
        <property id="7458746815261976739" name="requiredAccess" index="2YLI8m" />
        <property id="4692598989365753297" name="updateInBackground" index="1rBW0U" />
        <child id="1203083461638" name="executeFunction" index="tncku" />
        <child id="1217413222820" name="parameter" index="1NuT2Z" />
      </concept>
      <concept id="1203082903663" name="jetbrains.mps.lang.plugin.structure.ConceptFunctionParameter_AnActionEvent" flags="nn" index="tl45R" />
      <concept id="1203083511112" name="jetbrains.mps.lang.plugin.structure.ExecuteBlock" flags="in" index="tnohg" />
      <concept id="1203087890642" name="jetbrains.mps.lang.plugin.structure.ActionGroupDeclaration" flags="ng" index="tC5Ba">
        <child id="1204991552650" name="modifier" index="2f5YQi" />
        <child id="1207145245948" name="contents" index="ftER_" />
      </concept>
      <concept id="1203088046679" name="jetbrains.mps.lang.plugin.structure.ActionInstance" flags="ng" index="tCFHf">
        <reference id="1203088061055" name="action" index="tCJdB" />
      </concept>
      <concept id="1203092361741" name="jetbrains.mps.lang.plugin.structure.ModificationStatement" flags="lg" index="tT9cl">
        <reference id="1204992316090" name="point" index="2f8Tey" />
        <reference id="1203092736097" name="modifiedGroup" index="tU$_T" />
      </concept>
      <concept id="1205679047295" name="jetbrains.mps.lang.plugin.structure.ActionParameterDeclaration" flags="ig" index="2S4$dB" />
      <concept id="1206092561075" name="jetbrains.mps.lang.plugin.structure.ActionParameterReferenceOperation" flags="nn" index="3gHZIF" />
      <concept id="5538333046911348654" name="jetbrains.mps.lang.plugin.structure.RequiredCondition" flags="ng" index="1oajcY" />
      <concept id="1217413147516" name="jetbrains.mps.lang.plugin.structure.ActionParameter" flags="ngI" index="1NuADB">
        <child id="5538333046911298738" name="condition" index="1oa70y" />
      </concept>
    </language>
    <language id="ef7bf5ac-d06c-4342-b11d-e42104eb9343" name="jetbrains.mps.lang.plugin.standalone">
      <concept id="7520713872864775836" name="jetbrains.mps.lang.plugin.standalone.structure.StandalonePluginDescriptor" flags="ng" index="2DaZZR" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
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
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1513279640923991009" name="jetbrains.mps.baseLanguage.structure.IGenericClassCreator" flags="ngI" index="366HgL">
        <property id="1513279640906337053" name="inferTypeParams" index="373rjd" />
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
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
    </language>
    <language id="443f4c36-fcf5-4eb6-9500-8d06ed259e3e" name="jetbrains.mps.baseLanguage.classifiers">
      <concept id="1205752633985" name="jetbrains.mps.baseLanguage.classifiers.structure.ThisClassifierExpression" flags="nn" index="2WthIp" />
      <concept id="1205756064662" name="jetbrains.mps.baseLanguage.classifiers.structure.IMemberOperation" flags="ngI" index="2WEnae">
        <reference id="1205756909548" name="member" index="2WH_rO" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="817e4e70-961e-4a95-98a1-15e9f32231f1" name="jetbrains.mps.ide.httpsupport">
      <concept id="1829257266377339186" name="jetbrains.mps.ide.httpsupport.structure.Node_getURLOperation" flags="ng" index="2$mYbS" />
    </language>
  </registry>
  <node concept="2DaZZR" id="2vPZMAmsSPd" />
  <node concept="tC5Ba" id="2vPZMAmsSPe">
    <property role="TrG5h" value="reactGroup" />
    <node concept="tT9cl" id="2vPZMAmGAKA" role="2f5YQi">
      <ref role="tU$_T" to="tprs:hyf4Gvz" resolve="NodeActions" />
      <ref role="2f8Tey" to="tprs:7jff0wjeeqm" resolve="newActions" />
    </node>
    <node concept="tT9cl" id="2vPZMAmt4si" role="2f5YQi">
      <ref role="tU$_T" to="tprs:1JdTZ5pVxeC" resolve="EditorPopupEx" />
    </node>
    <node concept="ftmFs" id="2vPZMAmtJdh" role="ftER_">
      <node concept="tCFHf" id="2vPZMAmtJdj" role="ftvYc">
        <ref role="tCJdB" node="2vPZMAmtGRI" resolve="openInMPS" />
      </node>
      <node concept="tCFHf" id="2vPZMAmtJdl" role="ftvYc">
        <ref role="tCJdB" node="2vPZMAmt5CB" resolve="copyURL" />
      </node>
      <node concept="2a7GMi" id="2vPZMAmGBks" role="ftvYc" />
    </node>
  </node>
  <node concept="sE7Ow" id="2vPZMAmt5CB">
    <property role="1rBW0U" value="true" />
    <property role="TrG5h" value="copyURL" />
    <property role="2uzpH1" value="React: Copy URL" />
    <node concept="tnohg" id="2vPZMAmt5CC" role="tncku">
      <node concept="3clFbS" id="2vPZMAmt5CD" role="2VODD2">
        <node concept="3cpWs8" id="2vPZMAmtKX2" role="3cqZAp">
          <node concept="3cpWsn" id="2vPZMAmtKX3" role="3cpWs9">
            <property role="TrG5h" value="url" />
            <node concept="17QB3L" id="2vPZMAmtKWx" role="1tU5fm" />
            <node concept="2OqwBi" id="2vPZMAmtKX4" role="33vP2m">
              <node concept="2OqwBi" id="2vPZMAmtKX5" role="2Oq$k0">
                <node concept="2WthIp" id="2vPZMAmtKX6" role="2Oq$k0" />
                <node concept="3gHZIF" id="2vPZMAmtKX7" role="2OqNvi">
                  <ref role="2WH_rO" node="2vPZMAmtadQ" resolve="node" />
                </node>
              </node>
              <node concept="2$mYbS" id="2vPZMAmtKX8" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2vPZMAmtMLz" role="3cqZAp">
          <node concept="37vLTI" id="2vPZMAmtRp1" role="3clFbG">
            <node concept="37vLTw" id="2vPZMAmtRsz" role="37vLTJ">
              <ref role="3cqZAo" node="2vPZMAmtKX3" resolve="url" />
            </node>
            <node concept="3cpWs3" id="2vPZMAmtPZH" role="37vLTx">
              <node concept="Xl_RD" id="2vPZMAmtPZS" role="3uHU7w">
                <property role="Xl_RC" value="/client/" />
              </node>
              <node concept="2OqwBi" id="2vPZMAmtNM3" role="3uHU7B">
                <node concept="37vLTw" id="2vPZMAmtMLx" role="2Oq$k0">
                  <ref role="3cqZAo" node="2vPZMAmtKX3" resolve="url" />
                </node>
                <node concept="liA8E" id="2vPZMAmtP9o" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.replace(java.lang.CharSequence,java.lang.CharSequence)" resolve="replace" />
                  <node concept="Xl_RD" id="2vPZMAmtP9y" role="37wK5m">
                    <property role="Xl_RC" value="http://127.0.0.1:63320/node?ref=" />
                  </node>
                  <node concept="Xl_RD" id="2vPZMAmtPcK" role="37wK5m">
                    <property role="Xl_RC" value="http://localhost:43595/nodes/mps:" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="2vPZMAmtRxK" role="3cqZAp">
          <node concept="3cpWsn" id="2vPZMAmtRxJ" role="3cpWs9">
            <property role="TrG5h" value="s" />
            <node concept="3uibUv" id="2vPZMAmtRxL" role="1tU5fm">
              <ref role="3uigEE" to="kt01:~StringSelection" resolve="StringSelection" />
            </node>
            <node concept="2ShNRf" id="2vPZMAmtT$T" role="33vP2m">
              <node concept="1pGfFk" id="2vPZMAmtT_1" role="2ShVmc">
                <ref role="37wK5l" to="kt01:~StringSelection.&lt;init&gt;(java.lang.String)" resolve="StringSelection" />
                <node concept="37vLTw" id="2vPZMAmtT_2" role="37wK5m">
                  <ref role="3cqZAo" node="2vPZMAmtKX3" resolve="url" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="2vPZMAmtRxP" role="3cqZAp">
          <node concept="3cpWsn" id="2vPZMAmtRxO" role="3cpWs9">
            <property role="TrG5h" value="clipboard" />
            <node concept="3uibUv" id="2vPZMAmtRxQ" role="1tU5fm">
              <ref role="3uigEE" to="kt01:~Clipboard" resolve="Clipboard" />
            </node>
            <node concept="2OqwBi" id="2vPZMAmtZke" role="33vP2m">
              <node concept="2YIFZM" id="2vPZMAmtZgS" role="2Oq$k0">
                <ref role="1Pybhc" to="z60i:~Toolkit" resolve="Toolkit" />
                <ref role="37wK5l" to="z60i:~Toolkit.getDefaultToolkit()" resolve="getDefaultToolkit" />
              </node>
              <node concept="liA8E" id="2vPZMAmtZkf" role="2OqNvi">
                <ref role="37wK5l" to="z60i:~Toolkit.getSystemClipboard()" resolve="getSystemClipboard" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2vPZMAmtRxT" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAmtTP9" role="3clFbG">
            <node concept="37vLTw" id="2vPZMAmtS76" role="2Oq$k0">
              <ref role="3cqZAo" node="2vPZMAmtRxO" resolve="clipboard" />
            </node>
            <node concept="liA8E" id="2vPZMAmtTPa" role="2OqNvi">
              <ref role="37wK5l" to="kt01:~Clipboard.setContents(java.awt.datatransfer.Transferable,java.awt.datatransfer.ClipboardOwner)" resolve="setContents" />
              <node concept="37vLTw" id="2vPZMAmtTPb" role="37wK5m">
                <ref role="3cqZAo" node="2vPZMAmtRxJ" resolve="s" />
              </node>
              <node concept="10Nm6u" id="2vPZMAmtTPc" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2S4$dB" id="2vPZMAmtadQ" role="1NuT2Z">
      <property role="TrG5h" value="node" />
      <node concept="3Tm6S6" id="2vPZMAmtadR" role="1B3o_S" />
      <node concept="1oajcY" id="2vPZMAmtadS" role="1oa70y" />
      <node concept="3Tqbb2" id="2vPZMAmt5D2" role="1tU5fm" />
    </node>
  </node>
  <node concept="sE7Ow" id="2vPZMAmtGRI">
    <property role="1rBW0U" value="true" />
    <property role="TrG5h" value="openInMPS" />
    <property role="2uzpH1" value="React: Open in Preview" />
    <property role="2YLI8m" value="6u2MFnph2yg/read" />
    <node concept="tnohg" id="2vPZMAmtGRJ" role="tncku">
      <node concept="3clFbS" id="2vPZMAmtGRK" role="2VODD2">
        <node concept="3clFbF" id="2vPZMAmtGWc" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAmtHD6" role="3clFbG">
            <node concept="2ShNRf" id="2vPZMAmtGWa" role="2Oq$k0">
              <node concept="1pGfFk" id="2vPZMAmtH5n" role="2ShVmc">
                <property role="373rjd" value="true" />
                <ref role="37wK5l" to="e11:~OpenNodeInWebEditorAction.&lt;init&gt;()" resolve="OpenNodeInWebEditorAction" />
              </node>
            </node>
            <node concept="liA8E" id="2vPZMAmtITT" role="2OqNvi">
              <ref role="37wK5l" to="e11:~OpenNodeInWebEditorAction.actionPerformed(com.intellij.openapi.actionSystem.AnActionEvent)" resolve="actionPerformed" />
              <node concept="tl45R" id="2vPZMAmtIUP" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

