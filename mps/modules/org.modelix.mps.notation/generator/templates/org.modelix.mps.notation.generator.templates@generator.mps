<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2fe6cd77-4aa8-40a0-b3ed-e4eb6d6a496f(org.modelix.mps.notation.generator.templates@generator)">
  <persistence version="9" />
  <languages>
    <use id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator" version="4" />
    <use id="c7b55726-1795-47bd-aa21-714ac1e30f21" name="org.modelix.mps.notation" version="0" />
    <use id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext" version="2" />
    <use id="df345b11-b8c7-4213-ac66-48d2a9b75d88" name="jetbrains.mps.baseLanguageInternal" version="0" />
    <use id="515552c7-fcc0-4ab4-9789-2f3c49344e85" name="jetbrains.mps.baseLanguage.varVariable" version="0" />
    <use id="446c26eb-2b7b-4bf0-9b35-f83fa582753e" name="jetbrains.mps.lang.modelapi" version="0" />
    <devkit ref="a2eb3a43-fcc2-4200-80dc-c60110c4862d(jetbrains.mps.devkit.templates)" />
  </languages>
  <imports>
    <import index="f8gn" ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)" />
    <import index="2k9e" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.adapter.structure(MPS.Core/)" />
    <import index="e8bb" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.adapter.ids(MPS.Core/)" />
    <import index="tpcn" ref="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" />
    <import index="18ew" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.util(MPS.Core/)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="ljn7" ref="771cf896-ab1b-409b-93b4-48c3bbb6b23f/java:org.modelix.editor.ssr.mps(org.modelix.mps.editor.ssr.stubs/)" />
    <import index="x83f" ref="771cf896-ab1b-409b-93b4-48c3bbb6b23f/java:org.modelix.aspects(org.modelix.mps.editor.ssr.stubs/)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="mhfm" ref="3f233e7f-b8a6-46d2-a57f-795d56775243/java:org.jetbrains.annotations(Annotations/)" />
    <import index="jej1" ref="771cf896-ab1b-409b-93b4-48c3bbb6b23f/java:org.modelix.editor(org.modelix.mps.editor.ssr.stubs/)" />
    <import index="v18h" ref="498d89d2-c2e9-11e2-ad49-6cf049e62fe5/java:kotlin(MPS.IDEA/)" />
    <import index="zxfz" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.mpsadapters(org.modelix.mps.editor.common.stubs/)" />
    <import index="jks5" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.api(org.modelix.mps.editor.common.stubs/)" />
    <import index="1ut2" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.mpsadapters.tomps(org.modelix.mps.editor.common.stubs/)" />
    <import index="i8bi" ref="r:c3548bac-30eb-4a2a-937c-0111d5697309(jetbrains.mps.lang.smodel.generator.smodelAdapter)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tp68" ref="r:00000000-0000-4000-0000-011c895903ac(jetbrains.mps.baseLanguageInternal.structure)" />
    <import index="wsib" ref="r:d1d5cd51-6710-43f8-bd5b-f958da6e1ca2(org.modelix.mps.notation.behavior)" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1188207840427" name="jetbrains.mps.baseLanguage.structure.AnnotationInstance" flags="nn" index="2AHcQZ">
        <reference id="1188208074048" name="annotation" index="2AI5Lk" />
      </concept>
      <concept id="1188208481402" name="jetbrains.mps.baseLanguage.structure.HasAnnotation" flags="ngI" index="2AJDlI">
        <child id="1188208488637" name="annotation" index="2AJF6D" />
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
      <concept id="1070462154015" name="jetbrains.mps.baseLanguage.structure.StaticFieldDeclaration" flags="ig" index="Wx3nA" />
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068390468200" name="jetbrains.mps.baseLanguage.structure.FieldDeclaration" flags="ig" index="312cEg" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu">
        <child id="1095933932569" name="implementedInterface" index="EKbjA" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1513279640923991009" name="jetbrains.mps.baseLanguage.structure.IGenericClassCreator" flags="ngI" index="366HgL">
        <property id="1513279640906337053" name="inferTypeParams" index="373rjd" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="1225271408483" name="jetbrains.mps.baseLanguage.structure.IsNotEmptyOperation" flags="nn" index="17RvpY" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123165" name="jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration" flags="ig" index="3clFb_" />
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068580123140" name="jetbrains.mps.baseLanguage.structure.ConstructorDeclaration" flags="ig" index="3clFbW" />
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
        <child id="1109201940907" name="parameter" index="11_B2D" />
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
      <concept id="6329021646629104954" name="jetbrains.mps.baseLanguage.structure.SingleLineComment" flags="nn" index="3SKdUt">
        <child id="8356039341262087992" name="line" index="1aUNEU" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
    </language>
    <language id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator">
      <concept id="1510949579266781519" name="jetbrains.mps.lang.generator.structure.TemplateCallMacro" flags="ln" index="5jKBG">
        <child id="1510949579266801461" name="sourceNodeQuery" index="5jGum" />
      </concept>
      <concept id="1114706874351" name="jetbrains.mps.lang.generator.structure.CopySrcNodeMacro" flags="ln" index="29HgVG">
        <child id="1168024447342" name="sourceNodeQuery" index="3NFExx" />
      </concept>
      <concept id="1219952072943" name="jetbrains.mps.lang.generator.structure.DropRootRule" flags="lg" index="aNPBN">
        <reference id="1219952338328" name="applicableConcept" index="aOQi4" />
      </concept>
      <concept id="1114729360583" name="jetbrains.mps.lang.generator.structure.CopySrcListMacro" flags="ln" index="2b32R4">
        <child id="1168278589236" name="sourceNodesQuery" index="2P8S$" />
      </concept>
      <concept id="1095416546421" name="jetbrains.mps.lang.generator.structure.MappingConfiguration" flags="ig" index="bUwia">
        <child id="1219952894531" name="dropRootRule" index="aQYdv" />
        <child id="1167088157977" name="createRootRule" index="2VS0gm" />
        <child id="1167328349397" name="reductionMappingRule" index="3acgRq" />
      </concept>
      <concept id="1177093525992" name="jetbrains.mps.lang.generator.structure.InlineTemplate_RuleConsequence" flags="lg" index="gft3U">
        <child id="1177093586806" name="templateNode" index="gfFT$" />
      </concept>
      <concept id="1168619357332" name="jetbrains.mps.lang.generator.structure.RootTemplateAnnotation" flags="lg" index="n94m4" />
      <concept id="1095672379244" name="jetbrains.mps.lang.generator.structure.TemplateFragment" flags="ng" index="raruj" />
      <concept id="1722980698497626400" name="jetbrains.mps.lang.generator.structure.ITemplateCall" flags="ngI" index="v9R3L">
        <reference id="1722980698497626483" name="template" index="v9R2y" />
      </concept>
      <concept id="1167087469898" name="jetbrains.mps.lang.generator.structure.CreateRootRule" flags="lg" index="2VPoh5">
        <reference id="1167087469901" name="templateNode" index="2VPoh2" />
      </concept>
      <concept id="1167168920554" name="jetbrains.mps.lang.generator.structure.BaseMappingRule_Condition" flags="in" index="30G5F_" />
      <concept id="1167169188348" name="jetbrains.mps.lang.generator.structure.TemplateFunctionParameter_sourceNode" flags="nn" index="30H73N" />
      <concept id="1167169308231" name="jetbrains.mps.lang.generator.structure.BaseMappingRule" flags="ng" index="30H$t8">
        <reference id="1167169349424" name="applicableConcept" index="30HIoZ" />
        <child id="1167169362365" name="conditionFunction" index="30HLyM" />
      </concept>
      <concept id="1092059087312" name="jetbrains.mps.lang.generator.structure.TemplateDeclaration" flags="ig" index="13MO4I">
        <reference id="1168285871518" name="applicableConcept" index="3gUMe" />
        <child id="1092060348987" name="contentNode" index="13RCb5" />
      </concept>
      <concept id="1087833241328" name="jetbrains.mps.lang.generator.structure.PropertyMacro" flags="ln" index="17Uvod">
        <child id="1167756362303" name="propertyValueFunction" index="3zH0cK" />
      </concept>
      <concept id="1167327847730" name="jetbrains.mps.lang.generator.structure.Reduction_MappingRule" flags="lg" index="3aamgX">
        <child id="1169672767469" name="ruleConsequence" index="1lVwrX" />
      </concept>
      <concept id="1184690432998" name="jetbrains.mps.lang.generator.structure.TemplateFunctionParameter_outputNode" flags="nn" index="3l3mFP" />
      <concept id="1167756080639" name="jetbrains.mps.lang.generator.structure.PropertyMacro_GetPropertyValue" flags="in" index="3zFVjK" />
      <concept id="1167770111131" name="jetbrains.mps.lang.generator.structure.ReferenceMacro_GetReferent" flags="in" index="3$xsQk" />
      <concept id="1167945743726" name="jetbrains.mps.lang.generator.structure.IfMacro_Condition" flags="in" index="3IZrLx" />
      <concept id="1167951910403" name="jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodesQuery" flags="in" index="3JmXsc" />
      <concept id="8900764248744213868" name="jetbrains.mps.lang.generator.structure.InlineTemplateWithContext_RuleConsequence" flags="lg" index="1Koe21">
        <child id="8900764248744213871" name="contentNode" index="1Koe22" />
      </concept>
      <concept id="1168024337012" name="jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodeQuery" flags="in" index="3NFfHV" />
      <concept id="1118773211870" name="jetbrains.mps.lang.generator.structure.IfMacro" flags="ln" index="1W57fq">
        <child id="1194989344771" name="alternativeConsequence" index="UU_$l" />
        <child id="1167945861827" name="conditionFunction" index="3IZSJc" />
      </concept>
      <concept id="1118786554307" name="jetbrains.mps.lang.generator.structure.LoopMacro" flags="ln" index="1WS0z7">
        <child id="1167952069335" name="sourceNodesQuery" index="3Jn$fo" />
      </concept>
      <concept id="1088761943574" name="jetbrains.mps.lang.generator.structure.ReferenceMacro" flags="ln" index="1ZhdrF">
        <child id="1167770376702" name="referentFunction" index="3$ytzL" />
      </concept>
    </language>
    <language id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext">
      <concept id="1218047638031" name="jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_CreateUniqueName" flags="nn" index="2piZGk">
        <child id="1218047638032" name="baseName" index="2piZGb" />
      </concept>
      <concept id="1216860049635" name="jetbrains.mps.lang.generator.generationContext.structure.TemplateFunctionParameter_generationContext" flags="nn" index="1iwH7S" />
      <concept id="1217004708011" name="jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetInputModel" flags="nn" index="1r8y6K" />
    </language>
    <language id="446c26eb-2b7b-4bf0-9b35-f83fa582753e" name="jetbrains.mps.lang.modelapi">
      <concept id="4733039728785194814" name="jetbrains.mps.lang.modelapi.structure.NamedNodeReference" flags="ng" index="ZC_QK">
        <reference id="7256306938026143658" name="target" index="2aWVGs" />
        <child id="7256306938026143676" name="child" index="2aWVGa" />
      </concept>
    </language>
    <language id="df345b11-b8c7-4213-ac66-48d2a9b75d88" name="jetbrains.mps.baseLanguageInternal">
      <concept id="3329300704499081004" name="jetbrains.mps.baseLanguageInternal.structure.InternalLambdaExpression" flags="ng" index="3s519P">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
        <child id="3329300704499081622" name="returnType" index="3s52Nf" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="5045161044515397667" name="jetbrains.mps.lang.smodel.structure.Node_PointerOperation" flags="ng" index="iZEcu" />
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="7400021826774799413" name="jetbrains.mps.lang.smodel.structure.NodePointerExpression" flags="ng" index="2tJFMh">
        <child id="7400021826774799510" name="ref" index="2tJFKM" />
      </concept>
      <concept id="4693937538533521280" name="jetbrains.mps.lang.smodel.structure.OfConceptOperation" flags="ng" index="v3k3i">
        <child id="4693937538533538124" name="requestedConcept" index="v3oSu" />
      </concept>
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1171315804604" name="jetbrains.mps.lang.smodel.structure.Model_RootsOperation" flags="nn" index="2RRcyG">
        <child id="6750920497477046361" name="conceptArgument" index="3MHsoP" />
      </concept>
      <concept id="3562215692195599741" name="jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect" flags="nn" index="13MTOL">
        <reference id="3562215692195600259" name="link" index="13MTZf" />
      </concept>
      <concept id="2644386474302386080" name="jetbrains.mps.lang.smodel.structure.PropertyIdRefExpression" flags="nn" index="355D3s">
        <reference id="2644386474302386081" name="conceptDeclaration" index="355D3t" />
        <reference id="2644386474302386082" name="propertyDeclaration" index="355D3u" />
      </concept>
      <concept id="2644386474301421077" name="jetbrains.mps.lang.smodel.structure.LinkIdRefExpression" flags="nn" index="359W_D">
        <reference id="2644386474301421078" name="conceptDeclaration" index="359W_E" />
        <reference id="2644386474301421079" name="linkDeclaration" index="359W_F" />
      </concept>
      <concept id="2644386474300074836" name="jetbrains.mps.lang.smodel.structure.ConceptIdRefExpression" flags="nn" index="35c_gC">
        <reference id="2644386474300074837" name="conceptDeclaration" index="35c_gD" />
      </concept>
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2" />
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
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="3364660638048049750" name="jetbrains.mps.lang.core.structure.PropertyAttribute" flags="ng" index="A9Btg">
        <property id="1757699476691236117" name="name_DebugInfo" index="2qtEX9" />
        <property id="1341860900487648621" name="propertyId" index="P4ACc" />
      </concept>
      <concept id="3364660638048049745" name="jetbrains.mps.lang.core.structure.LinkAttribute" flags="ng" index="A9Btn">
        <property id="1757699476691236116" name="role_DebugInfo" index="2qtEX8" />
        <property id="1341860900488019036" name="linkId" index="P3scX" />
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
    <language id="515552c7-fcc0-4ab4-9789-2f3c49344e85" name="jetbrains.mps.baseLanguage.varVariable">
      <concept id="1177714083117" name="jetbrains.mps.baseLanguage.varVariable.structure.VarType" flags="in" index="PeGgZ" />
      <concept id="1236693300889" name="jetbrains.mps.baseLanguage.varVariable.structure.VarVariableDeclaration" flags="ng" index="3KEzu6" />
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1172650591544" name="jetbrains.mps.baseLanguage.collections.structure.SkipOperation" flags="nn" index="7r0gD">
        <child id="1172658456740" name="elementsToSkip" index="7T0AP" />
      </concept>
      <concept id="1237721394592" name="jetbrains.mps.baseLanguage.collections.structure.AbstractContainerCreator" flags="nn" index="HWqM0">
        <child id="1237721435808" name="initValue" index="HW$Y0" />
        <child id="1237721435807" name="elementType" index="HW$YZ" />
      </concept>
      <concept id="1160600644654" name="jetbrains.mps.baseLanguage.collections.structure.ListCreatorWithInit" flags="nn" index="Tc6Ow" />
      <concept id="1165525191778" name="jetbrains.mps.baseLanguage.collections.structure.GetFirstOperation" flags="nn" index="1uHKPH" />
    </language>
  </registry>
  <node concept="bUwia" id="3hw8cNzhJ6K">
    <property role="TrG5h" value="main" />
    <node concept="aNPBN" id="54VjPcDfUlX" role="aQYdv">
      <ref role="aOQi4" to="f8gn:7dm8yUsM9Ro" resolve="NotationModule" />
    </node>
    <node concept="2VPoh5" id="22f9nDgLfkO" role="2VS0gm">
      <ref role="2VPoh2" node="7HT$1xKu5Jt" resolve="AspectsDescriptor" />
    </node>
    <node concept="3aamgX" id="1vEPqpZ9vfI" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:7dm8yUsMxrq" resolve="ConstantCell" />
      <node concept="1Koe21" id="1vEPqpZ9zDC" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZ9_wL" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZ9$NW" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZ9_kw" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZ9_PL" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZ9_Qn" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZ9_RS" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV7Sw" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV7Ui" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5f3" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5hL" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5hM" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5hN" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZ9EDr" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZ9GiV" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZ9GEn" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZ9GiT" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5f3" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlxG" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlxH" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlxI" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlxJ" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlxK" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlxL" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZ9J9w" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.constant(java.lang.String,kotlin.jvm.functions.Function1)" resolve="constant" />
                      <node concept="Xl_RD" id="1vEPqpZ9Jwv" role="37wK5m">
                        <property role="Xl_RC" value="abc" />
                        <node concept="17Uvod" id="1vEPqpZ9Tkj" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="1vEPqpZ9Tkk" role="3zH0cK">
                            <node concept="3clFbS" id="1vEPqpZ9Tkl" role="2VODD2">
                              <node concept="3clFbF" id="1vEPqpZ9Uda" role="3cqZAp">
                                <node concept="2YIFZM" id="1vEPqpZ9Udb" role="3clFbG">
                                  <ref role="37wK5l" to="18ew:~NameUtil.escapeString(java.lang.String)" resolve="escapeString" />
                                  <ref role="1Pybhc" to="18ew:~NameUtil" resolve="NameUtil" />
                                  <node concept="2OqwBi" id="1vEPqpZ9Udc" role="37wK5m">
                                    <node concept="30H73N" id="1vEPqpZ9Udd" role="2Oq$k0" />
                                    <node concept="3TrcHB" id="1vEPqpZ9Ude" role="2OqNvi">
                                      <ref role="3TsBF5" to="f8gn:7dm8yUsMxD1" resolve="text" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV7Uj" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV7W5" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI5hO" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI5nC" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI5nD" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI5nE" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEfS" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEfT" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEfU" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEfV" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEfW" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEfX" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEfY" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEfZ" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1vEPqpZ9Mse" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxTZ_" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxTZ$" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxTZz" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxTZy" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxTZx" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxTZw" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxTZu" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxTZv" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1vEPqpZ9QR2" role="3cqZAp">
                            <node concept="10M0yZ" id="1vEPqpZ9QR3" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZ9VQj" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZ9EDY" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZ9EDZ" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZ9WWD" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhEA4oz" resolve="RemoveSpace" />
      <node concept="1Koe21" id="1vEPqpZ9WWE" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZ9WWF" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZ9WWG" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZ9WWH" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZ9WWI" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZ9WWJ" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZ9WWK" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV7W6" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV7XS" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5nF" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5qp" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5qq" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5qr" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZ9WWO" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZ9WWP" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZ9WWQ" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZ9WWR" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5nF" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlxM" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlxN" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlxO" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlxP" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlxQ" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlxR" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZ9WWS" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.noSpace()" resolve="noSpace" />
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZ9WX8" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZ9WX9" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZ9WXa" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZa9M8" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4dQjfTHYohE" resolve="NewLineCell" />
      <node concept="1Koe21" id="1vEPqpZa9M9" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZa9Ma" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZa9Mb" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZa9Mc" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZa9Md" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZa9Me" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZa9Mf" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV7XT" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV7ZF" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5qs" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5ta" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5tb" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5tc" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZa9Mj" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZa9Mk" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZa9Ml" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZa9Mm" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5qs" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlxS" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlxT" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlxU" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlxV" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlxW" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlxX" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZa9Mn" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.newLine()" resolve="newLine" />
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZa9Mo" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZa9Mp" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZa9Mq" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZagBn" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhE_FoM" resolve="ConceptAliasCell" />
      <node concept="1Koe21" id="1vEPqpZagBo" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZagBp" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZagBq" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZagBr" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZagBs" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZagBt" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZagBu" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV7ZG" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV81u" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5td" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5vV" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5vW" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5vX" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZagBy" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZagBz" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZagB$" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZagB_" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5td" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlxY" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlxZ" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRly0" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRly1" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRly2" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRly3" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZagBA" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.conceptAlias(kotlin.jvm.functions.Function1)" resolve="conceptAlias" />
                      <node concept="3s519P" id="HgolRSV81v" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV83h" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI5vY" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI5_E" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI5_F" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI5_G" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEg0" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEg1" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEg2" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEg3" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEg4" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEg5" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEg6" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEg7" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1vEPqpZapxR" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxTZH" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxTZG" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxTZF" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxTZE" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxTZD" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxTZC" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxTZA" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxTZB" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1vEPqpZapxS" role="3cqZAp">
                            <node concept="10M0yZ" id="1vEPqpZapxT" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZagBB" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZagBC" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZagBD" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZaquo" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhEAsOy" resolve="SubstituteCell" />
      <node concept="1Koe21" id="1vEPqpZaqup" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZaquq" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZaqur" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZaqus" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZaqut" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZaquu" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZaquv" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV83i" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV854" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5_H" role="1bW2Oz">
                <property role="TrG5h" value="rootBuilder" />
                <node concept="3uibUv" id="4HILH0eI5Cr" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5Cs" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5Ct" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZaquz" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZaqu$" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZaqu_" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZaquA" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5_H" resolve="rootBuilder" />
                    </node>
                    <node concept="liA8E" id="1vEPqpZaquB" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~NotationRootCellTemplateBuilder.completionText(java.lang.String)" resolve="completionText" />
                      <node concept="Xl_RD" id="1vEPqpZaz0T" role="37wK5m">
                        <property role="Xl_RC" value="text" />
                        <node concept="17Uvod" id="1vEPqpZa$It" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="1vEPqpZa$Iu" role="3zH0cK">
                            <node concept="3clFbS" id="1vEPqpZa$Iv" role="2VODD2">
                              <node concept="3SKdUt" id="1vEPqpZa_g2" role="3cqZAp">
                                <node concept="1PaTwC" id="1vEPqpZa_g3" role="1aUNEU">
                                  <node concept="3oM_SD" id="1vEPqpZa_g4" role="1PaTwD">
                                    <property role="3oM_SC" value="empty" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_g5" role="1PaTwD">
                                    <property role="3oM_SC" value="string" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_g6" role="1PaTwD">
                                    <property role="3oM_SC" value="hides" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_g7" role="1PaTwD">
                                    <property role="3oM_SC" value="the" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_g8" role="1PaTwD">
                                    <property role="3oM_SC" value="entry." />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_g9" role="1PaTwD">
                                    <property role="3oM_SC" value="null" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_ga" role="1PaTwD">
                                    <property role="3oM_SC" value="would" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_gb" role="1PaTwD">
                                    <property role="3oM_SC" value="have" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_gc" role="1PaTwD">
                                    <property role="3oM_SC" value="no" />
                                  </node>
                                  <node concept="3oM_SD" id="1vEPqpZa_gd" role="1PaTwD">
                                    <property role="3oM_SC" value="effect." />
                                  </node>
                                </node>
                              </node>
                              <node concept="3clFbF" id="1vEPqpZa_ge" role="3cqZAp">
                                <node concept="3K4zz7" id="1vEPqpZa_gf" role="3clFbG">
                                  <node concept="Xl_RD" id="1vEPqpZa_gg" role="3K4E3e">
                                    <property role="Xl_RC" value="" />
                                  </node>
                                  <node concept="3clFbC" id="1vEPqpZa_gh" role="3K4Cdx">
                                    <node concept="10Nm6u" id="1vEPqpZa_gi" role="3uHU7w" />
                                    <node concept="2OqwBi" id="1vEPqpZa_gj" role="3uHU7B">
                                      <node concept="30H73N" id="1vEPqpZa_gk" role="2Oq$k0" />
                                      <node concept="3TrcHB" id="1vEPqpZa_gl" role="2OqNvi">
                                        <ref role="3TsBF5" to="f8gn:ziPuhEAsOB" resolve="text" />
                                      </node>
                                    </node>
                                  </node>
                                  <node concept="2OqwBi" id="1vEPqpZa_gm" role="3K4GZi">
                                    <node concept="30H73N" id="1vEPqpZa_gn" role="2Oq$k0" />
                                    <node concept="3TrcHB" id="1vEPqpZa_go" role="2OqNvi">
                                      <ref role="3TsBF5" to="f8gn:ziPuhEAsOB" resolve="text" />
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
                  <node concept="raruj" id="1vEPqpZaquI" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZaquJ" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZaquK" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZaAri" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhE_VbT" resolve="OptionalCell" />
      <node concept="1Koe21" id="1vEPqpZaArj" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZaArk" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZaArl" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZaArm" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZaArn" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZaAro" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZaArp" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV855" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV86R" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5Cu" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5Fc" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5Fd" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5Fe" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZaArt" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZaAru" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZaArv" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZaArw" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5Cu" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRly4" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRly5" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRly6" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRly7" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRly8" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRly9" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZaArx" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.optional(kotlin.jvm.functions.Function1)" resolve="optional" />
                      <node concept="3s519P" id="HgolRSV86S" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV88E" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI5Ff" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI5KV" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI5KW" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI5KX" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEg8" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEg9" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEga" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEgb" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEgc" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEgd" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEge" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEgf" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1vEPqpZaAr_" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxTZP" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxTZO" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxTZN" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxTZM" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxTZL" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxTZK" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxTZI" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxTZJ" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbH" id="1vEPqpZaIek" role="3cqZAp">
                            <node concept="29HgVG" id="1vEPqpZaIMc" role="lGtFl">
                              <node concept="3NFfHV" id="1vEPqpZaJ3o" role="3NFExx">
                                <node concept="3clFbS" id="1vEPqpZaJ3p" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZaJ3s" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZaJnx" role="3clFbG">
                                      <node concept="30H73N" id="1vEPqpZaJ3r" role="2Oq$k0" />
                                      <node concept="3TrEf2" id="1vEPqpZaNav" role="2OqNvi">
                                        <ref role="3Tt5mk" to="f8gn:ziPuhE_VbX" resolve="cell" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1vEPqpZaArA" role="3cqZAp">
                            <node concept="10M0yZ" id="1vEPqpZaArB" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZaArC" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZaArD" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZaArE" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZaNwa" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYKUUq" resolve="PropertyCell" />
      <node concept="1Koe21" id="1vEPqpZaNwb" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZaNwc" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZaNwd" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZaNwe" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZaNwf" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZaNwg" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZaNwh" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV88F" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8at" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5KY" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5NG" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5NH" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5NI" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZaNwl" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZaNwm" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZaNwn" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZaNwo" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5KY" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlya" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyb" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyc" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyd" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlye" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyf" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZaNwp" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.propertyCell(org.modelix.model.api.IProperty,kotlin.jvm.functions.Function1)" resolve="propertyCell" />
                      <node concept="2ShNRf" id="1vEPqpZaY_6" role="37wK5m">
                        <node concept="1pGfFk" id="1vEPqpZb01a" role="2ShVmc">
                          <property role="373rjd" value="true" />
                          <ref role="37wK5l" to="zxfz:~MPSProperty.&lt;init&gt;(org.jetbrains.mps.openapi.language.SProperty)" resolve="MPSProperty" />
                          <node concept="355D3s" id="1vEPqpZb5OH" role="37wK5m">
                            <node concept="1ZhdrF" id="1vEPqpZb6_o" role="lGtFl">
                              <property role="2qtEX8" value="conceptDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474302386080/2644386474302386081" />
                              <node concept="3$xsQk" id="1vEPqpZb6_p" role="3$ytzL">
                                <node concept="3clFbS" id="1vEPqpZb6_q" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZb7l4" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZb7l5" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZb7l6" role="2Oq$k0">
                                        <node concept="30H73N" id="1vEPqpZb7l7" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="1vEPqpZb7l8" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="1vEPqpZb7l9" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:2OF3rgRewqT" resolve="getConceptDeclaration" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1ZhdrF" id="1vEPqpZb8Ah" role="lGtFl">
                              <property role="2qtEX8" value="propertyDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474302386080/2644386474302386082" />
                              <node concept="3$xsQk" id="1vEPqpZb8Ai" role="3$ytzL">
                                <node concept="3clFbS" id="1vEPqpZb8Aj" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZb9vO" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZb9vP" role="3clFbG">
                                      <node concept="30H73N" id="1vEPqpZb9vQ" role="2Oq$k0" />
                                      <node concept="3TrEf2" id="1vEPqpZb9vR" role="2OqNvi">
                                        <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8au" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8cg" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI5NJ" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI5TG" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~PropertyCellTemplateBuilder" resolve="PropertyCellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI5TH" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI5TI" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEgg" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEgh" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEgi" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEgj" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEgk" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEgl" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEgm" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEgn" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1vEPqpZaNwt" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxTZX" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxTZW" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxTZV" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxTZU" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxTZT" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxTZS" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxTZQ" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxTZR" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="1vEPqpZbbtn" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZbcD4" role="3clFbG">
                              <node concept="37vLTw" id="1vEPqpZbbtl" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI5NJ" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="1vEPqpZbgUd" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~PropertyCellTemplateBuilder.regex(java.lang.String)" resolve="regex" />
                                <node concept="Xl_RD" id="1vEPqpZbi44" role="37wK5m">
                                  <property role="Xl_RC" value="true|false" />
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="1vEPqpZbp9j" role="lGtFl">
                              <node concept="3IZrLx" id="1vEPqpZbp9k" role="3IZSJc">
                                <node concept="3clFbS" id="1vEPqpZbp9l" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZbqM5" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZbqM6" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZbqM7" role="2Oq$k0">
                                        <node concept="2OqwBi" id="1vEPqpZbqM8" role="2Oq$k0">
                                          <node concept="30H73N" id="1vEPqpZbqM9" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="1vEPqpZbqMa" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                          </node>
                                        </node>
                                        <node concept="3TrEf2" id="1vEPqpZbqMb" role="2OqNvi">
                                          <ref role="3Tt5mk" to="tpce:fKAX2Z_" resolve="dataType" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="1vEPqpZbqMc" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:hKtGpIQ" resolve="isSimpleBoolean" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="1vEPqpZbt9d" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZbt9e" role="3clFbG">
                              <node concept="37vLTw" id="1vEPqpZbt9f" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI5NJ" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="1vEPqpZbt9g" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~PropertyCellTemplateBuilder.regex(java.lang.String)" resolve="regex" />
                                <node concept="Xl_RD" id="1vEPqpZbt9h" role="37wK5m">
                                  <property role="Xl_RC" value="-?[0-9]{1,10}" />
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="1vEPqpZbt9i" role="lGtFl">
                              <node concept="3IZrLx" id="1vEPqpZbt9j" role="3IZSJc">
                                <node concept="3clFbS" id="1vEPqpZbt9k" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZbx1H" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZbx1I" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZbx1J" role="2Oq$k0">
                                        <node concept="2OqwBi" id="1vEPqpZbx1K" role="2Oq$k0">
                                          <node concept="30H73N" id="1vEPqpZbx1L" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="1vEPqpZbx1M" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                          </node>
                                        </node>
                                        <node concept="3TrEf2" id="1vEPqpZbx1N" role="2OqNvi">
                                          <ref role="3Tt5mk" to="tpce:fKAX2Z_" resolve="dataType" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="1vEPqpZbx1O" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:hKtGkcn" resolve="isSimpleInteger" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="1vEPqpZbz$1" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZbz$2" role="3clFbG">
                              <node concept="37vLTw" id="1vEPqpZbz$3" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI5NJ" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="1vEPqpZbz$4" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~PropertyCellTemplateBuilder.regex(java.lang.String)" resolve="regex" />
                                <node concept="Xl_RD" id="1vEPqpZbz$5" role="37wK5m">
                                  <node concept="17Uvod" id="1vEPqpZbBUR" role="lGtFl">
                                    <property role="2qtEX9" value="value" />
                                    <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                                    <node concept="3zFVjK" id="1vEPqpZbBUS" role="3zH0cK">
                                      <node concept="3clFbS" id="1vEPqpZbBUT" role="2VODD2">
                                        <node concept="3clFbF" id="1vEPqpZbEbk" role="3cqZAp">
                                          <node concept="2OqwBi" id="1vEPqpZbEbl" role="3clFbG">
                                            <node concept="1PxgMI" id="1vEPqpZbEbm" role="2Oq$k0">
                                              <node concept="chp4Y" id="1vEPqpZbEbn" role="3oSUPX">
                                                <ref role="cht4Q" to="tpce:fKAz7CR" resolve="ConstrainedDataTypeDeclaration" />
                                              </node>
                                              <node concept="2OqwBi" id="1vEPqpZbEbo" role="1m5AlR">
                                                <node concept="2OqwBi" id="1vEPqpZbEbp" role="2Oq$k0">
                                                  <node concept="30H73N" id="1vEPqpZbEbq" role="2Oq$k0" />
                                                  <node concept="3TrEf2" id="1vEPqpZbEbr" role="2OqNvi">
                                                    <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                                  </node>
                                                </node>
                                                <node concept="3TrEf2" id="1vEPqpZbEbs" role="2OqNvi">
                                                  <ref role="3Tt5mk" to="tpce:fKAX2Z_" resolve="dataType" />
                                                </node>
                                              </node>
                                            </node>
                                            <node concept="3TrcHB" id="1vEPqpZbEbt" role="2OqNvi">
                                              <ref role="3TsBF5" to="tpce:fKFLfW2" resolve="constraint" />
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="1vEPqpZbz$6" role="lGtFl">
                              <node concept="3IZrLx" id="1vEPqpZbz$7" role="3IZSJc">
                                <node concept="3clFbS" id="1vEPqpZbz$8" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZbHD6" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZbHD7" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZbHD8" role="2Oq$k0">
                                        <node concept="2OqwBi" id="1vEPqpZbHD9" role="2Oq$k0">
                                          <node concept="30H73N" id="1vEPqpZbHDa" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="1vEPqpZbHDb" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                          </node>
                                        </node>
                                        <node concept="3TrEf2" id="1vEPqpZbHDc" role="2OqNvi">
                                          <ref role="3Tt5mk" to="tpce:fKAX2Z_" resolve="dataType" />
                                        </node>
                                      </node>
                                      <node concept="1mIQ4w" id="1vEPqpZbHDd" role="2OqNvi">
                                        <node concept="chp4Y" id="1vEPqpZbHDe" role="cj9EA">
                                          <ref role="cht4Q" to="tpce:fKAz7CR" resolve="ConstrainedDataTypeDeclaration" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="1vEPqpZbKK9" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZbKKa" role="3clFbG">
                              <node concept="37vLTw" id="1vEPqpZbKKb" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI5NJ" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="1vEPqpZbKKc" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~PropertyCellTemplateBuilder.regex(java.lang.String)" resolve="regex" />
                                <node concept="Xl_RD" id="1vEPqpZbO_f" role="37wK5m">
                                  <property role="Xl_RC" value="[a-zA-Z$[_]][a-zA-Z0-9$[_]]*" />
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="1vEPqpZbKKr" role="lGtFl">
                              <node concept="3IZrLx" id="1vEPqpZbKKs" role="3IZSJc">
                                <node concept="3clFbS" id="1vEPqpZbKKt" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZbTDg" role="3cqZAp">
                                    <node concept="17R0WA" id="1vEPqpZbTDh" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZbTDi" role="3uHU7B">
                                        <node concept="2OqwBi" id="1vEPqpZbTDj" role="2Oq$k0">
                                          <node concept="30H73N" id="1vEPqpZbTDk" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="1vEPqpZbTDl" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:CUW2QYKUZw" resolve="property" />
                                          </node>
                                        </node>
                                        <node concept="iZEcu" id="1vEPqpZbTDm" role="2OqNvi" />
                                      </node>
                                      <node concept="2tJFMh" id="1vEPqpZbTDn" role="3uHU7w">
                                        <node concept="ZC_QK" id="1vEPqpZbTDo" role="2tJFKM">
                                          <ref role="2aWVGs" to="tpck:h0TrEE$" resolve="INamedConcept" />
                                          <node concept="ZC_QK" id="1vEPqpZbTDp" role="2aWVGa">
                                            <ref role="2aWVGs" to="tpck:h0TrG11" resolve="name" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1vEPqpZaNwA" role="3cqZAp">
                            <node concept="10M0yZ" id="1vEPqpZaNwB" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZaNwC" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZaNwD" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZaNwE" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZbZQm" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhE_FrH" resolve="FlagCell" />
      <node concept="1Koe21" id="1vEPqpZbZQn" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZbZQo" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZbZQp" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZbZQq" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZbZQr" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZbZQs" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZbZQt" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8ch" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8e3" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI5TJ" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI5Wt" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI5Wu" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI5Wv" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZbZQx" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZbZQy" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZbZQz" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZbZQ$" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI5TJ" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlyg" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyh" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyi" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyj" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyk" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyl" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZbZQ_" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.flagCell(org.modelix.model.api.IProperty,java.lang.String,kotlin.jvm.functions.Function1)" resolve="flagCell" />
                      <node concept="2ShNRf" id="1vEPqpZbZQA" role="37wK5m">
                        <node concept="1pGfFk" id="1vEPqpZbZQB" role="2ShVmc">
                          <property role="373rjd" value="true" />
                          <ref role="37wK5l" to="zxfz:~MPSProperty.&lt;init&gt;(org.jetbrains.mps.openapi.language.SProperty)" resolve="MPSProperty" />
                          <node concept="355D3s" id="1vEPqpZbZQC" role="37wK5m">
                            <node concept="1ZhdrF" id="1vEPqpZbZQD" role="lGtFl">
                              <property role="2qtEX8" value="conceptDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474302386080/2644386474302386081" />
                              <node concept="3$xsQk" id="1vEPqpZbZQE" role="3$ytzL">
                                <node concept="3clFbS" id="1vEPqpZbZQF" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZbZQG" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZbZQH" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZbZQI" role="2Oq$k0">
                                        <node concept="30H73N" id="1vEPqpZbZQJ" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="1vEPqpZbZQK" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:ziPuhE_FrT" resolve="property" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="1vEPqpZbZQL" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:2OF3rgRewqT" resolve="getConceptDeclaration" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1ZhdrF" id="1vEPqpZbZQM" role="lGtFl">
                              <property role="2qtEX8" value="propertyDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474302386080/2644386474302386082" />
                              <node concept="3$xsQk" id="1vEPqpZbZQN" role="3$ytzL">
                                <node concept="3clFbS" id="1vEPqpZbZQO" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZbZQP" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZbZQQ" role="3clFbG">
                                      <node concept="30H73N" id="1vEPqpZbZQR" role="2Oq$k0" />
                                      <node concept="3TrEf2" id="1vEPqpZbZQS" role="2OqNvi">
                                        <ref role="3Tt5mk" to="f8gn:ziPuhE_FrT" resolve="property" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="Xl_RD" id="1vEPqpZcxze" role="37wK5m">
                        <property role="Xl_RC" value="" />
                        <node concept="17Uvod" id="1vEPqpZcNFX" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="1vEPqpZcNFY" role="3zH0cK">
                            <node concept="3clFbS" id="1vEPqpZcNFZ" role="2VODD2">
                              <node concept="3clFbF" id="1vEPqpZcRj$" role="3cqZAp">
                                <node concept="2OqwBi" id="1vEPqpZcRj_" role="3clFbG">
                                  <node concept="30H73N" id="1vEPqpZcRjA" role="2Oq$k0" />
                                  <node concept="3TrcHB" id="1vEPqpZcRjB" role="2OqNvi">
                                    <ref role="3TsBF5" to="f8gn:ziPuhE_FrL" resolve="text" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="1W57fq" id="1vEPqpZcZPH" role="lGtFl">
                          <node concept="3IZrLx" id="1vEPqpZcZPI" role="3IZSJc">
                            <node concept="3clFbS" id="1vEPqpZcZPJ" role="2VODD2">
                              <node concept="3clFbF" id="1vEPqpZd3wg" role="3cqZAp">
                                <node concept="2OqwBi" id="1vEPqpZd3wh" role="3clFbG">
                                  <node concept="2OqwBi" id="1vEPqpZd3wi" role="2Oq$k0">
                                    <node concept="30H73N" id="1vEPqpZd3wj" role="2Oq$k0" />
                                    <node concept="3TrcHB" id="1vEPqpZd3wk" role="2OqNvi">
                                      <ref role="3TsBF5" to="f8gn:ziPuhE_FrL" resolve="text" />
                                    </node>
                                  </node>
                                  <node concept="17RvpY" id="1vEPqpZd3wl" role="2OqNvi" />
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="gft3U" id="1vEPqpZd88m" role="UU_$l">
                            <node concept="10Nm6u" id="1vEPqpZdbNh" role="gfFT$" />
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8e4" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8fQ" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI5Ww" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI62x" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI62y" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI62z" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEgo" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEgp" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEgq" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEgr" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEgs" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEgt" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEgu" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEgv" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1vEPqpZbZQW" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU05" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU04" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU03" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU02" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU01" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU00" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxTZY" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxTZZ" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1vEPqpZbZSd" role="3cqZAp">
                            <node concept="10M0yZ" id="1vEPqpZbZSe" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZbZSf" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZbZSg" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZbZSh" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1vEPqpZeylc" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYMiki" resolve="ChildrenCollectionCell" />
      <node concept="1Koe21" id="1vEPqpZeyld" role="1lVwrX">
        <node concept="2OqwBi" id="1vEPqpZeyle" role="1Koe22">
          <node concept="2ShNRf" id="1vEPqpZeylf" role="2Oq$k0">
            <node concept="1pGfFk" id="1vEPqpZeylg" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1vEPqpZeylh" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1vEPqpZeyli" role="37wK5m" />
            <node concept="3clFbT" id="1vEPqpZeylj" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8fR" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8hD" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI62$" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI65i" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI65j" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI65k" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1vEPqpZeyln" role="1bW5cS">
                <node concept="3clFbF" id="1vEPqpZeylo" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZeylp" role="3clFbG">
                    <node concept="37vLTw" id="1vEPqpZeylq" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI62$" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlym" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyn" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyo" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyp" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyq" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyr" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1vEPqpZeylr" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.vertical(org.modelix.model.api.IChildLink,kotlin.jvm.functions.Function1)" resolve="vertical" />
                      <node concept="2ShNRf" id="1vEPqpZeyls" role="37wK5m">
                        <node concept="1pGfFk" id="1vEPqpZeylt" role="2ShVmc">
                          <property role="373rjd" value="true" />
                          <ref role="37wK5l" to="zxfz:~MPSChildLink.&lt;init&gt;(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="MPSChildLink" />
                          <node concept="359W_D" id="2QtC6yYW4kj" role="37wK5m">
                            <ref role="359W_E" to="tpck:gw2VY9q" resolve="BaseConcept" />
                            <ref role="359W_F" to="tpck:4uZwTti3__2" resolve="smodelAttribute" />
                            <node concept="1ZhdrF" id="2QtC6yYWeIC" role="lGtFl">
                              <property role="2qtEX8" value="conceptDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421078" />
                              <node concept="3$xsQk" id="2QtC6yYWeID" role="3$ytzL">
                                <node concept="3clFbS" id="2QtC6yYWeIE" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yYWkWq" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yYWkWr" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yYWkWs" role="2Oq$k0">
                                        <node concept="2OqwBi" id="2QtC6yYWkWt" role="2Oq$k0">
                                          <node concept="30H73N" id="2QtC6yYWkWu" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="2QtC6yYWkWv" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:CUW2QYMipn" resolve="link" />
                                          </node>
                                        </node>
                                        <node concept="2qgKlT" id="2QtC6yYWkWw" role="2OqNvi">
                                          <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="2QtC6yYWkWx" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:7jb4LXpbWaP" resolve="getConceptDeclaration" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1ZhdrF" id="2QtC6yYWgmI" role="lGtFl">
                              <property role="2qtEX8" value="linkDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421079" />
                              <node concept="3$xsQk" id="2QtC6yYWgmJ" role="3$ytzL">
                                <node concept="3clFbS" id="2QtC6yYWgmK" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yYWi4v" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yYWi4w" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yYWi4x" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yYWi4y" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yYWi4z" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:CUW2QYMipn" resolve="link" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="2QtC6yYWi4$" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8hE" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8js" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI65l" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI6bi" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~ChildCellTemplateBuilder" resolve="ChildCellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI6bj" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI6bk" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEgw" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEgx" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEgy" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEgz" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEg$" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEg_" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEgA" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEgB" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1vEPqpZeym5" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0d" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0c" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0b" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0a" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU09" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU08" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU06" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU07" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="1vEPqpZrgZS" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZrhEO" role="3clFbG">
                              <node concept="37vLTw" id="1vEPqpZrgZQ" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI65l" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="1vEPqpZrmx3" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~ChildCellTemplateBuilder.separator(kotlin.jvm.functions.Function1)" resolve="separator" />
                                <node concept="3s519P" id="HgolRSV8jt" role="37wK5m">
                                  <node concept="3uibUv" id="HgolRSV8lf" role="3s52Nf">
                                    <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                                  </node>
                                  <node concept="37vLTG" id="4HILH0eI6bl" role="1bW2Oz">
                                    <property role="TrG5h" value="builder" />
                                    <node concept="3uibUv" id="4HILH0eI6k9" role="1tU5fm">
                                      <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                                      <node concept="3uibUv" id="4HILH0eI6ka" role="11_B2D">
                                        <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                                      </node>
                                      <node concept="3uibUv" id="4HILH0eI6kb" role="11_B2D">
                                        <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                                      </node>
                                    </node>
                                    <node concept="17Uvod" id="HgolRTSEgC" role="lGtFl">
                                      <property role="2qtEX9" value="name" />
                                      <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                      <node concept="3zFVjK" id="HgolRTSEgD" role="3zH0cK">
                                        <node concept="3clFbS" id="HgolRTSEgE" role="2VODD2">
                                          <node concept="3clFbF" id="HgolRTSEgF" role="3cqZAp">
                                            <node concept="2OqwBi" id="HgolRTSEgG" role="3clFbG">
                                              <node concept="1iwH7S" id="HgolRTSEgH" role="2Oq$k0" />
                                              <node concept="2piZGk" id="HgolRTSEgI" role="2OqNvi">
                                                <node concept="Xl_RD" id="HgolRTSEgJ" role="2piZGb">
                                                  <property role="Xl_RC" value="builder" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node concept="3clFbS" id="1vEPqpZrnaj" role="1bW5cS">
                                    <node concept="3clFbH" id="1vEPqpZroVy" role="3cqZAp">
                                      <node concept="29HgVG" id="1vEPqpZrvrd" role="lGtFl">
                                        <node concept="3NFfHV" id="1vEPqpZrvre" role="3NFExx">
                                          <node concept="3clFbS" id="1vEPqpZrvrf" role="2VODD2">
                                            <node concept="3clFbF" id="1vEPqpZrvrl" role="3cqZAp">
                                              <node concept="2OqwBi" id="1vEPqpZrvrg" role="3clFbG">
                                                <node concept="3TrEf2" id="1vEPqpZrvrj" role="2OqNvi">
                                                  <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
                                                </node>
                                                <node concept="30H73N" id="1vEPqpZrvrk" role="2Oq$k0" />
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node concept="3cpWs6" id="1vEPqpZrpVa" role="3cqZAp">
                                      <node concept="10M0yZ" id="1vEPqpZrpVb" role="3cqZAk">
                                        <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                                        <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="1vEPqpZr$gx" role="lGtFl">
                              <node concept="3IZrLx" id="1vEPqpZr$gy" role="3IZSJc">
                                <node concept="3clFbS" id="1vEPqpZr$gz" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZr$YW" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZrBfc" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZrA2h" role="2Oq$k0">
                                        <node concept="30H73N" id="1vEPqpZr$YV" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="1vEPqpZrAMA" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
                                        </node>
                                      </node>
                                      <node concept="3x8VRR" id="1vEPqpZrC0h" role="2OqNvi" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="1vEPqpZrDky" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZrDQP" role="3clFbG">
                              <node concept="37vLTw" id="1vEPqpZrDkw" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI65l" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="1vEPqpZrHDY" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~ChildCellTemplateBuilder.newLineConcept(org.modelix.model.api.IConcept)" resolve="newLineConcept" />
                                <node concept="10Nm6u" id="1vEPqpZrItC" role="37wK5m">
                                  <node concept="5jKBG" id="1vEPqpZrJYX" role="lGtFl">
                                    <ref role="v9R2y" node="1vEPqpZ94Ep" resolve="template_SConcept_as_IConcept_java" />
                                    <node concept="3NFfHV" id="1vEPqpZrLeR" role="5jGum">
                                      <node concept="3clFbS" id="1vEPqpZrLeS" role="2VODD2">
                                        <node concept="3clFbF" id="1vEPqpZrLRo" role="3cqZAp">
                                          <node concept="2OqwBi" id="1vEPqpZrM6T" role="3clFbG">
                                            <node concept="30H73N" id="1vEPqpZrLRn" role="2Oq$k0" />
                                            <node concept="3TrEf2" id="1vEPqpZrMP0" role="2OqNvi">
                                              <ref role="3Tt5mk" to="f8gn:CUW2QYMiut" resolve="subconceptToInsert" />
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="1vEPqpZrOjc" role="lGtFl">
                              <node concept="3IZrLx" id="1vEPqpZrOjd" role="3IZSJc">
                                <node concept="3clFbS" id="1vEPqpZrOje" role="2VODD2">
                                  <node concept="3clFbF" id="1vEPqpZrP9_" role="3cqZAp">
                                    <node concept="2OqwBi" id="1vEPqpZrR6K" role="3clFbG">
                                      <node concept="2OqwBi" id="1vEPqpZrPq5" role="2Oq$k0">
                                        <node concept="30H73N" id="1vEPqpZrP9$" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="1vEPqpZrQ8L" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:CUW2QYMiut" resolve="subconceptToInsert" />
                                        </node>
                                      </node>
                                      <node concept="3x8VRR" id="1vEPqpZrS88" role="2OqNvi" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1vEPqpZeym6" role="3cqZAp">
                            <node concept="10M0yZ" id="1vEPqpZeym7" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1vEPqpZeym8" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1vEPqpZeym9" role="3cqZAp">
                  <node concept="10M0yZ" id="1vEPqpZeyma" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="2QtC6yZQe0P" role="30HLyM">
        <node concept="3clFbS" id="2QtC6yZQe0Q" role="2VODD2">
          <node concept="3clFbF" id="2QtC6yZQfaW" role="3cqZAp">
            <node concept="2OqwBi" id="2QtC6yZQfX7" role="3clFbG">
              <node concept="2OqwBi" id="2QtC6yZQf_d" role="2Oq$k0">
                <node concept="30H73N" id="2QtC6yZQfaV" role="2Oq$k0" />
                <node concept="3TrEf2" id="2QtC6yZQfKF" role="2OqNvi">
                  <ref role="3Tt5mk" to="f8gn:CUW2QYMi$q" resolve="layout" />
                </node>
              </node>
              <node concept="2qgKlT" id="2QtC6yZQg7_" role="2OqNvi">
                <ref role="37wK5l" to="wsib:CUW2QYKKme" resolve="isVertical" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yZQ1VN" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYMiki" resolve="ChildrenCollectionCell" />
      <node concept="1Koe21" id="2QtC6yZQ1VO" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yZQ1VP" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yZQ1VQ" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yZQ1VR" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yZQ1VS" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yZQ1VT" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yZQ1VU" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8lg" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8n2" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI6kc" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI6mU" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI6mV" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI6mW" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yZQ1VY" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yZQ1VZ" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yZQ1W0" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yZQ1W1" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI6kc" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlys" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyt" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyu" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyv" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyw" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyx" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yZQ1W2" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.horizontal(org.modelix.model.api.IChildLink,java.lang.String,kotlin.jvm.functions.Function1)" resolve="horizontal" />
                      <node concept="2ShNRf" id="2QtC6yZQ1W3" role="37wK5m">
                        <node concept="1pGfFk" id="2QtC6yZQ1W4" role="2ShVmc">
                          <property role="373rjd" value="true" />
                          <ref role="37wK5l" to="zxfz:~MPSChildLink.&lt;init&gt;(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="MPSChildLink" />
                          <node concept="359W_D" id="2QtC6yZQ1W5" role="37wK5m">
                            <ref role="359W_E" to="tpck:gw2VY9q" resolve="BaseConcept" />
                            <ref role="359W_F" to="tpck:4uZwTti3__2" resolve="smodelAttribute" />
                            <node concept="1ZhdrF" id="2QtC6yZQ1W6" role="lGtFl">
                              <property role="2qtEX8" value="conceptDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421078" />
                              <node concept="3$xsQk" id="2QtC6yZQ1W7" role="3$ytzL">
                                <node concept="3clFbS" id="2QtC6yZQ1W8" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZQ1W9" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZQ1Wa" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yZQ1Wb" role="2Oq$k0">
                                        <node concept="2OqwBi" id="2QtC6yZQ1Wc" role="2Oq$k0">
                                          <node concept="30H73N" id="2QtC6yZQ1Wd" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="2QtC6yZQ1We" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:CUW2QYMipn" resolve="link" />
                                          </node>
                                        </node>
                                        <node concept="2qgKlT" id="2QtC6yZQ1Wf" role="2OqNvi">
                                          <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="2QtC6yZQ1Wg" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:7jb4LXpbWaP" resolve="getConceptDeclaration" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1ZhdrF" id="2QtC6yZQ1Wh" role="lGtFl">
                              <property role="2qtEX8" value="linkDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421079" />
                              <node concept="3$xsQk" id="2QtC6yZQ1Wi" role="3$ytzL">
                                <node concept="3clFbS" id="2QtC6yZQ1Wj" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZQ1Wk" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZQ1Wl" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yZQ1Wm" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yZQ1Wn" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yZQ1Wo" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:CUW2QYMipn" resolve="link" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="2QtC6yZQ1Wp" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="Xl_RD" id="2QtC6yZQ1Wq" role="37wK5m">
                        <property role="Xl_RC" value="separator" />
                        <node concept="17Uvod" id="2QtC6yZQ1Wr" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="2QtC6yZQ1Ws" role="3zH0cK">
                            <node concept="3clFbS" id="2QtC6yZQ1Wt" role="2VODD2">
                              <node concept="3clFbF" id="2QtC6yZQ1Wu" role="3cqZAp">
                                <node concept="2OqwBi" id="2QtC6yZQ1Wv" role="3clFbG">
                                  <node concept="30H73N" id="2QtC6yZQ1Ww" role="2Oq$k0" />
                                  <node concept="3TrcHB" id="2QtC6yZQ1Wx" role="2OqNvi">
                                    <ref role="3TsBF5" to="f8gn:CUW2QYMiCG" resolve="separator" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="1W57fq" id="2QtC6yZQ1Wy" role="lGtFl">
                          <node concept="3IZrLx" id="2QtC6yZQ1Wz" role="3IZSJc">
                            <node concept="3clFbS" id="2QtC6yZQ1W$" role="2VODD2">
                              <node concept="3clFbF" id="2QtC6yZQ1W_" role="3cqZAp">
                                <node concept="2OqwBi" id="2QtC6yZQ1WA" role="3clFbG">
                                  <node concept="2OqwBi" id="2QtC6yZQ1WB" role="2Oq$k0">
                                    <node concept="30H73N" id="2QtC6yZQ1WC" role="2Oq$k0" />
                                    <node concept="3TrcHB" id="2QtC6yZQ1WD" role="2OqNvi">
                                      <ref role="3TsBF5" to="f8gn:CUW2QYMiCG" resolve="separator" />
                                    </node>
                                  </node>
                                  <node concept="17RvpY" id="2QtC6yZQ1WE" role="2OqNvi" />
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="gft3U" id="2QtC6yZQ1WF" role="UU_$l">
                            <node concept="10Nm6u" id="2QtC6yZQ1WG" role="gfFT$" />
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8n3" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8oP" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI6mX" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI6t2" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~ChildCellTemplateBuilder" resolve="ChildCellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI6t3" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI6t4" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEgK" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEgL" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEgM" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEgN" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEgO" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEgP" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEgQ" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEgR" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZQ1WK" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0l" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0k" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0j" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0i" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU0h" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU0g" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0e" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0f" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="2QtC6yZQ1WL" role="3cqZAp">
                            <node concept="2OqwBi" id="2QtC6yZQ1WM" role="3clFbG">
                              <node concept="37vLTw" id="2QtC6yZQ1WN" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI6mX" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="2QtC6yZQ1WO" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~ChildCellTemplateBuilder.separator(kotlin.jvm.functions.Function1)" resolve="separator" />
                                <node concept="3s519P" id="HgolRSV8oQ" role="37wK5m">
                                  <node concept="3uibUv" id="HgolRSV8qC" role="3s52Nf">
                                    <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                                  </node>
                                  <node concept="37vLTG" id="4HILH0eI6t5" role="1bW2Oz">
                                    <property role="TrG5h" value="builder" />
                                    <node concept="3uibUv" id="4HILH0eI6A1" role="1tU5fm">
                                      <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                                      <node concept="3uibUv" id="4HILH0eI6A2" role="11_B2D">
                                        <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                                      </node>
                                      <node concept="3uibUv" id="4HILH0eI6A3" role="11_B2D">
                                        <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                                      </node>
                                    </node>
                                    <node concept="17Uvod" id="HgolRTSEgS" role="lGtFl">
                                      <property role="2qtEX9" value="name" />
                                      <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                      <node concept="3zFVjK" id="HgolRTSEgT" role="3zH0cK">
                                        <node concept="3clFbS" id="HgolRTSEgU" role="2VODD2">
                                          <node concept="3clFbF" id="HgolRTSEgV" role="3cqZAp">
                                            <node concept="2OqwBi" id="HgolRTSEgW" role="3clFbG">
                                              <node concept="1iwH7S" id="HgolRTSEgX" role="2Oq$k0" />
                                              <node concept="2piZGk" id="HgolRTSEgY" role="2OqNvi">
                                                <node concept="Xl_RD" id="HgolRTSEgZ" role="2piZGb">
                                                  <property role="Xl_RC" value="builder" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node concept="3clFbS" id="2QtC6yZQ1WS" role="1bW5cS">
                                    <node concept="3clFbH" id="2QtC6yZQ1WT" role="3cqZAp">
                                      <node concept="29HgVG" id="2QtC6yZQ1WU" role="lGtFl">
                                        <node concept="3NFfHV" id="2QtC6yZQ1WV" role="3NFExx">
                                          <node concept="3clFbS" id="2QtC6yZQ1WW" role="2VODD2">
                                            <node concept="3clFbF" id="2QtC6yZQ1WX" role="3cqZAp">
                                              <node concept="2OqwBi" id="2QtC6yZQ1WY" role="3clFbG">
                                                <node concept="3TrEf2" id="2QtC6yZQ1WZ" role="2OqNvi">
                                                  <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
                                                </node>
                                                <node concept="30H73N" id="2QtC6yZQ1X0" role="2Oq$k0" />
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node concept="3cpWs6" id="2QtC6yZQ1X1" role="3cqZAp">
                                      <node concept="10M0yZ" id="2QtC6yZQ1X2" role="3cqZAk">
                                        <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                                        <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="2QtC6yZQ1X3" role="lGtFl">
                              <node concept="3IZrLx" id="2QtC6yZQ1X4" role="3IZSJc">
                                <node concept="3clFbS" id="2QtC6yZQ1X5" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZQ1X6" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZQ1X7" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yZQ1X8" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yZQ1X9" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yZQ1Xa" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:6xJrM0NrOsd" resolve="separatorCell" />
                                        </node>
                                      </node>
                                      <node concept="3x8VRR" id="2QtC6yZQ1Xb" role="2OqNvi" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="2QtC6yZQ1Xc" role="3cqZAp">
                            <node concept="2OqwBi" id="2QtC6yZQ1Xd" role="3clFbG">
                              <node concept="37vLTw" id="2QtC6yZQ1Xe" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI6mX" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="2QtC6yZQ1Xf" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~ChildCellTemplateBuilder.newLineConcept(org.modelix.model.api.IConcept)" resolve="newLineConcept" />
                                <node concept="10Nm6u" id="2QtC6yZQ1Xg" role="37wK5m">
                                  <node concept="5jKBG" id="2QtC6yZQ1Xh" role="lGtFl">
                                    <ref role="v9R2y" node="1vEPqpZ94Ep" resolve="template_SConcept_as_IConcept_java" />
                                    <node concept="3NFfHV" id="2QtC6yZQ1Xi" role="5jGum">
                                      <node concept="3clFbS" id="2QtC6yZQ1Xj" role="2VODD2">
                                        <node concept="3clFbF" id="2QtC6yZQ1Xk" role="3cqZAp">
                                          <node concept="2OqwBi" id="2QtC6yZQ1Xl" role="3clFbG">
                                            <node concept="30H73N" id="2QtC6yZQ1Xm" role="2Oq$k0" />
                                            <node concept="3TrEf2" id="2QtC6yZQ1Xn" role="2OqNvi">
                                              <ref role="3Tt5mk" to="f8gn:CUW2QYMiut" resolve="subconceptToInsert" />
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="2QtC6yZQ1Xo" role="lGtFl">
                              <node concept="3IZrLx" id="2QtC6yZQ1Xp" role="3IZSJc">
                                <node concept="3clFbS" id="2QtC6yZQ1Xq" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZQ1Xr" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZQ1Xs" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yZQ1Xt" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yZQ1Xu" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yZQ1Xv" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:CUW2QYMiut" resolve="subconceptToInsert" />
                                        </node>
                                      </node>
                                      <node concept="3x8VRR" id="2QtC6yZQ1Xw" role="2OqNvi" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZQ1Xx" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yZQ1Xy" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yZQ1Xz" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yZQ1X$" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yZQ1X_" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yYX9px" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhEA4oI" resolve="SingleChildCell" />
      <node concept="1Koe21" id="2QtC6yYX9py" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yYX9pz" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yYX9p$" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yYX9p_" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yYX9pA" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yYX9pB" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yYX9pC" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8qD" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8sr" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI6A4" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI6CM" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI6CN" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI6CO" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yYX9pG" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yYX9pH" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yYX9pI" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yYX9pJ" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI6A4" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlyy" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyz" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRly$" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRly_" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyA" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyB" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yYX9pK" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.cell(org.modelix.model.api.IChildLink,kotlin.jvm.functions.Function1)" resolve="cell" />
                      <node concept="2ShNRf" id="2QtC6yYX9pL" role="37wK5m">
                        <node concept="1pGfFk" id="2QtC6yYX9pM" role="2ShVmc">
                          <property role="373rjd" value="true" />
                          <ref role="37wK5l" to="zxfz:~MPSChildLink.&lt;init&gt;(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="MPSChildLink" />
                          <node concept="359W_D" id="2QtC6yYX9pN" role="37wK5m">
                            <ref role="359W_E" to="tpck:gw2VY9q" resolve="BaseConcept" />
                            <ref role="359W_F" to="tpck:4uZwTti3__2" resolve="smodelAttribute" />
                            <node concept="1ZhdrF" id="2QtC6yYX9pO" role="lGtFl">
                              <property role="2qtEX8" value="conceptDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421078" />
                              <node concept="3$xsQk" id="2QtC6yYX9pP" role="3$ytzL">
                                <node concept="3clFbS" id="2QtC6yYX9pQ" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yYX9pR" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yYX9pS" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yYX9pT" role="2Oq$k0">
                                        <node concept="2OqwBi" id="2QtC6yYX9pU" role="2Oq$k0">
                                          <node concept="30H73N" id="2QtC6yYX9pV" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="2QtC6yYX9pW" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:ziPuhEA4oM" resolve="link" />
                                          </node>
                                        </node>
                                        <node concept="2qgKlT" id="2QtC6yYX9pX" role="2OqNvi">
                                          <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="2QtC6yYX9pY" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:7jb4LXpbWaP" resolve="getConceptDeclaration" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1ZhdrF" id="2QtC6yYX9pZ" role="lGtFl">
                              <property role="2qtEX8" value="linkDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421079" />
                              <node concept="3$xsQk" id="2QtC6yYX9q0" role="3$ytzL">
                                <node concept="3clFbS" id="2QtC6yYX9q1" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yYX9q2" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yYX9q3" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yYX9q4" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yYX9q5" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yYX9q6" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:ziPuhEA4oM" resolve="link" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="2QtC6yYX9q7" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8ss" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8ue" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI6CP" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI6II" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI6IJ" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI6IK" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEh0" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEh1" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEh2" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEh3" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEh4" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEh5" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEh6" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEh7" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yYX9qu" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0t" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0s" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0r" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0q" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU0p" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU0o" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0m" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0n" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yYX9rf" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yYX9rg" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yYX9rt" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yYX9ru" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yYX9rv" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yZ1MI3" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhEA2a_" resolve="ReferenceCell" />
      <node concept="1Koe21" id="2QtC6yZ1MI4" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yZ1MI5" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yZ1MI6" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yZ1MI7" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yZ1MI8" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yZ1MI9" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yZ1MIa" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8uf" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8w1" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI6IL" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI6Lv" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI6Lw" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI6Lx" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yZ1MIe" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yZ1MIf" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yZ1MIg" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yZ1MIh" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI6IL" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlyC" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyD" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyE" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyF" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyG" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyH" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yZ1MIi" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.cell(org.modelix.model.api.IReferenceLink,kotlin.jvm.functions.Function1,kotlin.jvm.functions.Function1)" resolve="cell" />
                      <node concept="2ShNRf" id="2QtC6yZ1MIj" role="37wK5m">
                        <node concept="1pGfFk" id="2QtC6yZ1MIk" role="2ShVmc">
                          <property role="373rjd" value="true" />
                          <ref role="37wK5l" to="zxfz:~MPSReferenceLink.&lt;init&gt;(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="MPSReferenceLink" />
                          <node concept="359W_D" id="2QtC6yZ1W5E" role="37wK5m">
                            <ref role="359W_E" to="tpee:fz7vLUo" resolve="VariableReference" />
                            <ref role="359W_F" to="tpee:fzcqZ_w" resolve="variableDeclaration" />
                            <node concept="1ZhdrF" id="23vo47q_GD7" role="lGtFl">
                              <property role="2qtEX8" value="linkDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421079" />
                              <node concept="3$xsQk" id="23vo47q_GDa" role="3$ytzL">
                                <node concept="3clFbS" id="23vo47q_GDb" role="2VODD2">
                                  <node concept="3clFbF" id="23vo47q_GDh" role="3cqZAp">
                                    <node concept="2OqwBi" id="23vo47q_JvP" role="3clFbG">
                                      <node concept="2OqwBi" id="23vo47q_GDc" role="2Oq$k0">
                                        <node concept="3TrEf2" id="23vo47q_GDf" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:ziPuhEA2aC" resolve="link" />
                                        </node>
                                        <node concept="30H73N" id="23vo47q_GDg" role="2Oq$k0" />
                                      </node>
                                      <node concept="2qgKlT" id="23vo47q_Ku9" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1ZhdrF" id="23vo47q_KZD" role="lGtFl">
                              <property role="2qtEX8" value="conceptDeclaration" />
                              <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474301421077/2644386474301421078" />
                              <node concept="3$xsQk" id="23vo47q_KZE" role="3$ytzL">
                                <node concept="3clFbS" id="23vo47q_KZF" role="2VODD2">
                                  <node concept="3clFbF" id="23vo47q_M3b" role="3cqZAp">
                                    <node concept="2OqwBi" id="23vo47q_M3c" role="3clFbG">
                                      <node concept="2OqwBi" id="23vo47q_M3d" role="2Oq$k0">
                                        <node concept="2OqwBi" id="23vo47q_M3e" role="2Oq$k0">
                                          <node concept="30H73N" id="23vo47q_M3f" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="23vo47q_M3g" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:ziPuhEA2aC" resolve="link" />
                                          </node>
                                        </node>
                                        <node concept="2qgKlT" id="23vo47q_M3h" role="2OqNvi">
                                          <ref role="37wK5l" to="tpcn:hEwIf_V" resolve="getGenuineLink" />
                                        </node>
                                      </node>
                                      <node concept="2qgKlT" id="23vo47q_M3i" role="2OqNvi">
                                        <ref role="37wK5l" to="tpcn:7jb4LXpbWaP" resolve="getConceptDeclaration" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8w2" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8xA" role="3s52Nf">
                          <ref role="3uigEE" to="wyt6:~String" resolve="String" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI6Ly" role="1bW2Oz">
                          <property role="TrG5h" value="referenceTarget" />
                          <node concept="3uibUv" id="4HILH0eI6S$" role="1tU5fm">
                            <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZ1MIH" role="1bW5cS">
                          <node concept="3cpWs6" id="2QtC6yZ2wwd" role="3cqZAp">
                            <node concept="1W57fq" id="2QtC6yZ2F3s" role="lGtFl">
                              <node concept="3IZrLx" id="2QtC6yZ2F3t" role="3IZSJc">
                                <node concept="3clFbS" id="2QtC6yZ2F3u" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZ2FPU" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZ2FPV" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yZ2FPW" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yZ2FPX" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yZ2FPY" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                                        </node>
                                      </node>
                                      <node concept="3w_OXm" id="2QtC6yZ2FPZ" role="2OqNvi" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="2YIFZM" id="6GdlvdUGl0Y" role="3cqZAk">
                              <ref role="37wK5l" to="i8bi:5IkW5anFfnY" resolve="getString" />
                              <ref role="1Pybhc" to="i8bi:5IkW5anFfnn" resolve="SPropertyOperations" />
                              <node concept="2OqwBi" id="6GdlvdUGl0Z" role="37wK5m">
                                <node concept="10M0yZ" id="6GdlvdUGl10" role="2Oq$k0">
                                  <ref role="3cqZAo" to="1ut2:~ModelixNodeAsMPSNode.Companion" resolve="Companion" />
                                  <ref role="1PxDUh" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                                </node>
                                <node concept="liA8E" id="6GdlvdUGl11" role="2OqNvi">
                                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode$Companion.toMPSNode(org.modelix.model.api.INode)" resolve="toMPSNode" />
                                  <node concept="37vLTw" id="6GdlvdUGl12" role="37wK5m">
                                    <ref role="3cqZAo" node="4HILH0eI6Ly" resolve="referenceTarget" />
                                  </node>
                                </node>
                              </node>
                              <node concept="355D3s" id="6GdlvdUGl13" role="37wK5m">
                                <ref role="355D3t" to="tpck:h0TrEE$" resolve="INamedConcept" />
                                <ref role="355D3u" to="tpck:h0TrG11" resolve="name" />
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZ1MII" role="3cqZAp">
                            <node concept="Xl_RD" id="2QtC6yZ2lg4" role="3cqZAk">
                              <property role="Xl_RC" value="" />
                              <node concept="29HgVG" id="2QtC6yZ2ur2" role="lGtFl">
                                <node concept="3NFfHV" id="2QtC6yZ2v60" role="3NFExx">
                                  <node concept="3clFbS" id="2QtC6yZ2v61" role="2VODD2">
                                    <node concept="3clFbF" id="2QtC6yZ2v63" role="3cqZAp">
                                      <node concept="2OqwBi" id="2QtC6yZ2v68" role="3clFbG">
                                        <node concept="3TrEf2" id="2QtC6yZ2v69" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                                        </node>
                                        <node concept="30H73N" id="2QtC6yZ2v6a" role="2Oq$k0" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="1W57fq" id="2QtC6yZ2HHT" role="lGtFl">
                              <node concept="3IZrLx" id="2QtC6yZ2HHU" role="3IZSJc">
                                <node concept="3clFbS" id="2QtC6yZ2HHV" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZ2IL3" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZ2ILb" role="3clFbG">
                                      <node concept="2OqwBi" id="2QtC6yZ2ILc" role="2Oq$k0">
                                        <node concept="30H73N" id="2QtC6yZ2ILd" role="2Oq$k0" />
                                        <node concept="3TrEf2" id="2QtC6yZ2ILe" role="2OqNvi">
                                          <ref role="3Tt5mk" to="f8gn:22f9nDgMtfW" resolve="renderTarget" />
                                        </node>
                                      </node>
                                      <node concept="3x8VRR" id="2QtC6yZ2ILf" role="2OqNvi" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3s519P" id="HgolRSV8xB" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8zQ" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI6S_" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI70T" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~ReferenceCellTemplateBuilder" resolve="ReferenceCellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI70U" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI70V" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI70W" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEh8" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEh9" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEha" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEhb" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEhc" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEhd" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEhe" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEhf" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZ20d3" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0_" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0$" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0z" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0y" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU0x" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU0w" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0u" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0v" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZ20d4" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yZ20d5" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yZ1MIK" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yZ1MIL" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yZ1MIM" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="22f9nDgPg0F" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:22f9nDgOIIh" resolve="BL_ReferenceTargetExpression" />
      <node concept="1Koe21" id="2QtC6yZ3dLN" role="1lVwrX">
        <node concept="3clFb_" id="2QtC6yZ3dQT" role="1Koe22">
          <property role="TrG5h" value="f" />
          <node concept="37vLTG" id="2QtC6yZ3dWf" role="3clF46">
            <property role="TrG5h" value="referenceTarget" />
            <node concept="3uibUv" id="2QtC6z0GIX$" role="1tU5fm">
              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
            </node>
          </node>
          <node concept="3Tqbb2" id="2QtC6yZ3ehA" role="3clF45" />
          <node concept="3Tm1VV" id="2QtC6yZ3dQV" role="1B3o_S" />
          <node concept="3clFbS" id="2QtC6yZ3dQW" role="3clF47">
            <node concept="3clFbF" id="2QtC6z0GMWm" role="3cqZAp">
              <node concept="2OqwBi" id="2QtC6z0GN6y" role="3clFbG">
                <node concept="10M0yZ" id="2QtC6z0GMYC" role="2Oq$k0">
                  <ref role="3cqZAo" to="1ut2:~ModelixNodeAsMPSNode.Companion" resolve="Companion" />
                  <ref role="1PxDUh" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                </node>
                <node concept="liA8E" id="2QtC6z0GNcQ" role="2OqNvi">
                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode$Companion.toMPSNode(org.modelix.model.api.INode)" resolve="toMPSNode" />
                  <node concept="37vLTw" id="2QtC6z0GNf0" role="37wK5m">
                    <ref role="3cqZAo" node="2QtC6yZ3dWf" resolve="referenceTarget" />
                  </node>
                </node>
                <node concept="raruj" id="2QtC6z0GNiT" role="lGtFl" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="CUW2QYOA2M" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
      <node concept="30G5F_" id="CUW2QYOAqx" role="30HLyM">
        <node concept="3clFbS" id="CUW2QYOAqy" role="2VODD2">
          <node concept="3clFbF" id="CUW2QYOAx3" role="3cqZAp">
            <node concept="2OqwBi" id="CUW2QYOG6d" role="3clFbG">
              <node concept="2OqwBi" id="CUW2QYODG7" role="2Oq$k0">
                <node concept="2OqwBi" id="CUW2QYOAVk" role="2Oq$k0">
                  <node concept="30H73N" id="CUW2QYOAx2" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="CUW2QYOB9t" role="2OqNvi">
                    <ref role="3TtcxE" to="f8gn:CUW2QYKJ$J" resolve="cells" />
                  </node>
                </node>
                <node concept="1uHKPH" id="CUW2QYOFuD" role="2OqNvi" />
              </node>
              <node concept="1mIQ4w" id="CUW2QYOH3A" role="2OqNvi">
                <node concept="chp4Y" id="CUW2QYOHrg" role="cj9EA">
                  <ref role="cht4Q" to="f8gn:CUW2QYMXaO" resolve="IndentCell" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1Koe21" id="1nuEuAfyIB3" role="1lVwrX">
        <node concept="2OqwBi" id="1nuEuAfyIB4" role="1Koe22">
          <node concept="2ShNRf" id="1nuEuAfyIB5" role="2Oq$k0">
            <node concept="1pGfFk" id="1nuEuAfyIB6" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1nuEuAfyIB7" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1nuEuAfyIB8" role="37wK5m" />
            <node concept="3clFbT" id="1nuEuAfyIB9" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8zR" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8_D" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI70X" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI73F" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI73G" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI73H" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1nuEuAfyIBd" role="1bW5cS">
                <node concept="3clFbF" id="1nuEuAfyIBe" role="3cqZAp">
                  <node concept="2OqwBi" id="1nuEuAfyIBf" role="3clFbG">
                    <node concept="37vLTw" id="1nuEuAfyIBg" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI70X" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlyI" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyJ" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyK" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyL" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyM" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyN" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1nuEuAfyIBh" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.indented(kotlin.jvm.functions.Function1)" resolve="indented" />
                      <node concept="3s519P" id="HgolRSV8_E" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8Bs" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI73I" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI79q" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI79r" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI79s" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEhg" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEhh" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEhi" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEhj" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEhk" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEhl" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEhm" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEhn" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="1nuEuAfyIBl" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfyIBm" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfyIBn" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfyIBo" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfyIBp" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfyIBq" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfyIBr" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfyIBs" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfyIBt" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbH" id="1nuEuAfyIBu" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfyIBv" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfyIBF" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfyIBG" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfyIBH" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfyIBI" role="3clFbG">
                                      <node concept="2OqwBi" id="1nuEuAfyIBJ" role="2Oq$k0">
                                        <node concept="3Tsc0h" id="1nuEuAfyIBK" role="2OqNvi">
                                          <ref role="3TtcxE" to="f8gn:CUW2QYKJ$J" resolve="cells" />
                                        </node>
                                        <node concept="30H73N" id="1nuEuAfyIBL" role="2Oq$k0" />
                                      </node>
                                      <node concept="7r0gD" id="1nuEuAfyIBM" role="2OqNvi">
                                        <node concept="3cmrfG" id="1nuEuAfyIBN" role="7T0AP">
                                          <property role="3cmrfH" value="1" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="1nuEuAfyIBA" role="3cqZAp">
                            <node concept="10M0yZ" id="1nuEuAfyIBB" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1nuEuAfyIBC" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1nuEuAfyIBD" role="3cqZAp">
                  <node concept="10M0yZ" id="1nuEuAfyIBE" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yZ3g2L" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYOmUP" resolve="WithIndentCell" />
      <node concept="1Koe21" id="2QtC6yZ3g2M" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yZ3g2N" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yZ3g2O" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yZ3g2P" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yZ3g2Q" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yZ3g2R" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yZ3g2S" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8Bt" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8Df" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI79t" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI7cb" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI7cc" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI7cd" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yZ3g2W" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yZ3g2X" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yZ3g2Y" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yZ3g2Z" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI79t" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlyO" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyP" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyQ" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyR" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyS" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyT" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yZ3g30" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.indented(kotlin.jvm.functions.Function1)" resolve="indented" />
                      <node concept="3s519P" id="HgolRSV8Dg" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8F2" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI7ce" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI7hU" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI7hV" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI7hW" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEho" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEhp" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEhq" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEhr" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEhs" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEht" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEhu" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEhv" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZ3g3S" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0H" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0G" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0F" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0E" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU0D" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU0C" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0A" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0B" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbH" id="2QtC6yZ3EZr" role="3cqZAp">
                            <node concept="2b32R4" id="2QtC6yZ3Fqi" role="lGtFl">
                              <node concept="3JmXsc" id="2QtC6yZ3Fql" role="2P8S$">
                                <node concept="3clFbS" id="2QtC6yZ3Fqm" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZ3FV0" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZ3FV2" role="3clFbG">
                                      <node concept="3Tsc0h" id="2QtC6yZ3FV3" role="2OqNvi">
                                        <ref role="3TtcxE" to="f8gn:CUW2QYOnl8" resolve="cells" />
                                      </node>
                                      <node concept="30H73N" id="2QtC6yZ3FV4" role="2Oq$k0" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZ3g3T" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yZ3g3U" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yZ3g3V" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yZ3g3W" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yZ3g3X" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yZ4acj" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
      <node concept="1Koe21" id="2QtC6yZ4ack" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yZ4acl" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yZ4acm" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yZ4acn" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yZ4aco" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yZ4acp" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yZ4acq" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8F3" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8GP" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI7hX" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI7kF" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI7kG" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI7kH" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yZ4acu" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yZ4acv" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yZ4acw" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yZ4acx" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI7hX" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlyU" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlyV" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlyW" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlyX" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlyY" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlyZ" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yZ4acy" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.vertical(kotlin.jvm.functions.Function1)" resolve="vertical" />
                      <node concept="3s519P" id="HgolRSV8GQ" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8IC" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI7kI" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI7qq" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI7qr" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI7qs" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEhw" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEhx" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEhy" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEhz" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEh$" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEh_" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEhA" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEhB" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZ4acA" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0P" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0O" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0N" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0M" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU0L" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU0K" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0I" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0J" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbH" id="2QtC6yZ4acB" role="3cqZAp">
                            <node concept="2b32R4" id="2QtC6yZ4acC" role="lGtFl">
                              <node concept="3JmXsc" id="2QtC6yZ4acD" role="2P8S$">
                                <node concept="3clFbS" id="2QtC6yZ4acE" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZ4acF" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZ4acG" role="3clFbG">
                                      <node concept="3Tsc0h" id="2QtC6yZ4acH" role="2OqNvi">
                                        <ref role="3TtcxE" to="f8gn:CUW2QYKJ$J" resolve="cells" />
                                      </node>
                                      <node concept="30H73N" id="2QtC6yZ4acI" role="2Oq$k0" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZ4acJ" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yZ4acK" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yZ4acL" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yZ4acM" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yZ4acN" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="2QtC6yZ4t31" role="30HLyM">
        <node concept="3clFbS" id="2QtC6yZ4t32" role="2VODD2">
          <node concept="3clFbF" id="2QtC6yZ4tMd" role="3cqZAp">
            <node concept="2OqwBi" id="2QtC6yZ4tMe" role="3clFbG">
              <node concept="30H73N" id="2QtC6yZ4tMf" role="2Oq$k0" />
              <node concept="2qgKlT" id="2QtC6yZ4tMg" role="2OqNvi">
                <ref role="37wK5l" to="wsib:CUW2QYKLam" resolve="isVerticalLayout" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yZ4u_r" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:CUW2QYKJtX" resolve="StaticCollectionCell" />
      <node concept="1Koe21" id="2QtC6yZ4u_s" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yZ4u_t" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yZ4u_u" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yZ4u_v" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yZ4u_w" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yZ4u_x" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yZ4u_y" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8ID" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8Kr" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI7qt" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI7tb" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI7tc" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI7td" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yZ4u_A" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yZ4u_B" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yZ4u_C" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yZ4u_D" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI7qt" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlz0" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlz1" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlz2" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlz3" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlz4" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlz5" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yZ4u_E" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.horizontal(kotlin.jvm.functions.Function1)" resolve="horizontal" />
                      <node concept="3s519P" id="HgolRSV8Ks" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8Me" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI7te" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI7yU" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI7yV" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI7yW" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEhC" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEhD" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEhE" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEhF" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEhG" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEhH" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEhI" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEhJ" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZ4u_I" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU0X" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU0W" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU0V" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU0U" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU0T" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU0S" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0Q" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0R" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbH" id="2QtC6yZ4u_J" role="3cqZAp">
                            <node concept="2b32R4" id="2QtC6yZ4u_K" role="lGtFl">
                              <node concept="3JmXsc" id="2QtC6yZ4u_L" role="2P8S$">
                                <node concept="3clFbS" id="2QtC6yZ4u_M" role="2VODD2">
                                  <node concept="3clFbF" id="2QtC6yZ4u_N" role="3cqZAp">
                                    <node concept="2OqwBi" id="2QtC6yZ4u_O" role="3clFbG">
                                      <node concept="3Tsc0h" id="2QtC6yZ4u_P" role="2OqNvi">
                                        <ref role="3TtcxE" to="f8gn:CUW2QYKJ$J" resolve="cells" />
                                      </node>
                                      <node concept="30H73N" id="2QtC6yZ4u_Q" role="2Oq$k0" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZ4u_R" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yZ4u_S" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yZ4u_T" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yZ4u_U" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yZ4u_V" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2QtC6yZ4Rz6" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:ziPuhE_FoY" resolve="BL_ExpressionCell" />
      <node concept="1Koe21" id="2QtC6yZ4Rz7" role="1lVwrX">
        <node concept="2OqwBi" id="2QtC6yZ4Rz8" role="1Koe22">
          <node concept="2ShNRf" id="2QtC6yZ4Rz9" role="2Oq$k0">
            <node concept="1pGfFk" id="2QtC6yZ4Rza" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2QtC6yZ4Rzb" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2QtC6yZ4Rzc" role="37wK5m" />
            <node concept="3clFbT" id="2QtC6yZ4Rzd" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8Mf" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8O1" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI7yX" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI7_F" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI7_G" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI7_H" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2QtC6yZ4Rzh" role="1bW5cS">
                <node concept="3clFbF" id="2QtC6yZ4Rzi" role="3cqZAp">
                  <node concept="2OqwBi" id="2QtC6yZ4Rzj" role="3clFbG">
                    <node concept="37vLTw" id="2QtC6yZ4Rzk" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI7yX" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlz6" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlz7" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlz8" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlz9" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlza" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlzb" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2QtC6yZ4Rzl" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.horizontal(kotlin.jvm.functions.Function1)" resolve="horizontal" />
                      <node concept="3s519P" id="HgolRSV8O2" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8PO" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI7_I" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI7Fq" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI7Fr" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI7Fs" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEhK" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEhL" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEhM" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEhN" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEhO" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEhP" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEhQ" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEhR" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2QtC6yZ4Rzp" role="1bW5cS">
                          <node concept="3clFbH" id="1nuEuAfxU15" role="3cqZAp">
                            <node concept="2b32R4" id="1nuEuAfxU14" role="lGtFl">
                              <node concept="3JmXsc" id="1nuEuAfxU13" role="2P8S$">
                                <node concept="3clFbS" id="1nuEuAfxU12" role="2VODD2">
                                  <node concept="3clFbF" id="1nuEuAfxU11" role="3cqZAp">
                                    <node concept="2OqwBi" id="1nuEuAfxU10" role="3clFbG">
                                      <node concept="30H73N" id="1nuEuAfxU0Y" role="2Oq$k0" />
                                      <node concept="2qgKlT" id="1nuEuAfxU0Z" role="2OqNvi">
                                        <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbF" id="2QtC6yZ50Ta" role="3cqZAp">
                            <node concept="2OqwBi" id="2QtC6yZ50Tc" role="3clFbG">
                              <node concept="37vLTw" id="2QtC6yZ50Td" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI7_I" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="2QtC6yZ50Te" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~CellTemplateBuilder.withUntypedNode(kotlin.jvm.functions.Function1)" resolve="withUntypedNode" />
                                <node concept="3s519P" id="HgolRSV8PP" role="37wK5m">
                                  <node concept="3uibUv" id="HgolRSV8QH" role="3s52Nf">
                                    <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                                  </node>
                                  <node concept="37vLTG" id="4HILH0eI7Ft" role="1bW2Oz">
                                    <property role="TrG5h" value="modelixNode" />
                                    <node concept="3uibUv" id="4HILH0eI7Ms" role="1tU5fm">
                                      <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                                    </node>
                                    <node concept="17Uvod" id="HgolRTSEhS" role="lGtFl">
                                      <property role="2qtEX9" value="name" />
                                      <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                      <node concept="3zFVjK" id="HgolRTSEhT" role="3zH0cK">
                                        <node concept="3clFbS" id="HgolRTSEhU" role="2VODD2">
                                          <node concept="3clFbF" id="HgolRTSEhV" role="3cqZAp">
                                            <node concept="2OqwBi" id="HgolRTSEhW" role="3clFbG">
                                              <node concept="1iwH7S" id="HgolRTSEhX" role="2Oq$k0" />
                                              <node concept="2piZGk" id="HgolRTSEhY" role="2OqNvi">
                                                <node concept="Xl_RD" id="HgolRTSEhZ" role="2piZGb">
                                                  <property role="Xl_RC" value="modelixNode" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node concept="3clFbS" id="2QtC6yZ50Ti" role="1bW5cS">
                                    <node concept="3cpWs8" id="2QtC6z1jQKQ" role="3cqZAp">
                                      <node concept="3cpWsn" id="2QtC6z1jQKT" role="3cpWs9">
                                        <property role="TrG5h" value="node" />
                                        <property role="3TUv4t" value="true" />
                                        <node concept="3Tqbb2" id="2QtC6z1jQKO" role="1tU5fm" />
                                        <node concept="2OqwBi" id="2QtC6z1jVld" role="33vP2m">
                                          <node concept="10M0yZ" id="2QtC6z1jVle" role="2Oq$k0">
                                            <ref role="3cqZAo" to="1ut2:~ModelixNodeAsMPSNode.Companion" resolve="Companion" />
                                            <ref role="1PxDUh" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                                          </node>
                                          <node concept="liA8E" id="2QtC6z1jVlf" role="2OqNvi">
                                            <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode$Companion.toMPSNode(org.modelix.model.api.INode)" resolve="toMPSNode" />
                                            <node concept="37vLTw" id="2xR011TvVVZ" role="37wK5m">
                                              <ref role="3cqZAo" node="4HILH0eI7Ft" resolve="modelixNode" />
                                            </node>
                                          </node>
                                        </node>
                                        <node concept="17Uvod" id="HgolRTSEi0" role="lGtFl">
                                          <property role="2qtEX9" value="name" />
                                          <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                          <node concept="3zFVjK" id="HgolRTSEi1" role="3zH0cK">
                                            <node concept="3clFbS" id="HgolRTSEi2" role="2VODD2">
                                              <node concept="3clFbF" id="HgolRTSEi3" role="3cqZAp">
                                                <node concept="2OqwBi" id="HgolRTSEi4" role="3clFbG">
                                                  <node concept="1iwH7S" id="HgolRTSEi5" role="2Oq$k0" />
                                                  <node concept="2piZGk" id="HgolRTSEi6" role="2OqNvi">
                                                    <node concept="Xl_RD" id="HgolRTSEi7" role="2piZGb">
                                                      <property role="Xl_RC" value="node" />
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node concept="3clFbF" id="2QtC6yZ59nV" role="3cqZAp">
                                      <node concept="2OqwBi" id="2QtC6yZ59nX" role="3clFbG">
                                        <node concept="37vLTw" id="2QtC6yZ59nY" role="2Oq$k0">
                                          <ref role="3cqZAo" node="4HILH0eI7_I" resolve="builder" />
                                        </node>
                                        <node concept="liA8E" id="2QtC6yZ59nZ" role="2OqNvi">
                                          <ref role="37wK5l" to="jej1:~CellTemplateBuilder.modelAccess(kotlin.jvm.functions.Function1)" resolve="modelAccess" />
                                          <node concept="3s519P" id="HgolRSV8QI" role="37wK5m">
                                            <node concept="3uibUv" id="HgolRSV8RA" role="3s52Nf">
                                              <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                                            </node>
                                            <node concept="37vLTG" id="4HILH0eI7Mt" role="1bW2Oz">
                                              <property role="TrG5h" value="builder" />
                                              <node concept="3uibUv" id="4HILH0eI7Va" role="1tU5fm">
                                                <ref role="3uigEE" to="jej1:~ModelAccessBuilder" resolve="ModelAccessBuilder" />
                                              </node>
                                              <node concept="17Uvod" id="HgolRTSEi8" role="lGtFl">
                                                <property role="2qtEX9" value="name" />
                                                <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                                <node concept="3zFVjK" id="HgolRTSEi9" role="3zH0cK">
                                                  <node concept="3clFbS" id="HgolRTSEia" role="2VODD2">
                                                    <node concept="3clFbF" id="HgolRTSEib" role="3cqZAp">
                                                      <node concept="2OqwBi" id="HgolRTSEic" role="3clFbG">
                                                        <node concept="1iwH7S" id="HgolRTSEid" role="2Oq$k0" />
                                                        <node concept="2piZGk" id="HgolRTSEie" role="2OqNvi">
                                                          <node concept="Xl_RD" id="HgolRTSEif" role="2piZGb">
                                                            <property role="Xl_RC" value="builder" />
                                                          </node>
                                                        </node>
                                                      </node>
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                            <node concept="3clFbS" id="2QtC6yZ59o3" role="1bW5cS">
                                              <node concept="3clFbF" id="2QtC6yZ5lml" role="3cqZAp">
                                                <node concept="2OqwBi" id="2QtC6yZ5lmn" role="3clFbG">
                                                  <node concept="37vLTw" id="2QtC6yZ5lmo" role="2Oq$k0">
                                                    <ref role="3cqZAo" node="4HILH0eI7Mt" resolve="builder" />
                                                  </node>
                                                  <node concept="liA8E" id="2QtC6yZ5lmp" role="2OqNvi">
                                                    <ref role="37wK5l" to="jej1:~ModelAccessBuilder.get(kotlin.jvm.functions.Function0)" resolve="get" />
                                                    <node concept="3s519P" id="HgolRSV8RB" role="37wK5m">
                                                      <node concept="17QB3L" id="HgolRSV8Sc" role="3s52Nf" />
                                                      <node concept="3clFbS" id="2QtC6yZ5lmt" role="1bW5cS">
                                                        <node concept="3cpWs6" id="2QtC6yZ5lmu" role="3cqZAp">
                                                          <node concept="Xl_RD" id="2QtC6yZ5wxE" role="3cqZAk">
                                                            <property role="Xl_RC" value="" />
                                                            <node concept="29HgVG" id="2QtC6yZ5HO1" role="lGtFl">
                                                              <node concept="3NFfHV" id="2QtC6yZ5Itw" role="3NFExx">
                                                                <node concept="3clFbS" id="2QtC6yZ5Itx" role="2VODD2">
                                                                  <node concept="3clFbF" id="2QtC6yZ5J94" role="3cqZAp">
                                                                    <node concept="2OqwBi" id="2QtC6yZ5Jm1" role="3clFbG">
                                                                      <node concept="30H73N" id="2QtC6yZ5J93" role="2Oq$k0" />
                                                                      <node concept="3TrEf2" id="2QtC6yZ5SFX" role="2OqNvi">
                                                                        <ref role="3Tt5mk" to="f8gn:ziPuhE_Fp2" resolve="expression" />
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
                                              <node concept="3cpWs6" id="2QtC6yZ59oc" role="3cqZAp">
                                                <node concept="10M0yZ" id="2QtC6yZ59od" role="3cqZAk">
                                                  <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                                                  <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node concept="3cpWs6" id="2QtC6yZ50Tr" role="3cqZAp">
                                      <node concept="10M0yZ" id="2QtC6yZ50Ts" role="3cqZAk">
                                        <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                                        <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2QtC6yZ4Rzy" role="3cqZAp">
                            <node concept="10M0yZ" id="2QtC6yZ4Rzz" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2QtC6yZ4Rz$" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2QtC6yZ4Rz_" role="3cqZAp">
                  <node concept="10M0yZ" id="2QtC6yZ4RzA" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2xR011UnUZ6" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:22f9nDgNr2y" resolve="BL_NotationNodeExpression" />
      <node concept="1Koe21" id="2xR011UnUZ7" role="1lVwrX">
        <node concept="3clFb_" id="2xR011UnUZ8" role="1Koe22">
          <property role="TrG5h" value="f" />
          <node concept="37vLTG" id="2xR011UnUZ9" role="3clF46">
            <property role="TrG5h" value="modelixNode" />
            <node concept="3uibUv" id="2xR011UnUZa" role="1tU5fm">
              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
            </node>
          </node>
          <node concept="3Tqbb2" id="2xR011UnUZb" role="3clF45" />
          <node concept="3Tm1VV" id="2xR011UnUZc" role="1B3o_S" />
          <node concept="3clFbS" id="2xR011UnUZd" role="3clF47">
            <node concept="3clFbF" id="2xR011UnUZe" role="3cqZAp">
              <node concept="2OqwBi" id="2xR011UnUZf" role="3clFbG">
                <node concept="10M0yZ" id="2xR011UnUZg" role="2Oq$k0">
                  <ref role="3cqZAo" to="1ut2:~ModelixNodeAsMPSNode.Companion" resolve="Companion" />
                  <ref role="1PxDUh" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                </node>
                <node concept="liA8E" id="2xR011UnUZh" role="2OqNvi">
                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode$Companion.toMPSNode(org.modelix.model.api.INode)" resolve="toMPSNode" />
                  <node concept="37vLTw" id="2xR011UnUZi" role="37wK5m">
                    <ref role="3cqZAo" node="2xR011UnUZ9" resolve="modelixNode" />
                    <node concept="1ZhdrF" id="HgolRTRlzc" role="lGtFl">
                      <property role="2qtEX8" value="variableDeclaration" />
                      <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                      <node concept="3$xsQk" id="HgolRTRlzd" role="3$ytzL">
                        <node concept="3clFbS" id="HgolRTRlze" role="2VODD2">
                          <node concept="3clFbF" id="HgolRTRlzf" role="3cqZAp">
                            <node concept="2YIFZM" id="HgolRTRlzg" role="3clFbG">
                              <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                              <ref role="37wK5l" to="wsib:HgolRTUXg0" resolve="findUntypedNodeParameter" />
                              <node concept="3l3mFP" id="HgolRTRlzh" role="37wK5m" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="raruj" id="2xR011UnUZj" role="lGtFl" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4OG1auJGV_e" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:43rgS5P5dfO" resolve="TextColorStyleItem" />
      <node concept="1Koe21" id="4OG1auJGV_f" role="1lVwrX">
        <node concept="2OqwBi" id="4OG1auJGV_g" role="1Koe22">
          <node concept="2ShNRf" id="4OG1auJGV_h" role="2Oq$k0">
            <node concept="1pGfFk" id="4OG1auJGV_i" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="4OG1auJGV_j" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="4OG1auJGV_k" role="37wK5m" />
            <node concept="3clFbT" id="4OG1auJGV_l" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8Sd" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8TZ" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI7Vb" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI7XT" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI7XU" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI7XV" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4OG1auJGV_p" role="1bW5cS">
                <node concept="3clFbF" id="4OG1auJGV_q" role="3cqZAp">
                  <node concept="2OqwBi" id="4OG1auJGV_r" role="3clFbG">
                    <node concept="37vLTw" id="4OG1auJGV_s" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI7Vb" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlzi" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlzj" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlzk" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlzl" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlzm" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlzn" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="4OG1auJGV_t" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.withUntypedNode(kotlin.jvm.functions.Function1)" resolve="withUntypedNode" />
                      <node concept="3s519P" id="HgolRSV8U0" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8US" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI7XW" role="1bW2Oz">
                          <property role="TrG5h" value="modelixNode" />
                          <node concept="3uibUv" id="4HILH0eI826" role="1tU5fm">
                            <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                          </node>
                          <node concept="17Uvod" id="HgolRTSEig" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEih" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEii" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEij" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEik" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEil" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEim" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEin" role="2piZGb">
                                        <property role="Xl_RC" value="modelixNode" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="4OG1auJGV_P" role="1bW5cS">
                          <node concept="3clFbF" id="4OG1auKpSrj" role="3cqZAp">
                            <node concept="2OqwBi" id="4OG1auKpSrk" role="3clFbG">
                              <node concept="37vLTw" id="4OG1auKpSrl" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI7Vb" resolve="builder" />
                                <node concept="1ZhdrF" id="HgolRTRlzo" role="lGtFl">
                                  <property role="2qtEX8" value="variableDeclaration" />
                                  <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                                  <node concept="3$xsQk" id="HgolRTRlzp" role="3$ytzL">
                                    <node concept="3clFbS" id="HgolRTRlzq" role="2VODD2">
                                      <node concept="3clFbF" id="HgolRTRlzr" role="3cqZAp">
                                        <node concept="2YIFZM" id="HgolRTRlzs" role="3clFbG">
                                          <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                          <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                          <node concept="3l3mFP" id="HgolRTRlzt" role="37wK5m" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node concept="liA8E" id="4OG1auKpSrm" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~CellTemplateBuilder.textColor(java.lang.String)" resolve="textColor" />
                                <node concept="Xl_RD" id="4OG1auJGV_R" role="37wK5m">
                                  <property role="Xl_RC" value="" />
                                  <node concept="29HgVG" id="4OG1auJGV_S" role="lGtFl">
                                    <node concept="3NFfHV" id="4OG1auJGV_T" role="3NFExx">
                                      <node concept="3clFbS" id="4OG1auJGV_U" role="2VODD2">
                                        <node concept="3clFbF" id="4OG1auJGV_V" role="3cqZAp">
                                          <node concept="2OqwBi" id="4OG1auJGVA1" role="3clFbG">
                                            <node concept="30H73N" id="4OG1auJGVA2" role="2Oq$k0" />
                                            <node concept="2qgKlT" id="4OG1auJGVA3" role="2OqNvi">
                                              <ref role="37wK5l" to="wsib:4OG1auJF0F_" resolve="getComputedExpression" />
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
                          <node concept="3cpWs6" id="4OG1auKpSrw" role="3cqZAp">
                            <node concept="10M0yZ" id="4OG1auKpSrx" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="4OG1auJGV_A" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="4OG1auJGV_B" role="3cqZAp">
                  <node concept="10M0yZ" id="4OG1auJGV_C" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="4OG1auJGV_D" role="30HLyM">
        <node concept="3clFbS" id="4OG1auJGV_E" role="2VODD2">
          <node concept="3clFbF" id="4OG1auJGV_F" role="3cqZAp">
            <node concept="2OqwBi" id="4OG1auJGV_L" role="3clFbG">
              <node concept="30H73N" id="4OG1auJGV_M" role="2Oq$k0" />
              <node concept="2qgKlT" id="4OG1auJGV_N" role="2OqNvi">
                <ref role="37wK5l" to="wsib:4OG1auJF0Fh" resolve="isComputedColor" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1nuEuAfuL31" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:43rgS5P5dfO" resolve="TextColorStyleItem" />
      <node concept="1Koe21" id="1nuEuAfuL32" role="1lVwrX">
        <node concept="2OqwBi" id="1nuEuAfuL33" role="1Koe22">
          <node concept="2ShNRf" id="1nuEuAfuL34" role="2Oq$k0">
            <node concept="1pGfFk" id="1nuEuAfuL35" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1nuEuAfuL36" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1nuEuAfuL37" role="37wK5m" />
            <node concept="3clFbT" id="1nuEuAfuL38" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8UT" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8WF" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI827" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI84P" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI84Q" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI84R" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1nuEuAfuL3c" role="1bW5cS">
                <node concept="3clFbF" id="1nuEuAfuL3d" role="3cqZAp">
                  <node concept="2OqwBi" id="1nuEuAfuL3e" role="3clFbG">
                    <node concept="37vLTw" id="1nuEuAfuL3f" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI827" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlzu" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlzv" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlzw" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlzx" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlzy" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlzz" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1nuEuAfuL3g" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.textColor(java.lang.String)" resolve="textColor" />
                      <node concept="Xl_RD" id="1nuEuAfuL3h" role="37wK5m">
                        <property role="Xl_RC" value="abc" />
                        <node concept="17Uvod" id="1nuEuAfuL3i" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="1nuEuAfuL3j" role="3zH0cK">
                            <node concept="3clFbS" id="1nuEuAfuL3k" role="2VODD2">
                              <node concept="3clFbF" id="1nuEuAfuL3l" role="3cqZAp">
                                <node concept="2OqwBi" id="1nuEuAfwFtX" role="3clFbG">
                                  <node concept="30H73N" id="1nuEuAfwFtV" role="2Oq$k0" />
                                  <node concept="2qgKlT" id="1nuEuAfwFtW" role="2OqNvi">
                                    <ref role="37wK5l" to="wsib:1nuEuAfvz3a" resolve="getCssColor" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1nuEuAfuL3w" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1nuEuAfuL3x" role="3cqZAp">
                  <node concept="10M0yZ" id="1nuEuAfuL3y" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="4OG1auJGVA4" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:1nuEuAfnjtS" resolve="BackgroundColorStyleItem" />
      <node concept="1Koe21" id="4OG1auJGVA5" role="1lVwrX">
        <node concept="2OqwBi" id="4OG1auJGVA6" role="1Koe22">
          <node concept="2ShNRf" id="4OG1auJGVA7" role="2Oq$k0">
            <node concept="1pGfFk" id="4OG1auJGVA8" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="4OG1auJGVA9" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="4OG1auJGVAa" role="37wK5m" />
            <node concept="3clFbT" id="4OG1auJGVAb" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8WG" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV8Yu" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI84S" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI87A" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI87B" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI87C" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4OG1auJGVAf" role="1bW5cS">
                <node concept="3clFbF" id="4OG1auJGVAg" role="3cqZAp">
                  <node concept="2OqwBi" id="4OG1auJGVAh" role="3clFbG">
                    <node concept="37vLTw" id="4OG1auJGVAi" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI84S" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlz$" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlz_" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlzA" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlzB" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlzC" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlzD" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="4OG1auJGVAj" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.withUntypedNode(kotlin.jvm.functions.Function1)" resolve="withUntypedNode" />
                      <node concept="3s519P" id="HgolRSV8Yv" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV8Zn" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI87D" role="1bW2Oz">
                          <property role="TrG5h" value="modelixNode" />
                          <node concept="3uibUv" id="4HILH0eI8bN" role="1tU5fm">
                            <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                          </node>
                          <node concept="17Uvod" id="HgolRTSEio" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEip" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEiq" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEir" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEis" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEit" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEiu" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEiv" role="2piZGb">
                                        <property role="Xl_RC" value="modelixNode" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="4OG1auJGVAF" role="1bW5cS">
                          <node concept="3clFbF" id="4OG1auKpSry" role="3cqZAp">
                            <node concept="2OqwBi" id="4OG1auKpSrz" role="3clFbG">
                              <node concept="37vLTw" id="4OG1auKpSr$" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI84S" resolve="builder" />
                                <node concept="1ZhdrF" id="HgolRTRlzE" role="lGtFl">
                                  <property role="2qtEX8" value="variableDeclaration" />
                                  <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                                  <node concept="3$xsQk" id="HgolRTRlzF" role="3$ytzL">
                                    <node concept="3clFbS" id="HgolRTRlzG" role="2VODD2">
                                      <node concept="3clFbF" id="HgolRTRlzH" role="3cqZAp">
                                        <node concept="2YIFZM" id="HgolRTRlzI" role="3clFbG">
                                          <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                          <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                          <node concept="3l3mFP" id="HgolRTRlzJ" role="37wK5m" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node concept="liA8E" id="4OG1auKpSr_" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~CellTemplateBuilder.backgroundColor(java.lang.String)" resolve="backgroundColor" />
                                <node concept="Xl_RD" id="4OG1auJGVAH" role="37wK5m">
                                  <property role="Xl_RC" value="" />
                                  <node concept="29HgVG" id="4OG1auJGVAI" role="lGtFl">
                                    <node concept="3NFfHV" id="4OG1auJGVAJ" role="3NFExx">
                                      <node concept="3clFbS" id="4OG1auJGVAK" role="2VODD2">
                                        <node concept="3clFbF" id="4OG1auJGVAL" role="3cqZAp">
                                          <node concept="2OqwBi" id="4OG1auJGVAR" role="3clFbG">
                                            <node concept="30H73N" id="4OG1auJGVAS" role="2Oq$k0" />
                                            <node concept="2qgKlT" id="4OG1auJGVAT" role="2OqNvi">
                                              <ref role="37wK5l" to="wsib:4OG1auJF0F_" resolve="getComputedExpression" />
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
                          <node concept="3cpWs6" id="4OG1auKpSrJ" role="3cqZAp">
                            <node concept="10M0yZ" id="4OG1auKpSrK" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="4OG1auJGVAs" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="4OG1auJGVAt" role="3cqZAp">
                  <node concept="10M0yZ" id="4OG1auJGVAu" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="4OG1auJGVAv" role="30HLyM">
        <node concept="3clFbS" id="4OG1auJGVAw" role="2VODD2">
          <node concept="3clFbF" id="4OG1auJGVAx" role="3cqZAp">
            <node concept="2OqwBi" id="4OG1auJGVAB" role="3clFbG">
              <node concept="30H73N" id="4OG1auJGVAC" role="2Oq$k0" />
              <node concept="2qgKlT" id="4OG1auJGVAD" role="2OqNvi">
                <ref role="37wK5l" to="wsib:4OG1auJF0Fh" resolve="isComputedColor" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="1nuEuAfuL3z" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:1nuEuAfnjtS" resolve="BackgroundColorStyleItem" />
      <node concept="1Koe21" id="1nuEuAfuL3$" role="1lVwrX">
        <node concept="2OqwBi" id="1nuEuAfuL3_" role="1Koe22">
          <node concept="2ShNRf" id="1nuEuAfuL3A" role="2Oq$k0">
            <node concept="1pGfFk" id="1nuEuAfuL3B" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="1nuEuAfuL3C" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="1nuEuAfuL3D" role="37wK5m" />
            <node concept="3clFbT" id="1nuEuAfuL3E" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV8Zo" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV91a" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8bO" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8ey" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8ez" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8e$" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="1nuEuAfuL3I" role="1bW5cS">
                <node concept="3clFbF" id="1nuEuAfuL3J" role="3cqZAp">
                  <node concept="2OqwBi" id="1nuEuAfuL3K" role="3clFbG">
                    <node concept="37vLTw" id="1nuEuAfuL3L" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8bO" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlzK" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlzL" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlzM" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlzN" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlzO" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlzP" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="1nuEuAfuL3M" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.backgroundColor(java.lang.String)" resolve="backgroundColor" />
                      <node concept="Xl_RD" id="1nuEuAfuL3N" role="37wK5m">
                        <property role="Xl_RC" value="abc" />
                        <node concept="17Uvod" id="1nuEuAfuL3O" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="1nuEuAfuL3P" role="3zH0cK">
                            <node concept="3clFbS" id="1nuEuAfuL3Q" role="2VODD2">
                              <node concept="3clFbF" id="1nuEuAfuL3R" role="3cqZAp">
                                <node concept="2OqwBi" id="1nuEuAfwFu0" role="3clFbG">
                                  <node concept="30H73N" id="1nuEuAfwFtY" role="2Oq$k0" />
                                  <node concept="2qgKlT" id="1nuEuAfwFtZ" role="2OqNvi">
                                    <ref role="37wK5l" to="wsib:1nuEuAfvz3a" resolve="getCssColor" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="1nuEuAfuL42" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="1nuEuAfuL43" role="3cqZAp">
                  <node concept="10M0yZ" id="1nuEuAfuL44" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="74Ju8e4RkS9" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4DCI_D3jA$7" resolve="ItalicStyleItem" />
      <node concept="1Koe21" id="74Ju8e4RkSa" role="1lVwrX">
        <node concept="2OqwBi" id="74Ju8e4RkSb" role="1Koe22">
          <node concept="2ShNRf" id="74Ju8e4RkSc" role="2Oq$k0">
            <node concept="1pGfFk" id="74Ju8e4RkSd" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="74Ju8e4RkSe" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="74Ju8e4RkSf" role="37wK5m" />
            <node concept="3clFbT" id="74Ju8e4RkSg" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV91b" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV92X" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8e_" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8hj" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8hk" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8hl" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="74Ju8e4RkSk" role="1bW5cS">
                <node concept="3clFbF" id="74Ju8e4RkSl" role="3cqZAp">
                  <node concept="2OqwBi" id="74Ju8e4RkSm" role="3clFbG">
                    <node concept="37vLTw" id="74Ju8e4RkSn" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8e_" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlzQ" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlzR" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlzS" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlzT" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRlzU" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRlzV" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="74Ju8e4RkSo" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.italic(boolean)" resolve="italic" />
                      <node concept="3clFbT" id="74Ju8e4RkS$" role="37wK5m">
                        <property role="3clFbU" value="true" />
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="74Ju8e4RkSx" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="74Ju8e4RkSy" role="3cqZAp">
                  <node concept="10M0yZ" id="74Ju8e4RkSz" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="74Ju8e4RkS_" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4DCI_D3jABp" resolve="UnderlinedStyleItem" />
      <node concept="1Koe21" id="74Ju8e4RkSA" role="1lVwrX">
        <node concept="2OqwBi" id="74Ju8e4RkSB" role="1Koe22">
          <node concept="2ShNRf" id="74Ju8e4RkSC" role="2Oq$k0">
            <node concept="1pGfFk" id="74Ju8e4RkSD" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="74Ju8e4RkSE" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="74Ju8e4RkSF" role="37wK5m" />
            <node concept="3clFbT" id="74Ju8e4RkSG" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV92Y" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV94K" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8hm" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8k4" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8k5" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8k6" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="74Ju8e4RkSK" role="1bW5cS">
                <node concept="3clFbF" id="74Ju8e4RkSL" role="3cqZAp">
                  <node concept="2OqwBi" id="74Ju8e4RkSM" role="3clFbG">
                    <node concept="37vLTw" id="74Ju8e4RkSN" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8hm" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRlzW" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRlzX" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRlzY" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRlzZ" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRl$0" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRl$1" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="74Ju8e4RkSO" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.underlined(boolean)" resolve="underlined" />
                      <node concept="3clFbT" id="74Ju8e4RkT0" role="37wK5m">
                        <property role="3clFbU" value="true" />
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="74Ju8e4RkSX" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="74Ju8e4RkSY" role="3cqZAp">
                  <node concept="10M0yZ" id="74Ju8e4RkSZ" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="74Ju8e4RkT1" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4DCI_D3jAEG" resolve="StrikeOutStyleItem" />
      <node concept="1Koe21" id="74Ju8e4RkT2" role="1lVwrX">
        <node concept="2OqwBi" id="74Ju8e4RkT3" role="1Koe22">
          <node concept="2ShNRf" id="74Ju8e4RkT4" role="2Oq$k0">
            <node concept="1pGfFk" id="74Ju8e4RkT5" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="74Ju8e4RkT6" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="74Ju8e4RkT7" role="37wK5m" />
            <node concept="3clFbT" id="74Ju8e4RkT8" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV94L" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV96z" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8k7" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8mP" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8mQ" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8mR" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="74Ju8e4RkTc" role="1bW5cS">
                <node concept="3clFbF" id="74Ju8e4RkTd" role="3cqZAp">
                  <node concept="2OqwBi" id="74Ju8e4RkTe" role="3clFbG">
                    <node concept="37vLTw" id="74Ju8e4RkTf" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8k7" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRl$2" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRl$3" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRl$4" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRl$5" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRl$6" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRl$7" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="74Ju8e4RkTg" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.strikeOut(boolean)" resolve="strikeOut" />
                      <node concept="3clFbT" id="74Ju8e4RkTs" role="37wK5m">
                        <property role="3clFbU" value="true" />
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="74Ju8e4RkTp" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="74Ju8e4RkTq" role="3cqZAp">
                  <node concept="10M0yZ" id="74Ju8e4RkTr" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="74Ju8e4RkTt" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4DCI_D3jAwQ" resolve="BoldStyleItem" />
      <node concept="1Koe21" id="74Ju8e4RkTu" role="1lVwrX">
        <node concept="2OqwBi" id="74Ju8e4RkTv" role="1Koe22">
          <node concept="2ShNRf" id="74Ju8e4RkTw" role="2Oq$k0">
            <node concept="1pGfFk" id="74Ju8e4RkTx" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="74Ju8e4RkTy" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="74Ju8e4RkTz" role="37wK5m" />
            <node concept="3clFbT" id="74Ju8e4RkT$" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV96$" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV98m" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8mS" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8pA" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8pB" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8pC" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="74Ju8e4RkTC" role="1bW5cS">
                <node concept="3clFbF" id="74Ju8e4RkTD" role="3cqZAp">
                  <node concept="2OqwBi" id="74Ju8e4RkTE" role="3clFbG">
                    <node concept="37vLTw" id="74Ju8e4RkTF" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8mS" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRl$8" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRl$9" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRl$a" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRl$b" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRl$c" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRl$d" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="74Ju8e4RkTG" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.bold(boolean)" resolve="bold" />
                      <node concept="3clFbT" id="74Ju8e4RkTS" role="37wK5m">
                        <property role="3clFbU" value="true" />
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="74Ju8e4RkTP" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="74Ju8e4RkTQ" role="3cqZAp">
                  <node concept="10M0yZ" id="74Ju8e4RkTR" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="74Ju8e4ThK4" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4DCI_D3jAql" resolve="FontFamilyStyleItem" />
      <node concept="1Koe21" id="74Ju8e4ThK5" role="1lVwrX">
        <node concept="2OqwBi" id="74Ju8e4ThK6" role="1Koe22">
          <node concept="2ShNRf" id="74Ju8e4ThK7" role="2Oq$k0">
            <node concept="1pGfFk" id="74Ju8e4ThK8" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="74Ju8e4ThK9" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="74Ju8e4ThKa" role="37wK5m" />
            <node concept="3clFbT" id="74Ju8e4ThKb" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV98n" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV9a9" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8pD" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8sn" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8so" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8sp" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="74Ju8e4ThKf" role="1bW5cS">
                <node concept="3clFbF" id="74Ju8e4ThKg" role="3cqZAp">
                  <node concept="2OqwBi" id="74Ju8e4ThKh" role="3clFbG">
                    <node concept="37vLTw" id="74Ju8e4ThKi" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8pD" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRl$e" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRl$f" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRl$g" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRl$h" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRl$i" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRl$j" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="74Ju8e4ThKj" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.fontFamily(java.lang.String)" resolve="fontFamily" />
                      <node concept="Xl_RD" id="74Ju8e4ThKk" role="37wK5m">
                        <property role="Xl_RC" value="abc" />
                        <node concept="17Uvod" id="74Ju8e4ThKl" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="74Ju8e4ThKm" role="3zH0cK">
                            <node concept="3clFbS" id="74Ju8e4ThKn" role="2VODD2">
                              <node concept="3clFbF" id="74Ju8e4ThKo" role="3cqZAp">
                                <node concept="2OqwBi" id="74Ju8e4ThKp" role="3clFbG">
                                  <node concept="30H73N" id="74Ju8e4ThKq" role="2Oq$k0" />
                                  <node concept="3TrcHB" id="74Ju8e4ThKv" role="2OqNvi">
                                    <ref role="3TsBF5" to="f8gn:4DCI_D3jAqm" resolve="family" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="74Ju8e4ThKs" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="74Ju8e4ThKt" role="3cqZAp">
                  <node concept="10M0yZ" id="74Ju8e4ThKu" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="74Ju8e4ThKw" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:4DCI_D3jAt_" resolve="FontSizeStyleItem" />
      <node concept="1Koe21" id="74Ju8e4ThKx" role="1lVwrX">
        <node concept="2OqwBi" id="74Ju8e4ThKy" role="1Koe22">
          <node concept="2ShNRf" id="74Ju8e4ThKz" role="2Oq$k0">
            <node concept="1pGfFk" id="74Ju8e4ThK$" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="74Ju8e4ThK_" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="74Ju8e4ThKA" role="37wK5m" />
            <node concept="3clFbT" id="74Ju8e4ThKB" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV9aa" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV9bW" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8sq" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8v8" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8v9" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8va" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="74Ju8e4ThKF" role="1bW5cS">
                <node concept="3clFbF" id="74Ju8e4ThKG" role="3cqZAp">
                  <node concept="2OqwBi" id="74Ju8e4ThKH" role="3clFbG">
                    <node concept="37vLTw" id="74Ju8e4ThKI" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8sq" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRl$k" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRl$l" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRl$m" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRl$n" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRl$o" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRl$p" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="74Ju8e4ThKJ" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.fontSize(java.lang.String)" resolve="fontSize" />
                      <node concept="Xl_RD" id="74Ju8e4ThKK" role="37wK5m">
                        <property role="Xl_RC" value="abc" />
                        <node concept="17Uvod" id="74Ju8e4ThKL" role="lGtFl">
                          <property role="2qtEX9" value="value" />
                          <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1070475926800/1070475926801" />
                          <node concept="3zFVjK" id="74Ju8e4ThKM" role="3zH0cK">
                            <node concept="3clFbS" id="74Ju8e4ThKN" role="2VODD2">
                              <node concept="3clFbF" id="74Ju8e4ThKO" role="3cqZAp">
                                <node concept="2OqwBi" id="74Ju8e4ThKP" role="3clFbG">
                                  <node concept="30H73N" id="74Ju8e4ThKQ" role="2Oq$k0" />
                                  <node concept="3TrcHB" id="74Ju8e4ThKV" role="2OqNvi">
                                    <ref role="3TsBF5" to="f8gn:4DCI_D3jAtA" resolve="size" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="74Ju8e4ThKS" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="74Ju8e4ThKT" role="3cqZAp">
                  <node concept="10M0yZ" id="74Ju8e4ThKU" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3aamgX" id="2eHudJqj5u4" role="3acgRq">
      <ref role="30HIoZ" to="f8gn:2eHudJpH2xi" resolve="LabelCell" />
      <node concept="1Koe21" id="2eHudJqj5u5" role="1lVwrX">
        <node concept="2OqwBi" id="2eHudJqj5u6" role="1Koe22">
          <node concept="2ShNRf" id="2eHudJqj5u7" role="2Oq$k0">
            <node concept="1pGfFk" id="2eHudJqj5u8" role="2ShVmc">
              <property role="373rjd" value="true" />
              <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
            </node>
          </node>
          <node concept="liA8E" id="2eHudJqj5u9" role="2OqNvi">
            <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
            <node concept="10Nm6u" id="2eHudJqj5ua" role="37wK5m" />
            <node concept="3clFbT" id="2eHudJqj5ub" role="37wK5m" />
            <node concept="3s519P" id="HgolRSV9bX" role="37wK5m">
              <node concept="3uibUv" id="HgolRSV9dJ" role="3s52Nf">
                <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
              </node>
              <node concept="37vLTG" id="4HILH0eI8vb" role="1bW2Oz">
                <property role="TrG5h" value="builder" />
                <node concept="3uibUv" id="4HILH0eI8xT" role="1tU5fm">
                  <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                  <node concept="3uibUv" id="4HILH0eI8xU" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                  </node>
                  <node concept="3uibUv" id="4HILH0eI8xV" role="11_B2D">
                    <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="2eHudJqj5uf" role="1bW5cS">
                <node concept="3clFbF" id="2eHudJqj5ug" role="3cqZAp">
                  <node concept="2OqwBi" id="2eHudJqj5uh" role="3clFbG">
                    <node concept="37vLTw" id="2eHudJqj5ui" role="2Oq$k0">
                      <ref role="3cqZAo" node="4HILH0eI8vb" resolve="builder" />
                      <node concept="1ZhdrF" id="HgolRTRl$q" role="lGtFl">
                        <property role="2qtEX8" value="variableDeclaration" />
                        <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068498886296/1068581517664" />
                        <node concept="3$xsQk" id="HgolRTRl$r" role="3$ytzL">
                          <node concept="3clFbS" id="HgolRTRl$s" role="2VODD2">
                            <node concept="3clFbF" id="HgolRTRl$t" role="3cqZAp">
                              <node concept="2YIFZM" id="HgolRTRl$u" role="3clFbG">
                                <ref role="1Pybhc" to="wsib:HgolRTUXeG" resolve="NotationGenUtil" />
                                <ref role="37wK5l" to="wsib:HgolRTUXeJ" resolve="findCellBuilder" />
                                <node concept="3l3mFP" id="HgolRTRl$v" role="37wK5m" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="liA8E" id="2eHudJqj5uj" role="2OqNvi">
                      <ref role="37wK5l" to="jej1:~CellTemplateBuilder.horizontal(kotlin.jvm.functions.Function1)" resolve="horizontal" />
                      <node concept="3s519P" id="HgolRSV9dK" role="37wK5m">
                        <node concept="3uibUv" id="HgolRSV9fy" role="3s52Nf">
                          <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                        </node>
                        <node concept="37vLTG" id="4HILH0eI8xW" role="1bW2Oz">
                          <property role="TrG5h" value="builder" />
                          <node concept="3uibUv" id="4HILH0eI8BC" role="1tU5fm">
                            <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                            <node concept="3uibUv" id="4HILH0eI8BD" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="3uibUv" id="4HILH0eI8BE" role="11_B2D">
                              <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                            </node>
                          </node>
                          <node concept="17Uvod" id="HgolRTSEiw" role="lGtFl">
                            <property role="2qtEX9" value="name" />
                            <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                            <node concept="3zFVjK" id="HgolRTSEix" role="3zH0cK">
                              <node concept="3clFbS" id="HgolRTSEiy" role="2VODD2">
                                <node concept="3clFbF" id="HgolRTSEiz" role="3cqZAp">
                                  <node concept="2OqwBi" id="HgolRTSEi$" role="3clFbG">
                                    <node concept="1iwH7S" id="HgolRTSEi_" role="2Oq$k0" />
                                    <node concept="2piZGk" id="HgolRTSEiA" role="2OqNvi">
                                      <node concept="Xl_RD" id="HgolRTSEiB" role="2piZGb">
                                        <property role="Xl_RC" value="builder" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbS" id="2eHudJqj5un" role="1bW5cS">
                          <node concept="3clFbF" id="2eHudJqj5uw" role="3cqZAp">
                            <node concept="2OqwBi" id="2eHudJqj5ux" role="3clFbG">
                              <node concept="37vLTw" id="2eHudJqj5uy" role="2Oq$k0">
                                <ref role="3cqZAo" node="4HILH0eI8xW" resolve="builder" />
                              </node>
                              <node concept="liA8E" id="2eHudJqj5uz" role="2OqNvi">
                                <ref role="37wK5l" to="jej1:~CellTemplateBuilder.withUntypedNode(kotlin.jvm.functions.Function1)" resolve="withUntypedNode" />
                                <node concept="3s519P" id="HgolRSV9fz" role="37wK5m">
                                  <node concept="3uibUv" id="HgolRSV9gr" role="3s52Nf">
                                    <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                                  </node>
                                  <node concept="37vLTG" id="4HILH0eI8BF" role="1bW2Oz">
                                    <property role="TrG5h" value="modelixNode" />
                                    <node concept="3uibUv" id="4HILH0eI8IE" role="1tU5fm">
                                      <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                                    </node>
                                    <node concept="17Uvod" id="HgolRTSEiC" role="lGtFl">
                                      <property role="2qtEX9" value="name" />
                                      <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                      <node concept="3zFVjK" id="HgolRTSEiD" role="3zH0cK">
                                        <node concept="3clFbS" id="HgolRTSEiE" role="2VODD2">
                                          <node concept="3clFbF" id="HgolRTSEiF" role="3cqZAp">
                                            <node concept="2OqwBi" id="HgolRTSEiG" role="3clFbG">
                                              <node concept="1iwH7S" id="HgolRTSEiH" role="2Oq$k0" />
                                              <node concept="2piZGk" id="HgolRTSEiI" role="2OqNvi">
                                                <node concept="Xl_RD" id="HgolRTSEiJ" role="2piZGb">
                                                  <property role="Xl_RC" value="modelixNode" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node concept="3clFbS" id="2eHudJqj5uB" role="1bW5cS">
                                    <node concept="3cpWs8" id="2eHudJqj5uC" role="3cqZAp">
                                      <node concept="3cpWsn" id="2eHudJqj5uD" role="3cpWs9">
                                        <property role="TrG5h" value="node" />
                                        <property role="3TUv4t" value="true" />
                                        <node concept="3Tqbb2" id="2eHudJqj5uE" role="1tU5fm" />
                                        <node concept="2OqwBi" id="2eHudJqj5uF" role="33vP2m">
                                          <node concept="10M0yZ" id="2eHudJqj5uG" role="2Oq$k0">
                                            <ref role="3cqZAo" to="1ut2:~ModelixNodeAsMPSNode.Companion" resolve="Companion" />
                                            <ref role="1PxDUh" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                                          </node>
                                          <node concept="liA8E" id="2eHudJqj5uH" role="2OqNvi">
                                            <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode$Companion.toMPSNode(org.modelix.model.api.INode)" resolve="toMPSNode" />
                                            <node concept="37vLTw" id="2eHudJqj5uI" role="37wK5m">
                                              <ref role="3cqZAo" node="4HILH0eI8BF" resolve="modelixNode" />
                                            </node>
                                          </node>
                                        </node>
                                        <node concept="17Uvod" id="HgolRTSEiK" role="lGtFl">
                                          <property role="2qtEX9" value="name" />
                                          <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                          <node concept="3zFVjK" id="HgolRTSEiL" role="3zH0cK">
                                            <node concept="3clFbS" id="HgolRTSEiM" role="2VODD2">
                                              <node concept="3clFbF" id="HgolRTSEiN" role="3cqZAp">
                                                <node concept="2OqwBi" id="HgolRTSEiO" role="3clFbG">
                                                  <node concept="1iwH7S" id="HgolRTSEiP" role="2Oq$k0" />
                                                  <node concept="2piZGk" id="HgolRTSEiQ" role="2OqNvi">
                                                    <node concept="Xl_RD" id="HgolRTSEiR" role="2piZGb">
                                                      <property role="Xl_RC" value="node" />
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node concept="3clFbF" id="2eHudJqj5vf" role="3cqZAp">
                                      <node concept="2OqwBi" id="2eHudJqj5vg" role="3clFbG">
                                        <node concept="37vLTw" id="2eHudJqj5vh" role="2Oq$k0">
                                          <ref role="3cqZAo" node="4HILH0eI8xW" resolve="builder" />
                                        </node>
                                        <node concept="liA8E" id="2eHudJqj5vi" role="2OqNvi">
                                          <ref role="37wK5l" to="jej1:~CellTemplateBuilder.label(java.lang.String,kotlin.jvm.functions.Function1)" resolve="label" />
                                          <node concept="Xl_RD" id="2eHudJqj5vF" role="37wK5m">
                                            <property role="Xl_RC" value="" />
                                            <node concept="29HgVG" id="2eHudJqj5vG" role="lGtFl">
                                              <node concept="3NFfHV" id="2eHudJqj5vH" role="3NFExx">
                                                <node concept="3clFbS" id="2eHudJqj5vI" role="2VODD2">
                                                  <node concept="3clFbF" id="2eHudJqj5vJ" role="3cqZAp">
                                                    <node concept="2OqwBi" id="2eHudJqj5vK" role="3clFbG">
                                                      <node concept="30H73N" id="2eHudJqj5vL" role="2Oq$k0" />
                                                      <node concept="3TrEf2" id="2eHudJqj5vM" role="2OqNvi">
                                                        <ref role="3Tt5mk" to="f8gn:2eHudJpH2xj" resolve="text" />
                                                      </node>
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                          <node concept="3s519P" id="HgolRSV9gs" role="37wK5m">
                                            <node concept="3uibUv" id="HgolRSV9ie" role="3s52Nf">
                                              <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                                            </node>
                                            <node concept="37vLTG" id="4HILH0eI8IF" role="1bW2Oz">
                                              <property role="TrG5h" value="builder" />
                                              <node concept="3uibUv" id="4HILH0eI8T2" role="1tU5fm">
                                                <ref role="3uigEE" to="jej1:~CellTemplateBuilder" resolve="CellTemplateBuilder" />
                                                <node concept="3uibUv" id="4HILH0eI8T3" role="11_B2D">
                                                  <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                                                </node>
                                                <node concept="3uibUv" id="4HILH0eI8T4" role="11_B2D">
                                                  <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                                                </node>
                                              </node>
                                              <node concept="17Uvod" id="HgolRTSEiS" role="lGtFl">
                                                <property role="2qtEX9" value="name" />
                                                <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                                                <node concept="3zFVjK" id="HgolRTSEiT" role="3zH0cK">
                                                  <node concept="3clFbS" id="HgolRTSEiU" role="2VODD2">
                                                    <node concept="3clFbF" id="HgolRTSEiV" role="3cqZAp">
                                                      <node concept="2OqwBi" id="HgolRTSEiW" role="3clFbG">
                                                        <node concept="1iwH7S" id="HgolRTSEiX" role="2Oq$k0" />
                                                        <node concept="2piZGk" id="HgolRTSEiY" role="2OqNvi">
                                                          <node concept="Xl_RD" id="HgolRTSEiZ" role="2piZGb">
                                                            <property role="Xl_RC" value="builder" />
                                                          </node>
                                                        </node>
                                                      </node>
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                            </node>
                                            <node concept="3clFbS" id="2eHudJqj5vv" role="1bW5cS">
                                              <node concept="3clFbH" id="2eHudJqj5vw" role="3cqZAp">
                                                <node concept="2b32R4" id="2eHudJqj5vx" role="lGtFl">
                                                  <node concept="3JmXsc" id="2eHudJqj5vy" role="2P8S$">
                                                    <node concept="3clFbS" id="2eHudJqj5vz" role="2VODD2">
                                                      <node concept="3clFbF" id="2eHudJqj5v$" role="3cqZAp">
                                                        <node concept="2OqwBi" id="2eHudJqj5v_" role="3clFbG">
                                                          <node concept="30H73N" id="2eHudJqj5vA" role="2Oq$k0" />
                                                          <node concept="2qgKlT" id="2eHudJqj5vB" role="2OqNvi">
                                                            <ref role="37wK5l" to="wsib:1nuEuAfon$G" resolve="getEffectiveStyleItems" />
                                                          </node>
                                                        </node>
                                                      </node>
                                                    </node>
                                                  </node>
                                                </node>
                                              </node>
                                              <node concept="3cpWs6" id="2eHudJqj5vC" role="3cqZAp">
                                                <node concept="10M0yZ" id="2eHudJqj5vD" role="3cqZAk">
                                                  <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                                                  <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                                                </node>
                                              </node>
                                            </node>
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                    <node concept="3cpWs6" id="2eHudJqj5v8" role="3cqZAp">
                                      <node concept="10M0yZ" id="2eHudJqj5v9" role="3cqZAk">
                                        <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                                        <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3cpWs6" id="2eHudJqj5va" role="3cqZAp">
                            <node concept="10M0yZ" id="2eHudJqj5vb" role="3cqZAk">
                              <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                              <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="raruj" id="2eHudJqj5vc" role="lGtFl" />
                </node>
                <node concept="3cpWs6" id="2eHudJqj5vd" role="3cqZAp">
                  <node concept="10M0yZ" id="2eHudJqj5ve" role="3cqZAk">
                    <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                    <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="312cEu" id="7HT$1xKu5Jt">
    <property role="TrG5h" value="AspectsDescriptor" />
    <node concept="Wx3nA" id="7cakuaptePQ" role="jymVt">
      <property role="TrG5h" value="INSTANCE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="7cakuaptbYq" role="1tU5fm">
        <ref role="3uigEE" node="7HT$1xKu5Jt" resolve="AspectsDescriptor" />
      </node>
      <node concept="3Tm1VV" id="7cakuaptfPD" role="1B3o_S" />
      <node concept="2ShNRf" id="7cakuaptcdf" role="33vP2m">
        <node concept="1pGfFk" id="7cakuaptccZ" role="2ShVmc">
          <ref role="37wK5l" node="7HT$1xKu819" resolve="AspectsDescriptor" />
        </node>
      </node>
    </node>
    <node concept="312cEg" id="7HT$1xKu7eo" role="jymVt">
      <property role="TrG5h" value="editorAspect" />
      <node concept="3Tm6S6" id="7HT$1xKu7ep" role="1B3o_S" />
      <node concept="3uibUv" id="7HT$1xKufRh" role="1tU5fm">
        <ref role="3uigEE" to="jej1:~EditorAspect" resolve="EditorAspect" />
      </node>
      <node concept="2ShNRf" id="7HT$1xKufWk" role="33vP2m">
        <node concept="1pGfFk" id="7HT$1xKufVS" role="2ShVmc">
          <ref role="37wK5l" to="jej1:~EditorAspect.&lt;init&gt;()" resolve="EditorAspect" />
        </node>
      </node>
    </node>
    <node concept="3clFbW" id="7HT$1xKu819" role="jymVt">
      <node concept="3cqZAl" id="7HT$1xKu81b" role="3clF45" />
      <node concept="3Tm6S6" id="7cakuaptcpf" role="1B3o_S" />
      <node concept="3clFbS" id="7HT$1xKu81d" role="3clF47">
        <node concept="3clFbF" id="7HT$1xKufYi" role="3cqZAp">
          <node concept="2OqwBi" id="7HT$1xKugg8" role="3clFbG">
            <node concept="37vLTw" id="7HT$1xKufYh" role="2Oq$k0">
              <ref role="3cqZAo" node="7HT$1xKu7eo" resolve="editorAspect" />
            </node>
            <node concept="liA8E" id="7HT$1xKugL2" role="2OqNvi">
              <ref role="37wK5l" to="jej1:~EditorAspect.conceptEditor(org.modelix.model.api.IConcept,boolean,kotlin.jvm.functions.Function1)" resolve="conceptEditor" />
              <node concept="10Nm6u" id="7HT$1xKugVB" role="37wK5m">
                <node concept="5jKBG" id="1vEPqpZ9gKg" role="lGtFl">
                  <ref role="v9R2y" node="1vEPqpZ94Ep" resolve="template_SConcept_as_IConcept_java" />
                  <node concept="3NFfHV" id="1vEPqpZ9hFs" role="5jGum">
                    <node concept="3clFbS" id="1vEPqpZ9hFt" role="2VODD2">
                      <node concept="3clFbF" id="1vEPqpZ9ipa" role="3cqZAp">
                        <node concept="2OqwBi" id="1vEPqpZ9iWm" role="3clFbG">
                          <node concept="30H73N" id="1vEPqpZ9ip9" role="2Oq$k0" />
                          <node concept="3TrEf2" id="1vEPqpZ9lo9" role="2OqNvi">
                            <ref role="3Tt5mk" to="f8gn:7dm8yUsMfNE" resolve="concept" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbT" id="7HT$1xKuh1f" role="37wK5m">
                <node concept="17Uvod" id="7cakuapQ8Vx" role="lGtFl">
                  <property role="2qtEX9" value="value" />
                  <property role="P4ACc" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1068580123137/1068580123138" />
                  <node concept="3zFVjK" id="7cakuapQ8V$" role="3zH0cK">
                    <node concept="3clFbS" id="7cakuapQ8V_" role="2VODD2">
                      <node concept="3clFbF" id="7cakuapQ8VF" role="3cqZAp">
                        <node concept="2OqwBi" id="7cakuapQ8VA" role="3clFbG">
                          <node concept="3TrcHB" id="7cakuapQ8VD" role="2OqNvi">
                            <ref role="3TsBF5" to="f8gn:1zXwHaHuRnq" resolve="applicableToSubconcepts" />
                          </node>
                          <node concept="30H73N" id="7cakuapQ8VE" role="2Oq$k0" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3s519P" id="HgolRSV9if" role="37wK5m">
                <node concept="3uibUv" id="HgolRSV9k1" role="3s52Nf">
                  <ref role="3uigEE" to="v18h:~Unit" resolve="Unit" />
                </node>
                <node concept="37vLTG" id="4HILH0eI8T5" role="1bW2Oz">
                  <property role="TrG5h" value="builder" />
                  <node concept="3uibUv" id="4HILH0eI8VP" role="1tU5fm">
                    <ref role="3uigEE" to="jej1:~NotationRootCellTemplateBuilder" resolve="NotationRootCellTemplateBuilder" />
                    <node concept="3uibUv" id="4HILH0eI8VQ" role="11_B2D">
                      <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                    </node>
                    <node concept="3uibUv" id="4HILH0eI8VR" role="11_B2D">
                      <ref role="3uigEE" to="jks5:~IConcept" resolve="IConcept" />
                    </node>
                  </node>
                  <node concept="17Uvod" id="HgolRTA74e" role="lGtFl">
                    <property role="2qtEX9" value="name" />
                    <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                    <node concept="3zFVjK" id="HgolRTA74h" role="3zH0cK">
                      <node concept="3clFbS" id="HgolRTA74j" role="2VODD2">
                        <node concept="3clFbF" id="HgolRTA74k" role="3cqZAp">
                          <node concept="2OqwBi" id="HgolRTA74m" role="3clFbG">
                            <node concept="1iwH7S" id="HgolRTA74p" role="2Oq$k0" />
                            <node concept="2piZGk" id="HgolRTA74q" role="2OqNvi">
                              <node concept="Xl_RD" id="HgolRTA74s" role="2piZGb">
                                <property role="Xl_RC" value="builder" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbS" id="7HT$1xKui5H" role="1bW5cS">
                  <node concept="3cpWs8" id="2QtC6z0YHyI" role="3cqZAp">
                    <node concept="3KEzu6" id="2QtC6z0YHyF" role="3cpWs9">
                      <property role="TrG5h" value="rootBuilder" />
                      <node concept="PeGgZ" id="2QtC6z0YHyG" role="1tU5fm" />
                      <node concept="37vLTw" id="2QtC6z0YJMq" role="33vP2m">
                        <ref role="3cqZAo" node="4HILH0eI8T5" resolve="builder" />
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbF" id="1vEPqpZ8jNe" role="3cqZAp">
                    <node concept="2OqwBi" id="1vEPqpZ8kc3" role="3clFbG">
                      <node concept="37vLTw" id="1vEPqpZ8jNc" role="2Oq$k0">
                        <ref role="3cqZAo" node="4HILH0eI8T5" resolve="builder" />
                      </node>
                      <node concept="liA8E" id="1vEPqpZ8mKD" role="2OqNvi">
                        <ref role="37wK5l" to="jej1:~NotationRootCellTemplateBuilder.condition(kotlin.jvm.functions.Function1)" resolve="condition" />
                        <node concept="3s519P" id="HgolRSV9k2" role="37wK5m">
                          <node concept="10P_77" id="HgolRSV9kW" role="3s52Nf" />
                          <node concept="37vLTG" id="4HILH0eI8VS" role="1bW2Oz">
                            <property role="TrG5h" value="modelixNode" />
                            <node concept="3uibUv" id="4HILH0eI906" role="1tU5fm">
                              <ref role="3uigEE" to="jks5:~INode" resolve="INode" />
                            </node>
                            <node concept="17Uvod" id="HgolRTAdOu" role="lGtFl">
                              <property role="2qtEX9" value="name" />
                              <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
                              <node concept="3zFVjK" id="HgolRTAdOx" role="3zH0cK">
                                <node concept="3clFbS" id="HgolRTAdOz" role="2VODD2">
                                  <node concept="3clFbF" id="HgolRTAdO$" role="3cqZAp">
                                    <node concept="2OqwBi" id="HgolRTAdOA" role="3clFbG">
                                      <node concept="1iwH7S" id="HgolRTAdOD" role="2Oq$k0" />
                                      <node concept="2piZGk" id="HgolRTAdOE" role="2OqNvi">
                                        <node concept="Xl_RD" id="HgolRTAdOG" role="2piZGb">
                                          <property role="Xl_RC" value="modelixNode" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbS" id="1vEPqpZ8nhj" role="1bW5cS">
                            <node concept="3clFbF" id="1vEPqpZ8nZM" role="3cqZAp">
                              <node concept="3clFbT" id="1vEPqpZ8nZL" role="3clFbG">
                                <property role="3clFbU" value="true" />
                                <node concept="29HgVG" id="1vEPqpZ8A7o" role="lGtFl">
                                  <node concept="3NFfHV" id="1vEPqpZ8Aqp" role="3NFExx">
                                    <node concept="3clFbS" id="1vEPqpZ8Aqq" role="2VODD2">
                                      <node concept="3clFbF" id="1vEPqpZ8AJO" role="3cqZAp">
                                        <node concept="2OqwBi" id="1vEPqpZ8Bfu" role="3clFbG">
                                          <node concept="30H73N" id="1vEPqpZ8AJN" role="2Oq$k0" />
                                          <node concept="3TrEf2" id="1vEPqpZ8DjJ" role="2OqNvi">
                                            <ref role="3Tt5mk" to="f8gn:7dm8yUsMfZC" resolve="condition" />
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
                    <node concept="1W57fq" id="1vEPqpZ8tO5" role="lGtFl">
                      <node concept="3IZrLx" id="1vEPqpZ8tO6" role="3IZSJc">
                        <node concept="3clFbS" id="1vEPqpZ8tO7" role="2VODD2">
                          <node concept="3clFbF" id="1vEPqpZ8utr" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZ8uts" role="3clFbG">
                              <node concept="2OqwBi" id="1vEPqpZ8utt" role="2Oq$k0">
                                <node concept="30H73N" id="1vEPqpZ8utu" role="2Oq$k0" />
                                <node concept="3TrEf2" id="1vEPqpZ8utv" role="2OqNvi">
                                  <ref role="3Tt5mk" to="f8gn:7dm8yUsMfZC" resolve="condition" />
                                </node>
                              </node>
                              <node concept="3x8VRR" id="1vEPqpZ8utw" role="2OqNvi" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbH" id="1vEPqpZ8TJN" role="3cqZAp">
                    <node concept="29HgVG" id="1vEPqpZ8URf" role="lGtFl">
                      <node concept="3NFfHV" id="1vEPqpZ8URg" role="3NFExx">
                        <node concept="3clFbS" id="1vEPqpZ8URh" role="2VODD2">
                          <node concept="3clFbF" id="1vEPqpZ8URn" role="3cqZAp">
                            <node concept="2OqwBi" id="1vEPqpZ8URi" role="3clFbG">
                              <node concept="3TrEf2" id="1vEPqpZ8URl" role="2OqNvi">
                                <ref role="3Tt5mk" to="f8gn:7dm8yUsMfYJ" resolve="cell" />
                              </node>
                              <node concept="30H73N" id="1vEPqpZ8URm" role="2Oq$k0" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3cpWs6" id="1vEPqpZ8reH" role="3cqZAp">
                    <node concept="10M0yZ" id="1vEPqpZ8sA4" role="3cqZAk">
                      <ref role="3cqZAo" to="v18h:~Unit.INSTANCE" resolve="INSTANCE" />
                      <ref role="1PxDUh" to="v18h:~Unit" resolve="Unit" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="1WS0z7" id="1vEPqpZ8y2x" role="lGtFl">
            <node concept="3JmXsc" id="1vEPqpZ8y2y" role="3Jn$fo">
              <node concept="3clFbS" id="1vEPqpZ8y2z" role="2VODD2">
                <node concept="3clFbF" id="1vEPqpZ8yBE" role="3cqZAp">
                  <node concept="2OqwBi" id="1vEPqpZ8yBF" role="3clFbG">
                    <node concept="2OqwBi" id="1vEPqpZ8yBG" role="2Oq$k0">
                      <node concept="2OqwBi" id="1vEPqpZ8yBH" role="2Oq$k0">
                        <node concept="2OqwBi" id="1vEPqpZ8yBI" role="2Oq$k0">
                          <node concept="1iwH7S" id="1vEPqpZ8yBJ" role="2Oq$k0" />
                          <node concept="1r8y6K" id="1vEPqpZ8yBK" role="2OqNvi" />
                        </node>
                        <node concept="2RRcyG" id="1vEPqpZ8yBL" role="2OqNvi">
                          <node concept="chp4Y" id="1vEPqpZ8yBM" role="3MHsoP">
                            <ref role="cht4Q" to="f8gn:7dm8yUsM9Ro" resolve="NotationModule" />
                          </node>
                        </node>
                      </node>
                      <node concept="13MTOL" id="1vEPqpZ8yBN" role="2OqNvi">
                        <ref role="13MTZf" to="f8gn:7dm8yUsMfq9" resolve="content" />
                      </node>
                    </node>
                    <node concept="v3k3i" id="1vEPqpZ8yBO" role="2OqNvi">
                      <node concept="chp4Y" id="1vEPqpZ8yBP" role="v3oSu">
                        <ref role="cht4Q" to="f8gn:7dm8yUsMfHH" resolve="ConceptNotation" />
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
    <node concept="3Tm1VV" id="7HT$1xKu5Ju" role="1B3o_S" />
    <node concept="n94m4" id="7HT$1xKu5Jv" role="lGtFl" />
    <node concept="3uibUv" id="7HT$1xKu68i" role="EKbjA">
      <ref role="3uigEE" to="ljn7:~ILanguageAspectsDescriptor" resolve="ILanguageAspectsDescriptor" />
    </node>
    <node concept="3clFb_" id="7HT$1xKu68E" role="jymVt">
      <property role="TrG5h" value="createAspects" />
      <node concept="3Tm1VV" id="7HT$1xKu68F" role="1B3o_S" />
      <node concept="2AHcQZ" id="7HT$1xKu68H" role="2AJF6D">
        <ref role="2AI5Lk" to="mhfm:~NotNull" resolve="NotNull" />
      </node>
      <node concept="3uibUv" id="7HT$1xKu68I" role="3clF45">
        <ref role="3uigEE" to="33ny:~List" resolve="List" />
        <node concept="3uibUv" id="7HT$1xKu68J" role="11_B2D">
          <ref role="3uigEE" to="x83f:~ILanguageAspect" resolve="ILanguageAspect" />
        </node>
      </node>
      <node concept="3clFbS" id="7HT$1xKu68K" role="3clF47">
        <node concept="3clFbF" id="1vEPqpZ8VUy" role="3cqZAp">
          <node concept="2ShNRf" id="1vEPqpZ8VUw" role="3clFbG">
            <node concept="Tc6Ow" id="1vEPqpZ8Zy7" role="2ShVmc">
              <node concept="3uibUv" id="1vEPqpZ8ZTZ" role="HW$YZ">
                <ref role="3uigEE" to="x83f:~ILanguageAspect" resolve="ILanguageAspect" />
              </node>
              <node concept="37vLTw" id="1vEPqpZ927w" role="HW$Y0">
                <ref role="3cqZAo" node="7HT$1xKu7eo" resolve="editorAspect" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2AHcQZ" id="7HT$1xKu68L" role="2AJF6D">
        <ref role="2AI5Lk" to="wyt6:~Override" resolve="Override" />
      </node>
    </node>
  </node>
  <node concept="13MO4I" id="1vEPqpZ94Ep">
    <property role="TrG5h" value="template_SConcept_as_IConcept_java" />
    <ref role="3gUMe" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
    <node concept="2ShNRf" id="1vEPqpZ95CN" role="13RCb5">
      <node concept="1pGfFk" id="1vEPqpZ99q5" role="2ShVmc">
        <property role="373rjd" value="true" />
        <ref role="37wK5l" to="zxfz:~MPSConcept.&lt;init&gt;(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="MPSConcept" />
        <node concept="35c_gC" id="7cakuapbHKS" role="37wK5m">
          <ref role="35c_gD" to="tpck:gw2VY9q" resolve="BaseConcept" />
          <node concept="1ZhdrF" id="7cakuapbI28" role="lGtFl">
            <property role="2qtEX8" value="conceptDeclaration" />
            <property role="P3scX" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1/2644386474300074836/2644386474300074837" />
            <node concept="3$xsQk" id="7cakuapbI29" role="3$ytzL">
              <node concept="3clFbS" id="7cakuapbI2a" role="2VODD2">
                <node concept="3clFbF" id="7cakuapbI3a" role="3cqZAp">
                  <node concept="30H73N" id="7cakuapbI39" role="3clFbG" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="raruj" id="1vEPqpZ99Xh" role="lGtFl" />
    </node>
  </node>
</model>

