<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:bd16d026-1f3f-43f5-8bf1-4308f4f99e87(org.modelix.mps.react.componentslib.modelix)">
  <persistence version="9" />
  <languages>
    <use id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="2" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
  </languages>
  <imports>
    <import index="e11" ref="83a7cbdc-dd9d-4dad-be97-957aa1b07375/java:org.modelix.react.ssr.mps(org.modelix.mps.react.ssr.stubs/)" />
    <import index="jh6v" ref="r:f2f39a18-fd23-4090-b7f2-ba8da340eec2(org.modelix.model.repositoryconcepts.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" />
    <import index="tpcn" ref="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="18ew" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.util(MPS.Core/)" />
  </imports>
  <registry>
    <language id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react">
      <concept id="5291744615171232098" name="org.modelix.mps.react.structure.CustomHandlerParameter" flags="ng" index="24bxNi">
        <child id="5291744615171247995" name="value" index="24b$bb" />
      </concept>
      <concept id="5291744615171232095" name="org.modelix.mps.react.structure.CustomHandler" flags="ng" index="24bxNJ">
        <child id="5291744615171248060" name="serverSideParameters" index="24b$8c" />
        <child id="5291744615171248062" name="body" index="24b$8e" />
      </concept>
      <concept id="8374592933087336196" name="org.modelix.mps.react.structure.IfComp" flags="ng" index="274_3y">
        <child id="8374592933087336198" name="condition" index="274_3w" />
        <child id="8374592933087336199" name="child" index="274_3x" />
      </concept>
      <concept id="8876946878574531757" name="org.modelix.mps.react.structure.TextComponent" flags="ng" index="ggXia">
        <child id="8876946878574531775" name="value" index="ggXio" />
      </concept>
      <concept id="8876946878574742630" name="org.modelix.mps.react.structure.JsCode" flags="ng" index="gh8L1">
        <property id="8876946878574742644" name="code" index="gh8Lj" />
      </concept>
      <concept id="8876946878574735527" name="org.modelix.mps.react.structure.JsFunctionPropertyValue" flags="ng" index="ghf20">
        <child id="8876946878574735559" name="parameters" index="ghf3w" />
        <child id="8876946878574737562" name="implementation" index="ghfyX" />
      </concept>
      <concept id="8876946878574735543" name="org.modelix.mps.react.structure.JsFunctionParameter" flags="ng" index="ghf2g" />
      <concept id="8876946878574654557" name="org.modelix.mps.react.structure.PrimitivePropertyValue" flags="ng" index="ghjhU">
        <child id="8876946878574654571" name="value" index="ghjhc" />
      </concept>
      <concept id="8876946878575278069" name="org.modelix.mps.react.structure.JsonObjectValue" flags="ng" index="gjbvi">
        <child id="8876946878575278146" name="members" index="gjbx_" />
      </concept>
      <concept id="8876946878575278085" name="org.modelix.mps.react.structure.JsonObjectMember" flags="ng" index="gjbwy">
        <property id="8876946878575278099" name="key" index="gjbwO" />
        <child id="8876946878575278101" name="value" index="gjbwM" />
      </concept>
      <concept id="8876946878573696709" name="org.modelix.mps.react.structure.ReactModule" flags="ng" index="gl9ry">
        <child id="8876946878573903290" name="content" index="gmrQt" />
      </concept>
      <concept id="8876946878573903439" name="org.modelix.mps.react.structure.GenericReactComponent" flags="ng" index="gmrTC">
        <property id="8876946878573977569" name="componentType" index="gmPZ6" />
        <child id="8876946878574187978" name="properties" index="gn1nH" />
        <child id="8876946878574187976" name="children" index="gn1nJ" />
        <child id="5355184975888307549" name="stateVariables" index="2o1qk1" />
      </concept>
      <concept id="8876946878574187981" name="org.modelix.mps.react.structure.Property" flags="ng" index="gn1nE">
        <property id="8876946878574187995" name="propertyName" index="gn1nW" />
        <child id="8876946878574187997" name="value" index="gn1nU" />
      </concept>
      <concept id="5355184975888307501" name="org.modelix.mps.react.structure.StateVariable" flags="ng" index="2o1qlL">
        <child id="5355184975888310505" name="initializer" index="2o1p2P" />
        <child id="5355184975888307510" name="type" index="2o1qlE" />
      </concept>
      <concept id="5355184975888424302" name="org.modelix.mps.react.structure.StateVariableReference" flags="ng" index="2o1YOM">
        <reference id="5355184975888424309" name="decl" index="2o1YOD" />
      </concept>
      <concept id="1612157992440222093" name="org.modelix.mps.react.structure.ForEachInteratorVariableReference" flags="ng" index="rqPyE">
        <reference id="1612157992440222094" name="forEach" index="rqPyD" />
      </concept>
      <concept id="1612157992440089595" name="org.modelix.mps.react.structure.ForEachComponent" flags="ng" index="rrkbs">
        <child id="1612157992440089646" name="input" index="rrkk9" />
        <child id="1612157992440089600" name="component" index="rrkkB" />
      </concept>
      <concept id="8861973540082802718" name="org.modelix.mps.react.structure.ComponentPropertyValue" flags="ng" index="rtYR_">
        <child id="8861973540082802734" name="component" index="rtYRl" />
      </concept>
      <concept id="5355184975880615620" name="org.modelix.mps.react.structure.NamedRendererOverload" flags="ng" index="2rzwqo">
        <reference id="5355184975880615621" name="overloaded" index="2rzwqp" />
      </concept>
      <concept id="5355184975880615610" name="org.modelix.mps.react.structure.NamedRendererParameter" flags="ng" index="2rzwrA">
        <child id="5355184975880615618" name="type" index="2rzwqu" />
      </concept>
      <concept id="5355184975880615607" name="org.modelix.mps.react.structure.NamedRenderer" flags="ng" index="2rzwrF" />
      <concept id="5355184975881978516" name="org.modelix.mps.react.structure.CallNamedRenderer" flags="ng" index="2rDjb8">
        <reference id="5355184975881978525" name="renderer" index="2rDjb1" />
        <child id="5355184975881978527" name="parameterValues" index="2rDjb3" />
      </concept>
      <concept id="5355184975880958844" name="org.modelix.mps.react.structure.NamedRendererParameterReference" flags="ng" index="2rHscw">
        <reference id="5355184975880958845" name="decl" index="2rHscx" />
      </concept>
      <concept id="5355184975881056557" name="org.modelix.mps.react.structure.NamedRendererBase" flags="ng" index="2rHO5L">
        <child id="5355184975881056561" name="parameters" index="2rHO5H" />
        <child id="5355184975881056562" name="components" index="2rHO5I" />
      </concept>
      <concept id="5355184975881402769" name="org.modelix.mps.react.structure.CustomHandlerParameterReference" flags="ng" index="2rIwBd">
        <reference id="5355184975881402770" name="decl" index="2rIwBe" />
      </concept>
      <concept id="1470515121291768364" name="org.modelix.mps.react.structure.IncrementalPolymorhpicFunctionCall" flags="ng" index="_1Yeq">
        <reference id="1470515121291768365" name="decl" index="_1Yer" />
        <child id="1470515121291768367" name="parameterValues" index="_1Yep" />
      </concept>
      <concept id="1470515121291768350" name="org.modelix.mps.react.structure.IncrementalPolymorhpicFunctionParameterReference" flags="ng" index="_1YeC">
        <reference id="1470515121293281412" name="decl" index="_VD$M" />
      </concept>
      <concept id="1470515121291768326" name="org.modelix.mps.react.structure.IncrementalPolymorhpicFunction" flags="ng" index="_1YeK">
        <child id="1470515121292776028" name="returnType" index="_5OfE" />
      </concept>
      <concept id="1470515121291768327" name="org.modelix.mps.react.structure.IncrementalPolymorhpicFunctionOverload" flags="ng" index="_1YeL">
        <reference id="1470515121291768360" name="overloaded" index="_1Yeu" />
      </concept>
      <concept id="1470515121291768332" name="org.modelix.mps.react.structure.IncrementalPolymorhpicFunctionParameter" flags="ng" index="_1YeU">
        <child id="1470515121291855562" name="type" index="_6ltW" />
      </concept>
      <concept id="1470515121291768333" name="org.modelix.mps.react.structure.IncrementalPolymorhpicFunctionBase" flags="ng" index="_1YeV">
        <child id="1470515121291768353" name="parameters" index="_1Yen" />
        <child id="1470515121291768351" name="body" index="_1YeD" />
      </concept>
      <concept id="2075754047059325736" name="org.modelix.mps.react.structure.JsonArrayElementExpression" flags="ng" index="34KBLA">
        <child id="2075754047059325996" name="value" index="34KBHy" />
      </concept>
      <concept id="2075754047059325481" name="org.modelix.mps.react.structure.JsonArrayBuilder" flags="ng" index="34KBPB">
        <child id="2075754047059325604" name="body" index="34KBRE" />
      </concept>
      <concept id="2833354970324652966" name="org.modelix.mps.react.structure.When" flags="ng" index="1nAWFN">
        <child id="2833354970324652969" name="else" index="1nAWFW" />
        <child id="2833354970324652971" name="cases" index="1nAWFY" />
      </concept>
      <concept id="2833354970324652974" name="org.modelix.mps.react.structure.WhenCase" flags="ng" index="1nAWFV">
        <child id="2833354970324652977" name="compnent" index="1nAWF$" />
        <child id="2833354970324652975" name="condition" index="1nAWFU" />
      </concept>
      <concept id="3359299524217903406" name="org.modelix.mps.react.structure.PagePathVariableReference" flags="ng" index="1tINwK">
        <reference id="3359299524217903407" name="decl" index="1tINwL" />
      </concept>
      <concept id="7186142608857783837" name="org.modelix.mps.react.structure.ContextRepositoryExpression" flags="ng" index="1xZx2W" />
      <concept id="7186142608857762387" name="org.modelix.mps.react.structure.Page" flags="ng" index="1xZ$jM">
        <child id="7186142608858233588" name="path" index="1xWnhl" />
        <child id="7186142608857776878" name="content" index="1xZwLf" />
      </concept>
      <concept id="7186142608857847244" name="org.modelix.mps.react.structure.PagePath" flags="ng" index="1xZLHH">
        <child id="7186142608857857834" name="parts" index="1xZN6b" />
      </concept>
      <concept id="7186142608857857829" name="org.modelix.mps.react.structure.StaticPagePathPart" flags="ng" index="1xZN64">
        <property id="7186142608857857830" name="value" index="1xZN67" />
      </concept>
      <concept id="7186142608857857831" name="org.modelix.mps.react.structure.VariablePagePathPart" flags="ng" index="1xZN66" />
      <concept id="793519207835900435" name="org.modelix.mps.react.structure.EmptyContent" flags="ng" index="3ywjYg" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="nn" index="2tJIrI" />
      <concept id="1188207840427" name="jetbrains.mps.baseLanguage.structure.AnnotationInstance" flags="nn" index="2AHcQZ">
        <reference id="1188208074048" name="annotation" index="2AI5Lk" />
      </concept>
      <concept id="1188208481402" name="jetbrains.mps.baseLanguage.structure.HasAnnotation" flags="ngI" index="2AJDlI">
        <child id="1188208488637" name="annotation" index="2AJF6D" />
      </concept>
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1197029447546" name="jetbrains.mps.baseLanguage.structure.FieldReferenceOperation" flags="nn" index="2OwXpG">
        <reference id="1197029500499" name="fieldDeclaration" index="2Oxat5" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1070475354124" name="jetbrains.mps.baseLanguage.structure.ThisExpression" flags="nn" index="Xjq3P" />
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1068390468200" name="jetbrains.mps.baseLanguage.structure.FieldDeclaration" flags="ig" index="312cEg" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1109279763828" name="jetbrains.mps.baseLanguage.structure.TypeVariableDeclaration" flags="ng" index="16euLQ" />
      <concept id="1109279851642" name="jetbrains.mps.baseLanguage.structure.GenericDeclaration" flags="ng" index="16eOlS">
        <child id="1109279881614" name="typeVariableDeclaration" index="16eVyc" />
      </concept>
      <concept id="1109283449304" name="jetbrains.mps.baseLanguage.structure.TypeVariableReference" flags="in" index="16syzq">
        <reference id="1109283546497" name="typeVariableDeclaration" index="16sUi3" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="1225271369338" name="jetbrains.mps.baseLanguage.structure.IsEmptyOperation" flags="nn" index="17RlXB" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1111509017652" name="jetbrains.mps.baseLanguage.structure.FloatingPointConstant" flags="nn" index="3b6qkQ">
        <property id="1113006610751" name="value" index="$nhwW" />
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
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
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
      <concept id="1068580123140" name="jetbrains.mps.baseLanguage.structure.ConstructorDeclaration" flags="ig" index="3clFbW" />
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
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1081506762703" name="jetbrains.mps.baseLanguage.structure.GreaterThanExpression" flags="nn" index="3eOSWO" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1171903916106" name="jetbrains.mps.baseLanguage.structure.UpperBoundType" flags="in" index="3qUE_q">
        <child id="1171903916107" name="bound" index="3qUE_r" />
      </concept>
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1204200696010" name="jetbrains.mps.baseLanguage.structure.NullType" flags="in" index="1vX6Bi" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="2524418899405758586" name="jetbrains.mps.baseLanguage.closures.structure.InferredClosureParameterDeclaration" flags="ig" index="gl6BB" />
      <concept id="1199542442495" name="jetbrains.mps.baseLanguage.closures.structure.FunctionType" flags="in" index="1ajhzC">
        <child id="1199542457201" name="resultType" index="1ajl9A" />
        <child id="1199542501692" name="parameterType" index="1ajw0F" />
      </concept>
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
      <concept id="1225797177491" name="jetbrains.mps.baseLanguage.closures.structure.InvokeFunctionOperation" flags="nn" index="1Bd96e">
        <child id="1225797361612" name="parameter" index="1BdPVh" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="4693937538533521280" name="jetbrains.mps.lang.smodel.structure.OfConceptOperation" flags="ng" index="v3k3i">
        <child id="4693937538533538124" name="requestedConcept" index="v3oSu" />
      </concept>
      <concept id="7453996997717780434" name="jetbrains.mps.lang.smodel.structure.Node_GetSConceptOperation" flags="nn" index="2yIwOk" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="8329979535468945057" name="jetbrains.mps.lang.smodel.structure.Node_PresentationOperation" flags="ng" index="2Iv5rx" />
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="3562215692195599741" name="jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect" flags="nn" index="13MTOL">
        <reference id="3562215692195600259" name="link" index="13MTZf" />
      </concept>
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <property id="1238684351431" name="asCast" index="1BlNFB" />
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
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1176906603202" name="jetbrains.mps.baseLanguage.collections.structure.BinaryOperation" flags="nn" index="56pJg">
        <child id="1176906787974" name="rightExpression" index="576Qk" />
      </concept>
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1176923520476" name="jetbrains.mps.baseLanguage.collections.structure.ExcludeOperation" flags="nn" index="66VNe" />
      <concept id="1172650591544" name="jetbrains.mps.baseLanguage.collections.structure.SkipOperation" flags="nn" index="7r0gD">
        <child id="1172658456740" name="elementsToSkip" index="7T0AP" />
      </concept>
      <concept id="1226511727824" name="jetbrains.mps.baseLanguage.collections.structure.SetType" flags="in" index="2hMVRd">
        <child id="1226511765987" name="elementType" index="2hN53Y" />
      </concept>
      <concept id="1226516258405" name="jetbrains.mps.baseLanguage.collections.structure.HashSetCreator" flags="nn" index="2i4dXS" />
      <concept id="1151688443754" name="jetbrains.mps.baseLanguage.collections.structure.ListType" flags="in" index="_YKpA">
        <child id="1151688676805" name="elementType" index="_ZDj9" />
      </concept>
      <concept id="1151689724996" name="jetbrains.mps.baseLanguage.collections.structure.SequenceType" flags="in" index="A3Dl8">
        <child id="1151689745422" name="elementType" index="A3Ik2" />
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
      <concept id="1235573135402" name="jetbrains.mps.baseLanguage.collections.structure.SingletonSequenceCreator" flags="nn" index="2HTt$P">
        <child id="1235573175711" name="elementType" index="2HTBi0" />
        <child id="1235573187520" name="singletonValue" index="2HTEbv" />
      </concept>
      <concept id="1237721394592" name="jetbrains.mps.baseLanguage.collections.structure.AbstractContainerCreator" flags="nn" index="HWqM0">
        <child id="1237721435808" name="initValue" index="HW$Y0" />
        <child id="1237721435807" name="elementType" index="HW$YZ" />
        <child id="1237731803878" name="copyFrom" index="I$8f6" />
      </concept>
      <concept id="1205679737078" name="jetbrains.mps.baseLanguage.collections.structure.SortOperation" flags="nn" index="2S7cBI">
        <child id="1205679832066" name="ascending" index="2S7zOq" />
      </concept>
      <concept id="1237909114519" name="jetbrains.mps.baseLanguage.collections.structure.GetValuesOperation" flags="nn" index="T8wYR" />
      <concept id="1160600644654" name="jetbrains.mps.baseLanguage.collections.structure.ListCreatorWithInit" flags="nn" index="Tc6Ow" />
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
      <concept id="1171391069720" name="jetbrains.mps.baseLanguage.collections.structure.GetIndexOfOperation" flags="nn" index="2WmjW8" />
      <concept id="1240239494010" name="jetbrains.mps.baseLanguage.collections.structure.TreeMapCreator" flags="nn" index="342d9q" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
      <concept id="1240325842691" name="jetbrains.mps.baseLanguage.collections.structure.AsSequenceOperation" flags="nn" index="39bAoz" />
      <concept id="1178286324487" name="jetbrains.mps.baseLanguage.collections.structure.SortDirection" flags="nn" index="1nlBCl" />
      <concept id="1197683403723" name="jetbrains.mps.baseLanguage.collections.structure.MapType" flags="in" index="3rvAFt">
        <child id="1197683466920" name="keyType" index="3rvQeY" />
        <child id="1197683475734" name="valueType" index="3rvSg0" />
      </concept>
      <concept id="1165525191778" name="jetbrains.mps.baseLanguage.collections.structure.GetFirstOperation" flags="nn" index="1uHKPH" />
      <concept id="1165530316231" name="jetbrains.mps.baseLanguage.collections.structure.IsEmptyOperation" flags="nn" index="1v1jN8" />
      <concept id="1225711141656" name="jetbrains.mps.baseLanguage.collections.structure.ListElementAccessExpression" flags="nn" index="1y4W85">
        <child id="1225711182005" name="list" index="1y566C" />
        <child id="1225711191269" name="index" index="1y58nS" />
      </concept>
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
      <concept id="1202128969694" name="jetbrains.mps.baseLanguage.collections.structure.SelectOperation" flags="nn" index="3$u5V9" />
      <concept id="1197932370469" name="jetbrains.mps.baseLanguage.collections.structure.MapElement" flags="nn" index="3EllGN">
        <child id="1197932505799" name="map" index="3ElQJh" />
        <child id="1197932525128" name="key" index="3ElVtu" />
      </concept>
      <concept id="1176501494711" name="jetbrains.mps.baseLanguage.collections.structure.IsNotEmptyOperation" flags="nn" index="3GX2aA" />
      <concept id="1172254888721" name="jetbrains.mps.baseLanguage.collections.structure.ContainsOperation" flags="nn" index="3JPx81" />
      <concept id="1180964022718" name="jetbrains.mps.baseLanguage.collections.structure.ConcatOperation" flags="nn" index="3QWeyG" />
      <concept id="1178894719932" name="jetbrains.mps.baseLanguage.collections.structure.DistinctOperation" flags="nn" index="1VAtEI" />
    </language>
  </registry>
  <node concept="gl9ry" id="3uZ5ZhGndDA">
    <property role="TrG5h" value="lib.pages.ide" />
    <node concept="1xZ$jM" id="6YzOfzDJ1Wn" role="gmrQt">
      <node concept="1xZLHH" id="6YzOfzDJ1Wp" role="1xWnhl">
        <node concept="1xZN64" id="6YzOfzDJ3sX" role="1xZN6b">
          <property role="1xZN67" value="modelix" />
        </node>
        <node concept="1xZN64" id="6YzOfzDJ3t4" role="1xZN6b">
          <property role="1xZN67" value="lib" />
        </node>
        <node concept="1xZN64" id="6YzOfzDJ3tb" role="1xZN6b">
          <property role="1xZN67" value="ide" />
        </node>
      </node>
      <node concept="2rDjb8" id="6YzOfzDJ3tc" role="1xZwLf">
        <ref role="2rDjb1" node="3uZ5ZhGndDL" resolve="ide" />
        <node concept="1xZx2W" id="6YzOfzDJ3td" role="2rDjb3" />
        <node concept="10Nm6u" id="6YzOfzDJ4Io" role="2rDjb3" />
      </node>
    </node>
    <node concept="3ywjYg" id="6YzOfzDJ0rW" role="gmrQt" />
    <node concept="1xZ$jM" id="3uZ5ZhGndDB" role="gmrQt">
      <node concept="1xZLHH" id="3uZ5ZhGndDC" role="1xWnhl">
        <node concept="1xZN64" id="3uZ5ZhGndDD" role="1xZN6b">
          <property role="1xZN67" value="modelix" />
        </node>
        <node concept="1xZN64" id="6YzOfzDIPE_" role="1xZN6b">
          <property role="1xZN67" value="lib" />
        </node>
        <node concept="1xZN64" id="3uZ5ZhGndDF" role="1xZN6b">
          <property role="1xZN67" value="ide" />
        </node>
        <node concept="1xZN66" id="3uZ5ZhGndDG" role="1xZN6b">
          <property role="TrG5h" value="rootNodeRef" />
        </node>
      </node>
      <node concept="2rDjb8" id="3uZ5ZhGndDH" role="1xZwLf">
        <ref role="2rDjb1" node="3uZ5ZhGndDL" resolve="ide" />
        <node concept="1xZx2W" id="3uZ5ZhGndDI" role="2rDjb3" />
        <node concept="2YIFZM" id="3uZ5ZhGnobi" role="2rDjb3">
          <ref role="37wK5l" to="e11:~ReactFacade.resolveMPSNode(org.modelix.model.api.INodeReference)" resolve="resolveMPSNode" />
          <ref role="1Pybhc" to="e11:~ReactFacade" resolve="ReactFacade" />
          <node concept="2YIFZM" id="3uZ5ZhGnobj" role="37wK5m">
            <ref role="37wK5l" to="e11:~ReactFacade.deserializeModelixNodeReference(java.lang.String)" resolve="deserializeModelixNodeReference" />
            <ref role="1Pybhc" to="e11:~ReactFacade" resolve="ReactFacade" />
            <node concept="1tINwK" id="3uZ5ZhGnobk" role="37wK5m">
              <ref role="1tINwL" node="3uZ5ZhGndDG" resolve="rootNodeRef" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwrF" id="3uZ5ZhGndDL" role="gmrQt">
      <property role="TrG5h" value="ide" />
      <node concept="gmrTC" id="3uZ5ZhGndDM" role="2rHO5I">
        <property role="gmPZ6" value="mui.Box" />
        <node concept="gn1nE" id="3uZ5ZhGndDN" role="gn1nH">
          <property role="gn1nW" value="sx" />
          <node concept="gjbvi" id="3uZ5ZhGndDO" role="gn1nU">
            <node concept="gjbwy" id="3uZ5ZhGndDP" role="gjbx_">
              <property role="gjbwO" value="padding" />
              <node concept="ghjhU" id="3uZ5ZhGndDQ" role="gjbwM">
                <node concept="3cmrfG" id="3uZ5ZhGndDR" role="ghjhc">
                  <property role="3cmrfH" value="2" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="gmrTC" id="6YzOfzDHZW9" role="gn1nJ">
          <property role="gmPZ6" value="splitpane.SplitPane" />
          <node concept="gmrTC" id="6YzOfzDI2nz" role="gn1nJ">
            <property role="gmPZ6" value="splitpane.Pane" />
            <node concept="2rDjb8" id="6YzOfzDI7BU" role="gn1nJ">
              <ref role="2rDjb1" node="7nrA7MorVtg" resolve="projectView" />
              <node concept="2rHscw" id="6YzOfzDI7BV" role="2rDjb3">
                <ref role="2rHscx" node="3uZ5ZhGndEn" resolve="repository" />
              </node>
            </node>
            <node concept="gn1nE" id="6YzOfzDI77C" role="gn1nH">
              <property role="gn1nW" value="defaultSize" />
              <node concept="ghjhU" id="6YzOfzDI7ap" role="gn1nU">
                <node concept="Xl_RD" id="6YzOfzDI7AH" role="ghjhc">
                  <property role="Xl_RC" value="25%" />
                </node>
              </node>
            </node>
          </node>
          <node concept="gmrTC" id="6YzOfzDI4Jr" role="gn1nJ">
            <property role="gmPZ6" value="splitpane.Pane" />
            <node concept="2rDjb8" id="6YzOfzDI7C0" role="gn1nJ">
              <ref role="2rDjb1" node="3uZ5ZhGndEs" />
              <node concept="2rHscw" id="6YzOfzDI7C1" role="2rDjb3">
                <ref role="2rHscx" node="3uZ5ZhGndEp" resolve="rootNode" />
              </node>
            </node>
          </node>
          <node concept="gn1nE" id="6YzOfzDHZWb" role="gn1nH">
            <property role="gn1nW" value="direction" />
            <node concept="ghjhU" id="6YzOfzDI2mk" role="gn1nU">
              <node concept="Xl_RD" id="6YzOfzDI2mj" role="ghjhc">
                <property role="Xl_RC" value="horizontal" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2rzwrA" id="3uZ5ZhGndEn" role="2rHO5H">
        <property role="TrG5h" value="repository" />
        <node concept="3Tqbb2" id="3uZ5ZhGndEo" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskm" resolve="Repository" />
        </node>
      </node>
      <node concept="2rzwrA" id="3uZ5ZhGndEp" role="2rHO5H">
        <property role="TrG5h" value="rootNode" />
        <node concept="3Tqbb2" id="3uZ5ZhGnik$" role="2rzwqu" />
      </node>
    </node>
    <node concept="3ywjYg" id="3uZ5ZhGnrjQ" role="gmrQt" />
    <node concept="2rzwrF" id="3uZ5ZhGtGCo" role="gmrQt">
      <property role="TrG5h" value="textEditorOnPaper" />
      <node concept="2rzwrA" id="3uZ5ZhGtHBX" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="3uZ5ZhGtHC3" role="2rzwqu" />
      </node>
      <node concept="gmrTC" id="3uZ5ZhGndEb" role="2rHO5I">
        <property role="gmPZ6" value="mui.Paper" />
        <node concept="gmrTC" id="3uZ5ZhGtHQt" role="gn1nJ">
          <property role="gmPZ6" value="modelix.TextEditor" />
          <node concept="gn1nE" id="3uZ5ZhGtHQu" role="gn1nH">
            <property role="gn1nW" value="nodeRef" />
            <node concept="ghjhU" id="3uZ5ZhGtHQv" role="gn1nU">
              <node concept="3cpWs3" id="3uZ5ZhGtHQw" role="ghjhc">
                <node concept="Xl_RD" id="3uZ5ZhGtHQx" role="3uHU7B">
                  <property role="Xl_RC" value="" />
                </node>
                <node concept="2YIFZM" id="3uZ5ZhGtHQy" role="3uHU7w">
                  <ref role="37wK5l" to="e11:~ReactFacade.serializeRef(org.jetbrains.mps.openapi.model.SNode)" resolve="serializeRef" />
                  <ref role="1Pybhc" to="e11:~ReactFacade" resolve="ReactFacade" />
                  <node concept="2rHscw" id="3uZ5ZhGtHQz" role="37wK5m">
                    <ref role="2rHscx" node="3uZ5ZhGtHBX" resolve="node" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="3uZ5ZhGndEc" role="gn1nH">
          <property role="gn1nW" value="sx" />
          <node concept="gjbvi" id="3uZ5ZhGndEd" role="gn1nU">
            <node concept="gjbwy" id="3uZ5ZhGndEe" role="gjbx_">
              <property role="gjbwO" value="padding" />
              <node concept="ghjhU" id="3uZ5ZhGndEf" role="gjbwM">
                <node concept="3cmrfG" id="3uZ5ZhGndEg" role="ghjhc">
                  <property role="3cmrfH" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="3uZ5ZhGtFCG" role="gmrQt" />
    <node concept="2rzwrF" id="3uZ5ZhGndEs" role="gmrQt">
      <property role="TrG5h" value="mainEditor" />
      <node concept="2rzwrA" id="3uZ5ZhGndEt" role="2rHO5H">
        <property role="TrG5h" value="rootNode" />
        <node concept="3Tqbb2" id="3uZ5ZhGndEu" role="2rzwqu" />
      </node>
      <node concept="1nAWFN" id="4JkQtugcRij" role="2rHO5I">
        <node concept="1nAWFV" id="4JkQtugcSfC" role="1nAWFY">
          <node concept="3eOSWO" id="4JkQtugcXR$" role="1nAWFU">
            <node concept="3cmrfG" id="4JkQtugcXRB" role="3uHU7w">
              <property role="3cmrfH" value="1" />
            </node>
            <node concept="2OqwBi" id="4JkQtugcTmj" role="3uHU7B">
              <node concept="_1Yeq" id="4JkQtugcSfF" role="2Oq$k0">
                <ref role="_1Yer" node="3uZ5ZhGwjLt" />
                <node concept="2rHscw" id="4JkQtugcSfM" role="_1Yep">
                  <ref role="2rHscx" node="3uZ5ZhGndEt" resolve="rootNode" />
                </node>
              </node>
              <node concept="34oBXx" id="4JkQtugcVFx" role="2OqNvi" />
            </node>
          </node>
          <node concept="gmrTC" id="4JkQtugd1kN" role="1nAWF$">
            <property role="gmPZ6" value="mui.Stack" />
            <node concept="gn1nE" id="4JkQtugd1kO" role="gn1nH">
              <property role="gn1nW" value="spacing" />
              <node concept="ghjhU" id="4JkQtugd1kP" role="gn1nU">
                <node concept="3cmrfG" id="4JkQtugd1kQ" role="ghjhc">
                  <property role="3cmrfH" value="0" />
                </node>
              </node>
            </node>
            <node concept="gmrTC" id="4JkQtugd1kR" role="gn1nJ">
              <property role="gmPZ6" value="mui.Tabs" />
              <node concept="gn1nE" id="4JkQtugd1kS" role="gn1nH">
                <property role="gn1nW" value="value" />
                <node concept="ghjhU" id="4JkQtugd1kT" role="gn1nU">
                  <node concept="2o1YOM" id="4JkQtugd1kU" role="ghjhc">
                    <ref role="2o1YOD" node="4JkQtugd1lE" resolve="selectedTab" />
                  </node>
                </node>
              </node>
              <node concept="gn1nE" id="4JkQtugd1kV" role="gn1nH">
                <property role="gn1nW" value="onChange" />
                <node concept="ghf20" id="4JkQtugd1kW" role="gn1nU">
                  <node concept="ghf2g" id="4JkQtugd1kX" role="ghf3w">
                    <property role="TrG5h" value="event" />
                  </node>
                  <node concept="ghf2g" id="4JkQtugd1kY" role="ghf3w">
                    <property role="TrG5h" value="value" />
                  </node>
                  <node concept="24bxNJ" id="4JkQtugd1kZ" role="ghfyX">
                    <node concept="24bxNi" id="4JkQtugd1l0" role="24b$8c">
                      <property role="TrG5h" value="newValue" />
                      <node concept="gh8L1" id="4JkQtugd1l1" role="24b$bb">
                        <property role="gh8Lj" value="value" />
                      </node>
                    </node>
                    <node concept="3clFbS" id="4JkQtugd1l2" role="24b$8e">
                      <node concept="3clFbF" id="4JkQtugd1l3" role="3cqZAp">
                        <node concept="37vLTI" id="4JkQtugd1l4" role="3clFbG">
                          <node concept="2YIFZM" id="4JkQtugd1l5" role="37vLTx">
                            <ref role="37wK5l" to="wyt6:~Integer.parseInt(java.lang.String)" resolve="parseInt" />
                            <ref role="1Pybhc" to="wyt6:~Integer" resolve="Integer" />
                            <node concept="2rIwBd" id="4JkQtugd1l6" role="37wK5m">
                              <ref role="2rIwBe" node="4JkQtugd1l0" resolve="newValue" />
                            </node>
                          </node>
                          <node concept="2o1YOM" id="4JkQtugd1l7" role="37vLTJ">
                            <ref role="2o1YOD" node="4JkQtugd1lE" resolve="selectedTab" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="gn1nE" id="4JkQtugd1l8" role="gn1nH">
                <property role="gn1nW" value="variant" />
                <node concept="ghjhU" id="4JkQtugd1l9" role="gn1nU">
                  <node concept="Xl_RD" id="4JkQtugd1la" role="ghjhc">
                    <property role="Xl_RC" value="scrollable" />
                  </node>
                </node>
              </node>
              <node concept="gn1nE" id="4JkQtugd1lb" role="gn1nH">
                <property role="gn1nW" value="scrollButtons" />
                <node concept="ghjhU" id="4JkQtugd1lc" role="gn1nU">
                  <node concept="Xl_RD" id="4JkQtugd1ld" role="ghjhc">
                    <property role="Xl_RC" value="auto" />
                  </node>
                </node>
              </node>
              <node concept="rrkbs" id="4JkQtugd1le" role="gn1nJ">
                <property role="TrG5h" value="aspect" />
                <node concept="_1Yeq" id="4JkQtugd1lf" role="rrkk9">
                  <ref role="_1Yer" node="3uZ5ZhGwjLt" />
                  <node concept="2rHscw" id="4JkQtugd1lg" role="_1Yep">
                    <ref role="2rHscx" node="3uZ5ZhGndEt" resolve="rootNode" />
                  </node>
                </node>
                <node concept="gmrTC" id="4JkQtugd1lh" role="rrkkB">
                  <property role="gmPZ6" value="mui.Tab" />
                  <node concept="gn1nE" id="4JkQtugd1li" role="gn1nH">
                    <property role="gn1nW" value="label" />
                    <node concept="ghjhU" id="4JkQtugd1lj" role="gn1nU">
                      <node concept="2YIFZM" id="4JkQtugd1lk" role="ghjhc">
                        <ref role="37wK5l" to="18ew:~NameUtil.shortNameFromLongName(java.lang.String)" resolve="shortNameFromLongName" />
                        <ref role="1Pybhc" to="18ew:~NameUtil" resolve="NameUtil" />
                        <node concept="2OqwBi" id="4JkQtugd1ll" role="37wK5m">
                          <node concept="1PxgMI" id="4JkQtugd1lm" role="2Oq$k0">
                            <property role="1BlNFB" value="true" />
                            <node concept="chp4Y" id="4JkQtugd1ln" role="3oSUPX">
                              <ref role="cht4Q" to="jh6v:qmkA5fOskc" resolve="Model" />
                            </node>
                            <node concept="2OqwBi" id="4JkQtugd1lo" role="1m5AlR">
                              <node concept="rqPyE" id="4JkQtugd1lp" role="2Oq$k0">
                                <ref role="rqPyD" node="4JkQtugd1le" resolve="aspect" />
                              </node>
                              <node concept="1mfA1w" id="4JkQtugd1lq" role="2OqNvi" />
                            </node>
                          </node>
                          <node concept="3TrcHB" id="4JkQtugd1lr" role="2OqNvi">
                            <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="gn1nE" id="4JkQtugd1ls" role="gn1nH">
                    <property role="gn1nW" value="icon" />
                    <node concept="rtYR_" id="4JkQtugd1lt" role="gn1nU">
                      <node concept="2rDjb8" id="4JkQtugd1lu" role="rtYRl">
                        <ref role="2rDjb1" node="2Kjf8ILc43G" resolve="icon" />
                        <node concept="rqPyE" id="4JkQtugd1lv" role="2rDjb3">
                          <ref role="rqPyD" node="4JkQtugd1le" resolve="aspect" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="gn1nE" id="4JkQtugd1lw" role="gn1nH">
                    <property role="gn1nW" value="iconPosition" />
                    <node concept="ghjhU" id="4JkQtugd1lx" role="gn1nU">
                      <node concept="Xl_RD" id="4JkQtugd1ly" role="ghjhc">
                        <property role="Xl_RC" value="start" />
                      </node>
                    </node>
                  </node>
                  <node concept="2rDjb8" id="4JkQtugd1lz" role="gn1nJ">
                    <ref role="2rDjb1" node="3uZ5ZhGtGCo" resolve="textEditorOnPaper" />
                    <node concept="rqPyE" id="4JkQtugd1l$" role="2rDjb3">
                      <ref role="rqPyD" node="4JkQtugd1le" resolve="aspect" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="2rDjb8" id="4JkQtugd1l_" role="gn1nJ">
              <ref role="2rDjb1" node="3uZ5ZhGtGCo" resolve="textEditorOnPaper" />
              <node concept="1y4W85" id="4JkQtugd1lA" role="2rDjb3">
                <node concept="2o1YOM" id="4JkQtugd1lB" role="1y58nS">
                  <ref role="2o1YOD" node="4JkQtugd1lE" resolve="selectedTab" />
                </node>
                <node concept="_1Yeq" id="4JkQtugd1lC" role="1y566C">
                  <ref role="_1Yer" node="3uZ5ZhGwjLt" />
                  <node concept="2rHscw" id="4JkQtugd1lD" role="_1Yep">
                    <ref role="2rHscx" node="3uZ5ZhGndEt" resolve="rootNode" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="2o1qlL" id="4JkQtugd1lE" role="2o1qk1">
              <property role="TrG5h" value="selectedTab" />
              <node concept="10Oyi0" id="4JkQtugd1lF" role="2o1qlE" />
              <node concept="2OqwBi" id="6YzOfzDGiYb" role="2o1p2P">
                <node concept="_1Yeq" id="6YzOfzDGfk1" role="2Oq$k0">
                  <ref role="_1Yer" node="3uZ5ZhGwjLt" />
                  <node concept="2rHscw" id="6YzOfzDGgIC" role="_1Yep">
                    <ref role="2rHscx" node="3uZ5ZhGndEt" resolve="rootNode" />
                  </node>
                </node>
                <node concept="2WmjW8" id="6YzOfzDGkvP" role="2OqNvi">
                  <node concept="2rHscw" id="6YzOfzDGlDu" role="25WWJ7">
                    <ref role="2rHscx" node="3uZ5ZhGndEt" resolve="rootNode" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2rDjb8" id="3uZ5ZhGtJlH" role="1nAWFW">
          <ref role="2rDjb1" node="3uZ5ZhGtGCo" resolve="textEditorOnPaper" />
          <node concept="2rHscw" id="3uZ5ZhGtJMU" role="2rDjb3">
            <ref role="2rHscx" node="3uZ5ZhGndEt" resolve="rootNode" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="6YzOfzDJ5Sd" role="gmrQt" />
    <node concept="2rzwqo" id="6YzOfzDJ7oN" role="gmrQt">
      <ref role="2rzwqp" node="3uZ5ZhGndEs" resolve="mainEditor" />
      <node concept="2rzwrA" id="6YzOfzDJamQ" role="2rHO5H">
        <property role="TrG5h" value="rootNode" />
        <node concept="1vX6Bi" id="6YzOfzDJcjp" role="2rzwqu" />
      </node>
      <node concept="gmrTC" id="6YzOfzDJcjt" role="2rHO5I">
        <property role="gmPZ6" value="html.div" />
        <node concept="ggXia" id="6YzOfzDJcjw" role="gn1nJ">
          <node concept="Xl_RD" id="6YzOfzDJcj$" role="ggXio">
            <property role="Xl_RC" value="Choose a root node" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="3uZ5ZhGnuhp" role="gmrQt" />
    <node concept="_1YeK" id="3uZ5ZhGwjLt" role="gmrQt">
      <property role="TrG5h" value="getNodesForTabs" />
      <node concept="_1YeU" id="3uZ5ZhGwkLo" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="3uZ5ZhGwkLw" role="_6ltW" />
      </node>
      <node concept="_YKpA" id="3uZ5ZhGwkLA" role="_5OfE">
        <node concept="3Tqbb2" id="3uZ5ZhGwkLC" role="_ZDj9" />
      </node>
      <node concept="3clFbS" id="3uZ5ZhGwjLx" role="_1YeD">
        <node concept="3cpWs6" id="4JkQtugag2k" role="3cqZAp">
          <node concept="2ShNRf" id="4JkQtugai28" role="3cqZAk">
            <node concept="Tc6Ow" id="4JkQtugalU_" role="2ShVmc">
              <node concept="3Tqbb2" id="4JkQtugalV6" role="HW$YZ" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="4JkQtugcpaa" role="gmrQt" />
    <node concept="_1YeL" id="4JkQtugcqHj" role="gmrQt">
      <ref role="_1Yeu" node="3uZ5ZhGwjLt" resolve="getNodesForTabs" />
      <node concept="3clFbS" id="4JkQtugcqHl" role="_1YeD">
        <node concept="3cpWs8" id="4JkQtugcvxA" role="3cqZAp">
          <node concept="3cpWsn" id="4JkQtugcvxB" role="3cpWs9">
            <property role="TrG5h" value="concept" />
            <node concept="3Tqbb2" id="4JkQtugcvsZ" role="1tU5fm">
              <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
            </node>
            <node concept="2OqwBi" id="4JkQtugcvxC" role="33vP2m">
              <node concept="_1YeC" id="4JkQtugcvxD" role="2Oq$k0">
                <ref role="_VD$M" node="4JkQtugcs0j" resolve="node" />
              </node>
              <node concept="2qgKlT" id="4JkQtugcvxE" role="2OqNvi">
                <ref role="37wK5l" to="tpcn:2hxg_BDjKM8" resolve="getBaseConcept" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4JkQtugcvEW" role="3cqZAp">
          <node concept="3clFbS" id="4JkQtugcvEY" role="3clFbx">
            <node concept="3cpWs6" id="4JkQtugcwrm" role="3cqZAp">
              <node concept="2ShNRf" id="6YzOfzDF3YT" role="3cqZAk">
                <node concept="Tc6Ow" id="6YzOfzDF7Gg" role="2ShVmc">
                  <node concept="_1YeC" id="6YzOfzDFbzi" role="HW$Y0">
                    <ref role="_VD$M" node="4JkQtugcs0j" resolve="node" />
                  </node>
                  <node concept="3Tqbb2" id="6YzOfzDFb$Z" role="HW$YZ" />
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="4JkQtugcvXx" role="3clFbw">
            <node concept="37vLTw" id="4JkQtugcvJ9" role="2Oq$k0">
              <ref role="3cqZAo" node="4JkQtugcvxB" resolve="concept" />
            </node>
            <node concept="3w_OXm" id="4JkQtugcwnz" role="2OqNvi" />
          </node>
        </node>
        <node concept="3cpWs6" id="4JkQtugcKMR" role="3cqZAp">
          <node concept="2OqwBi" id="4JkQtugcGGP" role="3cqZAk">
            <node concept="2OqwBi" id="4JkQtugcEs_" role="2Oq$k0">
              <node concept="2OqwBi" id="4JkQtugcAcI" role="2Oq$k0">
                <node concept="_1Yeq" id="4JkQtugc$VT" role="2Oq$k0">
                  <ref role="_1Yer" node="3uZ5ZhGwjLt" resolve="getNodesForTabs" />
                  <node concept="37vLTw" id="4JkQtugc$VU" role="_1Yep">
                    <ref role="3cqZAo" node="4JkQtugcvxB" resolve="concept" />
                  </node>
                </node>
                <node concept="3QWeyG" id="4JkQtugcBCG" role="2OqNvi">
                  <node concept="2ShNRf" id="4JkQtugcJGV" role="576Qk">
                    <node concept="2HTt$P" id="4JkQtugcK1n" role="2ShVmc">
                      <node concept="_1YeC" id="4JkQtugcKdL" role="2HTEbv">
                        <ref role="_VD$M" node="4JkQtugcs0j" resolve="node" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="1VAtEI" id="4JkQtugcFyn" role="2OqNvi" />
            </node>
            <node concept="ANE8D" id="4JkQtugcHsc" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="4JkQtugcs0j" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="4JkQtugcs0k" role="_6ltW">
          <ref role="ehGHo" to="tpce:2hxg_BDjKM4" resolve="IConceptAspect" />
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="4JkQtug9Ihl" role="gmrQt" />
    <node concept="_1YeL" id="4JkQtug9KkY" role="gmrQt">
      <ref role="_1Yeu" node="3uZ5ZhGwjLt" resolve="getNodesForTabs" />
      <node concept="3clFbS" id="4JkQtug9Kl0" role="_1YeD">
        <node concept="3cpWs8" id="3uZ5ZhGwkLE" role="3cqZAp">
          <node concept="3cpWsn" id="3uZ5ZhGwkLF" role="3cpWs9">
            <property role="TrG5h" value="seq" />
            <node concept="A3Dl8" id="3uZ5ZhGwkLG" role="1tU5fm">
              <node concept="3Tqbb2" id="3uZ5ZhGwkLH" role="A3Ik2">
                <ref role="ehGHo" to="tpce:2hxg_BDjKM4" resolve="IConceptAspect" />
              </node>
            </node>
            <node concept="2OqwBi" id="3uZ5ZhGwkLI" role="33vP2m">
              <node concept="2OqwBi" id="3uZ5ZhGwkLJ" role="2Oq$k0">
                <node concept="2OqwBi" id="3uZ5ZhGwkLK" role="2Oq$k0">
                  <node concept="2OqwBi" id="3uZ5ZhGwkLL" role="2Oq$k0">
                    <node concept="_1YeC" id="3uZ5ZhGwpqc" role="2Oq$k0">
                      <ref role="_VD$M" node="4JkQtugabS0" resolve="node" />
                    </node>
                    <node concept="2Xjw5R" id="3uZ5ZhGwkLN" role="2OqNvi">
                      <node concept="1xMEDy" id="3uZ5ZhGwkLO" role="1xVPHs">
                        <node concept="chp4Y" id="3uZ5ZhGwkLP" role="ri$Ld">
                          <ref role="cht4Q" to="jh6v:qmkA5fOskf" resolve="Module" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3Tsc0h" id="3uZ5ZhGwkLQ" role="2OqNvi">
                    <ref role="3TtcxE" to="jh6v:qmkA5fOski" />
                  </node>
                </node>
                <node concept="13MTOL" id="3uZ5ZhGwkLR" role="2OqNvi">
                  <ref role="13MTZf" to="jh6v:qmkA5fOskk" />
                </node>
              </node>
              <node concept="v3k3i" id="3uZ5ZhGwkLS" role="2OqNvi">
                <node concept="chp4Y" id="3uZ5ZhGwkLT" role="v3oSu">
                  <ref role="cht4Q" to="tpce:2hxg_BDjKM4" resolve="IConceptAspect" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="3uZ5ZhGwqAC" role="3cqZAp">
          <node concept="3cpWsn" id="3uZ5ZhGwqAD" role="3cpWs9">
            <property role="TrG5h" value="aspects" />
            <node concept="A3Dl8" id="3uZ5ZhGwqyf" role="1tU5fm">
              <node concept="3Tqbb2" id="3uZ5ZhGwqyi" role="A3Ik2">
                <ref role="ehGHo" to="tpce:2hxg_BDjKM4" resolve="IConceptAspect" />
              </node>
            </node>
            <node concept="2OqwBi" id="3uZ5ZhGwqAE" role="33vP2m">
              <node concept="37vLTw" id="3uZ5ZhGwqAF" role="2Oq$k0">
                <ref role="3cqZAo" node="3uZ5ZhGwkLF" resolve="seq" />
              </node>
              <node concept="3zZkjj" id="3uZ5ZhGwqAG" role="2OqNvi">
                <node concept="1bVj0M" id="3uZ5ZhGwqAH" role="23t8la">
                  <node concept="3clFbS" id="3uZ5ZhGwqAI" role="1bW5cS">
                    <node concept="3clFbF" id="3uZ5ZhGwqAJ" role="3cqZAp">
                      <node concept="17R0WA" id="4JkQtugcLLh" role="3clFbG">
                        <node concept="2OqwBi" id="3uZ5ZhGwqAL" role="3uHU7B">
                          <node concept="37vLTw" id="3uZ5ZhGwqAM" role="2Oq$k0">
                            <ref role="3cqZAo" node="3uZ5ZhGwqAQ" resolve="it" />
                          </node>
                          <node concept="2qgKlT" id="4JkQtugcLmp" role="2OqNvi">
                            <ref role="37wK5l" to="tpcn:2hxg_BDjKM8" resolve="getBaseConcept" />
                          </node>
                        </node>
                        <node concept="_1YeC" id="4JkQtugcM6D" role="3uHU7w">
                          <ref role="_VD$M" node="4JkQtugabS0" resolve="node" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="gl6BB" id="3uZ5ZhGwqAQ" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="3uZ5ZhGwqAR" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3uZ5ZhGwtiU" role="3cqZAp">
          <node concept="2OqwBi" id="3uZ5ZhGwxnN" role="3clFbG">
            <node concept="2OqwBi" id="3uZ5ZhGwujy" role="2Oq$k0">
              <node concept="2ShNRf" id="3uZ5ZhGwtiQ" role="2Oq$k0">
                <node concept="2HTt$P" id="3uZ5ZhGwtOP" role="2ShVmc">
                  <node concept="_1YeC" id="3uZ5ZhGwtQ3" role="2HTEbv">
                    <ref role="_VD$M" node="4JkQtugabS0" resolve="node" />
                  </node>
                  <node concept="3Tqbb2" id="3uZ5ZhGwtP$" role="2HTBi0" />
                </node>
              </node>
              <node concept="3QWeyG" id="3uZ5ZhGwvWn" role="2OqNvi">
                <node concept="37vLTw" id="3uZ5ZhGwvW_" role="576Qk">
                  <ref role="3cqZAo" node="3uZ5ZhGwqAD" resolve="aspects" />
                </node>
              </node>
            </node>
            <node concept="ANE8D" id="3uZ5ZhGwyRo" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="4JkQtugabS0" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="4JkQtugabS1" role="_6ltW">
          <ref role="ehGHo" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="3uZ5ZhGndEA" role="gmrQt" />
  </node>
  <node concept="gl9ry" id="7nrA7MorVtf">
    <property role="TrG5h" value="lib.projectview" />
    <node concept="2rzwrF" id="7nrA7MorVtg" role="gmrQt">
      <property role="TrG5h" value="projectView" />
      <node concept="2rzwrA" id="7nrA7MorVwI" role="2rHO5H">
        <property role="TrG5h" value="repository" />
        <node concept="3Tqbb2" id="7nrA7Mosjpv" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskm" resolve="Repository" />
        </node>
      </node>
      <node concept="gmrTC" id="7nrA7Mosjp_" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.SimpleTreeView" />
        <node concept="2o1qlL" id="6JXnTOwwIuz" role="2o1qk1">
          <property role="TrG5h" value="expandedItems" />
          <node concept="2hMVRd" id="6JXnTOwwIuG" role="2o1qlE">
            <node concept="17QB3L" id="6JXnTOwwIuN" role="2hN53Y" />
          </node>
          <node concept="2ShNRf" id="6JXnTOwwIuU" role="2o1p2P">
            <node concept="2i4dXS" id="6JXnTOwwIKP" role="2ShVmc" />
          </node>
        </node>
        <node concept="gn1nE" id="1NezOVo2I$U" role="gn1nH">
          <property role="gn1nW" value="expandedItems" />
          <node concept="34KBPB" id="1NezOVo4r1v" role="gn1nU">
            <node concept="3clFbS" id="1NezOVo4r1x" role="34KBRE">
              <node concept="2Gpval" id="1NezOVo4r2t" role="3cqZAp">
                <node concept="2GrKxI" id="1NezOVo4r2u" role="2Gsz3X">
                  <property role="TrG5h" value="expandedItem" />
                </node>
                <node concept="3clFbS" id="1NezOVo4r2w" role="2LFqv$">
                  <node concept="3clFbF" id="1NezOVo4riW" role="3cqZAp">
                    <node concept="34KBLA" id="1NezOVo4riU" role="3clFbG">
                      <node concept="2GrUjf" id="6JXnTOwwPnO" role="34KBHy">
                        <ref role="2Gs0qQ" node="1NezOVo4r2u" resolve="expandedItem" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="2o1YOM" id="6JXnTOwwMkr" role="2GsD0m">
                  <ref role="2o1YOD" node="6JXnTOwwIuz" resolve="expandedItems" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="6JXnTOwwTXI" role="gn1nH">
          <property role="gn1nW" value="onItemExpansionToggle" />
          <node concept="ghf20" id="6JXnTOwwU0u" role="gn1nU">
            <node concept="ghf2g" id="6JXnTOwwVBj" role="ghf3w">
              <property role="TrG5h" value="event" />
            </node>
            <node concept="ghf2g" id="6JXnTOwwVCe" role="ghf3w">
              <property role="TrG5h" value="itemId" />
            </node>
            <node concept="ghf2g" id="6JXnTOwwXdi" role="ghf3w">
              <property role="TrG5h" value="isExpanded" />
            </node>
            <node concept="24bxNJ" id="6JXnTOwwU1r" role="ghfyX">
              <node concept="24bxNi" id="6JXnTOwwVBb" role="24b$8c">
                <property role="TrG5h" value="itemId" />
                <node concept="gh8L1" id="6JXnTOwwVBc" role="24b$bb">
                  <property role="gh8Lj" value="itemId" />
                </node>
              </node>
              <node concept="24bxNi" id="6JXnTOwyUQi" role="24b$8c">
                <property role="TrG5h" value="isExpanded" />
                <node concept="gh8L1" id="6JXnTOwyUQj" role="24b$bb">
                  <property role="gh8Lj" value="isExpanded" />
                </node>
              </node>
              <node concept="3clFbS" id="6JXnTOwwU1t" role="24b$8e">
                <node concept="3clFbJ" id="6JXnTOwyUQt" role="3cqZAp">
                  <node concept="17R0WA" id="6JXnTOwyVQm" role="3clFbw">
                    <node concept="Xl_RD" id="5IrYb0m7FLy" role="3uHU7w">
                      <property role="Xl_RC" value="true" />
                    </node>
                    <node concept="2rIwBd" id="6JXnTOwyUQA" role="3uHU7B">
                      <ref role="2rIwBe" node="6JXnTOwyUQi" resolve="isExpanded" />
                    </node>
                  </node>
                  <node concept="3clFbS" id="6JXnTOwyUQv" role="3clFbx">
                    <node concept="3clFbF" id="6JXnTOwyVR7" role="3cqZAp">
                      <node concept="37vLTI" id="2rFw46IDiPM" role="3clFbG">
                        <node concept="2o1YOM" id="6JXnTOwyVR9" role="37vLTJ">
                          <ref role="2o1YOD" node="6JXnTOwwIuz" resolve="expandedItems" />
                        </node>
                        <node concept="2ShNRf" id="2rFw46IDV2u" role="37vLTx">
                          <node concept="2i4dXS" id="2rFw46IDUYY" role="2ShVmc">
                            <node concept="17QB3L" id="2rFw46IDUYZ" role="HW$YZ" />
                            <node concept="2OqwBi" id="2rFw46IDMLN" role="I$8f6">
                              <node concept="2o1YOM" id="2rFw46IDL2n" role="2Oq$k0">
                                <ref role="2o1YOD" node="6JXnTOwwIuz" resolve="expandedItems" />
                              </node>
                              <node concept="3QWeyG" id="2rFw46IDODz" role="2OqNvi">
                                <node concept="2ShNRf" id="2rFw46IDPhf" role="576Qk">
                                  <node concept="2HTt$P" id="2rFw46IDQCf" role="2ShVmc">
                                    <node concept="2rIwBd" id="2rFw46IDRo5" role="2HTEbv">
                                      <ref role="2rIwBe" node="6JXnTOwwVBb" resolve="itemId" />
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
                  <node concept="9aQIb" id="6JXnTOwyZnx" role="9aQIa">
                    <node concept="3clFbS" id="6JXnTOwyZny" role="9aQI4">
                      <node concept="3clFbF" id="6JXnTOwyZos" role="3cqZAp">
                        <node concept="37vLTI" id="2rFw46IE1Gx" role="3clFbG">
                          <node concept="2o1YOM" id="6JXnTOwyZou" role="37vLTJ">
                            <ref role="2o1YOD" node="6JXnTOwwIuz" resolve="expandedItems" />
                          </node>
                          <node concept="2ShNRf" id="2rFw46IE2BP" role="37vLTx">
                            <node concept="2i4dXS" id="2rFw46IE2BQ" role="2ShVmc">
                              <node concept="17QB3L" id="2rFw46IE2BR" role="HW$YZ" />
                              <node concept="2OqwBi" id="2rFw46IE2BS" role="I$8f6">
                                <node concept="2o1YOM" id="2rFw46IE2BT" role="2Oq$k0">
                                  <ref role="2o1YOD" node="6JXnTOwwIuz" resolve="expandedItems" />
                                </node>
                                <node concept="66VNe" id="2rFw46IE8UD" role="2OqNvi">
                                  <node concept="2ShNRf" id="2rFw46IE2BV" role="576Qk">
                                    <node concept="2HTt$P" id="2rFw46IE2BW" role="2ShVmc">
                                      <node concept="2rIwBd" id="2rFw46IE2BX" role="2HTEbv">
                                        <ref role="2rIwBe" node="6JXnTOwwVBb" resolve="itemId" />
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
            </node>
          </node>
        </node>
        <node concept="rrkbs" id="7nrA7Mosmf_" role="gn1nJ">
          <property role="TrG5h" value="project" />
          <node concept="2rDjb8" id="7nrA7MosmEQ" role="rrkkB">
            <ref role="2rDjb1" node="7nrA7MosnvR" resolve="treeItem" />
            <node concept="rqPyE" id="46tLIHjIo_R" role="2rDjb3">
              <ref role="rqPyD" node="7nrA7Mosmf_" resolve="project" />
            </node>
            <node concept="2o1YOM" id="6JXnTOwwKve" role="2rDjb3">
              <ref role="2o1YOD" node="6JXnTOwwIuz" resolve="expandedItems" />
            </node>
          </node>
          <node concept="2OqwBi" id="7nrA7Mosmqf" role="rrkk9">
            <node concept="2rHscw" id="7nrA7MosmfI" role="2Oq$k0">
              <ref role="2rHscx" node="7nrA7MorVwI" resolve="repository" />
            </node>
            <node concept="3Tsc0h" id="7nrA7MosmyX" role="2OqNvi">
              <ref role="3TtcxE" to="jh6v:68axlwQ7jSc" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="7nrA7MosjpD" role="gmrQt" />
    <node concept="2rzwrF" id="7nrA7MosnvR" role="gmrQt">
      <property role="TrG5h" value="treeItem" />
      <node concept="2rzwrA" id="7nrA7MosnvU" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="7KGHflxYC3k" role="2rzwqu">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="2rzwrA" id="6JXnTOwwyAx" role="2rHO5H">
        <property role="TrG5h" value="expandedItems" />
        <node concept="2hMVRd" id="6JXnTOww$vL" role="2rzwqu">
          <node concept="17QB3L" id="6JXnTOww_8d" role="2hN53Y" />
        </node>
      </node>
      <node concept="gmrTC" id="7nrA7Mosnw4" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.TreeItem2" />
        <node concept="gn1nE" id="7nrA7Mosnw6" role="gn1nH">
          <property role="gn1nW" value="itemId" />
          <node concept="ghjhU" id="7nrA7MosnzO" role="gn1nU">
            <node concept="_1Yeq" id="7KGHfly050g" role="ghjhc">
              <ref role="_1Yer" node="7KGHflxZ_HE" resolve="treeItemId" />
              <node concept="2rHscw" id="7KGHfly050h" role="_1Yep">
                <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="7nrA7MosqTr" role="gn1nH">
          <property role="gn1nW" value="label" />
          <node concept="rtYR_" id="4TpzghMgIBm" role="gn1nU">
            <node concept="gmrTC" id="4TpzghMgIBn" role="rtYRl">
              <property role="gmPZ6" value="mui.Stack" />
              <node concept="gn1nE" id="4TpzghMgIBo" role="gn1nH">
                <property role="gn1nW" value="direction" />
                <node concept="ghjhU" id="4TpzghMgIBp" role="gn1nU">
                  <node concept="Xl_RD" id="4TpzghMgIBq" role="ghjhc">
                    <property role="Xl_RC" value="row" />
                  </node>
                </node>
              </node>
              <node concept="gn1nE" id="4TpzghMgIBr" role="gn1nH">
                <property role="gn1nW" value="spacing" />
                <node concept="ghjhU" id="4TpzghMgIBs" role="gn1nU">
                  <node concept="3b6qkQ" id="4TpzghMgIBt" role="ghjhc">
                    <property role="$nhwW" value="0.5" />
                  </node>
                </node>
              </node>
              <node concept="gn1nE" id="2Kjf8ILjSp5" role="gn1nH">
                <property role="gn1nW" value="sx" />
                <node concept="gjbvi" id="2Kjf8ILjSqV" role="gn1nU">
                  <node concept="gjbwy" id="2Kjf8ILjSG2" role="gjbx_">
                    <property role="gjbwO" value="alignItems" />
                    <node concept="ghjhU" id="2Kjf8ILjSUm" role="gjbwM">
                      <node concept="Xl_RD" id="2Kjf8ILjSUl" role="ghjhc">
                        <property role="Xl_RC" value="center" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2rDjb8" id="2Kjf8ILdoO_" role="gn1nJ">
                <ref role="2rDjb1" node="2Kjf8ILc43G" resolve="icon" />
                <node concept="2rHscw" id="2Kjf8ILdpf2" role="2rDjb3">
                  <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                </node>
              </node>
              <node concept="2rDjb8" id="2Kjf8ILdPYN" role="gn1nJ">
                <ref role="2rDjb1" node="2Kjf8ILdMXC" resolve="labelComponent" />
                <node concept="2rHscw" id="2Kjf8ILdQDt" role="2rDjb3">
                  <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="274_3y" id="6JXnTOwwCyc" role="gn1nJ">
          <node concept="2OqwBi" id="6JXnTOwwDU$" role="274_3w">
            <node concept="2rHscw" id="6JXnTOwwD5I" role="2Oq$k0">
              <ref role="2rHscx" node="6JXnTOwwyAx" resolve="expandedItems" />
            </node>
            <node concept="3JPx81" id="6JXnTOwwF1W" role="2OqNvi">
              <node concept="_1Yeq" id="7KGHfly03ZD" role="25WWJ7">
                <ref role="_1Yer" node="7KGHflxZ_HE" resolve="treeItemId" />
                <node concept="2rHscw" id="7KGHfly04zx" role="_1Yep">
                  <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                </node>
              </node>
            </node>
          </node>
          <node concept="rrkbs" id="4TpzghMg8o1" role="274_3x">
            <property role="TrG5h" value="child" />
            <node concept="2rDjb8" id="4TpzghMgbfI" role="rrkkB">
              <ref role="2rDjb1" node="7nrA7MosnvR" resolve="treeItem" />
              <node concept="rqPyE" id="4TpzghMgdcl" role="2rDjb3">
                <ref role="rqPyD" node="4TpzghMg8o1" resolve="child" />
              </node>
              <node concept="2rHscw" id="6JXnTOwwSiA" role="2rDjb3">
                <ref role="2rHscx" node="6JXnTOwwyAx" resolve="expandedItems" />
              </node>
            </node>
            <node concept="_1Yeq" id="4TpzghMgbev" role="rrkk9">
              <ref role="_1Yer" node="4TpzghMfHq0" resolve="treeChildren" />
              <node concept="2rHscw" id="4TpzghMgbfe" role="_1Yep">
                <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
              </node>
            </node>
          </node>
        </node>
        <node concept="274_3y" id="3uZ5ZhGl1hN" role="gn1nJ">
          <node concept="gmrTC" id="3uZ5ZhGlzVi" role="274_3x">
            <property role="gmPZ6" value="html.div" />
          </node>
          <node concept="1Wc70l" id="3uZ5ZhGltHn" role="274_3w">
            <node concept="3fqX7Q" id="3uZ5ZhGls_9" role="3uHU7B">
              <node concept="2OqwBi" id="3uZ5ZhGls_b" role="3fr31v">
                <node concept="2rHscw" id="3uZ5ZhGls_c" role="2Oq$k0">
                  <ref role="2rHscx" node="6JXnTOwwyAx" resolve="expandedItems" />
                </node>
                <node concept="3JPx81" id="3uZ5ZhGls_d" role="2OqNvi">
                  <node concept="_1Yeq" id="3uZ5ZhGls_e" role="25WWJ7">
                    <ref role="_1Yer" node="7KGHflxZ_HE" resolve="treeItemId" />
                    <node concept="2rHscw" id="3uZ5ZhGls_f" role="_1Yep">
                      <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="3uZ5ZhGly84" role="3uHU7w">
              <node concept="_1Yeq" id="3uZ5ZhGlwM4" role="2Oq$k0">
                <ref role="_1Yer" node="4TpzghMfHq0" resolve="treeChildren" />
                <node concept="2rHscw" id="3uZ5ZhGlwM5" role="_1Yep">
                  <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                </node>
              </node>
              <node concept="3GX2aA" id="3uZ5ZhGlzCX" role="2OqNvi" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwqo" id="7KGHfly0$4W" role="gmrQt">
      <ref role="2rzwqp" node="7nrA7MosnvR" resolve="treeItem" />
      <node concept="2rzwrA" id="7KGHfly0_oj" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="7KGHfly0Aks" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:3DfUugBU39$" resolve="ProjectModule" />
        </node>
      </node>
      <node concept="2rzwrA" id="7KGHfly0AkC" role="2rHO5H">
        <property role="TrG5h" value="expandedItems" />
        <node concept="2hMVRd" id="7KGHfly0AkD" role="2rzwqu">
          <node concept="17QB3L" id="7KGHfly0AkE" role="2hN53Y" />
        </node>
      </node>
      <node concept="2rDjb8" id="7KGHfly0AkK" role="2rHO5I">
        <ref role="2rDjb1" node="7nrA7MosnvR" resolve="treeItem" />
        <node concept="2OqwBi" id="7KGHfly0AtI" role="2rDjb3">
          <node concept="2rHscw" id="7KGHfly0AkM" role="2Oq$k0">
            <ref role="2rHscx" node="7KGHfly0_oj" resolve="node" />
          </node>
          <node concept="3TrEf2" id="7KGHfly0ACW" role="2OqNvi">
            <ref role="3Tt5mk" to="jh6v:5100827PtfH" />
          </node>
        </node>
        <node concept="2rHscw" id="7KGHfly0AGW" role="2rDjb3">
          <ref role="2rHscx" node="7KGHfly0AkC" resolve="expandedItems" />
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="2Kjf8ILc3zz" role="gmrQt" />
    <node concept="2rzwrF" id="2Kjf8ILc43G" role="gmrQt">
      <property role="TrG5h" value="icon" />
      <node concept="2rzwrA" id="2Kjf8ILc5hh" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="7KGHflxYD8T" role="2rzwqu">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="gmrTC" id="2Kjf8ILc6Te" role="2rHO5I">
        <property role="gmPZ6" value="mui.SvgIcon" />
        <node concept="gn1nE" id="2Kjf8ILjw$2" role="gn1nH">
          <property role="gn1nW" value="fontSize" />
          <node concept="ghjhU" id="2Kjf8ILjw_T" role="gn1nU">
            <node concept="Xl_RD" id="2Kjf8ILjw_S" role="ghjhc">
              <property role="Xl_RC" value="small" />
            </node>
          </node>
        </node>
        <node concept="gmrTC" id="2Kjf8ILilY9" role="gn1nJ">
          <property role="gmPZ6" value="svg.image" />
          <node concept="gn1nE" id="2Kjf8ILc6Tg" role="gn1nH">
            <property role="gn1nW" value="href" />
            <node concept="ghjhU" id="2Kjf8ILc8yj" role="gn1nU">
              <node concept="3cpWs3" id="2Kjf8ILjjxD" role="ghjhc">
                <node concept="Xl_RD" id="2Kjf8ILjk9K" role="3uHU7B">
                  <property role="Xl_RC" value="icons/" />
                </node>
                <node concept="_1Yeq" id="2Kjf8ILiSZu" role="3uHU7w">
                  <ref role="_1Yer" node="2Kjf8ILiKW8" resolve="iconPath" />
                  <node concept="2rHscw" id="2Kjf8ILiT05" role="_1Yep">
                    <ref role="2rHscx" node="2Kjf8ILc5hh" resolve="node" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="gn1nE" id="2Kjf8ILhvp8" role="gn1nH">
            <property role="gn1nW" value="width" />
            <node concept="ghjhU" id="2Kjf8ILhvrT" role="gn1nU">
              <node concept="3cmrfG" id="2Kjf8ILhvrS" role="ghjhc">
                <property role="3cmrfH" value="24" />
              </node>
            </node>
          </node>
          <node concept="gn1nE" id="2Kjf8ILhwkt" role="gn1nH">
            <property role="gn1nW" value="height" />
            <node concept="ghjhU" id="2Kjf8ILhwmk" role="gn1nU">
              <node concept="3cmrfG" id="2Kjf8ILhwmj" role="ghjhc">
                <property role="3cmrfH" value="24" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="2Kjf8ILiJoJ" role="gmrQt" />
    <node concept="_1YeK" id="2Kjf8ILiKW8" role="gmrQt">
      <property role="TrG5h" value="iconPath" />
      <node concept="_1YeU" id="2Kjf8ILiMbL" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="1RtoFYlhaWl" role="_6ltW">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="17QB3L" id="2Kjf8ILiMbV" role="_5OfE" />
      <node concept="3clFbS" id="2Kjf8ILiKWc" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILiMbX" role="3cqZAp">
          <node concept="Xl_RD" id="1RtoFYlhaVN" role="3cqZAk">
            <property role="Xl_RC" value="MPSIcons.Nodes.Default" />
          </node>
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="1RtoFYloAOS" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="1RtoFYloAOU" role="_1YeD">
        <node concept="3cpWs6" id="1RtoFYloDiy" role="3cqZAp">
          <node concept="Xl_RD" id="1RtoFYloDiC" role="3cqZAk">
            <property role="Xl_RC" value="AllIcons.Nodes.Folder" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="1RtoFYloC5n" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="1RtoFYloC5o" role="_6ltW">
          <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="2Kjf8ILiNfK" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="2Kjf8ILiNfM" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILiPw9" role="3cqZAp">
          <node concept="Xl_RD" id="2Kjf8ILiQPM" role="3cqZAk">
            <property role="Xl_RC" value="AllIcons.Nodes.HomeFolder" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="2Kjf8ILiOvs" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILiOvt" role="_6ltW">
          <ref role="ehGHo" to="jh6v:3uw$nPCBu_p" resolve="Project" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="2Kjf8ILiT0H" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="2Kjf8ILiT0I" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILiT0J" role="3cqZAp">
          <node concept="Xl_RD" id="2Kjf8ILiT0K" role="3cqZAk">
            <property role="Xl_RC" value="MPSIcons.Nodes.Solution" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="2Kjf8ILiT0L" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILiT0M" role="_6ltW">
          <ref role="ehGHo" to="jh6v:6nwO_ZKkI83" resolve="Solution" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="2Kjf8ILiU6C" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="2Kjf8ILiU6D" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILiU6E" role="3cqZAp">
          <node concept="Xl_RD" id="2Kjf8ILiU6F" role="3cqZAk">
            <property role="Xl_RC" value="MPSIcons.Nodes.Language" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="2Kjf8ILiU6G" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILiU6H" role="_6ltW">
          <ref role="ehGHo" to="jh6v:6nwO_ZKkI84" resolve="Language" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="2Kjf8ILiVqd" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="2Kjf8ILiVqe" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILiVqf" role="3cqZAp">
          <node concept="Xl_RD" id="2Kjf8ILiVqg" role="3cqZAk">
            <property role="Xl_RC" value="MPSIcons.Nodes.Generator" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="2Kjf8ILiVqh" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILiVqi" role="_6ltW">
          <ref role="ehGHo" to="jh6v:65B3JdzwOGB" resolve="Generator" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="2Kjf8ILiWvY" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="2Kjf8ILiWvZ" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILiWw0" role="3cqZAp">
          <node concept="Xl_RD" id="2Kjf8ILiWw1" role="3cqZAk">
            <property role="Xl_RC" value="MPSIcons.Nodes.DevKit" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="2Kjf8ILiWw2" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILiWw3" role="_6ltW">
          <ref role="ehGHo" to="jh6v:6nwO_ZKkI85" resolve="DevKit" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="2Kjf8ILk5qm" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="2Kjf8ILk5qn" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILk5qo" role="3cqZAp">
          <node concept="Xl_RD" id="2Kjf8ILk5qp" role="3cqZAk">
            <property role="Xl_RC" value="MPSIcons.Nodes.Model" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="2Kjf8ILk5qq" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILk5qr" role="_6ltW">
          <ref role="ehGHo" to="jh6v:qmkA5fOskc" resolve="Model" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="1RtoFYlh5o2" role="gmrQt">
      <ref role="_1Yeu" node="2Kjf8ILiKW8" resolve="iconPath" />
      <node concept="3clFbS" id="1RtoFYlh5o4" role="_1YeD">
        <node concept="3cpWs6" id="1RtoFYlhawf" role="3cqZAp">
          <node concept="3cpWs3" id="1RtoFYlhawg" role="3cqZAk">
            <node concept="Xl_RD" id="1RtoFYlhawh" role="3uHU7B">
              <property role="Xl_RC" value="concepts/" />
            </node>
            <node concept="2YIFZM" id="1RtoFYlhawi" role="3uHU7w">
              <ref role="37wK5l" to="e11:~ReactFacade.serializeAndEscape(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="serializeAndEscape" />
              <ref role="1Pybhc" to="e11:~ReactFacade" resolve="ReactFacade" />
              <node concept="2OqwBi" id="1RtoFYlhawj" role="37wK5m">
                <node concept="_1YeC" id="1RtoFYlhawk" role="2Oq$k0">
                  <ref role="_VD$M" node="1RtoFYlh6Cs" resolve="node" />
                </node>
                <node concept="2yIwOk" id="1RtoFYlhawl" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="1RtoFYlh6Cs" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="1RtoFYlh6Ct" role="_6ltW" />
      </node>
    </node>
    <node concept="3ywjYg" id="2Kjf8ILiMcf" role="gmrQt" />
    <node concept="2rzwrF" id="2Kjf8ILdMXC" role="gmrQt">
      <property role="TrG5h" value="labelComponent" />
      <node concept="2rzwrA" id="2Kjf8ILdNtN" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="1RtoFYlgUVE" role="2rzwqu">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="gmrTC" id="2Kjf8ILdNtX" role="2rHO5I">
        <property role="gmPZ6" value="html.span" />
        <node concept="ggXia" id="2Kjf8ILdNu6" role="gn1nJ">
          <node concept="_1Yeq" id="2Kjf8ILdNu7" role="ggXio">
            <ref role="_1Yer" node="4TpzghMgqET" resolve="labelText" />
            <node concept="2rHscw" id="2Kjf8ILdNu8" role="_1Yep">
              <ref role="2rHscx" node="2Kjf8ILdNtN" resolve="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwqo" id="2Kjf8ILdTau" role="gmrQt">
      <ref role="2rzwqp" node="2Kjf8ILdMXC" resolve="labelComponent" />
      <node concept="2rzwrA" id="2Kjf8ILdVl0" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILdVl6" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskf" resolve="Module" />
        </node>
      </node>
      <node concept="gmrTC" id="2Kjf8ILgsu2" role="2rHO5I">
        <property role="gmPZ6" value="html.span" />
        <node concept="ggXia" id="2Kjf8ILdVlc" role="gn1nJ">
          <node concept="_1Yeq" id="2Kjf8ILdVlg" role="ggXio">
            <ref role="_1Yer" node="4TpzghMgqET" resolve="labelText" />
            <node concept="2rHscw" id="2Kjf8ILdVlk" role="_1Yep">
              <ref role="2rHscx" node="2Kjf8ILdVl0" resolve="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwqo" id="2Kjf8ILdWV9" role="gmrQt">
      <ref role="2rzwqp" node="2Kjf8ILdMXC" resolve="labelComponent" />
      <node concept="2rzwrA" id="2Kjf8ILdWVa" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILdWVb" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskc" resolve="Model" />
        </node>
      </node>
      <node concept="gmrTC" id="2Kjf8ILgsua" role="2rHO5I">
        <property role="gmPZ6" value="html.span" />
        <node concept="ggXia" id="2Kjf8ILgsub" role="gn1nJ">
          <node concept="_1Yeq" id="2Kjf8ILgsuc" role="ggXio">
            <ref role="_1Yer" node="4TpzghMgqET" resolve="labelText" />
            <node concept="2rHscw" id="2Kjf8ILgsud" role="_1Yep">
              <ref role="2rHscx" node="2Kjf8ILdWVa" resolve="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwqo" id="2Kjf8ILhjhj" role="gmrQt">
      <ref role="2rzwqp" node="2Kjf8ILdMXC" resolve="labelComponent" />
      <node concept="2rzwrA" id="2Kjf8ILhjhk" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="2Kjf8ILhjhl" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:3uw$nPCBu_p" resolve="Project" />
        </node>
      </node>
      <node concept="gmrTC" id="2Kjf8ILhjhm" role="2rHO5I">
        <property role="gmPZ6" value="html.span" />
        <node concept="ggXia" id="2Kjf8ILhjhn" role="gn1nJ">
          <node concept="_1Yeq" id="2Kjf8ILhjho" role="ggXio">
            <ref role="_1Yer" node="4TpzghMgqET" resolve="labelText" />
            <node concept="2rHscw" id="2Kjf8ILhjhp" role="_1Yep">
              <ref role="2rHscx" node="2Kjf8ILhjhk" resolve="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwqo" id="1RtoFYlgN0f" role="gmrQt">
      <ref role="2rzwqp" node="2Kjf8ILdMXC" resolve="labelComponent" />
      <node concept="2rzwrA" id="1RtoFYlgPMB" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="1RtoFYlgQAi" role="2rzwqu" />
      </node>
      <node concept="gmrTC" id="1RtoFYlgPrO" role="2rHO5I">
        <property role="gmPZ6" value="router.NavLink" />
        <node concept="gn1nE" id="1RtoFYlgPrP" role="gn1nH">
          <property role="gn1nW" value="to" />
          <node concept="ghjhU" id="1RtoFYlgPrQ" role="gn1nU">
            <node concept="3cpWs3" id="1RtoFYlgPrR" role="ghjhc">
              <node concept="Xl_RD" id="1RtoFYlgPrS" role="3uHU7w">
                <property role="Xl_RC" value="/" />
              </node>
              <node concept="3cpWs3" id="1RtoFYlgPrT" role="3uHU7B">
                <node concept="2YIFZM" id="1RtoFYlgPrU" role="3uHU7w">
                  <ref role="37wK5l" to="e11:~ReactFacade.serializeAndEscapeRef(org.jetbrains.mps.openapi.model.SNode)" resolve="serializeAndEscapeRef" />
                  <ref role="1Pybhc" to="e11:~ReactFacade" resolve="ReactFacade" />
                  <node concept="2rHscw" id="1RtoFYlgPrV" role="37wK5m">
                    <ref role="2rHscx" node="1RtoFYlgPMB" resolve="node" />
                  </node>
                </node>
                <node concept="Xl_RD" id="1RtoFYlgPrW" role="3uHU7B">
                  <property role="Xl_RC" value="/pages/modelix/lib/ide/" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="ggXia" id="1RtoFYlgPrX" role="gn1nJ">
          <node concept="_1Yeq" id="1RtoFYlgPrY" role="ggXio">
            <ref role="_1Yer" node="4TpzghMgqET" resolve="labelText" />
            <node concept="2rHscw" id="1RtoFYlgPrZ" role="_1Yep">
              <ref role="2rHscx" node="1RtoFYlgPMB" resolve="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="7KGHflxY3Xw" role="gmrQt" />
    <node concept="_1YeK" id="4TpzghMgqET" role="gmrQt">
      <property role="TrG5h" value="labelText" />
      <node concept="_1YeU" id="4TpzghMgsew" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="1RtoFYlgD3D" role="_6ltW">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="17QB3L" id="4TpzghMgufg" role="_5OfE" />
      <node concept="3clFbS" id="4TpzghMgqEX" role="_1YeD">
        <node concept="3cpWs6" id="4TpzghMgwgg" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlgLA_" role="3cqZAk">
            <node concept="_1YeC" id="1RtoFYlgLyJ" role="2Oq$k0">
              <ref role="_VD$M" node="4TpzghMgsew" resolve="node" />
            </node>
            <node concept="liA8E" id="1RtoFYlgLEK" role="2OqNvi">
              <ref role="37wK5l" to="wyt6:~Object.toString()" resolve="toString" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="1RtoFYlgGQE" role="gmrQt">
      <ref role="_1Yeu" node="4TpzghMgqET" resolve="labelText" />
      <node concept="3clFbS" id="1RtoFYlgGQG" role="_1YeD">
        <node concept="3cpWs6" id="1RtoFYlgLcJ" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlgLk4" role="3cqZAk">
            <node concept="_1YeC" id="1RtoFYlgLcL" role="2Oq$k0">
              <ref role="_VD$M" node="1RtoFYlgI5F" resolve="node" />
            </node>
            <node concept="2Iv5rx" id="1RtoFYlgLyv" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="1RtoFYlgI5F" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="1RtoFYlgL77" role="_6ltW" />
      </node>
    </node>
    <node concept="3ywjYg" id="4TpzghMfGcU" role="gmrQt" />
    <node concept="_1YeK" id="4TpzghMfHq0" role="gmrQt">
      <property role="TrG5h" value="treeChildren" />
      <node concept="_1YeU" id="4TpzghMfIHf" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="1RtoFYlgCXQ" role="_6ltW">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="_YKpA" id="4TpzghMfIHp" role="_5OfE">
        <node concept="3qUE_q" id="7KGHflxWEZN" role="_ZDj9">
          <node concept="3uibUv" id="7KGHflxWFyT" role="3qUE_r">
            <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
          </node>
        </node>
      </node>
      <node concept="3clFbS" id="4TpzghMfHq4" role="_1YeD">
        <node concept="3cpWs6" id="2Kjf8ILbxlY" role="3cqZAp">
          <node concept="2ShNRf" id="1RtoFYleMeE" role="3cqZAk">
            <node concept="Tc6Ow" id="1RtoFYleMeF" role="2ShVmc">
              <node concept="3Tqbb2" id="1RtoFYleMeG" role="HW$YZ" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="1RtoFYloR1W" role="gmrQt">
      <ref role="_1Yeu" node="4TpzghMfHq0" resolve="treeChildren" />
      <node concept="3clFbS" id="1RtoFYloR1Y" role="_1YeD">
        <node concept="3cpWs6" id="1RtoFYloXGY" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlpA9h" role="3cqZAk">
            <node concept="_1YeC" id="1RtoFYlpA3k" role="2Oq$k0">
              <ref role="_VD$M" node="1RtoFYloWvI" resolve="node" />
            </node>
            <node concept="liA8E" id="1RtoFYlpAhM" role="2OqNvi">
              <ref role="37wK5l" node="1RtoFYlp13x" resolve="getChildren" />
            </node>
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="1RtoFYloWvI" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="1RtoFYloWvJ" role="_6ltW">
          <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="4TpzghMfPnd" role="gmrQt">
      <ref role="_1Yeu" node="4TpzghMfHq0" resolve="treeChildren" />
      <node concept="3clFbS" id="4TpzghMfPnf" role="_1YeD">
        <node concept="3cpWs6" id="4TpzghMfVhY" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlen9k" role="3cqZAk">
            <node concept="2OqwBi" id="1RtoFYlen9l" role="2Oq$k0">
              <node concept="2OqwBi" id="1RtoFYlen9m" role="2Oq$k0">
                <node concept="_1YeC" id="1RtoFYlen9n" role="2Oq$k0">
                  <ref role="_VD$M" node="4TpzghMfQJ9" resolve="node" />
                </node>
                <node concept="3Tsc0h" id="1RtoFYlen9o" role="2OqNvi">
                  <ref role="3TtcxE" to="jh6v:qmkA5fOski" />
                </node>
              </node>
              <node concept="2S7cBI" id="1RtoFYlen9p" role="2OqNvi">
                <node concept="1nlBCl" id="1RtoFYlen9q" role="2S7zOq">
                  <property role="3clFbU" value="true" />
                </node>
                <node concept="1bVj0M" id="1RtoFYlen9r" role="23t8la">
                  <node concept="3clFbS" id="1RtoFYlen9s" role="1bW5cS">
                    <node concept="3clFbF" id="1RtoFYlen9t" role="3cqZAp">
                      <node concept="2OqwBi" id="1RtoFYlen9u" role="3clFbG">
                        <node concept="37vLTw" id="1RtoFYlen9v" role="2Oq$k0">
                          <ref role="3cqZAo" node="1RtoFYlen9x" resolve="it" />
                        </node>
                        <node concept="3TrcHB" id="1RtoFYlen9w" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="gl6BB" id="1RtoFYlen9x" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="1RtoFYlen9y" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="ANE8D" id="1RtoFYlen9z" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="4TpzghMfQJ9" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="4TpzghMfQJa" role="_6ltW">
          <ref role="ehGHo" to="jh6v:qmkA5fOskf" resolve="Module" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="4TpzghMfZBW" role="gmrQt">
      <ref role="_1Yeu" node="4TpzghMfHq0" resolve="treeChildren" />
      <node concept="3clFbS" id="4TpzghMfZBX" role="_1YeD">
        <node concept="3cpWs6" id="4TpzghMfZBY" role="3cqZAp">
          <node concept="2OqwBi" id="2Kjf8ILgOoI" role="3cqZAk">
            <node concept="2OqwBi" id="2Kjf8ILgOoJ" role="2Oq$k0">
              <node concept="2OqwBi" id="2Kjf8ILgOoK" role="2Oq$k0">
                <node concept="_1YeC" id="2Kjf8ILgOoL" role="2Oq$k0">
                  <ref role="_VD$M" node="4TpzghMfZCd" resolve="node" />
                </node>
                <node concept="3Tsc0h" id="2Kjf8ILgOoM" role="2OqNvi">
                  <ref role="3TtcxE" to="jh6v:qmkA5fOskk" />
                </node>
              </node>
              <node concept="2S7cBI" id="2Kjf8ILgOoN" role="2OqNvi">
                <node concept="1nlBCl" id="2Kjf8ILgOoO" role="2S7zOq">
                  <property role="3clFbU" value="true" />
                </node>
                <node concept="1bVj0M" id="2Kjf8ILgOoP" role="23t8la">
                  <node concept="3clFbS" id="2Kjf8ILgOoQ" role="1bW5cS">
                    <node concept="3clFbF" id="2Kjf8ILgOoR" role="3cqZAp">
                      <node concept="2OqwBi" id="2Kjf8ILgOoS" role="3clFbG">
                        <node concept="37vLTw" id="2Kjf8ILgOoT" role="2Oq$k0">
                          <ref role="3cqZAo" node="2Kjf8ILgOoV" resolve="it" />
                        </node>
                        <node concept="2Iv5rx" id="2Kjf8ILgOoU" role="2OqNvi" />
                      </node>
                    </node>
                  </node>
                  <node concept="gl6BB" id="2Kjf8ILgOoV" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="2Kjf8ILgOoW" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="ANE8D" id="2Kjf8ILgOoX" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="4TpzghMfZCd" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="4TpzghMfZCe" role="_6ltW">
          <ref role="ehGHo" to="jh6v:qmkA5fOskc" resolve="Model" />
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="4TpzghMge70" role="gmrQt">
      <ref role="_1Yeu" node="4TpzghMfHq0" resolve="treeChildren" />
      <node concept="3clFbS" id="4TpzghMge71" role="_1YeD">
        <node concept="3cpWs8" id="1RtoFYlvp9A" role="3cqZAp">
          <node concept="3cpWsn" id="1RtoFYlvp9B" role="3cpWs9">
            <property role="TrG5h" value="folderQuery" />
            <node concept="1ajhzC" id="1RtoFYlvp9z" role="1tU5fm">
              <node concept="3Tqbb2" id="1RtoFYlvp9$" role="1ajw0F">
                <ref role="ehGHo" to="jh6v:3DfUugBU39$" resolve="ProjectModule" />
              </node>
              <node concept="17QB3L" id="1RtoFYlvp9_" role="1ajl9A" />
            </node>
            <node concept="1bVj0M" id="1RtoFYlvp9C" role="33vP2m">
              <node concept="gl6BB" id="1RtoFYlvp9D" role="1bW2Oz">
                <property role="TrG5h" value="m" />
                <node concept="2jxLKc" id="1RtoFYlvp9E" role="1tU5fm" />
              </node>
              <node concept="3clFbS" id="1RtoFYlvp9F" role="1bW5cS">
                <node concept="3clFbF" id="1RtoFYlvp9G" role="3cqZAp">
                  <node concept="2OqwBi" id="1RtoFYlvp9H" role="3clFbG">
                    <node concept="37vLTw" id="1RtoFYlvp9I" role="2Oq$k0">
                      <ref role="3cqZAo" node="1RtoFYlvp9D" resolve="m" />
                    </node>
                    <node concept="3TrcHB" id="1RtoFYlvp9J" role="2OqNvi">
                      <ref role="3TsBF5" to="jh6v:3DfUugBU39_" resolve="virtualFolder" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="1RtoFYlyfFg" role="3cqZAp">
          <node concept="3cpWsn" id="1RtoFYlyfFh" role="3cpWs9">
            <property role="TrG5h" value="seq" />
            <node concept="A3Dl8" id="1RtoFYlyeKa" role="1tU5fm">
              <node concept="3Tqbb2" id="1RtoFYlyeKd" role="A3Ik2">
                <ref role="ehGHo" to="jh6v:3DfUugBU39$" resolve="ProjectModule" />
              </node>
            </node>
            <node concept="2OqwBi" id="1RtoFYlyfFi" role="33vP2m">
              <node concept="2OqwBi" id="1RtoFYlyfFj" role="2Oq$k0">
                <node concept="_1YeC" id="1RtoFYlyfFk" role="2Oq$k0">
                  <ref role="_VD$M" node="4TpzghMge7h" resolve="node" />
                </node>
                <node concept="3Tsc0h" id="1RtoFYlyfFl" role="2OqNvi">
                  <ref role="3TtcxE" to="jh6v:3DfUugBU39C" />
                </node>
              </node>
              <node concept="2S7cBI" id="1RtoFYlyfFm" role="2OqNvi">
                <node concept="1nlBCl" id="1RtoFYlyfFn" role="2S7zOq">
                  <property role="3clFbU" value="true" />
                </node>
                <node concept="1bVj0M" id="1RtoFYlyfFo" role="23t8la">
                  <node concept="3clFbS" id="1RtoFYlyfFp" role="1bW5cS">
                    <node concept="3clFbF" id="1RtoFYlyfFq" role="3cqZAp">
                      <node concept="2OqwBi" id="1RtoFYlyfFr" role="3clFbG">
                        <node concept="2OqwBi" id="1RtoFYlyfFs" role="2Oq$k0">
                          <node concept="37vLTw" id="1RtoFYlyfFt" role="2Oq$k0">
                            <ref role="3cqZAo" node="1RtoFYlyfFw" resolve="it" />
                          </node>
                          <node concept="3TrEf2" id="1RtoFYlyfFu" role="2OqNvi">
                            <ref role="3Tt5mk" to="jh6v:5100827PtfH" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="1RtoFYlyfFv" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="gl6BB" id="1RtoFYlyfFw" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="1RtoFYlyfFx" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1RtoFYlq2Zl" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlq2Zn" role="3cqZAk">
            <node concept="2YIFZM" id="7KGHflxKp4J" role="2Oq$k0">
              <ref role="37wK5l" node="1RtoFYlj7ZU" resolve="createFolder" />
              <ref role="1Pybhc" node="1RtoFYlhdyU" resolve="VirtualFolder" />
              <node concept="3cpWs3" id="7KGHflxZZ4h" role="37wK5m">
                <node concept="Xl_RD" id="7KGHflxZZ4k" role="3uHU7w" />
                <node concept="3cpWs3" id="7KGHfly00__" role="3uHU7B">
                  <node concept="Xl_RD" id="7KGHfly00R5" role="3uHU7B">
                    <property role="Xl_RC" value="folder/" />
                  </node>
                  <node concept="_1Yeq" id="7KGHflxZVee" role="3uHU7w">
                    <ref role="_1Yer" node="7KGHflxZ_HE" resolve="treeItemId" />
                    <node concept="_1YeC" id="7KGHflxZVhO" role="_1Yep">
                      <ref role="_VD$M" node="4TpzghMge7h" resolve="node" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="37vLTw" id="1RtoFYlyfFy" role="37wK5m">
                <ref role="3cqZAo" node="1RtoFYlyfFh" resolve="seq" />
              </node>
              <node concept="37vLTw" id="1RtoFYlvp9K" role="37wK5m">
                <ref role="3cqZAo" node="1RtoFYlvp9B" resolve="folderQuery" />
              </node>
            </node>
            <node concept="liA8E" id="1RtoFYlq2ZL" role="2OqNvi">
              <ref role="37wK5l" node="1RtoFYlp13x" resolve="getChildren" />
            </node>
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="4TpzghMge7h" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="4TpzghMge7i" role="_6ltW">
          <ref role="ehGHo" to="jh6v:3uw$nPCBu_p" resolve="Project" />
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="1RtoFYlgrAc" role="gmrQt" />
    <node concept="_1YeK" id="1RtoFYlfLA7" role="gmrQt">
      <property role="TrG5h" value="virtualFolders" />
      <node concept="_1YeU" id="1RtoFYlfMMU" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="1RtoFYlfMN0" role="_6ltW" />
      </node>
      <node concept="_YKpA" id="1RtoFYlfMN4" role="_5OfE">
        <node concept="17QB3L" id="1RtoFYlfMN6" role="_ZDj9" />
      </node>
      <node concept="3clFbS" id="1RtoFYlfLAb" role="_1YeD">
        <node concept="3cpWs8" id="1RtoFYlfPK6" role="3cqZAp">
          <node concept="3cpWsn" id="1RtoFYlfPK7" role="3cpWs9">
            <property role="TrG5h" value="path" />
            <node concept="17QB3L" id="1RtoFYlfOhE" role="1tU5fm" />
            <node concept="_1Yeq" id="1RtoFYlfPK8" role="33vP2m">
              <ref role="_1Yer" node="1RtoFYlfIT5" resolve="virtualFolder" />
              <node concept="_1YeC" id="1RtoFYlfPK9" role="_1Yep">
                <ref role="_VD$M" node="1RtoFYlfMMU" resolve="node" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="1RtoFYlfPKJ" role="3cqZAp">
          <node concept="3clFbS" id="1RtoFYlfPKL" role="3clFbx">
            <node concept="3cpWs6" id="1RtoFYlfRw4" role="3cqZAp">
              <node concept="2ShNRf" id="1RtoFYlfRwb" role="3cqZAk">
                <node concept="Tc6Ow" id="1RtoFYlfUZn" role="2ShVmc">
                  <node concept="17QB3L" id="1RtoFYlfUZS" role="HW$YZ" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbC" id="1RtoFYlfQKE" role="3clFbw">
            <node concept="10Nm6u" id="1RtoFYlfRvP" role="3uHU7w" />
            <node concept="37vLTw" id="1RtoFYlfPKU" role="3uHU7B">
              <ref role="3cqZAo" node="1RtoFYlfPK7" resolve="path" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1RtoFYlfZY0" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlfZY2" role="3cqZAk">
            <node concept="2OqwBi" id="1RtoFYlfZY3" role="2Oq$k0">
              <node concept="2OqwBi" id="1RtoFYlfZY4" role="2Oq$k0">
                <node concept="37vLTw" id="1RtoFYlfZY5" role="2Oq$k0">
                  <ref role="3cqZAo" node="1RtoFYlfPK7" resolve="path" />
                </node>
                <node concept="liA8E" id="1RtoFYlfZY6" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.split(java.lang.String)" resolve="split" />
                  <node concept="Xl_RD" id="1RtoFYlfZY7" role="37wK5m">
                    <property role="Xl_RC" value="." />
                  </node>
                </node>
              </node>
              <node concept="39bAoz" id="1RtoFYlfZY8" role="2OqNvi" />
            </node>
            <node concept="ANE8D" id="1RtoFYlfZY9" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="1RtoFYlfK6g" role="gmrQt" />
    <node concept="_1YeK" id="1RtoFYlfIT5" role="gmrQt">
      <property role="TrG5h" value="virtualFolder" />
      <node concept="_1YeU" id="1RtoFYlfK5S" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="1RtoFYlfK5Y" role="_6ltW" />
      </node>
      <node concept="17QB3L" id="1RtoFYlfK6c" role="_5OfE" />
      <node concept="3clFbS" id="1RtoFYlfIT9" role="_1YeD">
        <node concept="3clFbF" id="1RtoFYlfK65" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlfLsN" role="3clFbG">
            <node concept="_1YeC" id="1RtoFYlfK64" role="2Oq$k0">
              <ref role="_VD$M" node="1RtoFYlfK5S" resolve="node" />
            </node>
            <node concept="3TrcHB" id="1RtoFYlfL$h" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="7KGHflxZzSI" role="gmrQt" />
    <node concept="_1YeK" id="7KGHflxZ_HE" role="gmrQt">
      <property role="TrG5h" value="treeItemId" />
      <node concept="_1YeU" id="7KGHflxZBhO" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="7KGHflxZBhU" role="_6ltW">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="17QB3L" id="7KGHflxZBkk" role="_5OfE" />
      <node concept="3clFbS" id="7KGHflxZ_HI" role="_1YeD">
        <node concept="3cpWs6" id="7KGHflxZFXH" role="3cqZAp">
          <node concept="3cpWs3" id="7KGHflxZFXJ" role="3cqZAk">
            <node concept="Xl_RD" id="7KGHflxZFXK" role="3uHU7B">
              <property role="Xl_RC" value="@" />
            </node>
            <node concept="2YIFZM" id="7KGHflxZFXL" role="3uHU7w">
              <ref role="37wK5l" to="wyt6:~System.identityHashCode(java.lang.Object)" resolve="identityHashCode" />
              <ref role="1Pybhc" to="wyt6:~System" resolve="System" />
              <node concept="_1YeC" id="7KGHflxZFXM" role="37wK5m">
                <ref role="_VD$M" node="7KGHflxZBhO" resolve="node" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="_1YeL" id="7KGHflxZD9h" role="gmrQt">
      <ref role="_1Yeu" node="7KGHflxZ_HE" resolve="treeItemId" />
      <node concept="3clFbS" id="7KGHflxZD9j" role="_1YeD">
        <node concept="3cpWs6" id="7KGHflxZIM$" role="3cqZAp">
          <node concept="2YIFZM" id="7KGHflxZIME" role="3cqZAk">
            <ref role="37wK5l" to="e11:~ReactFacade.serializeRef(org.jetbrains.mps.openapi.model.SNode)" resolve="serializeRef" />
            <ref role="1Pybhc" to="e11:~ReactFacade" resolve="ReactFacade" />
            <node concept="_1YeC" id="7KGHflxZLWp" role="37wK5m">
              <ref role="_VD$M" node="7KGHflxZGdW" resolve="node" />
            </node>
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="7KGHflxZGdW" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="7KGHflxZHOS" role="_6ltW" />
      </node>
    </node>
    <node concept="_1YeL" id="7KGHflxZOhM" role="gmrQt">
      <ref role="_1Yeu" node="7KGHflxZ_HE" resolve="treeItemId" />
      <node concept="3clFbS" id="7KGHflxZOhO" role="_1YeD">
        <node concept="3cpWs6" id="7KGHflxZROo" role="3cqZAp">
          <node concept="2OqwBi" id="7KGHflxZRUr" role="3cqZAk">
            <node concept="_1YeC" id="7KGHflxZROu" role="2Oq$k0">
              <ref role="_VD$M" node="7KGHflxZQ4e" resolve="node" />
            </node>
            <node concept="liA8E" id="7KGHflxZS6f" role="2OqNvi">
              <ref role="37wK5l" node="7KGHflxZkuS" resolve="getId" />
            </node>
          </node>
        </node>
      </node>
      <node concept="_1YeU" id="7KGHflxZQ4e" role="_1Yen">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="7KGHflxZQ4f" role="_6ltW">
          <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
        </node>
      </node>
    </node>
  </node>
  <node concept="312cEu" id="1RtoFYlhdyU">
    <property role="TrG5h" value="VirtualFolder" />
    <node concept="312cEg" id="1RtoFYlhd_$" role="jymVt">
      <property role="TrG5h" value="childFolders" />
      <node concept="3Tm6S6" id="1RtoFYlhd__" role="1B3o_S" />
      <node concept="3rvAFt" id="1RtoFYliFpe" role="1tU5fm">
        <node concept="17QB3L" id="1RtoFYliH9Y" role="3rvQeY" />
        <node concept="3uibUv" id="1RtoFYliIUg" role="3rvSg0">
          <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
        </node>
      </node>
      <node concept="2ShNRf" id="1RtoFYliMd2" role="33vP2m">
        <node concept="342d9q" id="1RtoFYliO9e" role="2ShVmc" />
      </node>
    </node>
    <node concept="312cEg" id="1RtoFYlhdBR" role="jymVt">
      <property role="TrG5h" value="childItems" />
      <node concept="3Tm6S6" id="1RtoFYlhdBS" role="1B3o_S" />
      <node concept="_YKpA" id="1RtoFYlhdCi" role="1tU5fm">
        <node concept="3uibUv" id="1RtoFYlhdCC" role="_ZDj9">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="2ShNRf" id="1RtoFYlhgB3" role="33vP2m">
        <node concept="Tc6Ow" id="1RtoFYlhgAL" role="2ShVmc">
          <node concept="3uibUv" id="1RtoFYlhgAM" role="HW$YZ">
            <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
          </node>
        </node>
      </node>
    </node>
    <node concept="312cEg" id="1RtoFYlhdDP" role="jymVt">
      <property role="TrG5h" value="name" />
      <node concept="3Tm6S6" id="1RtoFYlhdDQ" role="1B3o_S" />
      <node concept="17QB3L" id="1RtoFYlhdEi" role="1tU5fm" />
    </node>
    <node concept="312cEg" id="7KGHflxYHDi" role="jymVt">
      <property role="TrG5h" value="id" />
      <node concept="3Tm6S6" id="7KGHflxYHDj" role="1B3o_S" />
      <node concept="17QB3L" id="7KGHflxZ96Z" role="1tU5fm" />
    </node>
    <node concept="2tJIrI" id="1RtoFYlhdEQ" role="jymVt" />
    <node concept="3clFbW" id="1RtoFYlhdFg" role="jymVt">
      <node concept="37vLTG" id="7KGHflxYLaC" role="3clF46">
        <property role="TrG5h" value="id" />
        <node concept="17QB3L" id="7KGHflxZ3g5" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="1RtoFYlhdQy" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="1RtoFYlhdSZ" role="1tU5fm" />
      </node>
      <node concept="3cqZAl" id="1RtoFYlhdFi" role="3clF45" />
      <node concept="3Tm1VV" id="1RtoFYlhdFj" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlhdFk" role="3clF47">
        <node concept="3clFbF" id="7KGHflxYUgg" role="3cqZAp">
          <node concept="37vLTI" id="7KGHflxYXW4" role="3clFbG">
            <node concept="37vLTw" id="7KGHflxYYxD" role="37vLTx">
              <ref role="3cqZAo" node="7KGHflxYLaC" resolve="id" />
            </node>
            <node concept="2OqwBi" id="7KGHflxYUVo" role="37vLTJ">
              <node concept="Xjq3P" id="7KGHflxYUge" role="2Oq$k0" />
              <node concept="2OwXpG" id="7KGHflxYVM5" role="2OqNvi">
                <ref role="2Oxat5" node="7KGHflxYHDi" resolve="id" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1RtoFYlhdWa" role="3cqZAp">
          <node concept="37vLTI" id="1RtoFYlhfse" role="3clFbG">
            <node concept="37vLTw" id="1RtoFYlhftC" role="37vLTx">
              <ref role="3cqZAo" node="1RtoFYlhdQy" resolve="name" />
            </node>
            <node concept="2OqwBi" id="1RtoFYlhe3A" role="37vLTJ">
              <node concept="Xjq3P" id="1RtoFYlhdW9" role="2Oq$k0" />
              <node concept="2OwXpG" id="1RtoFYlheaf" role="2OqNvi">
                <ref role="2Oxat5" node="1RtoFYlhdDP" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYlhgeG" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYlhggE" role="jymVt">
      <property role="TrG5h" value="addFolder" />
      <node concept="37vLTG" id="1RtoFYlhgs$" role="3clF46">
        <property role="TrG5h" value="folder" />
        <node concept="3uibUv" id="1RtoFYlhgwB" role="1tU5fm">
          <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
        </node>
      </node>
      <node concept="3cqZAl" id="1RtoFYlhggG" role="3clF45" />
      <node concept="3Tm6S6" id="1RtoFYlj50I" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlhggI" role="3clF47">
        <node concept="3clFbF" id="1RtoFYliViq" role="3cqZAp">
          <node concept="37vLTI" id="1RtoFYlj2Xu" role="3clFbG">
            <node concept="37vLTw" id="1RtoFYlj4tJ" role="37vLTx">
              <ref role="3cqZAo" node="1RtoFYlhgs$" resolve="folder" />
            </node>
            <node concept="3EllGN" id="1RtoFYliXys" role="37vLTJ">
              <node concept="2OqwBi" id="1RtoFYliZsO" role="3ElVtu">
                <node concept="37vLTw" id="1RtoFYliZ3S" role="2Oq$k0">
                  <ref role="3cqZAo" node="1RtoFYlhgs$" resolve="folder" />
                </node>
                <node concept="liA8E" id="1RtoFYlj1o_" role="2OqNvi">
                  <ref role="37wK5l" node="1RtoFYlhols" resolve="getName" />
                </node>
              </node>
              <node concept="37vLTw" id="1RtoFYliVip" role="3ElQJh">
                <ref role="3cqZAo" node="1RtoFYlhd_$" resolve="childFolders" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYlhgBS" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYlhgEB" role="jymVt">
      <property role="TrG5h" value="addFolder" />
      <node concept="37vLTG" id="1RtoFYlhgRX" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="1RtoFYlhgUR" role="1tU5fm" />
      </node>
      <node concept="3uibUv" id="1RtoFYlhgYp" role="3clF45">
        <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
      </node>
      <node concept="3Tm6S6" id="1RtoFYlj6uo" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlhgEF" role="3clF47">
        <node concept="3cpWs8" id="1RtoFYlhh54" role="3cqZAp">
          <node concept="3cpWsn" id="1RtoFYlhh55" role="3cpWs9">
            <property role="TrG5h" value="newFolder" />
            <node concept="3uibUv" id="1RtoFYlhh56" role="1tU5fm">
              <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
            </node>
            <node concept="2ShNRf" id="1RtoFYlhhhb" role="33vP2m">
              <node concept="1pGfFk" id="1RtoFYlhhgT" role="2ShVmc">
                <ref role="37wK5l" node="1RtoFYlhdFg" resolve="VirtualFolder" />
                <node concept="3cpWs3" id="7KGHflxZieC" role="37wK5m">
                  <node concept="37vLTw" id="7KGHflxZigd" role="3uHU7w">
                    <ref role="3cqZAo" node="1RtoFYlhgRX" resolve="name" />
                  </node>
                  <node concept="3cpWs3" id="7KGHflxZcQ1" role="3uHU7B">
                    <node concept="37vLTw" id="7KGHflxZ2th" role="3uHU7B">
                      <ref role="3cqZAo" node="7KGHflxYHDi" resolve="id" />
                    </node>
                    <node concept="Xl_RD" id="7KGHflxZcRA" role="3uHU7w">
                      <property role="Xl_RC" value="/" />
                    </node>
                  </node>
                </node>
                <node concept="37vLTw" id="1RtoFYlhhkI" role="37wK5m">
                  <ref role="3cqZAo" node="1RtoFYlhgRX" resolve="name" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1RtoFYlhhrW" role="3cqZAp">
          <node concept="1rXfSq" id="1RtoFYlhhrU" role="3clFbG">
            <ref role="37wK5l" node="1RtoFYlhggE" resolve="addFolder" />
            <node concept="37vLTw" id="1RtoFYlhhxA" role="37wK5m">
              <ref role="3cqZAo" node="1RtoFYlhh55" resolve="newFolder" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1RtoFYlhhIJ" role="3cqZAp">
          <node concept="37vLTw" id="1RtoFYlhhMt" role="3cqZAk">
            <ref role="3cqZAo" node="1RtoFYlhh55" resolve="newFolder" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYlhhRO" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYlhhXs" role="jymVt">
      <property role="TrG5h" value="getOrCreateFolder" />
      <node concept="37vLTG" id="1RtoFYlhibh" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="17QB3L" id="1RtoFYlhijv" role="1tU5fm" />
      </node>
      <node concept="3uibUv" id="1RtoFYlhxfp" role="3clF45">
        <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
      </node>
      <node concept="3Tm1VV" id="1RtoFYlhhXv" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlhhXw" role="3clF47">
        <node concept="3cpWs8" id="1RtoFYlhrXU" role="3cqZAp">
          <node concept="3cpWsn" id="1RtoFYlhrXV" role="3cpWs9">
            <property role="TrG5h" value="existing" />
            <node concept="3uibUv" id="1RtoFYlhrhD" role="1tU5fm">
              <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
            </node>
            <node concept="3EllGN" id="1RtoFYliQnp" role="33vP2m">
              <node concept="37vLTw" id="1RtoFYliRVv" role="3ElVtu">
                <ref role="3cqZAo" node="1RtoFYlhibh" resolve="name" />
              </node>
              <node concept="37vLTw" id="1RtoFYlhrXX" role="3ElQJh">
                <ref role="3cqZAo" node="1RtoFYlhd_$" resolve="childFolders" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="1RtoFYlhsTU" role="3cqZAp">
          <node concept="3clFbS" id="1RtoFYlhsTW" role="3clFbx">
            <node concept="3cpWs6" id="1RtoFYlhtOg" role="3cqZAp">
              <node concept="1rXfSq" id="1RtoFYlhubE" role="3cqZAk">
                <ref role="37wK5l" node="1RtoFYlhgEB" resolve="addFolder" />
                <node concept="37vLTw" id="1RtoFYlhusl" role="37wK5m">
                  <ref role="3cqZAo" node="1RtoFYlhibh" resolve="name" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbC" id="1RtoFYlhtpJ" role="3clFbw">
            <node concept="10Nm6u" id="1RtoFYlhtzY" role="3uHU7w" />
            <node concept="37vLTw" id="1RtoFYlht2k" role="3uHU7B">
              <ref role="3cqZAo" node="1RtoFYlhrXV" resolve="existing" />
            </node>
          </node>
          <node concept="9aQIb" id="1RtoFYlhvci" role="9aQIa">
            <node concept="3clFbS" id="1RtoFYlhvcj" role="9aQI4">
              <node concept="3cpWs6" id="1RtoFYlhvHd" role="3cqZAp">
                <node concept="37vLTw" id="1RtoFYlhwdJ" role="3cqZAk">
                  <ref role="3cqZAo" node="1RtoFYlhrXV" resolve="existing" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYlhyOa" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYlhzmw" role="jymVt">
      <property role="TrG5h" value="getOrCreateFolder" />
      <node concept="37vLTG" id="1RtoFYlh_9l" role="3clF46">
        <property role="TrG5h" value="path" />
        <node concept="_YKpA" id="1RtoFYlh_GD" role="1tU5fm">
          <node concept="17QB3L" id="1RtoFYlh_O1" role="_ZDj9" />
        </node>
      </node>
      <node concept="3uibUv" id="1RtoFYlhAcS" role="3clF45">
        <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
      </node>
      <node concept="3Tm1VV" id="1RtoFYlhzmz" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlhzm$" role="3clF47">
        <node concept="3clFbJ" id="1RtoFYlhD_j" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlhFG4" role="3clFbw">
            <node concept="37vLTw" id="1RtoFYlhEan" role="2Oq$k0">
              <ref role="3cqZAo" node="1RtoFYlh_9l" resolve="path" />
            </node>
            <node concept="1v1jN8" id="1RtoFYlhHsA" role="2OqNvi" />
          </node>
          <node concept="3clFbS" id="1RtoFYlhD_l" role="3clFbx">
            <node concept="3cpWs6" id="1RtoFYlhI1U" role="3cqZAp">
              <node concept="Xjq3P" id="1RtoFYlhI2N" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1RtoFYlhK$v" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlhQRK" role="3clFbG">
            <node concept="1rXfSq" id="1RtoFYlhK$t" role="2Oq$k0">
              <ref role="37wK5l" node="1RtoFYlhhXs" resolve="getOrCreateFolder" />
              <node concept="2OqwBi" id="1RtoFYlhNiy" role="37wK5m">
                <node concept="37vLTw" id="1RtoFYlhLnf" role="2Oq$k0">
                  <ref role="3cqZAo" node="1RtoFYlh_9l" resolve="path" />
                </node>
                <node concept="1uHKPH" id="1RtoFYlhOHD" role="2OqNvi" />
              </node>
            </node>
            <node concept="liA8E" id="1RtoFYlhRkO" role="2OqNvi">
              <ref role="37wK5l" node="1RtoFYlhzmw" resolve="getOrCreateFolder" />
              <node concept="2OqwBi" id="1RtoFYli35t" role="37wK5m">
                <node concept="2OqwBi" id="1RtoFYlhUWk" role="2Oq$k0">
                  <node concept="37vLTw" id="1RtoFYlhSsy" role="2Oq$k0">
                    <ref role="3cqZAo" node="1RtoFYlh_9l" resolve="path" />
                  </node>
                  <node concept="7r0gD" id="1RtoFYli0pv" role="2OqNvi">
                    <node concept="3cmrfG" id="1RtoFYli1cJ" role="7T0AP">
                      <property role="3cmrfH" value="1" />
                    </node>
                  </node>
                </node>
                <node concept="ANE8D" id="1RtoFYli5bZ" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYligga" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYlihZZ" role="jymVt">
      <property role="TrG5h" value="addItem" />
      <node concept="37vLTG" id="1RtoFYlimfa" role="3clF46">
        <property role="TrG5h" value="item" />
        <node concept="3uibUv" id="1RtoFYlimyL" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="3cqZAl" id="1RtoFYlii01" role="3clF45" />
      <node concept="3Tm1VV" id="1RtoFYlii02" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlii03" role="3clF47">
        <node concept="3clFbF" id="1RtoFYlioOw" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlirvd" role="3clFbG">
            <node concept="37vLTw" id="1RtoFYlioOv" role="2Oq$k0">
              <ref role="3cqZAo" node="1RtoFYlhdBR" resolve="childItems" />
            </node>
            <node concept="TSZUe" id="1RtoFYlisTg" role="2OqNvi">
              <node concept="37vLTw" id="1RtoFYliupB" role="25WWJ7">
                <ref role="3cqZAo" node="1RtoFYlimfa" resolve="item" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYlhyif" role="jymVt" />
    <node concept="3Tm1VV" id="1RtoFYlhdyV" role="1B3o_S" />
    <node concept="3clFb_" id="1RtoFYlhols" role="jymVt">
      <property role="TrG5h" value="getName" />
      <node concept="17QB3L" id="1RtoFYlholt" role="3clF45" />
      <node concept="3Tm1VV" id="1RtoFYlholu" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlholv" role="3clF47">
        <node concept="3clFbF" id="1RtoFYlholw" role="3cqZAp">
          <node concept="2OqwBi" id="1RtoFYlholp" role="3clFbG">
            <node concept="Xjq3P" id="1RtoFYlholq" role="2Oq$k0" />
            <node concept="2OwXpG" id="1RtoFYlholr" role="2OqNvi">
              <ref role="2Oxat5" node="1RtoFYlhdDP" resolve="name" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYliuGC" role="jymVt" />
    <node concept="3clFb_" id="7KGHflxZkuS" role="jymVt">
      <property role="TrG5h" value="getId" />
      <node concept="17QB3L" id="7KGHflxZkuT" role="3clF45" />
      <node concept="3Tm1VV" id="7KGHflxZkuU" role="1B3o_S" />
      <node concept="3clFbS" id="7KGHflxZkuV" role="3clF47">
        <node concept="3clFbF" id="7KGHflxZkuW" role="3cqZAp">
          <node concept="2OqwBi" id="7KGHflxZkuP" role="3clFbG">
            <node concept="Xjq3P" id="7KGHflxZkuQ" role="2Oq$k0" />
            <node concept="2OwXpG" id="7KGHflxZkuR" role="2OqNvi">
              <ref role="2Oxat5" node="7KGHflxYHDi" resolve="id" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="7KGHflxZq5C" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYloEKm" role="jymVt">
      <property role="TrG5h" value="toString" />
      <node concept="3Tm1VV" id="1RtoFYloEKn" role="1B3o_S" />
      <node concept="17QB3L" id="1RtoFYloLJF" role="3clF45" />
      <node concept="3clFbS" id="1RtoFYloEKq" role="3clF47">
        <node concept="3clFbF" id="1RtoFYloJfY" role="3cqZAp">
          <node concept="37vLTw" id="1RtoFYloJfV" role="3clFbG">
            <ref role="3cqZAo" node="1RtoFYlhdDP" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="2AHcQZ" id="1RtoFYloEKr" role="2AJF6D">
        <ref role="2AI5Lk" to="wyt6:~Override" resolve="Override" />
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYloNv$" role="jymVt" />
    <node concept="3clFb_" id="1RtoFYlp13x" role="jymVt">
      <property role="TrG5h" value="getChildren" />
      <node concept="_YKpA" id="1RtoFYlpc6j" role="3clF45">
        <node concept="3uibUv" id="1RtoFYlpdPZ" role="_ZDj9">
          <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
        </node>
      </node>
      <node concept="3Tm1VV" id="1RtoFYlp13$" role="1B3o_S" />
      <node concept="3clFbS" id="1RtoFYlp13_" role="3clF47">
        <node concept="3clFbF" id="7KGHflxNXKa" role="3cqZAp">
          <node concept="2OqwBi" id="7KGHflxOduT" role="3clFbG">
            <node concept="2OqwBi" id="7KGHflxO0bM" role="2Oq$k0">
              <node concept="2OqwBi" id="7KGHflxNXKc" role="2Oq$k0">
                <node concept="2OqwBi" id="7KGHflxNXKd" role="2Oq$k0">
                  <node concept="37vLTw" id="7KGHflxNXKe" role="2Oq$k0">
                    <ref role="3cqZAo" node="1RtoFYlhd_$" resolve="childFolders" />
                  </node>
                  <node concept="T8wYR" id="7KGHflxNXKf" role="2OqNvi" />
                </node>
                <node concept="3$u5V9" id="7KGHflxNXKg" role="2OqNvi">
                  <node concept="1bVj0M" id="7KGHflxNXKh" role="23t8la">
                    <node concept="3clFbS" id="7KGHflxNXKi" role="1bW5cS">
                      <node concept="3cpWs8" id="7KGHflxNXKj" role="3cqZAp">
                        <node concept="3cpWsn" id="7KGHflxNXKk" role="3cpWs9">
                          <property role="TrG5h" value="folder" />
                          <node concept="3uibUv" id="7KGHflxNXKl" role="1tU5fm">
                            <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
                          </node>
                          <node concept="37vLTw" id="7KGHflxNXKm" role="33vP2m">
                            <ref role="3cqZAo" node="7KGHflxNXKp" resolve="it" />
                          </node>
                        </node>
                      </node>
                      <node concept="3clFbF" id="7KGHflxNXKn" role="3cqZAp">
                        <node concept="37vLTw" id="7KGHflxNXKo" role="3clFbG">
                          <ref role="3cqZAo" node="7KGHflxNXKk" resolve="folder" />
                        </node>
                      </node>
                    </node>
                    <node concept="gl6BB" id="7KGHflxNXKp" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="7KGHflxNXKq" role="1tU5fm" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3QWeyG" id="7KGHflxO1xO" role="2OqNvi">
                <node concept="2OqwBi" id="7KGHflxO3Z8" role="576Qk">
                  <node concept="37vLTw" id="7KGHflxO2m6" role="2Oq$k0">
                    <ref role="3cqZAo" node="1RtoFYlhdBR" resolve="childItems" />
                  </node>
                  <node concept="3$u5V9" id="7KGHflxOb11" role="2OqNvi">
                    <node concept="1bVj0M" id="7KGHflxOb12" role="23t8la">
                      <node concept="3clFbS" id="7KGHflxOb13" role="1bW5cS">
                        <node concept="3cpWs8" id="7KGHflxOb14" role="3cqZAp">
                          <node concept="3cpWsn" id="7KGHflxOb15" role="3cpWs9">
                            <property role="TrG5h" value="folder" />
                            <node concept="3uibUv" id="7KGHflxOb16" role="1tU5fm">
                              <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
                            </node>
                            <node concept="37vLTw" id="7KGHflxOb17" role="33vP2m">
                              <ref role="3cqZAo" node="7KGHflxOb1a" resolve="it" />
                            </node>
                          </node>
                        </node>
                        <node concept="3clFbF" id="7KGHflxOb18" role="3cqZAp">
                          <node concept="37vLTw" id="7KGHflxOb19" role="3clFbG">
                            <ref role="3cqZAo" node="7KGHflxOb15" resolve="folder" />
                          </node>
                        </node>
                      </node>
                      <node concept="gl6BB" id="7KGHflxOb1a" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="7KGHflxOb1b" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="ANE8D" id="7KGHflxOfBr" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1RtoFYloZ8H" role="jymVt" />
    <node concept="2YIFZL" id="1RtoFYlj7ZU" role="jymVt">
      <property role="TrG5h" value="createFolder" />
      <node concept="3clFbS" id="1RtoFYliwg5" role="3clF47">
        <node concept="3cpWs8" id="1RtoFYljcsW" role="3cqZAp">
          <node concept="3cpWsn" id="1RtoFYljcsX" role="3cpWs9">
            <property role="TrG5h" value="root" />
            <node concept="3uibUv" id="1RtoFYljcsY" role="1tU5fm">
              <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
            </node>
            <node concept="2ShNRf" id="1RtoFYlje7G" role="33vP2m">
              <node concept="1pGfFk" id="1RtoFYlje6o" role="2ShVmc">
                <ref role="37wK5l" node="1RtoFYlhdFg" resolve="VirtualFolder" />
                <node concept="37vLTw" id="7KGHflxZxot" role="37wK5m">
                  <ref role="3cqZAo" node="7KGHflxZsuT" resolve="id" />
                </node>
                <node concept="10Nm6u" id="1RtoFYljsbd" role="37wK5m" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2Gpval" id="1RtoFYljvPz" role="3cqZAp">
          <node concept="2GrKxI" id="1RtoFYljvP_" role="2Gsz3X">
            <property role="TrG5h" value="item" />
          </node>
          <node concept="37vLTw" id="1RtoFYljxpl" role="2GsD0m">
            <ref role="3cqZAo" node="1RtoFYli$Rw" resolve="items" />
          </node>
          <node concept="3clFbS" id="1RtoFYljvPD" role="2LFqv$">
            <node concept="3cpWs8" id="1RtoFYljyFv" role="3cqZAp">
              <node concept="3cpWsn" id="1RtoFYljyFy" role="3cpWs9">
                <property role="TrG5h" value="longName" />
                <node concept="17QB3L" id="1RtoFYljyFu" role="1tU5fm" />
                <node concept="2OqwBi" id="1RtoFYljGq9" role="33vP2m">
                  <node concept="37vLTw" id="1RtoFYljG0j" role="2Oq$k0">
                    <ref role="3cqZAo" node="1RtoFYljgu2" resolve="folderQuery" />
                  </node>
                  <node concept="1Bd96e" id="1RtoFYljI3D" role="2OqNvi">
                    <node concept="2GrUjf" id="1RtoFYljJmb" role="1BdPVh">
                      <ref role="2Gs0qQ" node="1RtoFYljvP_" resolve="item" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="1RtoFYljOo8" role="3cqZAp">
              <node concept="3clFbS" id="1RtoFYljOoa" role="3clFbx">
                <node concept="3clFbF" id="1RtoFYlkc0u" role="3cqZAp">
                  <node concept="2OqwBi" id="1RtoFYlkc9V" role="3clFbG">
                    <node concept="37vLTw" id="1RtoFYlkc0s" role="2Oq$k0">
                      <ref role="3cqZAo" node="1RtoFYljcsX" resolve="root" />
                    </node>
                    <node concept="liA8E" id="1RtoFYlkdwu" role="2OqNvi">
                      <ref role="37wK5l" node="1RtoFYlihZZ" resolve="addItem" />
                      <node concept="2GrUjf" id="1RtoFYlkf7$" role="37wK5m">
                        <ref role="2Gs0qQ" node="1RtoFYljvP_" resolve="item" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="22lmx$" id="1RtoFYlk58g" role="3clFbw">
                <node concept="2OqwBi" id="1RtoFYlk8Ta" role="3uHU7w">
                  <node concept="37vLTw" id="1RtoFYlk6pW" role="2Oq$k0">
                    <ref role="3cqZAo" node="1RtoFYljyFy" resolve="longName" />
                  </node>
                  <node concept="17RlXB" id="1RtoFYlkaKh" role="2OqNvi" />
                </node>
                <node concept="3clFbC" id="1RtoFYlk2RU" role="3uHU7B">
                  <node concept="37vLTw" id="1RtoFYljPDz" role="3uHU7B">
                    <ref role="3cqZAo" node="1RtoFYljyFy" resolve="longName" />
                  </node>
                  <node concept="10Nm6u" id="1RtoFYlk4QH" role="3uHU7w" />
                </node>
              </node>
              <node concept="9aQIb" id="1RtoFYlkfpT" role="9aQIa">
                <node concept="3clFbS" id="1RtoFYlkfpU" role="9aQI4">
                  <node concept="3cpWs8" id="1RtoFYlkuDT" role="3cqZAp">
                    <node concept="3cpWsn" id="1RtoFYlkuDU" role="3cpWs9">
                      <property role="TrG5h" value="path" />
                      <node concept="_YKpA" id="1RtoFYlktqt" role="1tU5fm">
                        <node concept="17QB3L" id="1RtoFYlkxho" role="_ZDj9" />
                      </node>
                      <node concept="2OqwBi" id="1RtoFYlkuDV" role="33vP2m">
                        <node concept="2OqwBi" id="1RtoFYlkuDW" role="2Oq$k0">
                          <node concept="2OqwBi" id="1RtoFYlkuDX" role="2Oq$k0">
                            <node concept="37vLTw" id="1RtoFYlkuDY" role="2Oq$k0">
                              <ref role="3cqZAo" node="1RtoFYljyFy" resolve="longName" />
                            </node>
                            <node concept="liA8E" id="1RtoFYlkuDZ" role="2OqNvi">
                              <ref role="37wK5l" to="wyt6:~String.split(java.lang.String)" resolve="split" />
                              <node concept="Xl_RD" id="1RtoFYlkuE0" role="37wK5m">
                                <property role="Xl_RC" value="\\." />
                              </node>
                            </node>
                          </node>
                          <node concept="39bAoz" id="1RtoFYlkuE1" role="2OqNvi" />
                        </node>
                        <node concept="ANE8D" id="1RtoFYlkuE2" role="2OqNvi" />
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbF" id="1RtoFYlk$9V" role="3cqZAp">
                    <node concept="2OqwBi" id="1RtoFYlkBjQ" role="3clFbG">
                      <node concept="2OqwBi" id="1RtoFYlk$t_" role="2Oq$k0">
                        <node concept="37vLTw" id="1RtoFYlk$9T" role="2Oq$k0">
                          <ref role="3cqZAo" node="1RtoFYljcsX" resolve="root" />
                        </node>
                        <node concept="liA8E" id="1RtoFYlk_3z" role="2OqNvi">
                          <ref role="37wK5l" node="1RtoFYlhzmw" resolve="getOrCreateFolder" />
                          <node concept="37vLTw" id="1RtoFYlkAwd" role="37wK5m">
                            <ref role="3cqZAo" node="1RtoFYlkuDU" resolve="path" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="1RtoFYlkDcu" role="2OqNvi">
                        <ref role="37wK5l" node="1RtoFYlihZZ" resolve="addItem" />
                        <node concept="2GrUjf" id="1RtoFYlkF1w" role="37wK5m">
                          <ref role="2Gs0qQ" node="1RtoFYljvP_" resolve="item" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1RtoFYljtYw" role="3cqZAp">
          <node concept="37vLTw" id="1RtoFYljvxw" role="3cqZAk">
            <ref role="3cqZAo" node="1RtoFYljcsX" resolve="root" />
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="7KGHflxZsuT" role="3clF46">
        <property role="TrG5h" value="id" />
        <node concept="17QB3L" id="7KGHflxZu7j" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="1RtoFYli$Rw" role="3clF46">
        <property role="TrG5h" value="items" />
        <node concept="A3Dl8" id="1RtoFYljLQV" role="1tU5fm">
          <node concept="16syzq" id="1RtoFYlpMDe" role="A3Ik2">
            <ref role="16sUi3" node="1RtoFYlpL7Q" resolve="T" />
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="1RtoFYljgu2" role="3clF46">
        <property role="TrG5h" value="folderQuery" />
        <node concept="1ajhzC" id="1RtoFYljhEt" role="1tU5fm">
          <node concept="16syzq" id="1RtoFYlpO8Q" role="1ajw0F">
            <ref role="16sUi3" node="1RtoFYlpL7Q" resolve="T" />
          </node>
          <node concept="17QB3L" id="1RtoFYljiSV" role="1ajl9A" />
        </node>
      </node>
      <node concept="3uibUv" id="1RtoFYlj9y_" role="3clF45">
        <ref role="3uigEE" node="1RtoFYlhdyU" resolve="VirtualFolder" />
      </node>
      <node concept="3Tm1VV" id="1RtoFYliwg4" role="1B3o_S" />
      <node concept="16euLQ" id="1RtoFYlpL7Q" role="16eVyc">
        <property role="TrG5h" value="T" />
      </node>
    </node>
  </node>
</model>

