<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:b94f7f48-1129-46aa-96e6-6e08cb81f727(org.modelix.mps.react.muicomponents.intentions)">
  <persistence version="9" />
  <languages>
    <use id="d7a92d38-f7db-40d0-8431-763b0c3c9f20" name="jetbrains.mps.lang.intentions" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="8xo1" ref="r:41b64586-29ed-47f5-b907-44be07261bbc(org.modelix.mps.react.structure)" />
    <import index="zaxg" ref="r:c4183f14-1033-4ade-be7c-1beadb184134(org.modelix.mps.react.muicomponents.structure)" />
    <import index="7923" ref="r:2c5a8407-fd65-4ea4-b95e-a8f8fee129c0(org.modelix.mps.react.muicomponents.behavior)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
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
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
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
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="2524418899405758586" name="jetbrains.mps.baseLanguage.closures.structure.InferredClosureParameterDeclaration" flags="ig" index="gl6BB" />
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="d7a92d38-f7db-40d0-8431-763b0c3c9f20" name="jetbrains.mps.lang.intentions">
      <concept id="1192794744107" name="jetbrains.mps.lang.intentions.structure.IntentionDeclaration" flags="ig" index="2S6QgY" />
      <concept id="1192794782375" name="jetbrains.mps.lang.intentions.structure.DescriptionBlock" flags="in" index="2S6ZIM" />
      <concept id="1192795771125" name="jetbrains.mps.lang.intentions.structure.IsApplicableBlock" flags="in" index="2SaL7w" />
      <concept id="1192795911897" name="jetbrains.mps.lang.intentions.structure.ExecuteBlock" flags="in" index="2Sbjvc" />
      <concept id="1192796902958" name="jetbrains.mps.lang.intentions.structure.ConceptFunctionParameter_node" flags="nn" index="2Sf5sV" />
      <concept id="2522969319638091381" name="jetbrains.mps.lang.intentions.structure.BaseIntentionDeclaration" flags="ig" index="2ZfUlf">
        <reference id="2522969319638198290" name="forConcept" index="2ZfgGC" />
        <child id="2522969319638198291" name="executeFunction" index="2ZfgGD" />
        <child id="2522969319638093995" name="isApplicableFunction" index="2ZfVeh" />
        <child id="2522969319638093993" name="descriptionFunction" index="2ZfVej" />
      </concept>
      <concept id="1240316299033" name="jetbrains.mps.lang.intentions.structure.QueryBlock" flags="in" index="38BcoT">
        <child id="1240393479918" name="paramType" index="3ddBve" />
      </concept>
      <concept id="1240322627579" name="jetbrains.mps.lang.intentions.structure.IntentionParameter" flags="nn" index="38Zlrr" />
      <concept id="1240395258925" name="jetbrains.mps.lang.intentions.structure.ParameterizedIntentionDeclaration" flags="ig" index="3dkpOd">
        <child id="1240395532443" name="queryFunction" index="3dlsAV" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1138757581985" name="jetbrains.mps.lang.smodel.structure.Link_SetNewChildOperation" flags="nn" index="zfrQC" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1143224066846" name="jetbrains.mps.lang.smodel.structure.Node_InsertNextSiblingOperation" flags="nn" index="HtI8k">
        <child id="1143224066849" name="insertedNode" index="HtI8F" />
      </concept>
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1181949435690" name="jetbrains.mps.lang.smodel.structure.Concept_NewInstance" flags="nn" index="LFhST" />
      <concept id="1181952871644" name="jetbrains.mps.lang.smodel.structure.Concept_GetAllSubConcepts" flags="nn" index="LSoRf">
        <child id="1182506816063" name="smodel" index="1iTxcG" />
      </concept>
      <concept id="7504436213544206332" name="jetbrains.mps.lang.smodel.structure.Node_ContainingLinkOperation" flags="nn" index="2NL2c5" />
      <concept id="2644386474300074836" name="jetbrains.mps.lang.smodel.structure.ConceptIdRefExpression" flags="nn" index="35c_gC">
        <reference id="2644386474300074837" name="conceptDeclaration" index="35c_gD" />
      </concept>
      <concept id="6677504323281689838" name="jetbrains.mps.lang.smodel.structure.SConceptType" flags="in" index="3bZ5Sz">
        <reference id="6677504323281689839" name="conceptDeclaraton" index="3bZ5Sy" />
      </concept>
      <concept id="6870613620390542976" name="jetbrains.mps.lang.smodel.structure.ConceptAliasOperation" flags="ng" index="3n3YKJ" />
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="6407023681583036853" name="jetbrains.mps.lang.smodel.structure.NodeAttributeQualifier" flags="ng" index="3CFYIy">
        <reference id="6407023681583036854" name="attributeConcept" index="3CFYIx" />
      </concept>
      <concept id="6407023681583031218" name="jetbrains.mps.lang.smodel.structure.AttributeAccess" flags="nn" index="3CFZ6_">
        <child id="6407023681583036852" name="qualifier" index="3CFYIz" />
      </concept>
      <concept id="1140131837776" name="jetbrains.mps.lang.smodel.structure.Node_ReplaceWithAnotherOperation" flags="nn" index="1P9Npp">
        <child id="1140131861877" name="replacementNode" index="1P9ThW" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
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
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1151688443754" name="jetbrains.mps.baseLanguage.collections.structure.ListType" flags="in" index="_YKpA">
        <child id="1151688676805" name="elementType" index="_ZDj9" />
      </concept>
      <concept id="1151702311717" name="jetbrains.mps.baseLanguage.collections.structure.ToListOperation" flags="nn" index="ANE8D" />
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
      <concept id="1175845471038" name="jetbrains.mps.baseLanguage.collections.structure.ReverseOperation" flags="nn" index="35Qw8J" />
      <concept id="1165525191778" name="jetbrains.mps.baseLanguage.collections.structure.GetFirstOperation" flags="nn" index="1uHKPH" />
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
      <concept id="1176501494711" name="jetbrains.mps.baseLanguage.collections.structure.IsNotEmptyOperation" flags="nn" index="3GX2aA" />
    </language>
  </registry>
  <node concept="2S6QgY" id="G39ofCWVCV">
    <property role="3GE5qa" value="interfaces" />
    <property role="TrG5h" value="unwrap" />
    <ref role="2ZfgGC" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
    <node concept="2S6ZIM" id="G39ofCWVCW" role="2ZfVej">
      <node concept="3clFbS" id="G39ofCWVCX" role="2VODD2">
        <node concept="3clFbF" id="G39ofCWZDS" role="3cqZAp">
          <node concept="Xl_RD" id="G39ofCWZDR" role="3clFbG">
            <property role="Xl_RC" value="Unwrap" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2Sbjvc" id="G39ofCWVCY" role="2ZfgGD">
      <node concept="3clFbS" id="G39ofCWVCZ" role="2VODD2">
        <node concept="3clFbJ" id="G39ofCX6NS" role="3cqZAp">
          <node concept="3clFbS" id="G39ofCX6NU" role="3clFbx">
            <node concept="3cpWs8" id="G39ofCXFiV" role="3cqZAp">
              <node concept="3cpWsn" id="G39ofCXFiW" role="3cpWs9">
                <property role="TrG5h" value="all" />
                <node concept="_YKpA" id="G39ofCXEZ$" role="1tU5fm">
                  <node concept="3Tqbb2" id="G39ofCXEZB" role="_ZDj9">
                    <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
                  </node>
                </node>
                <node concept="2OqwBi" id="G39ofCXM3z" role="33vP2m">
                  <node concept="2OqwBi" id="G39ofCXFiX" role="2Oq$k0">
                    <node concept="2OqwBi" id="G39ofCXFiY" role="2Oq$k0">
                      <node concept="2Sf5sV" id="G39ofCXFiZ" role="2Oq$k0" />
                      <node concept="2qgKlT" id="G39ofCXFj0" role="2OqNvi">
                        <ref role="37wK5l" to="7923:G39ofCXoEe" resolve="currentChildren" />
                      </node>
                    </node>
                    <node concept="ANE8D" id="G39ofCXFj1" role="2OqNvi" />
                  </node>
                  <node concept="35Qw8J" id="G39ofCXPGH" role="2OqNvi" />
                </node>
              </node>
            </node>
            <node concept="2Gpval" id="G39ofCXQp9" role="3cqZAp">
              <node concept="2GrKxI" id="G39ofCXQpb" role="2Gsz3X">
                <property role="TrG5h" value="c" />
              </node>
              <node concept="37vLTw" id="G39ofCXQIH" role="2GsD0m">
                <ref role="3cqZAo" node="G39ofCXFiW" resolve="all" />
              </node>
              <node concept="3clFbS" id="G39ofCXQpf" role="2LFqv$">
                <node concept="3clFbF" id="G39ofCXG$w" role="3cqZAp">
                  <node concept="2OqwBi" id="G39ofCXGJ7" role="3clFbG">
                    <node concept="2Sf5sV" id="G39ofCXG$v" role="2Oq$k0" />
                    <node concept="HtI8k" id="G39ofCXHaS" role="2OqNvi">
                      <node concept="2GrUjf" id="G39ofCXRpF" role="HtI8F">
                        <ref role="2Gs0qQ" node="G39ofCXQpb" resolve="c" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="G39ofCXS3r" role="3cqZAp">
              <node concept="2OqwBi" id="G39ofCXSgN" role="3clFbG">
                <node concept="2Sf5sV" id="G39ofCXS3q" role="2Oq$k0" />
                <node concept="3YRAZt" id="G39ofCXSG$" role="2OqNvi" />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="G39ofCX5kZ" role="3clFbw">
            <node concept="2OqwBi" id="G39ofCX06F" role="2Oq$k0">
              <node concept="2Sf5sV" id="G39ofCWZXl" role="2Oq$k0" />
              <node concept="2NL2c5" id="G39ofCX4ha" role="2OqNvi" />
            </node>
            <node concept="liA8E" id="G39ofCX6cR" role="2OqNvi">
              <ref role="37wK5l" to="c17a:~SAbstractLink.isMultiple()" resolve="isMultiple" />
            </node>
          </node>
          <node concept="9aQIb" id="G39ofCXzkV" role="9aQIa">
            <node concept="3clFbS" id="G39ofCXzkW" role="9aQI4">
              <node concept="3clFbF" id="G39ofCX$hP" role="3cqZAp">
                <node concept="2OqwBi" id="G39ofCX$sb" role="3clFbG">
                  <node concept="2Sf5sV" id="G39ofCX$hO" role="2Oq$k0" />
                  <node concept="1P9Npp" id="G39ofCX$Sp" role="2OqNvi">
                    <node concept="2OqwBi" id="G39ofCXAgn" role="1P9ThW">
                      <node concept="2OqwBi" id="G39ofCX_bz" role="2Oq$k0">
                        <node concept="2Sf5sV" id="G39ofCX_b$" role="2Oq$k0" />
                        <node concept="2qgKlT" id="G39ofCX_b_" role="2OqNvi">
                          <ref role="37wK5l" to="7923:G39ofCXoEe" resolve="currentChildren" />
                        </node>
                      </node>
                      <node concept="1uHKPH" id="G39ofCXBK$" role="2OqNvi" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2SaL7w" id="G39ofCXmhq" role="2ZfVeh">
      <node concept="3clFbS" id="G39ofCXmhr" role="2VODD2">
        <node concept="3clFbF" id="G39ofCXmNr" role="3cqZAp">
          <node concept="2OqwBi" id="G39ofCXuAm" role="3clFbG">
            <node concept="2OqwBi" id="G39ofCXna1" role="2Oq$k0">
              <node concept="2Sf5sV" id="G39ofCXmNq" role="2Oq$k0" />
              <node concept="2qgKlT" id="G39ofCXtDj" role="2OqNvi">
                <ref role="37wK5l" to="7923:G39ofCXoEe" resolve="currentChildren" />
              </node>
            </node>
            <node concept="3GX2aA" id="G39ofCXx8B" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="2S6QgY" id="2xzaHpfUtjg">
    <property role="TrG5h" value="attachErrorReporting" />
    <ref role="2ZfgGC" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
    <node concept="2S6ZIM" id="2xzaHpfUtjh" role="2ZfVej">
      <node concept="3clFbS" id="2xzaHpfUtji" role="2VODD2">
        <node concept="3clFbF" id="2xzaHpfUv2z" role="3cqZAp">
          <node concept="Xl_RD" id="2xzaHpfUv2y" role="3clFbG">
            <property role="Xl_RC" value="Attach error reporting" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2Sbjvc" id="2xzaHpfUtjj" role="2ZfgGD">
      <node concept="3clFbS" id="2xzaHpfUtjk" role="2VODD2">
        <node concept="3clFbF" id="2xzaHpfUzvY" role="3cqZAp">
          <node concept="2OqwBi" id="2xzaHpfU$_f" role="3clFbG">
            <node concept="2OqwBi" id="2xzaHpfUzDj" role="2Oq$k0">
              <node concept="2Sf5sV" id="2xzaHpfUzvX" role="2Oq$k0" />
              <node concept="3CFZ6_" id="2xzaHpfU$6j" role="2OqNvi">
                <node concept="3CFYIy" id="2xzaHpfU$q9" role="3CFYIz">
                  <ref role="3CFYIx" to="zaxg:2xzaHpfUqlh" resolve="ErrorReportingAnnotation" />
                </node>
              </node>
            </node>
            <node concept="zfrQC" id="2xzaHpfU_7i" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2SaL7w" id="2xzaHpfUvoN" role="2ZfVeh">
      <node concept="3clFbS" id="2xzaHpfUvoO" role="2VODD2">
        <node concept="3clFbF" id="2xzaHpfUwXf" role="3cqZAp">
          <node concept="2OqwBi" id="2xzaHpfUyxY" role="3clFbG">
            <node concept="2OqwBi" id="2xzaHpfUxl$" role="2Oq$k0">
              <node concept="2Sf5sV" id="2xzaHpfUwXe" role="2Oq$k0" />
              <node concept="3CFZ6_" id="2xzaHpfUxMk" role="2OqNvi">
                <node concept="3CFYIy" id="2xzaHpfUy7B" role="3CFYIz">
                  <ref role="3CFYIx" to="zaxg:2xzaHpfUqlh" resolve="ErrorReportingAnnotation" />
                </node>
              </node>
            </node>
            <node concept="3w_OXm" id="2xzaHpfUz7D" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="3dkpOd" id="2vPZMAnsO$D">
    <property role="TrG5h" value="wrapGeneric" />
    <ref role="2ZfgGC" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
    <node concept="38BcoT" id="2vPZMAnsO$E" role="3dlsAV">
      <node concept="3bZ5Sz" id="2vPZMAnsZ1h" role="3ddBve">
        <ref role="3bZ5Sy" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
      </node>
      <node concept="3clFbS" id="2vPZMAnsO$G" role="2VODD2">
        <node concept="3clFbF" id="2vPZMAnsRHd" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAntgN_" role="3clFbG">
            <node concept="2OqwBi" id="2vPZMAnt9_W" role="2Oq$k0">
              <node concept="2OqwBi" id="2vPZMAnsSyL" role="2Oq$k0">
                <node concept="35c_gC" id="2vPZMAnsRHb" role="2Oq$k0">
                  <ref role="35c_gD" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
                </node>
                <node concept="LSoRf" id="2vPZMAnsTes" role="2OqNvi">
                  <node concept="2OqwBi" id="2vPZMAnsT$$" role="1iTxcG">
                    <node concept="2Sf5sV" id="2vPZMAnsTqb" role="2Oq$k0" />
                    <node concept="I4A8Y" id="2vPZMAnsTAJ" role="2OqNvi" />
                  </node>
                </node>
              </node>
              <node concept="3zZkjj" id="2vPZMAntcB2" role="2OqNvi">
                <node concept="1bVj0M" id="2vPZMAntcB4" role="23t8la">
                  <node concept="3clFbS" id="2vPZMAntcB5" role="1bW5cS">
                    <node concept="3clFbF" id="2vPZMAntcBg" role="3cqZAp">
                      <node concept="3fqX7Q" id="2vPZMAntnTi" role="3clFbG">
                        <node concept="2OqwBi" id="2vPZMAntnTk" role="3fr31v">
                          <node concept="37vLTw" id="2vPZMAntnTl" role="2Oq$k0">
                            <ref role="3cqZAo" node="2vPZMAntcB6" resolve="it" />
                          </node>
                          <node concept="liA8E" id="2vPZMAntnTm" role="2OqNvi">
                            <ref role="37wK5l" to="c17a:~SAbstractConcept.isAbstract()" resolve="isAbstract" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="gl6BB" id="2vPZMAntcB6" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="2vPZMAntcB7" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="ANE8D" id="2vPZMAntk6U" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2S6ZIM" id="2vPZMAnsO$H" role="2ZfVej">
      <node concept="3clFbS" id="2vPZMAnsO$I" role="2VODD2">
        <node concept="3cpWs8" id="af0_0D4cLV" role="3cqZAp">
          <node concept="3cpWsn" id="af0_0D4cLW" role="3cpWs9">
            <property role="TrG5h" value="l" />
            <node concept="17QB3L" id="af0_0D4cuA" role="1tU5fm" />
            <node concept="2OqwBi" id="af0_0D4cLX" role="33vP2m">
              <node concept="38Zlrr" id="af0_0D4cLY" role="2Oq$k0" />
              <node concept="3n3YKJ" id="af0_0D4cLZ" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="af0_0D4dSV" role="3cqZAp">
          <node concept="3clFbS" id="af0_0D4dSX" role="3clFbx">
            <node concept="3clFbF" id="af0_0D4hjA" role="3cqZAp">
              <node concept="37vLTI" id="af0_0D4jPs" role="3clFbG">
                <node concept="2OqwBi" id="af0_0D4lET" role="37vLTx">
                  <node concept="38Zlrr" id="af0_0D4kCK" role="2Oq$k0" />
                  <node concept="liA8E" id="af0_0D4mtq" role="2OqNvi">
                    <ref role="37wK5l" to="c17a:~SAbstractConcept.getName()" resolve="getName" />
                  </node>
                </node>
                <node concept="37vLTw" id="af0_0D4hj$" role="37vLTJ">
                  <ref role="3cqZAo" node="af0_0D4cLW" resolve="l" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbC" id="af0_0D4fWD" role="3clFbw">
            <node concept="10Nm6u" id="af0_0D4gZI" role="3uHU7w" />
            <node concept="37vLTw" id="af0_0D4ecE" role="3uHU7B">
              <ref role="3cqZAo" node="af0_0D4cLW" resolve="l" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2vPZMAnt2i1" role="3cqZAp">
          <node concept="3cpWs3" id="2vPZMAnt5xq" role="3clFbG">
            <node concept="37vLTw" id="af0_0D4cM0" role="3uHU7w">
              <ref role="3cqZAo" node="af0_0D4cLW" resolve="l" />
            </node>
            <node concept="Xl_RD" id="2vPZMAnt2i0" role="3uHU7B">
              <property role="Xl_RC" value="Wrap with " />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2Sbjvc" id="2vPZMAnsO$J" role="2ZfgGD">
      <node concept="3clFbS" id="2vPZMAnsO$K" role="2VODD2">
        <node concept="3cpWs8" id="2vPZMAnt17r" role="3cqZAp">
          <node concept="3cpWsn" id="2vPZMAnt17s" role="3cpWs9">
            <property role="TrG5h" value="wrapper" />
            <node concept="3Tqbb2" id="2vPZMAnt16A" role="1tU5fm">
              <ref role="ehGHo" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
            </node>
            <node concept="1PxgMI" id="2vPZMAnt17t" role="33vP2m">
              <node concept="chp4Y" id="2vPZMAnt17u" role="3oSUPX">
                <ref role="cht4Q" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
              </node>
              <node concept="2OqwBi" id="2vPZMAnt17v" role="1m5AlR">
                <node concept="38Zlrr" id="2vPZMAnt17w" role="2Oq$k0" />
                <node concept="LFhST" id="2vPZMAnt17x" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2vPZMAnt1S9" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAnt247" role="3clFbG">
            <node concept="2Sf5sV" id="2vPZMAnt1S8" role="2Oq$k0" />
            <node concept="1P9Npp" id="2vPZMAnt7m4" role="2OqNvi">
              <node concept="37vLTw" id="2vPZMAnt7mI" role="1P9ThW">
                <ref role="3cqZAo" node="2vPZMAnt17s" resolve="wrapper" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2vPZMAnsZhc" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAnt1kw" role="3clFbG">
            <node concept="37vLTw" id="2vPZMAnt17y" role="2Oq$k0">
              <ref role="3cqZAo" node="2vPZMAnt17s" resolve="wrapper" />
            </node>
            <node concept="2qgKlT" id="2vPZMAnt1Ig" role="2OqNvi">
              <ref role="37wK5l" to="7923:2vPZMAnsyqb" resolve="wrap" />
              <node concept="2Sf5sV" id="2vPZMAnt1Pl" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2SaL7w" id="gNsEGB2FNn" role="2ZfVeh">
      <node concept="3clFbS" id="gNsEGB2FNo" role="2VODD2">
        <node concept="3clFbF" id="gNsEGB2I51" role="3cqZAp">
          <node concept="2OqwBi" id="gNsEGB2IS0" role="3clFbG">
            <node concept="1PxgMI" id="gNsEGB2I53" role="2Oq$k0">
              <node concept="chp4Y" id="gNsEGB2I54" role="3oSUPX">
                <ref role="cht4Q" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
              </node>
              <node concept="2OqwBi" id="gNsEGB2I55" role="1m5AlR">
                <node concept="38Zlrr" id="gNsEGB2I56" role="2Oq$k0" />
                <node concept="LFhST" id="gNsEGB2I57" role="2OqNvi" />
              </node>
            </node>
            <node concept="2qgKlT" id="gNsEGB2J$m" role="2OqNvi">
              <ref role="37wK5l" to="7923:gNsEGB2zdH" resolve="canThisBeWrapped" />
              <node concept="2Sf5sV" id="gNsEGB2JSr" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

