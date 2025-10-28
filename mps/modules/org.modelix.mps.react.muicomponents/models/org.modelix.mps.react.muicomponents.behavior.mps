<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2c5a8407-fd65-4ea4-b95e-a8f8fee129c0(org.modelix.mps.react.muicomponents.behavior)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <use id="d8f591ec-4d86-4af2-9f92-a9e93c803ffa" name="jetbrains.mps.lang.scopes" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="zaxg" ref="r:c4183f14-1033-4ade-be7c-1beadb184134(org.modelix.mps.react.muicomponents.structure)" />
    <import index="8xo1" ref="r:41b64586-29ed-47f5-b907-44be07261bbc(org.modelix.mps.react.structure)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="zdk4" ref="r:e8408387-58e6-408f-90ce-310136ba006d(org.modelix.mps.react.behavior)" />
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" implicit="true" />
    <import index="tp25" ref="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="6496299201655527393" name="jetbrains.mps.lang.behavior.structure.LocalBehaviorMethodCall" flags="nn" index="BsUDl" />
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <property id="1225194472832" name="isVirtual" index="13i0it" />
        <property id="1225194472834" name="isAbstract" index="13i0iv" />
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="8118189177080264853" name="jetbrains.mps.baseLanguage.structure.AlternativeType" flags="ig" index="nSUau">
        <child id="8118189177080264854" name="alternative" index="nSUat" />
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
      <concept id="4952749571008284462" name="jetbrains.mps.baseLanguage.structure.CatchVariable" flags="ng" index="XOnhg" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
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
        <property id="4467513934994662257" name="forceMultiLine" index="TyiWK" />
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
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
      <concept id="1081506762703" name="jetbrains.mps.baseLanguage.structure.GreaterThanExpression" flags="nn" index="3eOSWO" />
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
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="5351203823916750322" name="jetbrains.mps.baseLanguage.structure.TryUniversalStatement" flags="nn" index="3J1_TO">
        <child id="8276990574886367510" name="catchClause" index="1zxBo5" />
        <child id="8276990574886367508" name="body" index="1zxBo7" />
      </concept>
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="d8f591ec-4d86-4af2-9f92-a9e93c803ffa" name="jetbrains.mps.lang.scopes">
      <concept id="8077936094962944991" name="jetbrains.mps.lang.scopes.structure.ComeFromExpression" flags="nn" index="iy1fb">
        <reference id="8077936094962945822" name="link" index="iy1sa" />
      </concept>
      <concept id="8077936094962911282" name="jetbrains.mps.lang.scopes.structure.ParentScope" flags="nn" index="iy90A" />
      <concept id="8077936094962850237" name="jetbrains.mps.lang.scopes.structure.CompositeWithParentScopeExpression" flags="nn" index="iyS6D">
        <child id="8077936094962969171" name="expr" index="iy797" />
      </concept>
    </language>
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="5455284157994012186" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitLink" flags="ng" index="2pIpSj">
        <reference id="5455284157994012188" name="link" index="2pIpSl" />
        <child id="1595412875168045827" name="initValue" index="28nt2d" />
      </concept>
      <concept id="5455284157993863837" name="jetbrains.mps.lang.quotation.structure.NodeBuilder" flags="nn" index="2pJPEk">
        <child id="5455284157993863838" name="quotedNode" index="2pJPEn" />
      </concept>
      <concept id="5455284157993863840" name="jetbrains.mps.lang.quotation.structure.NodeBuilderNode" flags="nn" index="2pJPED">
        <reference id="5455284157993910961" name="concept" index="2pJxaS" />
        <child id="5455284157993911099" name="values" index="2pJxcM" />
      </concept>
      <concept id="8182547171709752110" name="jetbrains.mps.lang.quotation.structure.NodeBuilderExpression" flags="nn" index="36biLy">
        <child id="8182547171709752112" name="expression" index="36biLW" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1176544042499" name="jetbrains.mps.lang.typesystem.structure.Node_TypeOperation" flags="nn" index="3JvlWi" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="4705942098322467729" name="jetbrains.mps.lang.smodel.structure.EnumMemberReference" flags="ng" index="21nZrQ">
        <reference id="4705942098322467736" name="decl" index="21nZrZ" />
      </concept>
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="1140725362528" name="jetbrains.mps.lang.smodel.structure.Link_SetTargetOperation" flags="nn" index="2oxUTD">
        <child id="1140725362529" name="linkTarget" index="2oxUTC" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1138661924179" name="jetbrains.mps.lang.smodel.structure.Property_SetOperation" flags="nn" index="tyxLq">
        <child id="1138662048170" name="value" index="tz02z" />
      </concept>
      <concept id="1138757581985" name="jetbrains.mps.lang.smodel.structure.Link_SetNewChildOperation" flags="nn" index="zfrQC">
        <reference id="1139880128956" name="concept" index="1A9B2P" />
      </concept>
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1145383075378" name="jetbrains.mps.lang.smodel.structure.SNodeListType" flags="in" index="2I9FWS">
        <reference id="1145383142433" name="elementConcept" index="2I9WkF" />
      </concept>
      <concept id="1171305280644" name="jetbrains.mps.lang.smodel.structure.Node_GetDescendantsOperation" flags="nn" index="2Rf3mk" />
      <concept id="1145567426890" name="jetbrains.mps.lang.smodel.structure.SNodeListCreator" flags="nn" index="2T8Vx0">
        <child id="1145567471833" name="createdType" index="2T96Bj" />
      </concept>
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1180028149140" name="jetbrains.mps.lang.smodel.structure.Concept_IsSuperConceptOfOperation" flags="nn" index="2Za9M6">
        <child id="1180028346304" name="conceptArgument" index="2ZaTVi" />
      </concept>
      <concept id="2644386474301421077" name="jetbrains.mps.lang.smodel.structure.LinkIdRefExpression" flags="nn" index="359W_D">
        <reference id="2644386474301421078" name="conceptDeclaration" index="359W_E" />
        <reference id="2644386474301421079" name="linkDeclaration" index="359W_F" />
      </concept>
      <concept id="6677504323281689838" name="jetbrains.mps.lang.smodel.structure.SConceptType" flags="in" index="3bZ5Sz" />
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1144146199828" name="jetbrains.mps.lang.smodel.structure.Node_CopyOperation" flags="nn" index="1$rogu" />
      <concept id="1144195091934" name="jetbrains.mps.lang.smodel.structure.Node_IsRoleOperation" flags="nn" index="1BlSNk">
        <reference id="1144195362400" name="conceptOfParent" index="1BmUXE" />
        <reference id="1144195396777" name="linkInParent" index="1Bn3mz" />
      </concept>
      <concept id="1140131837776" name="jetbrains.mps.lang.smodel.structure.Node_ReplaceWithAnotherOperation" flags="nn" index="1P9Npp">
        <child id="1140131861877" name="replacementNode" index="1P9ThW" />
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
      <concept id="1151689724996" name="jetbrains.mps.baseLanguage.collections.structure.SequenceType" flags="in" index="A3Dl8">
        <child id="1151689745422" name="elementType" index="A3Ik2" />
      </concept>
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
      <concept id="1235573135402" name="jetbrains.mps.baseLanguage.collections.structure.SingletonSequenceCreator" flags="nn" index="2HTt$P">
        <child id="1235573175711" name="elementType" index="2HTBi0" />
        <child id="1235573187520" name="singletonValue" index="2HTEbv" />
      </concept>
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
    </language>
  </registry>
  <node concept="13h7C7" id="2vPZMAngLC_">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:2vPZMAneuaB" resolve="Command" />
    <node concept="13i0hz" id="2vPZMAngLCS" role="13h7CS">
      <property role="TrG5h" value="layoutMultiline" />
      <node concept="3Tm1VV" id="2vPZMAngLCT" role="1B3o_S" />
      <node concept="10P_77" id="2vPZMAngLDc" role="3clF45" />
      <node concept="3clFbS" id="2vPZMAngLCV" role="3clF47">
        <node concept="3clFbF" id="2vPZMAngLDZ" role="3cqZAp">
          <node concept="3eOSWO" id="2vPZMAngXHh" role="3clFbG">
            <node concept="3cmrfG" id="2vPZMAngXHk" role="3uHU7w">
              <property role="3cmrfH" value="1" />
            </node>
            <node concept="2OqwBi" id="2vPZMAngQxR" role="3uHU7B">
              <node concept="2OqwBi" id="2vPZMAngMfi" role="2Oq$k0">
                <node concept="2OqwBi" id="2vPZMAngLPe" role="2Oq$k0">
                  <node concept="13iPFW" id="2vPZMAngLDY" role="2Oq$k0" />
                  <node concept="3TrEf2" id="2vPZMAngLWU" role="2OqNvi">
                    <ref role="3Tt5mk" to="zaxg:2vPZMAneuaC" resolve="statements" />
                  </node>
                </node>
                <node concept="3Tsc0h" id="2vPZMAngMA_" role="2OqNvi">
                  <ref role="3TtcxE" to="tpee:fzcqZ_x" resolve="statement" />
                </node>
              </node>
              <node concept="34oBXx" id="2vPZMAngUw1" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="2vPZMAngLCA" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAngLCB" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAnsypS">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:2vPZMAnsypR" resolve="ICanWrap" />
    <node concept="13i0hz" id="gNsEGB2zdH" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="canThisBeWrapped" />
      <node concept="3Tm1VV" id="gNsEGB2zdI" role="1B3o_S" />
      <node concept="10P_77" id="gNsEGB2zxh" role="3clF45" />
      <node concept="3clFbS" id="gNsEGB2zdK" role="3clF47">
        <node concept="3clFbF" id="gNsEGB2AcT" role="3cqZAp">
          <node concept="3clFbT" id="gNsEGB2AcS" role="3clFbG">
            <property role="3clFbU" value="true" />
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="gNsEGB2_06" role="3clF46">
        <property role="TrG5h" value="rc" />
        <node concept="3Tqbb2" id="gNsEGB2_05" role="1tU5fm">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="2vPZMAnsyqb" role="13h7CS">
      <property role="13i0iv" value="true" />
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="wrap" />
      <node concept="3Tm1VV" id="2vPZMAnsyqc" role="1B3o_S" />
      <node concept="3Tqbb2" id="2vPZMAnsyqv" role="3clF45">
        <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
      </node>
      <node concept="3clFbS" id="2vPZMAnsyqe" role="3clF47" />
      <node concept="37vLTG" id="2vPZMAnsyri" role="3clF46">
        <property role="TrG5h" value="wrapped" />
        <node concept="3Tqbb2" id="2vPZMAnsyrh" role="1tU5fm">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="G39ofCXoEe" role="13h7CS">
      <property role="13i0iv" value="true" />
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="currentChildren" />
      <node concept="3Tm1VV" id="G39ofCXoEf" role="1B3o_S" />
      <node concept="A3Dl8" id="G39ofCXoX4" role="3clF45">
        <node concept="3Tqbb2" id="G39ofCXpfT" role="A3Ik2">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="3clFbS" id="G39ofCXoEh" role="3clF47" />
    </node>
    <node concept="13hLZK" id="2vPZMAnsypT" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAnsypU" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAnsysh">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:2vPZMAnsysd" resolve="IContainerMultiComponent" />
    <node concept="13hLZK" id="2vPZMAnsysi" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAnsysj" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="2vPZMAnsys$" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="wrap" />
      <ref role="13i0hy" node="2vPZMAnsyqb" resolve="wrap" />
      <node concept="3clFbS" id="2vPZMAnsysB" role="3clF47">
        <node concept="3clFbF" id="2vPZMAnsytv" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAns_qQ" role="3clFbG">
            <node concept="2OqwBi" id="2vPZMAnsyFd" role="2Oq$k0">
              <node concept="13iPFW" id="2vPZMAnsytu" role="2Oq$k0" />
              <node concept="3Tsc0h" id="2vPZMAnsyRH" role="2OqNvi">
                <ref role="3TtcxE" to="zaxg:2vPZMAmEVPK" resolve="children" />
              </node>
            </node>
            <node concept="TSZUe" id="2vPZMAnsDD_" role="2OqNvi">
              <node concept="37vLTw" id="2vPZMAnsDIp" role="25WWJ7">
                <ref role="3cqZAo" node="2vPZMAnsysS" resolve="wrapped" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="2vPZMAnsysS" role="3clF46">
        <property role="TrG5h" value="wrapped" />
        <node concept="3Tqbb2" id="2vPZMAnsysT" role="1tU5fm">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="3Tqbb2" id="2vPZMAnsysU" role="3clF45">
        <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
      </node>
      <node concept="3Tm1VV" id="2vPZMAnsysV" role="1B3o_S" />
    </node>
    <node concept="13i0hz" id="G39ofD11Wd" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="currentChildren" />
      <ref role="13i0hy" node="G39ofCXoEe" resolve="currentChildren" />
      <node concept="3clFbS" id="G39ofD11Wg" role="3clF47">
        <node concept="3cpWs6" id="G39ofD12DC" role="3cqZAp">
          <node concept="2OqwBi" id="G39ofD12P$" role="3cqZAk">
            <node concept="13iPFW" id="G39ofD12DK" role="2Oq$k0" />
            <node concept="3Tsc0h" id="G39ofD13kK" role="2OqNvi">
              <ref role="3TtcxE" to="zaxg:2vPZMAmEVPK" resolve="children" />
            </node>
          </node>
        </node>
      </node>
      <node concept="A3Dl8" id="G39ofD12j4" role="3clF45">
        <node concept="3Tqbb2" id="G39ofD12j5" role="A3Ik2">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="3Tm1VV" id="G39ofD12j6" role="1B3o_S" />
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAn_p7C">
    <property role="3GE5qa" value="output" />
    <ref role="13h7C2" to="zaxg:2vPZMAmDmtP" resolve="Label" />
    <node concept="13hLZK" id="2vPZMAn_p7D" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAn_p7E" role="2VODD2">
        <node concept="3clFbF" id="G39ofC8M45" role="3cqZAp">
          <node concept="2OqwBi" id="G39ofC8Odu" role="3clFbG">
            <node concept="2OqwBi" id="G39ofC8Mfl" role="2Oq$k0">
              <node concept="13iPFW" id="G39ofC8M43" role="2Oq$k0" />
              <node concept="3TrEf2" id="G39ofC8O3p" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:G39ofC8uZm" resolve="typography" />
              </node>
            </node>
            <node concept="zfrQC" id="G39ofC8On2" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAnEJvN">
    <property role="3GE5qa" value="layout" />
    <ref role="13h7C2" to="zaxg:2vPZMAnBVdN" resolve="Accordion" />
    <node concept="13hLZK" id="2vPZMAnEJvO" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAnEJvP" role="2VODD2">
        <node concept="3cpWs8" id="2vPZMAnEOb$" role="3cqZAp">
          <node concept="3cpWsn" id="2vPZMAnEOb_" role="3cpWs9">
            <property role="TrG5h" value="i" />
            <node concept="3Tqbb2" id="2vPZMAnEObg" role="1tU5fm">
              <ref role="ehGHo" to="zaxg:2vPZMAnBVdU" resolve="Icon" />
            </node>
            <node concept="2OqwBi" id="2vPZMAnEObA" role="33vP2m">
              <node concept="2OqwBi" id="2vPZMAnEObB" role="2Oq$k0">
                <node concept="13iPFW" id="2vPZMAnEObC" role="2Oq$k0" />
                <node concept="3TrEf2" id="2vPZMAnEObD" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:2vPZMAnEJvM" resolve="icon" />
                </node>
              </node>
              <node concept="zfrQC" id="2vPZMAnEObE" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2vPZMAnENrp" role="3cqZAp">
          <node concept="37vLTI" id="2vPZMAnEPKJ" role="3clFbG">
            <node concept="2OqwBi" id="2vPZMAnEOo7" role="37vLTJ">
              <node concept="37vLTw" id="2vPZMAnEObF" role="2Oq$k0">
                <ref role="3cqZAo" node="2vPZMAnEOb_" resolve="i" />
              </node>
              <node concept="3TrcHB" id="2vPZMAnEOvQ" role="2OqNvi">
                <ref role="3TsBF5" to="zaxg:2vPZMAnBVdV" resolve="name" />
              </node>
            </node>
            <node concept="Xl_RD" id="2vPZMAnENhx" role="37vLTx">
              <property role="Xl_RC" value="mui.icons.ExpandMore" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAnIaZk">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:2vPZMAnIaRU" resolve="IContainerSingleComponent" />
    <node concept="13i0hz" id="2vPZMAnIaZB" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="wrap" />
      <ref role="13i0hy" node="2vPZMAnsyqb" resolve="wrap" />
      <node concept="3clFbS" id="2vPZMAnIaZC" role="3clF47">
        <node concept="3clFbF" id="2vPZMAnIaZD" role="3cqZAp">
          <node concept="2OqwBi" id="2vPZMAnIaZE" role="3clFbG">
            <node concept="2OqwBi" id="2vPZMAnIaZF" role="2Oq$k0">
              <node concept="13iPFW" id="2vPZMAnIaZG" role="2Oq$k0" />
              <node concept="3TrEf2" id="2vPZMAnIbyh" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2vPZMAnIaRX" resolve="child" />
              </node>
            </node>
            <node concept="2oxUTD" id="2vPZMAnIc4u" role="2OqNvi">
              <node concept="37vLTw" id="2vPZMAnIc5L" role="2oxUTC">
                <ref role="3cqZAo" node="2vPZMAnIaZK" resolve="wrapped" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="2vPZMAnIaZK" role="3clF46">
        <property role="TrG5h" value="wrapped" />
        <node concept="3Tqbb2" id="2vPZMAnIaZL" role="1tU5fm">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="3Tqbb2" id="2vPZMAnIaZM" role="3clF45">
        <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
      </node>
      <node concept="3Tm1VV" id="2vPZMAnIaZN" role="1B3o_S" />
    </node>
    <node concept="13i0hz" id="G39ofD13GV" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="currentChildren" />
      <ref role="13i0hy" node="G39ofCXoEe" resolve="currentChildren" />
      <node concept="3clFbS" id="G39ofD13GY" role="3clF47">
        <node concept="3cpWs8" id="G39ofD1d0$" role="3cqZAp">
          <node concept="3cpWsn" id="G39ofD1d0_" role="3cpWs9">
            <property role="TrG5h" value="l" />
            <node concept="2I9FWS" id="G39ofD1cHy" role="1tU5fm">
              <ref role="2I9WkF" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
            </node>
            <node concept="2ShNRf" id="G39ofD1d0A" role="33vP2m">
              <node concept="2T8Vx0" id="G39ofD1d0B" role="2ShVmc">
                <node concept="2I9FWS" id="G39ofD1d0C" role="2T96Bj">
                  <ref role="2I9WkF" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="G39ofD19Q5" role="3cqZAp">
          <node concept="3clFbS" id="G39ofD19Q7" role="3clFbx">
            <node concept="3clFbF" id="G39ofD1elT" role="3cqZAp">
              <node concept="2OqwBi" id="G39ofD1gz$" role="3clFbG">
                <node concept="37vLTw" id="G39ofD1elR" role="2Oq$k0">
                  <ref role="3cqZAo" node="G39ofD1d0_" resolve="l" />
                </node>
                <node concept="TSZUe" id="G39ofD1ifR" role="2OqNvi">
                  <node concept="2OqwBi" id="G39ofD1iVp" role="25WWJ7">
                    <node concept="13iPFW" id="G39ofD1iCA" role="2Oq$k0" />
                    <node concept="3TrEf2" id="G39ofD1jGY" role="2OqNvi">
                      <ref role="3Tt5mk" to="zaxg:2vPZMAnIaRX" resolve="child" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3y3z36" id="G39ofD6EWj" role="3clFbw">
            <node concept="2OqwBi" id="G39ofD1a0i" role="3uHU7B">
              <node concept="13iPFW" id="G39ofD19Qa" role="2Oq$k0" />
              <node concept="3TrEf2" id="G39ofD1aw7" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2vPZMAnIaRX" resolve="child" />
              </node>
            </node>
            <node concept="10Nm6u" id="G39ofD1byI" role="3uHU7w" />
          </node>
        </node>
        <node concept="3cpWs6" id="G39ofD1bQc" role="3cqZAp">
          <node concept="37vLTw" id="G39ofD1d0D" role="3cqZAk">
            <ref role="3cqZAo" node="G39ofD1d0_" resolve="l" />
          </node>
        </node>
      </node>
      <node concept="A3Dl8" id="G39ofD1412" role="3clF45">
        <node concept="3Tqbb2" id="G39ofD1413" role="A3Ik2">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="3Tm1VV" id="G39ofD1414" role="1B3o_S" />
    </node>
    <node concept="13hLZK" id="2vPZMAnIaZl" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAnIaZm" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAnZU_y">
    <property role="3GE5qa" value="action" />
    <ref role="13h7C2" to="zaxg:2vPZMAnZ0ck" resolve="State" />
    <node concept="13hLZK" id="2vPZMAnZU_z" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAnZU_$" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="6Ddb4_fP2Hy" role="13h7CS">
      <property role="TrG5h" value="getScope" />
      <ref role="13i0hy" to="tpcu:52_Geb4QDV$" resolve="getScope" />
      <node concept="3Tm1VV" id="6Ddb4_fP2Hz" role="1B3o_S" />
      <node concept="3clFbS" id="6Ddb4_fP2HG" role="3clF47">
        <node concept="3clFbJ" id="6Ddb4_fPdmn" role="3cqZAp">
          <property role="TyiWK" value="true" />
          <node concept="3clFbS" id="6Ddb4_fPdmp" role="3clFbx">
            <node concept="3cpWs6" id="6Ddb4_fPv7D" role="3cqZAp">
              <node concept="iyS6D" id="6Ddb4_fPv7F" role="3cqZAk">
                <node concept="2YIFZM" id="6Ddb4_fPv7G" role="iy797">
                  <ref role="37wK5l" to="o8zo:6t3ylNOzI9Y" resolve="forNamedElements" />
                  <ref role="1Pybhc" to="o8zo:7ipADkTevLm" resolve="SimpleRoleScope" />
                  <node concept="13iPFW" id="6Ddb4_fPv7H" role="37wK5m" />
                  <node concept="359W_D" id="6Ddb4_fPv7I" role="37wK5m">
                    <ref role="359W_E" to="zaxg:2vPZMAnZ0ck" resolve="State" />
                    <ref role="359W_F" to="zaxg:2vPZMAnZ0cp" resolve="variables" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="1Wc70l" id="6Ddb4_fPg1W" role="3clFbw">
            <node concept="iy1fb" id="6Ddb4_fPnAL" role="3uHU7w">
              <ref role="iy1sa" to="zaxg:2vPZMAmEVPK" resolve="children" />
            </node>
            <node concept="2OqwBi" id="6Ddb4_fPdY$" role="3uHU7B">
              <node concept="37vLTw" id="6Ddb4_fPdq4" role="2Oq$k0">
                <ref role="3cqZAo" node="6Ddb4_fP2HH" resolve="kind" />
              </node>
              <node concept="2Za9M6" id="6Ddb4_fPeNp" role="2OqNvi">
                <node concept="chp4Y" id="6Ddb4_fPeXl" role="2ZaTVi">
                  <ref role="cht4Q" to="8xo1:4Dhs5NildkH" resolve="StateVariable" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6Ddb4_fP0kJ" role="3cqZAp">
          <node concept="iy90A" id="6Ddb4_fPvhZ" role="3cqZAk" />
        </node>
      </node>
      <node concept="37vLTG" id="6Ddb4_fP2HH" role="3clF46">
        <property role="TrG5h" value="kind" />
        <node concept="3bZ5Sz" id="6Ddb4_fP2HI" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="6Ddb4_fP2HJ" role="3clF46">
        <property role="TrG5h" value="child" />
        <node concept="3Tqbb2" id="6Ddb4_fP2HK" role="1tU5fm" />
      </node>
      <node concept="3uibUv" id="6Ddb4_fP2HL" role="3clF45">
        <ref role="3uigEE" to="o8zo:3fifI_xCtN$" resolve="Scope" />
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAory6T">
    <property role="3GE5qa" value="widgets" />
    <ref role="13h7C2" to="zaxg:2vPZMAolrZd" resolve="ShowAndEdit" />
    <node concept="13hLZK" id="2vPZMAory6U" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAory6V" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="2vPZMAory7c" role="13h7CS">
      <property role="TrG5h" value="readonlyVersion" />
      <node concept="3Tm1VV" id="2vPZMAory7d" role="1B3o_S" />
      <node concept="3clFbS" id="2vPZMAory7f" role="3clF47">
        <node concept="3cpWs8" id="2vPZMAorEfe" role="3cqZAp">
          <node concept="3cpWsn" id="2vPZMAorEff" role="3cpWs9">
            <property role="TrG5h" value="copiedChild" />
            <node concept="3Tqbb2" id="2vPZMAorEeF" role="1tU5fm">
              <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
            </node>
            <node concept="2OqwBi" id="2vPZMAorEfg" role="33vP2m">
              <node concept="2OqwBi" id="2vPZMAorEfh" role="2Oq$k0">
                <node concept="13iPFW" id="2vPZMAorEfi" role="2Oq$k0" />
                <node concept="3TrEf2" id="2vPZMAorEfj" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:2vPZMAnIaRX" resolve="child" />
                </node>
              </node>
              <node concept="1$rogu" id="2vPZMAorEfk" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="2Gpval" id="2vPZMAorC0K" role="3cqZAp">
          <node concept="2GrKxI" id="2vPZMAorC0M" role="2Gsz3X">
            <property role="TrG5h" value="w" />
          </node>
          <node concept="2OqwBi" id="2vPZMAorCI3" role="2GsD0m">
            <node concept="37vLTw" id="2vPZMAorC6Y" role="2Oq$k0">
              <ref role="3cqZAo" node="2vPZMAorEff" resolve="copiedChild" />
            </node>
            <node concept="2Rf3mk" id="2vPZMAorEtt" role="2OqNvi">
              <node concept="1xMEDy" id="2vPZMAorEtv" role="1xVPHs">
                <node concept="chp4Y" id="2vPZMAorEw0" role="ri$Ld">
                  <ref role="cht4Q" to="zaxg:5KtU3pY9cIT" resolve="IPropertyWidget" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="2vPZMAorC0Q" role="2LFqv$">
            <node concept="3cpWs8" id="2vPZMAoujQ9" role="3cqZAp">
              <node concept="3cpWsn" id="2vPZMAoujQa" role="3cpWs9">
                <property role="TrG5h" value="value" />
                <node concept="3Tqbb2" id="2vPZMAoujLs" role="1tU5fm">
                  <ref role="ehGHo" to="tpee:fz3vP1J" resolve="Expression" />
                </node>
                <node concept="2OqwBi" id="2vPZMAoujQb" role="33vP2m">
                  <node concept="2OqwBi" id="2vPZMAoujQc" role="2Oq$k0">
                    <node concept="2GrUjf" id="2vPZMAoujQd" role="2Oq$k0">
                      <ref role="2Gs0qQ" node="2vPZMAorC0M" resolve="w" />
                    </node>
                    <node concept="3TrEf2" id="2vPZMAoujQe" role="2OqNvi">
                      <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgs" resolve="data" />
                    </node>
                  </node>
                  <node concept="2qgKlT" id="2vPZMAoujQf" role="2OqNvi">
                    <ref role="37wK5l" node="2vPZMAoudvY" resolve="dataReadExpression" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="2vPZMAouk2B" role="3cqZAp">
              <node concept="2OqwBi" id="2vPZMAoukgT" role="3clFbG">
                <node concept="2GrUjf" id="2vPZMAouk2_" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="2vPZMAorC0M" resolve="w" />
                </node>
                <node concept="1P9Npp" id="2vPZMAoukC6" role="2OqNvi">
                  <node concept="2pJPEk" id="2vPZMAoukFr" role="1P9ThW">
                    <node concept="2pJPED" id="2vPZMAoBY$Z" role="2pJPEn">
                      <ref role="2pJxaS" to="zaxg:2vPZMAnIaRS" resolve="Box" />
                      <node concept="2pIpSj" id="2vPZMAoBYCq" role="2pJxcM">
                        <ref role="2pIpSl" to="zaxg:2vPZMAnIaRX" resolve="child" />
                        <node concept="2pJPED" id="2vPZMAoukFt" role="28nt2d">
                          <ref role="2pJxaS" to="zaxg:2vPZMAmDmtP" resolve="Label" />
                          <node concept="2pIpSj" id="2vPZMAoukMa" role="2pJxcM">
                            <ref role="2pIpSl" to="zaxg:2vPZMAmDsnU" resolve="value" />
                            <node concept="36biLy" id="2vPZMAoukPw" role="28nt2d">
                              <node concept="37vLTw" id="2vPZMAoukSM" role="36biLW">
                                <ref role="3cqZAo" node="2vPZMAoujQa" resolve="value" />
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
        <node concept="3clFbF" id="2vPZMAorECC" role="3cqZAp">
          <node concept="37vLTw" id="2vPZMAorECA" role="3clFbG">
            <ref role="3cqZAo" node="2vPZMAorEff" resolve="copiedChild" />
          </node>
        </node>
      </node>
      <node concept="3Tqbb2" id="2vPZMAory7N" role="3clF45">
        <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="2vPZMAoudvF">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:2vPZMAmvsgl" resolve="NodePropRef" />
    <node concept="13i0hz" id="2vPZMAoudvY" role="13h7CS">
      <property role="TrG5h" value="dataReadExpression" />
      <node concept="3Tm1VV" id="2vPZMAoudvZ" role="1B3o_S" />
      <node concept="3Tqbb2" id="2vPZMAoudwi" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1J" resolve="Expression" />
      </node>
      <node concept="3clFbS" id="2vPZMAoudw1" role="3clF47">
        <node concept="3clFbF" id="2vPZMAoudyA" role="3cqZAp">
          <node concept="2pJPEk" id="2vPZMAoudy$" role="3clFbG">
            <node concept="2pJPED" id="2vPZMAoudy_" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hqOqwz4" resolve="DotExpression" />
              <node concept="2pIpSj" id="2vPZMAoud_S" role="2pJxcM">
                <ref role="2pIpSl" to="tpee:hqOq$gm" resolve="operand" />
                <node concept="36biLy" id="2vPZMAoudAl" role="28nt2d">
                  <node concept="2OqwBi" id="2vPZMAouenv" role="36biLW">
                    <node concept="2OqwBi" id="2vPZMAoue76" role="2Oq$k0">
                      <node concept="13iPFW" id="2vPZMAoudAQ" role="2Oq$k0" />
                      <node concept="3TrEf2" id="2vPZMAoueeX" role="2OqNvi">
                        <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgm" resolve="node" />
                      </node>
                    </node>
                    <node concept="1$rogu" id="2vPZMAoueGw" role="2OqNvi" />
                  </node>
                </node>
              </node>
              <node concept="2pIpSj" id="2vPZMAoueMR" role="2pJxcM">
                <ref role="2pIpSl" to="tpee:hqOqNr4" resolve="operation" />
                <node concept="2pJPED" id="2vPZMAoui$x" role="28nt2d">
                  <ref role="2pJxaS" to="tp25:gzTrcDJ" resolve="SPropertyAccess" />
                  <node concept="2pIpSj" id="2vPZMAoui_n" role="2pJxcM">
                    <ref role="2pIpSl" to="tp25:gzTsBJd" resolve="property" />
                    <node concept="36biLy" id="2vPZMAouiCq" role="28nt2d">
                      <node concept="2OqwBi" id="2vPZMAouiPG" role="36biLW">
                        <node concept="13iPFW" id="2vPZMAouiDk" role="2Oq$k0" />
                        <node concept="3TrEf2" id="2vPZMAouiYU" role="2OqNvi">
                          <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgn" resolve="property" />
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
    <node concept="13hLZK" id="2vPZMAoudvG" role="13h7CW">
      <node concept="3clFbS" id="2vPZMAoudvH" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="cqTc8J2fEv">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:2vPZMAmGCtk" resolve="LayoutVertical" />
    <node concept="13hLZK" id="cqTc8J2fEw" role="13h7CW">
      <node concept="3clFbS" id="cqTc8J2fEx" role="2VODD2">
        <node concept="3clFbF" id="cqTc8J2lz6" role="3cqZAp">
          <node concept="2OqwBi" id="cqTc8J2mEK" role="3clFbG">
            <node concept="2OqwBi" id="cqTc8J2lKy" role="2Oq$k0">
              <node concept="13iPFW" id="cqTc8J2lz4" role="2Oq$k0" />
              <node concept="3TrEf2" id="cqTc8J2mgN" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:cqTc8J2l4k" resolve="align" />
              </node>
            </node>
            <node concept="zfrQC" id="cqTc8J2nog" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="cqTc8J2nH6">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:cqTc8J2hYz" resolve="Alignment" />
    <node concept="13hLZK" id="cqTc8J2nH7" role="13h7CW">
      <node concept="3clFbS" id="cqTc8J2nH8" role="2VODD2">
        <node concept="3clFbF" id="cqTc8J2nHq" role="3cqZAp">
          <node concept="2OqwBi" id="cqTc8J2oFD" role="3clFbG">
            <node concept="2OqwBi" id="cqTc8J2nQO" role="2Oq$k0">
              <node concept="13iPFW" id="cqTc8J2nHp" role="2Oq$k0" />
              <node concept="3TrcHB" id="cqTc8J2nYw" role="2OqNvi">
                <ref role="3TsBF5" to="zaxg:cqTc8J2hY_" resolve="horizontal" />
              </node>
            </node>
            <node concept="tyxLq" id="cqTc8J2oN1" role="2OqNvi">
              <node concept="21nZrQ" id="cqTc8J2oPy" role="tz02z">
                <ref role="21nZrZ" to="zaxg:cqTc8J2hI8" resolve="left" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="cqTc8J2oQ8" role="3cqZAp">
          <node concept="2OqwBi" id="cqTc8J2oQ9" role="3clFbG">
            <node concept="2OqwBi" id="cqTc8J2oQa" role="2Oq$k0">
              <node concept="13iPFW" id="cqTc8J2oQb" role="2Oq$k0" />
              <node concept="3TrcHB" id="cqTc8J2oQc" role="2OqNvi">
                <ref role="3TsBF5" to="zaxg:cqTc8J2hY$" resolve="vertical" />
              </node>
            </node>
            <node concept="tyxLq" id="cqTc8J2oQd" role="2OqNvi">
              <node concept="21nZrQ" id="cqTc8J2oQe" role="tz02z">
                <ref role="21nZrZ" to="zaxg:cqTc8J1POm" resolve="top" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="cqTc8J2sWX">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:2vPZMAmEVPF" resolve="LayoutHorizontal" />
    <node concept="13hLZK" id="cqTc8J2sWY" role="13h7CW">
      <node concept="3clFbS" id="cqTc8J2sWZ" role="2VODD2">
        <node concept="3clFbF" id="cqTc8J2sXg" role="3cqZAp">
          <node concept="2OqwBi" id="cqTc8J2sXi" role="3clFbG">
            <node concept="2OqwBi" id="cqTc8J2sXj" role="2Oq$k0">
              <node concept="13iPFW" id="cqTc8J2sXk" role="2Oq$k0" />
              <node concept="3TrEf2" id="cqTc8J2sXl" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:cqTc8J2sSH" resolve="align" />
              </node>
            </node>
            <node concept="zfrQC" id="cqTc8J2sXm" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="G39ofC8Oo5">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:cqTc8Jo1wo" resolve="Typography" />
    <node concept="13hLZK" id="G39ofC8Oo6" role="13h7CW">
      <node concept="3clFbS" id="G39ofC8Oo7" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="G39ofCIEhF">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:cqTc8Jo1wp" resolve="Color" />
    <node concept="13i0hz" id="G39ofCIE$w" role="13h7CS">
      <property role="TrG5h" value="colorString" />
      <node concept="3Tm1VV" id="G39ofCIE$x" role="1B3o_S" />
      <node concept="17QB3L" id="G39ofCIERm" role="3clF45" />
      <node concept="3clFbS" id="G39ofCIE$z" role="3clF47">
        <node concept="3clFbF" id="G39ofCIFJv" role="3cqZAp">
          <node concept="3cpWs3" id="G39ofCIH$I" role="3clFbG">
            <node concept="2OqwBi" id="G39ofCIJ4r" role="3uHU7w">
              <node concept="13iPFW" id="G39ofCIItd" role="2Oq$k0" />
              <node concept="3TrcHB" id="G39ofCIJv4" role="2OqNvi">
                <ref role="3TsBF5" to="zaxg:cqTc8Jo1wq" resolve="value" />
              </node>
            </node>
            <node concept="Xl_RD" id="G39ofCIIah" role="3uHU7B">
              <property role="Xl_RC" value="#" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="G39ofCILfK" role="13h7CS">
      <property role="TrG5h" value="color" />
      <node concept="3Tm1VV" id="G39ofCILfL" role="1B3o_S" />
      <node concept="3uibUv" id="G39ofCILQW" role="3clF45">
        <ref role="3uigEE" to="z60i:~Color" resolve="Color" />
      </node>
      <node concept="3clFbS" id="G39ofCILfN" role="3clF47">
        <node concept="3J1_TO" id="G39ofCIOZU" role="3cqZAp">
          <node concept="3uVAMA" id="G39ofCIQuZ" role="1zxBo5">
            <node concept="XOnhg" id="G39ofCIQv0" role="1zc67B">
              <property role="TrG5h" value="t" />
              <node concept="nSUau" id="G39ofCIQv1" role="1tU5fm">
                <node concept="3uibUv" id="G39ofCIQMg" role="nSUat">
                  <ref role="3uigEE" to="wyt6:~Throwable" resolve="Throwable" />
                </node>
              </node>
            </node>
            <node concept="3clFbS" id="G39ofCIQv2" role="1zc67A">
              <node concept="3cpWs6" id="G39ofCIRoZ" role="3cqZAp">
                <node concept="10M0yZ" id="G39ofCIRYU" role="3cqZAk">
                  <ref role="3cqZAo" to="z60i:~Color.black" resolve="black" />
                  <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="G39ofCIOZW" role="1zxBo7">
            <node concept="3cpWs6" id="G39ofCIPj8" role="3cqZAp">
              <node concept="2YIFZM" id="G39ofCIPja" role="3cqZAk">
                <ref role="37wK5l" to="z60i:~Color.decode(java.lang.String)" resolve="decode" />
                <ref role="1Pybhc" to="z60i:~Color" resolve="Color" />
                <node concept="BsUDl" id="G39ofCIPjb" role="37wK5m">
                  <ref role="37wK5l" node="G39ofCIE$w" resolve="colorString" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="G39ofCIEhG" role="13h7CW">
      <node concept="3clFbS" id="G39ofCIEhH" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="1LliyakHbMS">
    <property role="3GE5qa" value="values" />
    <ref role="13h7C2" to="zaxg:1Lliyak$MAq" resolve="ValueConverter" />
    <node concept="13hLZK" id="1LliyakHbMT" role="13h7CW">
      <node concept="3clFbS" id="1LliyakHbMU" role="2VODD2">
        <node concept="3clFbF" id="1LliyakHc5I" role="3cqZAp">
          <node concept="2OqwBi" id="1LliyakHen3" role="3clFbG">
            <node concept="2OqwBi" id="1LliyakHcgG" role="2Oq$k0">
              <node concept="13iPFW" id="1LliyakHc5H" role="2Oq$k0" />
              <node concept="3TrEf2" id="1LliyakHcJk" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:1Lliyak$O3t" resolve="widgetType" />
              </node>
            </node>
            <node concept="zfrQC" id="1LliyakHf3E" role="2OqNvi">
              <ref role="1A9B2P" to="tpee:hP7QB7G" resolve="StringType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="1LliyakQm1h" role="13h7CS">
      <property role="TrG5h" value="itType" />
      <ref role="13i0hy" node="1LliyakMmFh" resolve="itType" />
      <node concept="3Tm1VV" id="1LliyakQm1i" role="1B3o_S" />
      <node concept="3clFbS" id="1LliyakQm1n" role="3clF47">
        <node concept="3clFbF" id="1LliyakUseB" role="3cqZAp">
          <node concept="3K4zz7" id="1LliyakUtKC" role="3clFbG">
            <node concept="2OqwBi" id="1LliyakQnp4" role="3K4Cdx">
              <node concept="37vLTw" id="1LliyakQnfI" role="2Oq$k0">
                <ref role="3cqZAo" node="1LliyakQm1o" resolve="fun" />
              </node>
              <node concept="1BlSNk" id="1LliyakQnNr" role="2OqNvi">
                <ref role="1BmUXE" to="zaxg:1Lliyak$MAq" resolve="ValueConverter" />
                <ref role="1Bn3mz" to="zaxg:1LliyakH2ee" resolve="modelToWidget" />
              </node>
            </node>
            <node concept="2OqwBi" id="1LliyakQq__" role="3K4E3e">
              <node concept="2OqwBi" id="1LliyakQptL" role="2Oq$k0">
                <node concept="13iPFW" id="1LliyakQphW" role="2Oq$k0" />
                <node concept="3TrEf2" id="1LliyakQpWW" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:1Lliyak$Nuo" resolve="modelType" />
                </node>
              </node>
              <node concept="1$rogu" id="1LliyakQqM3" role="2OqNvi" />
            </node>
            <node concept="2OqwBi" id="1LliyakQrI8" role="3K4GZi">
              <node concept="2OqwBi" id="1LliyakQrI9" role="2Oq$k0">
                <node concept="13iPFW" id="1LliyakQrIa" role="2Oq$k0" />
                <node concept="3TrEf2" id="1LliyakQrIb" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:1Lliyak$O3t" resolve="widgetType" />
                </node>
              </node>
              <node concept="1$rogu" id="1LliyakQrIc" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="1LliyakQm1o" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="1LliyakQm1p" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
      <node concept="3Tqbb2" id="1LliyakQm1q" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
    </node>
    <node concept="13i0hz" id="1LliyakQm1r" role="13h7CS">
      <property role="TrG5h" value="resultType" />
      <ref role="13i0hy" node="1LliyakMp10" resolve="resultType" />
      <node concept="3Tm1VV" id="1LliyakQm1s" role="1B3o_S" />
      <node concept="3clFbS" id="1LliyakQm1x" role="3clF47">
        <node concept="3clFbF" id="1LliyakUvEv" role="3cqZAp">
          <node concept="3K4zz7" id="1LliyakUvEw" role="3clFbG">
            <node concept="2OqwBi" id="1LliyakUvEx" role="3K4Cdx">
              <node concept="37vLTw" id="1LliyakUvEy" role="2Oq$k0">
                <ref role="3cqZAo" node="1LliyakQm1y" resolve="fun" />
              </node>
              <node concept="1BlSNk" id="1LliyakUvEz" role="2OqNvi">
                <ref role="1BmUXE" to="zaxg:1Lliyak$MAq" resolve="ValueConverter" />
                <ref role="1Bn3mz" to="zaxg:1LliyakH2ee" resolve="modelToWidget" />
              </node>
            </node>
            <node concept="2OqwBi" id="1LliyakUvE$" role="3K4E3e">
              <node concept="2OqwBi" id="1LliyakUvE_" role="2Oq$k0">
                <node concept="13iPFW" id="1LliyakUvEA" role="2Oq$k0" />
                <node concept="3TrEf2" id="1LliyakUvEB" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:1Lliyak$O3t" resolve="widgetType" />
                </node>
              </node>
              <node concept="1$rogu" id="1LliyakUvEC" role="2OqNvi" />
            </node>
            <node concept="2OqwBi" id="1LliyakUvED" role="3K4GZi">
              <node concept="2OqwBi" id="1LliyakUvEE" role="2Oq$k0">
                <node concept="13iPFW" id="1LliyakUvEF" role="2Oq$k0" />
                <node concept="3TrEf2" id="1LliyakUvEG" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:1Lliyak$Nuo" resolve="modelType" />
                </node>
              </node>
              <node concept="1$rogu" id="1LliyakUvEH" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="1LliyakQm1y" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="1LliyakQm1z" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
      <node concept="3Tqbb2" id="1LliyakQm1$" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1LliyakMjtY">
    <property role="3GE5qa" value="values" />
    <ref role="13h7C2" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
    <node concept="13i0hz" id="1LliyalJhq8" role="13h7CS">
      <property role="TrG5h" value="itType" />
      <node concept="3Tm1VV" id="1LliyalJhq9" role="1B3o_S" />
      <node concept="3Tqbb2" id="1LliyalJhHk" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
      <node concept="3clFbS" id="1LliyalJhqb" role="3clF47">
        <node concept="3clFbF" id="1LliyalJiRZ" role="3cqZAp">
          <node concept="2OqwBi" id="1LliyalJk$P" role="3clFbG">
            <node concept="2OqwBi" id="1LliyalJj3e" role="2Oq$k0">
              <node concept="13iPFW" id="1LliyalJiRY" role="2Oq$k0" />
              <node concept="2Xjw5R" id="1LliyalJjty" role="2OqNvi">
                <node concept="1xMEDy" id="1LliyalJjt$" role="1xVPHs">
                  <node concept="chp4Y" id="1LliyalJjMr" role="ri$Ld">
                    <ref role="cht4Q" to="zaxg:1LliyakMlNn" resolve="IItFunctionContext" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="2qgKlT" id="1LliyalJl07" role="2OqNvi">
              <ref role="37wK5l" node="1LliyakMmFh" resolve="itType" />
              <node concept="13iPFW" id="1LliyalJljz" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="1LliyakMjtZ" role="13h7CW">
      <node concept="3clFbS" id="1LliyakMju0" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="1LliyakMmos">
    <property role="3GE5qa" value="values" />
    <ref role="13h7C2" to="zaxg:1LliyakMlNn" resolve="IItFunctionContext" />
    <node concept="13i0hz" id="1LliyakMmFh" role="13h7CS">
      <property role="13i0iv" value="true" />
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="itType" />
      <node concept="3Tm1VV" id="1LliyakMmFi" role="1B3o_S" />
      <node concept="3Tqbb2" id="1LliyakMmY7" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
      <node concept="3clFbS" id="1LliyakMmFk" role="3clF47" />
      <node concept="37vLTG" id="1LliyakMo8M" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="1LliyakMo8L" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="1LliyakMp10" role="13h7CS">
      <property role="13i0iv" value="true" />
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="resultType" />
      <node concept="3Tm1VV" id="1LliyakMp11" role="1B3o_S" />
      <node concept="3Tqbb2" id="1LliyakMp12" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
      <node concept="3clFbS" id="1LliyakMp13" role="3clF47" />
      <node concept="37vLTG" id="1LliyakMp14" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="1LliyakMp15" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="1LliyakMmot" role="13h7CW">
      <node concept="3clFbS" id="1LliyakMmou" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="gNsEGB2qvR">
    <property role="3GE5qa" value="layout" />
    <ref role="13h7C2" to="zaxg:2vPZMAoGIbo" resolve="LabelWidgetPair" />
    <node concept="13hLZK" id="gNsEGB2qvS" role="13h7CW">
      <node concept="3clFbS" id="gNsEGB2qvT" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="gNsEGB2ByE" role="13h7CS">
      <property role="TrG5h" value="canThisBeWrapped" />
      <ref role="13i0hy" node="gNsEGB2zdH" resolve="canThisBeWrapped" />
      <node concept="3clFbS" id="gNsEGB2ByH" role="3clF47">
        <node concept="3clFbF" id="gNsEGB2CcF" role="3cqZAp">
          <node concept="2OqwBi" id="gNsEGB2CEF" role="3clFbG">
            <node concept="37vLTw" id="gNsEGB2CcE" role="2Oq$k0">
              <ref role="3cqZAo" node="gNsEGB2BRD" resolve="rc" />
            </node>
            <node concept="1mIQ4w" id="gNsEGB2D5S" role="2OqNvi">
              <node concept="chp4Y" id="gNsEGB2Drh" role="cj9EA">
                <ref role="cht4Q" to="zaxg:2vPZMAolc2A" resolve="IWidget" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="gNsEGB2BRD" role="3clF46">
        <property role="TrG5h" value="rc" />
        <node concept="3Tqbb2" id="gNsEGB2BRE" role="1tU5fm">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="10P_77" id="gNsEGB2BRF" role="3clF45" />
      <node concept="3Tm1VV" id="gNsEGB2BRG" role="1B3o_S" />
    </node>
    <node concept="13i0hz" id="gNsEGB2qN4" role="13h7CS">
      <property role="TrG5h" value="wrap" />
      <ref role="13i0hy" node="2vPZMAnsyqb" resolve="wrap" />
      <node concept="3Tm1VV" id="gNsEGB2qN5" role="1B3o_S" />
      <node concept="3clFbS" id="gNsEGB2qNa" role="3clF47">
        <node concept="3clFbF" id="gNsEGB2wwc" role="3cqZAp">
          <node concept="37vLTI" id="gNsEGB2ywu" role="3clFbG">
            <node concept="1PxgMI" id="gNsEGB2AQY" role="37vLTx">
              <node concept="chp4Y" id="gNsEGB2BeS" role="3oSUPX">
                <ref role="cht4Q" to="zaxg:2vPZMAolc2A" resolve="IWidget" />
              </node>
              <node concept="37vLTw" id="gNsEGB2yRA" role="1m5AlR">
                <ref role="3cqZAo" node="gNsEGB2qNb" resolve="wrapped" />
              </node>
            </node>
            <node concept="2OqwBi" id="gNsEGB2x09" role="37vLTJ">
              <node concept="13iPFW" id="gNsEGB2wwb" role="2Oq$k0" />
              <node concept="3TrEf2" id="gNsEGB2xvn" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2vPZMAoGIbr" resolve="widget" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="gNsEGB2qNb" role="3clF46">
        <property role="TrG5h" value="wrapped" />
        <node concept="3Tqbb2" id="gNsEGB2qNc" role="1tU5fm">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
      <node concept="3Tqbb2" id="gNsEGB2qNd" role="3clF45">
        <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
      </node>
    </node>
    <node concept="13i0hz" id="gNsEGB2qNe" role="13h7CS">
      <property role="TrG5h" value="currentChildren" />
      <ref role="13i0hy" node="G39ofCXoEe" resolve="currentChildren" />
      <node concept="3Tm1VV" id="gNsEGB2qNf" role="1B3o_S" />
      <node concept="3clFbS" id="gNsEGB2qNj" role="3clF47">
        <node concept="3clFbF" id="gNsEGB2r6N" role="3cqZAp">
          <node concept="2ShNRf" id="gNsEGB2sc4" role="3clFbG">
            <node concept="2HTt$P" id="gNsEGB2uwv" role="2ShVmc">
              <node concept="2OqwBi" id="gNsEGB2v0H" role="2HTEbv">
                <node concept="13iPFW" id="gNsEGB2uOG" role="2Oq$k0" />
                <node concept="3TrEf2" id="gNsEGB2vwO" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:2vPZMAoGIbr" resolve="widget" />
                </node>
              </node>
              <node concept="3Tqbb2" id="gNsEGB2vQn" role="2HTBi0">
                <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="A3Dl8" id="gNsEGB2qNk" role="3clF45">
        <node concept="3Tqbb2" id="gNsEGB2qNl" role="A3Ik2">
          <ref role="ehGHo" to="8xo1:7GLg2tFqfT1" resolve="IReactComponent" />
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="5KtU3pYa$_y">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:5KtU3pY9R88" resolve="NodeReferenceRef" />
    <node concept="13i0hz" id="5KtU3pYa$Sn" role="13h7CS">
      <property role="TrG5h" value="dataReadExpression" />
      <node concept="3Tm1VV" id="5KtU3pYa$So" role="1B3o_S" />
      <node concept="3Tqbb2" id="5KtU3pYa$Sp" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1J" resolve="Expression" />
      </node>
      <node concept="3clFbS" id="5KtU3pYa$Sq" role="3clF47">
        <node concept="3clFbF" id="5KtU3pYa$Sr" role="3cqZAp">
          <node concept="2pJPEk" id="5KtU3pYa$Ss" role="3clFbG">
            <node concept="2pJPED" id="5KtU3pYa$St" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hqOqwz4" resolve="DotExpression" />
              <node concept="2pIpSj" id="5KtU3pYa$Su" role="2pJxcM">
                <ref role="2pIpSl" to="tpee:hqOq$gm" resolve="operand" />
                <node concept="36biLy" id="5KtU3pYa$Sv" role="28nt2d">
                  <node concept="2OqwBi" id="5KtU3pYa$Sw" role="36biLW">
                    <node concept="2OqwBi" id="5KtU3pYa$Sx" role="2Oq$k0">
                      <node concept="13iPFW" id="5KtU3pYa$Sy" role="2Oq$k0" />
                      <node concept="3TrEf2" id="5KtU3pYa$Sz" role="2OqNvi">
                        <ref role="3Tt5mk" to="zaxg:5KtU3pY9R89" resolve="node" />
                      </node>
                    </node>
                    <node concept="1$rogu" id="5KtU3pYa$S$" role="2OqNvi" />
                  </node>
                </node>
              </node>
              <node concept="2pIpSj" id="5KtU3pYa$S_" role="2pJxcM">
                <ref role="2pIpSl" to="tpee:hqOqNr4" resolve="operation" />
                <node concept="2pJPED" id="5KtU3pYa$SA" role="28nt2d">
                  <ref role="2pJxaS" to="tp25:gzTrEba" resolve="SLinkAccess" />
                  <node concept="2pIpSj" id="5KtU3pYa$SB" role="2pJxcM">
                    <ref role="2pIpSl" to="tp25:gzTt5is" resolve="link" />
                    <node concept="36biLy" id="5KtU3pYa$SC" role="28nt2d">
                      <node concept="2OqwBi" id="5KtU3pYa$SD" role="36biLW">
                        <node concept="13iPFW" id="5KtU3pYa$SE" role="2Oq$k0" />
                        <node concept="3TrEf2" id="5KtU3pYa$SF" role="2OqNvi">
                          <ref role="3Tt5mk" to="zaxg:5KtU3pY9R8a" resolve="reference" />
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
    <node concept="13hLZK" id="5KtU3pYa$_z" role="13h7CW">
      <node concept="3clFbS" id="5KtU3pYa$_$" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="5KtU3pYnaq3">
    <property role="3GE5qa" value="widgets" />
    <ref role="13h7C2" to="zaxg:5KtU3pY8yh1" resolve="ReferenceTargetChooser" />
    <node concept="13hLZK" id="5KtU3pYnaq4" role="13h7CW">
      <node concept="3clFbS" id="5KtU3pYnaq5" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="5KtU3pYnaGS" role="13h7CS">
      <property role="TrG5h" value="itType" />
      <ref role="13i0hy" node="1LliyakMmFh" resolve="itType" />
      <node concept="3Tm1VV" id="5KtU3pYnaGT" role="1B3o_S" />
      <node concept="3clFbS" id="5KtU3pYnaGY" role="3clF47">
        <node concept="3clFbJ" id="5KtU3pYneZ2" role="3cqZAp">
          <node concept="3clFbS" id="5KtU3pYneZ4" role="3clFbx">
            <node concept="3cpWs6" id="5KtU3pYnjpi" role="3cqZAp">
              <node concept="2pJPEk" id="5KtU3pYnk$8" role="3cqZAk">
                <node concept="2pJPED" id="5KtU3pYnk$c" role="2pJPEn">
                  <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbC" id="5KtU3pYngBr" role="3clFbw">
            <node concept="10Nm6u" id="5KtU3pYngV1" role="3uHU7w" />
            <node concept="2OqwBi" id="5KtU3pYnfyz" role="3uHU7B">
              <node concept="13iPFW" id="5KtU3pYnfiu" role="2Oq$k0" />
              <node concept="3TrEf2" id="5KtU3pYng8R" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:5KtU3pYaLL$" resolve="data" />
              </node>
            </node>
          </node>
          <node concept="9aQIb" id="5KtU3pYnhxa" role="9aQIa">
            <node concept="3clFbS" id="5KtU3pYnhxb" role="9aQI4">
              <node concept="3cpWs6" id="5KtU3pYnj5f" role="3cqZAp">
                <node concept="1PxgMI" id="5KtU3pYnj5h" role="3cqZAk">
                  <node concept="chp4Y" id="5KtU3pYnj5i" role="3oSUPX">
                    <ref role="cht4Q" to="tpee:fz3vP1H" resolve="Type" />
                  </node>
                  <node concept="2OqwBi" id="5KtU3pYnj5j" role="1m5AlR">
                    <node concept="2OqwBi" id="5KtU3pYnj5k" role="2Oq$k0">
                      <node concept="2OqwBi" id="5KtU3pYnj5l" role="2Oq$k0">
                        <node concept="13iPFW" id="5KtU3pYnj5m" role="2Oq$k0" />
                        <node concept="3TrEf2" id="5KtU3pYnj5n" role="2OqNvi">
                          <ref role="3Tt5mk" to="zaxg:5KtU3pYaLL$" resolve="data" />
                        </node>
                      </node>
                      <node concept="3TrEf2" id="5KtU3pYnj5o" role="2OqNvi">
                        <ref role="3Tt5mk" to="zaxg:5KtU3pY9R89" resolve="node" />
                      </node>
                    </node>
                    <node concept="3JvlWi" id="5KtU3pYnj5p" role="2OqNvi" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="5KtU3pYnaGZ" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="5KtU3pYnaH0" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
      <node concept="3Tqbb2" id="5KtU3pYnaH1" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
    </node>
    <node concept="13i0hz" id="5KtU3pYnaH2" role="13h7CS">
      <property role="TrG5h" value="resultType" />
      <ref role="13i0hy" node="1LliyakMp10" resolve="resultType" />
      <node concept="3Tm1VV" id="5KtU3pYnaH3" role="1B3o_S" />
      <node concept="3clFbS" id="5KtU3pYnaH8" role="3clF47">
        <node concept="3clFbF" id="5KtU3pYnb0k" role="3cqZAp">
          <node concept="2pJPEk" id="5KtU3pYnb0i" role="3clFbG">
            <node concept="2pJPED" id="5KtU3pYnb0j" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="5KtU3pYnaH9" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="5KtU3pYnaHa" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
      <node concept="3Tqbb2" id="5KtU3pYnaHb" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="6tfgpzo6sbC">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:6tfgpzo6r_t" resolve="IRefersToFeature" />
    <node concept="13i0hz" id="6tfgpzo6suP" role="13h7CS">
      <property role="13i0iv" value="true" />
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="featureName" />
      <node concept="3Tm1VV" id="6tfgpzo6suQ" role="1B3o_S" />
      <node concept="17QB3L" id="6tfgpzo6tqk" role="3clF45" />
      <node concept="3clFbS" id="6tfgpzo6suS" role="3clF47" />
    </node>
    <node concept="13hLZK" id="6tfgpzo6sbD" role="13h7CW">
      <node concept="3clFbS" id="6tfgpzo6sbE" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="6tfgpzo6vPN">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:5KtU3pY9cIT" resolve="IPropertyWidget" />
    <node concept="13i0hz" id="6tfgpzo6w90" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="featureName" />
      <ref role="13i0hy" node="6tfgpzo6suP" resolve="featureName" />
      <node concept="3clFbS" id="6tfgpzo6w93" role="3clF47">
        <node concept="3clFbF" id="6tfgpzo6wJF" role="3cqZAp">
          <node concept="2OqwBi" id="6tfgpzo6yWG" role="3clFbG">
            <node concept="2OqwBi" id="6tfgpzo6y1s" role="2Oq$k0">
              <node concept="2OqwBi" id="6tfgpzo6wZk" role="2Oq$k0">
                <node concept="13iPFW" id="6tfgpzo6wJE" role="2Oq$k0" />
                <node concept="3TrEf2" id="6tfgpzo6xzB" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgs" resolve="data" />
                </node>
              </node>
              <node concept="3TrEf2" id="6tfgpzo6yvI" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:2vPZMAmvsgn" resolve="property" />
              </node>
            </node>
            <node concept="3TrcHB" id="6tfgpzo6zAT" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="6tfgpzo6wse" role="3clF45" />
      <node concept="3Tm1VV" id="6tfgpzo6wsf" role="1B3o_S" />
    </node>
    <node concept="13hLZK" id="6tfgpzo6vPO" role="13h7CW">
      <node concept="3clFbS" id="6tfgpzo6vPP" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="6tfgpzo6$Dm">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:5KtU3pYaMW3" resolve="IReferenceWidget" />
    <node concept="13i0hz" id="6tfgpzo6$Wz" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="featureName" />
      <ref role="13i0hy" node="6tfgpzo6suP" resolve="featureName" />
      <node concept="3clFbS" id="6tfgpzo6$WA" role="3clF47">
        <node concept="3clFbF" id="6tfgpzo6_ze" role="3cqZAp">
          <node concept="2OqwBi" id="6tfgpzo6C39" role="3clFbG">
            <node concept="2OqwBi" id="6tfgpzo6AOZ" role="2Oq$k0">
              <node concept="2OqwBi" id="6tfgpzo6_MR" role="2Oq$k0">
                <node concept="13iPFW" id="6tfgpzo6_zd" role="2Oq$k0" />
                <node concept="3TrEf2" id="6tfgpzo6Ana" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:5KtU3pYaLL$" resolve="data" />
                </node>
              </node>
              <node concept="3TrEf2" id="6tfgpzo6Bjh" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:5KtU3pY9R8a" resolve="reference" />
              </node>
            </node>
            <node concept="3TrcHB" id="6tfgpzo6CHm" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="6tfgpzo6_fL" role="3clF45" />
      <node concept="3Tm1VV" id="6tfgpzo6_fM" role="1B3o_S" />
    </node>
    <node concept="13hLZK" id="6tfgpzo6$Dn" role="13h7CW">
      <node concept="3clFbS" id="6tfgpzo6$Do" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="6tfgpzo6KSQ">
    <property role="3GE5qa" value="output" />
    <ref role="13h7C2" to="zaxg:7$1mkeArAgt" resolve="ErrorReporting" />
    <node concept="13hLZK" id="6tfgpzo6KSR" role="13h7CW">
      <node concept="3clFbS" id="6tfgpzo6KSS" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="7HYB$0nt8PS">
    <ref role="13h7C2" to="zaxg:2xzaHpfUqlh" resolve="ErrorReportingAnnotation" />
    <node concept="13i0hz" id="7HYB$0nt995" role="13h7CS">
      <property role="TrG5h" value="detectedFeature" />
      <node concept="3Tm1VV" id="7HYB$0nt996" role="1B3o_S" />
      <node concept="17QB3L" id="7HYB$0nt9s3" role="3clF45" />
      <node concept="3clFbS" id="7HYB$0nt998" role="3clF47">
        <node concept="3clFbJ" id="7HYB$0ntc6f" role="3cqZAp">
          <node concept="2OqwBi" id="7HYB$0ntht0" role="3clFbw">
            <node concept="2OqwBi" id="7HYB$0ntchd" role="2Oq$k0">
              <node concept="13iPFW" id="7HYB$0ntc6i" role="2Oq$k0" />
              <node concept="1mfA1w" id="7HYB$0ntdP2" role="2OqNvi" />
            </node>
            <node concept="1mIQ4w" id="7HYB$0ntfGB" role="2OqNvi">
              <node concept="chp4Y" id="7HYB$0ntg08" role="cj9EA">
                <ref role="cht4Q" to="zaxg:6tfgpzo6r_t" resolve="IRefersToFeature" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="7HYB$0ntc6h" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0nti6e" role="3cqZAp">
              <node concept="2OqwBi" id="7HYB$0ntknG" role="3cqZAk">
                <node concept="1PxgMI" id="7HYB$0ntjSo" role="2Oq$k0">
                  <node concept="chp4Y" id="7HYB$0ntkcN" role="3oSUPX">
                    <ref role="cht4Q" to="zaxg:6tfgpzo6r_t" resolve="IRefersToFeature" />
                  </node>
                  <node concept="2OqwBi" id="7HYB$0nti$U" role="1m5AlR">
                    <node concept="13iPFW" id="7HYB$0nti6h" role="2Oq$k0" />
                    <node concept="1mfA1w" id="7HYB$0ntj6Z" role="2OqNvi" />
                  </node>
                </node>
                <node concept="2qgKlT" id="7HYB$0ntkQI" role="2OqNvi">
                  <ref role="37wK5l" node="6tfgpzo6suP" resolve="featureName" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="7HYB$0ntlz5" role="3cqZAp">
          <node concept="10Nm6u" id="7HYB$0ntlz9" role="3cqZAk" />
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="7HYB$0ntpKY" role="13h7CS">
      <property role="TrG5h" value="onlyGlobalErrors" />
      <node concept="3Tm1VV" id="7HYB$0ntpKZ" role="1B3o_S" />
      <node concept="10P_77" id="7HYB$0ntq5D" role="3clF45" />
      <node concept="3clFbS" id="7HYB$0ntpL1" role="3clF47">
        <node concept="3clFbF" id="7HYB$0nu19g" role="3cqZAp">
          <node concept="2OqwBi" id="7HYB$0nu1lN" role="3clFbG">
            <node concept="13iPFW" id="7HYB$0nu19e" role="2Oq$k0" />
            <node concept="3TrcHB" id="7HYB$0nu25l" role="2OqNvi">
              <ref role="3TsBF5" to="zaxg:7HYB$0ntKF4" resolve="overrideReportOnlyGlobal" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="7HYB$0ntsoi" role="13h7CS">
      <property role="TrG5h" value="restrictToFeature" />
      <node concept="3Tm1VV" id="7HYB$0ntsoj" role="1B3o_S" />
      <node concept="17QB3L" id="7HYB$0ntsUf" role="3clF45" />
      <node concept="3clFbS" id="7HYB$0ntsol" role="3clF47">
        <node concept="3clFbJ" id="7HYB$0ntSHR" role="3cqZAp">
          <node concept="3clFbS" id="7HYB$0ntSHT" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0ntUke" role="3cqZAp">
              <node concept="10Nm6u" id="7HYB$0ntXre" role="3cqZAk" />
            </node>
          </node>
          <node concept="2OqwBi" id="7HYB$0ntTcf" role="3clFbw">
            <node concept="13iPFW" id="7HYB$0ntT28" role="2Oq$k0" />
            <node concept="3TrcHB" id="7HYB$0ntTHb" role="2OqNvi">
              <ref role="3TsBF5" to="zaxg:7HYB$0ntJMl" resolve="overrideReportAnyFeature" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="7HYB$0nu09m" role="3cqZAp">
          <node concept="3clFbS" id="7HYB$0nu09n" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0nu09o" role="3cqZAp">
              <node concept="10Nm6u" id="7HYB$0nu09p" role="3cqZAk" />
            </node>
          </node>
          <node concept="2OqwBi" id="7HYB$0nu09q" role="3clFbw">
            <node concept="13iPFW" id="7HYB$0nu09r" role="2Oq$k0" />
            <node concept="3TrcHB" id="7HYB$0nu09s" role="2OqNvi">
              <ref role="3TsBF5" to="zaxg:7HYB$0ntJMl" resolve="overrideReportAnyFeature" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="7HYB$0ntXKd" role="3cqZAp">
          <node concept="BsUDl" id="7HYB$0ntY5i" role="3cqZAk">
            <ref role="37wK5l" node="7HYB$0nt995" resolve="detectedFeature" />
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="7HYB$0ntvVC" role="13h7CS">
      <property role="TrG5h" value="infoString" />
      <node concept="3Tm1VV" id="7HYB$0ntvVD" role="1B3o_S" />
      <node concept="17QB3L" id="7HYB$0ntwgj" role="3clF45" />
      <node concept="3clFbS" id="7HYB$0ntvVF" role="3clF47">
        <node concept="3clFbJ" id="7HYB$0ntwQp" role="3cqZAp">
          <node concept="BsUDl" id="7HYB$0ntx9G" role="3clFbw">
            <ref role="37wK5l" node="7HYB$0ntpKY" resolve="onlyGlobalErrors" />
          </node>
          <node concept="3clFbS" id="7HYB$0ntwQr" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0nty3Z" role="3cqZAp">
              <node concept="Xl_RD" id="7HYB$0ntyns" role="3cqZAk">
                <property role="Xl_RC" value="reports only errors with no feature association." />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="7HYB$0ntz1f" role="3cqZAp">
          <node concept="3clFbS" id="7HYB$0ntz1h" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0nt_vm" role="3cqZAp">
              <node concept="3cpWs3" id="7HYB$0ntDOO" role="3cqZAk">
                <node concept="Xl_RD" id="7HYB$0ntDOR" role="3uHU7w">
                  <property role="Xl_RC" value="'." />
                </node>
                <node concept="3cpWs3" id="7HYB$0ntBXu" role="3uHU7B">
                  <node concept="Xl_RD" id="7HYB$0nt_vn" role="3uHU7B">
                    <property role="Xl_RC" value="reports only errors for feature '" />
                  </node>
                  <node concept="BsUDl" id="7HYB$0ntChI" role="3uHU7w">
                    <ref role="37wK5l" node="7HYB$0ntsoi" resolve="restrictToFeature" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3y3z36" id="7HYB$0nt$Ry" role="3clFbw">
            <node concept="10Nm6u" id="7HYB$0nt_bm" role="3uHU7w" />
            <node concept="BsUDl" id="7HYB$0ntzkS" role="3uHU7B">
              <ref role="37wK5l" node="7HYB$0ntsoi" resolve="restrictToFeature" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="7HYB$0ntEN9" role="3cqZAp">
          <node concept="Xl_RD" id="7HYB$0ntFrr" role="3cqZAk">
            <property role="Xl_RC" value="reports all errors for the node" />
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="7HYB$0nzf_j" role="13h7CS">
      <property role="TrG5h" value="shortInfoString" />
      <node concept="3Tm1VV" id="7HYB$0nzf_k" role="1B3o_S" />
      <node concept="17QB3L" id="7HYB$0nzf_l" role="3clF45" />
      <node concept="3clFbS" id="7HYB$0nzf_m" role="3clF47">
        <node concept="3clFbJ" id="7HYB$0nzf_n" role="3cqZAp">
          <node concept="BsUDl" id="7HYB$0nzf_o" role="3clFbw">
            <ref role="37wK5l" node="7HYB$0ntpKY" resolve="onlyGlobalErrors" />
          </node>
          <node concept="3clFbS" id="7HYB$0nzf_p" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0nzf_q" role="3cqZAp">
              <node concept="Xl_RD" id="7HYB$0nzf_r" role="3cqZAk">
                <property role="Xl_RC" value="g" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="7HYB$0nzf_s" role="3cqZAp">
          <node concept="3clFbS" id="7HYB$0nzf_t" role="3clFbx">
            <node concept="3cpWs6" id="7HYB$0nzf_u" role="3cqZAp">
              <node concept="Xl_RD" id="7HYB$0nzih$" role="3cqZAk">
                <property role="Xl_RC" value="f" />
              </node>
            </node>
          </node>
          <node concept="3y3z36" id="7HYB$0nzf_$" role="3clFbw">
            <node concept="10Nm6u" id="7HYB$0nzf__" role="3uHU7w" />
            <node concept="BsUDl" id="7HYB$0nzf_A" role="3uHU7B">
              <ref role="37wK5l" node="7HYB$0ntsoi" resolve="restrictToFeature" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="7HYB$0nzf_B" role="3cqZAp">
          <node concept="Xl_RD" id="7HYB$0nzf_C" role="3cqZAk">
            <property role="Xl_RC" value="*" />
          </node>
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="7HYB$0nt8PT" role="13h7CW">
      <node concept="3clFbS" id="7HYB$0nt8PU" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="5Qmp_LAP9kn">
    <property role="3GE5qa" value="widgets" />
    <ref role="13h7C2" to="zaxg:gNsEGB5DCe" resolve="StringChoiceSpecifierDynamic" />
    <node concept="13hLZK" id="5Qmp_LAP9ko" role="13h7CW">
      <node concept="3clFbS" id="5Qmp_LAP9kp" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="5Qmp_LAQb9d">
    <ref role="13h7C2" to="zaxg:5Qmp_LAQ2pv" resolve="NodeFactory" />
    <node concept="13hLZK" id="5Qmp_LAQb9e" role="13h7CW">
      <node concept="3clFbS" id="5Qmp_LAQb9f" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="5Qmp_LAQbs2" role="13h7CS">
      <property role="TrG5h" value="itType" />
      <ref role="13i0hy" node="1LliyakMmFh" resolve="itType" />
      <node concept="3Tm1VV" id="5Qmp_LAQbs3" role="1B3o_S" />
      <node concept="3clFbS" id="5Qmp_LAQbs8" role="3clF47">
        <node concept="3clFbF" id="5Qmp_LAQbJu" role="3cqZAp">
          <node concept="2pJPEk" id="5Qmp_LAQbJs" role="3clFbG">
            <node concept="2pJPED" id="5Qmp_LAQbJt" role="2pJPEn">
              <ref role="2pJxaS" to="tp25:5MFgGQnlLNI" resolve="SConceptType" />
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="5Qmp_LAQbs9" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="5Qmp_LAQbsa" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
      <node concept="3Tqbb2" id="5Qmp_LAQbsb" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
    </node>
    <node concept="13i0hz" id="5Qmp_LAQbsc" role="13h7CS">
      <property role="TrG5h" value="resultType" />
      <ref role="13i0hy" node="1LliyakMp10" resolve="resultType" />
      <node concept="3Tm1VV" id="5Qmp_LAQbsd" role="1B3o_S" />
      <node concept="3clFbS" id="5Qmp_LAQbsi" role="3clF47">
        <node concept="3clFbJ" id="5Qmp_LAQcqp" role="3cqZAp">
          <node concept="2OqwBi" id="5Qmp_LAQd8W" role="3clFbw">
            <node concept="37vLTw" id="5Qmp_LAQcH4" role="2Oq$k0">
              <ref role="3cqZAo" node="5Qmp_LAQbsj" resolve="fun" />
            </node>
            <node concept="1BlSNk" id="5Qmp_LAQd_3" role="2OqNvi">
              <ref role="1BmUXE" to="zaxg:5Qmp_LAQ2pv" resolve="NodeFactory" />
              <ref role="1Bn3mz" to="zaxg:5Qmp_LAQ3RB" resolve="labelFun" />
            </node>
          </node>
          <node concept="3clFbS" id="5Qmp_LAQcqr" role="3clFbx">
            <node concept="3cpWs6" id="5Qmp_LAQetR" role="3cqZAp">
              <node concept="2pJPEk" id="5Qmp_LAQeKS" role="3cqZAk">
                <node concept="2pJPED" id="5Qmp_LAQeKU" role="2pJPEn">
                  <ref role="2pJxaS" to="tpee:hP7QB7G" resolve="StringType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="5Qmp_LAQgk2" role="3cqZAp">
          <node concept="2pJPEk" id="5Qmp_LAQgB8" role="3cqZAk">
            <node concept="2pJPED" id="5Qmp_LAQgBa" role="2pJPEn">
              <ref role="2pJxaS" to="tp25:gzTqbfa" resolve="SNodeType" />
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="5Qmp_LAQbsj" role="3clF46">
        <property role="TrG5h" value="fun" />
        <node concept="3Tqbb2" id="5Qmp_LAQbsk" role="1tU5fm">
          <ref role="ehGHo" to="zaxg:1LliyakMh9m" resolve="ItFunction" />
        </node>
      </node>
      <node concept="3Tqbb2" id="5Qmp_LAQbsl" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1H" resolve="Type" />
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="5Qmp_LAUZHK">
    <property role="3GE5qa" value="util" />
    <ref role="13h7C2" to="zaxg:5Qmp_LAUTgf" resolve="NodeChildRef" />
    <node concept="13i0hz" id="5Qmp_LAV00_" role="13h7CS">
      <property role="TrG5h" value="dataReadExpression" />
      <node concept="3Tm1VV" id="5Qmp_LAV00A" role="1B3o_S" />
      <node concept="3Tqbb2" id="5Qmp_LAV00B" role="3clF45">
        <ref role="ehGHo" to="tpee:fz3vP1J" resolve="Expression" />
      </node>
      <node concept="3clFbS" id="5Qmp_LAV00C" role="3clF47">
        <node concept="3clFbF" id="5Qmp_LAV00D" role="3cqZAp">
          <node concept="2pJPEk" id="5Qmp_LAV00E" role="3clFbG">
            <node concept="2pJPED" id="5Qmp_LAV00F" role="2pJPEn">
              <ref role="2pJxaS" to="tpee:hqOqwz4" resolve="DotExpression" />
              <node concept="2pIpSj" id="5Qmp_LAV00G" role="2pJxcM">
                <ref role="2pIpSl" to="tpee:hqOq$gm" resolve="operand" />
                <node concept="36biLy" id="5Qmp_LAV00H" role="28nt2d">
                  <node concept="2OqwBi" id="5Qmp_LAV00I" role="36biLW">
                    <node concept="2OqwBi" id="5Qmp_LAV00J" role="2Oq$k0">
                      <node concept="13iPFW" id="5Qmp_LAV00K" role="2Oq$k0" />
                      <node concept="3TrEf2" id="5Qmp_LAV00L" role="2OqNvi">
                        <ref role="3Tt5mk" to="zaxg:5Qmp_LAUTPE" resolve="node" />
                      </node>
                    </node>
                    <node concept="1$rogu" id="5Qmp_LAV00M" role="2OqNvi" />
                  </node>
                </node>
              </node>
              <node concept="2pIpSj" id="5Qmp_LAV00N" role="2pJxcM">
                <ref role="2pIpSl" to="tpee:hqOqNr4" resolve="operation" />
                <node concept="2pJPED" id="5Qmp_LAV00O" role="28nt2d">
                  <ref role="2pJxaS" to="tp25:gzTrEba" resolve="SLinkAccess" />
                  <node concept="2pIpSj" id="5Qmp_LAV00P" role="2pJxcM">
                    <ref role="2pIpSl" to="tp25:gzTt5is" resolve="link" />
                    <node concept="36biLy" id="5Qmp_LAV00Q" role="28nt2d">
                      <node concept="2OqwBi" id="5Qmp_LAV00R" role="36biLW">
                        <node concept="13iPFW" id="5Qmp_LAV00S" role="2Oq$k0" />
                        <node concept="3TrEf2" id="5Qmp_LAV00T" role="2OqNvi">
                          <ref role="3Tt5mk" to="zaxg:5Qmp_LAUU8d" resolve="child" />
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
    <node concept="13hLZK" id="5Qmp_LAUZHL" role="13h7CW">
      <node concept="3clFbS" id="5Qmp_LAUZHM" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="af0_0CTpco">
    <ref role="13h7C2" to="zaxg:af0_0CR$4e" resolve="CreateDeleteRenderChild" />
    <node concept="13hLZK" id="af0_0CTpcp" role="13h7CW">
      <node concept="3clFbS" id="af0_0CTpcq" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="af0_0CTtMO">
    <property role="3GE5qa" value="interfaces" />
    <ref role="13h7C2" to="zaxg:af0_0CSxPf" resolve="IChildWidget" />
    <node concept="13hLZK" id="af0_0CTtMP" role="13h7CW">
      <node concept="3clFbS" id="af0_0CTtMQ" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="af0_0CTu5Z" role="13h7CS">
      <property role="13i0it" value="true" />
      <property role="TrG5h" value="featureName" />
      <ref role="13i0hy" node="6tfgpzo6suP" resolve="featureName" />
      <node concept="3clFbS" id="af0_0CTu62" role="3clF47">
        <node concept="3clFbF" id="af0_0CTuGg" role="3cqZAp">
          <node concept="2OqwBi" id="af0_0CTwD7" role="3clFbG">
            <node concept="2OqwBi" id="af0_0CTvIf" role="2Oq$k0">
              <node concept="2OqwBi" id="af0_0CTuVT" role="2Oq$k0">
                <node concept="13iPFW" id="af0_0CTuGf" role="2Oq$k0" />
                <node concept="3TrEf2" id="af0_0CTvyl" role="2OqNvi">
                  <ref role="3Tt5mk" to="zaxg:5Qmp_LAVe3i" resolve="data" />
                </node>
              </node>
              <node concept="3TrEf2" id="af0_0CTwc9" role="2OqNvi">
                <ref role="3Tt5mk" to="zaxg:5Qmp_LAUU8d" resolve="child" />
              </node>
            </node>
            <node concept="3TrcHB" id="af0_0CTxiW" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="af0_0CTupb" role="3clF45" />
      <node concept="3Tm1VV" id="af0_0CTupc" role="1B3o_S" />
    </node>
  </node>
</model>

