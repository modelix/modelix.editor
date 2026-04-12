<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:cb4ea846-d62a-4b22-b433-1f1188720a47(test.org.modelix.webaspect.modelix)">
  <persistence version="9" />
  <languages>
    <devkit ref="46d68387-81c7-4c54-9dd2-2717eb3f009b(org.modelix.mps.webaspect.devkit)" />
  </languages>
  <imports>
    <import index="jh6v" ref="r:f2f39a18-fd23-4090-b7f2-ba8da340eec2(org.modelix.model.repositoryconcepts.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="1ut2" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.mpsadapters.tomps(org.modelix.mps.editor.common.stubs/)" />
    <import index="zxfz" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.mpsadapters(org.modelix.mps.editor.common.stubs/)" />
    <import index="w1kc" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel(MPS.Core/)" />
    <import index="jks5" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.api(org.modelix.mps.editor.common.stubs/)" />
    <import index="geos" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.persistent(org.modelix.mps.editor.common.stubs/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react">
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
      <concept id="8876946878574735510" name="org.modelix.mps.react.structure.PropertyChangeHandler" flags="ng" index="ghf2L">
        <reference id="8876946878574742616" name="property" index="gh8LZ" />
        <child id="8876946878574742646" name="value" index="gh8Lh" />
        <child id="8876946878574742620" name="node" index="gh8LV" />
      </concept>
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
      <concept id="2075754047059325736" name="org.modelix.mps.react.structure.JsonArrayElementExpression" flags="ng" index="34KBLA">
        <child id="2075754047059325996" name="value" index="34KBHy" />
      </concept>
      <concept id="2075754047059325481" name="org.modelix.mps.react.structure.JsonArrayBuilder" flags="ng" index="34KBPB">
        <child id="2075754047059325604" name="body" index="34KBRE" />
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
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
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
      <concept id="1070534934090" name="jetbrains.mps.baseLanguage.structure.CastExpression" flags="nn" index="10QFUN">
        <child id="1070534934091" name="type" index="10QFUM" />
        <child id="1070534934092" name="expression" index="10QFUP" />
      </concept>
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1225271283259" name="jetbrains.mps.baseLanguage.structure.NPEEqualsExpression" flags="nn" index="17R0WA" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1111509017652" name="jetbrains.mps.baseLanguage.structure.FloatingPointConstant" flags="nn" index="3b6qkQ">
        <property id="1113006610751" name="value" index="$nhwW" />
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
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1079359253375" name="jetbrains.mps.baseLanguage.structure.ParenthesizedExpression" flags="nn" index="1eOMI4">
        <child id="1079359253376" name="expression" index="1eOMHV" />
      </concept>
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
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="2524418899405758586" name="jetbrains.mps.baseLanguage.closures.structure.InferredClosureParameterDeclaration" flags="ig" index="gl6BB" />
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="446c26eb-2b7b-4bf0-9b35-f83fa582753e" name="jetbrains.mps.lang.modelapi">
      <concept id="4733039728785194814" name="jetbrains.mps.lang.modelapi.structure.NamedNodeReference" flags="ng" index="ZC_QK">
        <reference id="7256306938026143658" name="target" index="2aWVGs" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="5045161044515397667" name="jetbrains.mps.lang.smodel.structure.Node_PointerOperation" flags="ng" index="iZEcu" />
      <concept id="7400021826771268254" name="jetbrains.mps.lang.smodel.structure.SNodePointerType" flags="ig" index="2sp9CU" />
      <concept id="7400021826774799413" name="jetbrains.mps.lang.smodel.structure.NodePointerExpression" flags="ng" index="2tJFMh">
        <child id="7400021826774799510" name="ref" index="2tJFKM" />
      </concept>
      <concept id="4065387505485742749" name="jetbrains.mps.lang.smodel.structure.AbstractPointerResolveOperation" flags="ng" index="2yCiFS">
        <child id="3648723375513868575" name="repositoryArg" index="Vysub" />
      </concept>
      <concept id="1173122760281" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorsOperation" flags="nn" index="z$bX8" />
      <concept id="8329979535468945057" name="jetbrains.mps.lang.smodel.structure.Node_PresentationOperation" flags="ng" index="2Iv5rx" />
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="3648723375513868532" name="jetbrains.mps.lang.smodel.structure.NodePointer_ResolveOperation" flags="ng" index="Vyspw" />
      <concept id="3562215692195599741" name="jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect" flags="nn" index="13MTOL">
        <reference id="3562215692195600259" name="link" index="13MTZf" />
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
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
      <concept id="1225727723840" name="jetbrains.mps.baseLanguage.collections.structure.FindFirstOperation" flags="nn" index="1z4cxt" />
    </language>
  </registry>
  <node concept="gl9ry" id="6eUjE42h0De">
    <property role="TrG5h" value="test.pages.modules-list" />
    <node concept="1xZ$jM" id="6eUjE42q5xy" role="gmrQt">
      <node concept="1xZLHH" id="6eUjE42q5x$" role="1xWnhl">
        <node concept="1xZN64" id="G8IVG9Fnkz" role="1xZN6b">
          <property role="1xZN67" value="modelix" />
        </node>
        <node concept="1xZN64" id="6eUjE42qNC7" role="1xZN6b">
          <property role="1xZN67" value="test" />
        </node>
        <node concept="1xZN64" id="G8IVG9FmFQ" role="1xZN6b">
          <property role="1xZN67" value="modules-list" />
        </node>
      </node>
      <node concept="2rDjb8" id="6eUjE42sp_X" role="1xZwLf">
        <ref role="2rDjb1" node="6eUjE42h0Dw" resolve="main" />
        <node concept="1xZx2W" id="6eUjE42spA5" role="2rDjb3" />
      </node>
    </node>
    <node concept="3ywjYg" id="6eUjE42q5xx" role="gmrQt" />
    <node concept="2rzwrF" id="6eUjE42h0Dw" role="gmrQt">
      <property role="TrG5h" value="main" />
      <node concept="2rzwrA" id="6eUjE42h0Dz" role="2rHO5H">
        <property role="TrG5h" value="repository" />
        <node concept="3Tqbb2" id="6eUjE42h0DH" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskm" resolve="Repository" />
        </node>
      </node>
      <node concept="gmrTC" id="G8IVG9FmFY" role="2rHO5I">
        <property role="gmPZ6" value="html.ul" />
        <node concept="rrkbs" id="6eUjE42h7AY" role="gn1nJ">
          <property role="TrG5h" value="module" />
          <node concept="gmrTC" id="6eUjE42hjbe" role="rrkkB">
            <property role="gmPZ6" value="html.li" />
            <node concept="gn1nE" id="GzuF_KKeEI" role="gn1nH">
              <property role="gn1nW" value="class" />
              <node concept="ghjhU" id="GzuF_KKeEL" role="gn1nU">
                <node concept="Xl_RD" id="GzuF_KKeEK" role="ghjhc">
                  <property role="Xl_RC" value="module" />
                </node>
              </node>
            </node>
            <node concept="ggXia" id="6eUjE42hjf7" role="gn1nJ">
              <node concept="3cpWs3" id="6eUjE42hkeR" role="ggXio">
                <node concept="2OqwBi" id="6eUjE42hkFH" role="3uHU7w">
                  <node concept="rqPyE" id="6eUjE42hkeZ" role="2Oq$k0">
                    <ref role="rqPyD" node="6eUjE42h7AY" resolve="module" />
                  </node>
                  <node concept="3TrcHB" id="6eUjE42hl1f" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
                <node concept="Xl_RD" id="6eUjE42hjf9" role="3uHU7B">
                  <property role="Xl_RC" value="Module: " />
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="6eUjE42hiY7" role="rrkk9">
            <node concept="2rHscw" id="6eUjE42hiNW" role="2Oq$k0">
              <ref role="2rHscx" node="6eUjE42h0Dz" resolve="repository" />
            </node>
            <node concept="3Tsc0h" id="6eUjE42hj7i" role="2OqNvi">
              <ref role="3TtcxE" to="jh6v:qmkA5fOskn" resolve="modules" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="6eUjE42h0Dv" role="gmrQt" />
  </node>
  <node concept="gl9ry" id="25s8$s6sroN">
    <property role="TrG5h" value="test.textfield" />
    <node concept="1xZ$jM" id="25s8$s6sroO" role="gmrQt">
      <node concept="1xZLHH" id="25s8$s6sroP" role="1xWnhl">
        <node concept="1xZN64" id="25s8$s6sroQ" role="1xZN6b">
          <property role="1xZN67" value="modelix" />
        </node>
        <node concept="1xZN64" id="25s8$s6sroR" role="1xZN6b">
          <property role="1xZN67" value="test" />
        </node>
        <node concept="1xZN64" id="25s8$s6sroS" role="1xZN6b">
          <property role="1xZN67" value="text-field" />
        </node>
      </node>
      <node concept="2rDjb8" id="25s8$s6sroT" role="1xZwLf">
        <ref role="2rDjb1" node="25s8$s6sroW" resolve="textFieldTestMain" />
        <node concept="1xZx2W" id="25s8$s6sroU" role="2rDjb3" />
      </node>
    </node>
    <node concept="3ywjYg" id="25s8$s6sroV" role="gmrQt" />
    <node concept="2rzwrF" id="25s8$s6sroW" role="gmrQt">
      <property role="TrG5h" value="textFieldTestMain" />
      <node concept="2rzwrA" id="25s8$s6sroX" role="2rHO5H">
        <property role="TrG5h" value="repository" />
        <node concept="3Tqbb2" id="25s8$s6sroY" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskm" resolve="Repository" />
        </node>
      </node>
      <node concept="2rDjb8" id="25s8$s6tEcJ" role="2rHO5I">
        <ref role="2rDjb1" node="25s8$s6sXHk" resolve="nameEditor" />
        <node concept="2OqwBi" id="25s8$s6tFbD" role="2rDjb3">
          <node concept="2tJFMh" id="25s8$s6tEcY" role="2Oq$k0">
            <node concept="ZC_QK" id="25s8$s6tEyf" role="2tJFKM">
              <ref role="2aWVGs" node="25s8$s6sXGY" resolve="MyClass" />
            </node>
          </node>
          <node concept="Vyspw" id="25s8$s6tGb8" role="2OqNvi">
            <node concept="2OqwBi" id="25s8$s6tN$7" role="Vysub">
              <node concept="1eOMI4" id="25s8$s6tJKU" role="2Oq$k0">
                <node concept="10QFUN" id="25s8$s6tJKT" role="1eOMHV">
                  <node concept="2OqwBi" id="25s8$s6tJKP" role="10QFUP">
                    <node concept="2YIFZM" id="25s8$s6tJKQ" role="2Oq$k0">
                      <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                      <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                      <node concept="2rHscw" id="25s8$s6tJKR" role="37wK5m">
                        <ref role="2rHscx" node="25s8$s6sroX" resolve="repository" />
                      </node>
                    </node>
                    <node concept="liA8E" id="25s8$s6tJKS" role="2OqNvi">
                      <ref role="37wK5l" to="jks5:~INode.asReadableNode()" resolve="asReadableNode" />
                    </node>
                  </node>
                  <node concept="3uibUv" id="25s8$s6tMIS" role="10QFUM">
                    <ref role="3uigEE" to="zxfz:~MPSRepositoryAsNode" resolve="MPSRepositoryAsNode" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="25s8$s6tOyq" role="2OqNvi">
                <ref role="37wK5l" to="zxfz:~MPSRepositoryAsNode.getRepository_()" resolve="getRepository_" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="25s8$s6sXHi" role="gmrQt" />
    <node concept="2rzwrF" id="25s8$s6sXHk" role="gmrQt">
      <property role="TrG5h" value="nameEditor" />
      <node concept="2rzwrA" id="25s8$s6sXHn" role="2rHO5H">
        <property role="TrG5h" value="node" />
        <node concept="3Tqbb2" id="25s8$s6tlM5" role="2rzwqu">
          <ref role="ehGHo" to="tpck:h0TrEE$" resolve="INamedConcept" />
        </node>
      </node>
      <node concept="gmrTC" id="25s8$s6tlMb" role="2rHO5I">
        <property role="gmPZ6" value="modelix.TextField" />
        <node concept="gn1nE" id="25s8$s6tlMd" role="gn1nH">
          <property role="gn1nW" value="value" />
          <node concept="ghjhU" id="25s8$s6tmb2" role="gn1nU">
            <node concept="3cpWs3" id="25s8$s6tmXa" role="ghjhc">
              <node concept="2OqwBi" id="25s8$s6tnjN" role="3uHU7w">
                <node concept="2rHscw" id="25s8$s6tmXd" role="2Oq$k0">
                  <ref role="2rHscx" node="25s8$s6sXHn" resolve="node" />
                </node>
                <node concept="3TrcHB" id="25s8$s6tp6H" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
              <node concept="Xl_RD" id="25s8$s6tmcB" role="3uHU7B">
                <property role="Xl_RC" value="" />
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="5HlemtS1mlM" role="gn1nH">
          <property role="gn1nW" value="onChange" />
          <node concept="ghf20" id="5HlemtS1mlN" role="gn1nU">
            <node concept="ghf2g" id="5HlemtS1mlO" role="ghf3w">
              <property role="TrG5h" value="event" />
            </node>
            <node concept="ghf2L" id="5HlemtS1mlP" role="ghfyX">
              <ref role="gh8LZ" to="tpck:h0TrG11" resolve="name" />
              <node concept="gh8L1" id="5HlemtS1mlQ" role="gh8Lh">
                <property role="gh8Lj" value="event.target.value" />
              </node>
              <node concept="2rHscw" id="25s8$s6tEc$" role="gh8LV">
                <ref role="2rHscx" node="25s8$s6sXHn" resolve="node" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="gmrTC" id="4ZSn8w$Ubww" role="2rHO5I">
        <property role="gmPZ6" value="html.div" />
        <node concept="gn1nE" id="4ZSn8w$UAkC" role="gn1nH">
          <property role="gn1nW" value="class" />
          <node concept="ghjhU" id="4ZSn8w$UAmv" role="gn1nU">
            <node concept="Xl_RD" id="4ZSn8w$UAmu" role="ghjhc">
              <property role="Xl_RC" value="name" />
            </node>
          </node>
        </node>
        <node concept="ggXia" id="4ZSn8w$UbV2" role="gn1nJ">
          <node concept="2OqwBi" id="4ZSn8w$U$9r" role="ggXio">
            <node concept="2rHscw" id="4ZSn8w$U$3f" role="2Oq$k0">
              <ref role="2rHscx" node="25s8$s6sXHn" resolve="node" />
            </node>
            <node concept="3TrcHB" id="4ZSn8w$UAku" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="25s8$s6srpe" role="gmrQt" />
  </node>
  <node concept="312cEu" id="25s8$s6sXGY">
    <property role="TrG5h" value="MyClass" />
    <node concept="3Tm1VV" id="25s8$s6sXGZ" role="1B3o_S" />
  </node>
  <node concept="gl9ry" id="szQzwtjNyW">
    <property role="TrG5h" value="test.pages.text-editor" />
    <node concept="1xZ$jM" id="szQzwtjNyX" role="gmrQt">
      <node concept="1xZLHH" id="szQzwtjNyY" role="1xWnhl">
        <node concept="1xZN64" id="szQzwtjNyZ" role="1xZN6b">
          <property role="1xZN67" value="modelix" />
        </node>
        <node concept="1xZN64" id="szQzwtjNz0" role="1xZN6b">
          <property role="1xZN67" value="test" />
        </node>
        <node concept="1xZN64" id="szQzwtjNz1" role="1xZN6b">
          <property role="1xZN67" value="text-editor" />
        </node>
        <node concept="1xZN66" id="szQzwtng8p" role="1xZN6b">
          <property role="TrG5h" value="rootNodeRef" />
        </node>
      </node>
      <node concept="2rDjb8" id="szQzwtjNz2" role="1xZwLf">
        <ref role="2rDjb1" node="szQzwto0YX" resolve="textEditorForRef" />
        <node concept="1xZx2W" id="szQzwtopne" role="2rDjb3" />
        <node concept="2YIFZM" id="szQzwtnf1u" role="2rDjb3">
          <ref role="37wK5l" to="w1kc:~SNodePointer.deserialize(java.lang.String)" resolve="deserialize" />
          <ref role="1Pybhc" to="w1kc:~SNodePointer" resolve="SNodePointer" />
          <node concept="1tINwK" id="szQzwtngox" role="37wK5m">
            <ref role="1tINwL" node="szQzwtng8p" resolve="rootNodeRef" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2rzwrF" id="szQzwto0YX" role="gmrQt">
      <property role="TrG5h" value="textEditorForRef" />
      <node concept="gmrTC" id="7nrA7Mota0C" role="2rHO5I">
        <property role="gmPZ6" value="mui.Box" />
        <node concept="gn1nE" id="5cENyIUb4A3" role="gn1nH">
          <property role="gn1nW" value="sx" />
          <node concept="gjbvi" id="5cENyIUb58m" role="gn1nU">
            <node concept="gjbwy" id="5cENyIUb6om" role="gjbx_">
              <property role="gjbwO" value="padding" />
              <node concept="ghjhU" id="5cENyIUb6AE" role="gjbwM">
                <node concept="3cmrfG" id="5cENyIUbWiV" role="ghjhc">
                  <property role="3cmrfH" value="2" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="gmrTC" id="7nrA7MosInR" role="gn1nJ">
          <property role="gmPZ6" value="mui.Grid" />
          <node concept="2o1qlL" id="A3wmzsqzz9" role="2o1qk1">
            <property role="TrG5h" value="selectedNode" />
            <node concept="3uibUv" id="A3wmzsqzY2" role="2o1qlE">
              <ref role="3uigEE" to="jks5:~INodeReference" resolve="INodeReference" />
            </node>
            <node concept="10Nm6u" id="A3wmzsqzY7" role="2o1p2P" />
          </node>
          <node concept="gn1nE" id="7nrA7MosIRX" role="gn1nH">
            <property role="gn1nW" value="container" />
            <node concept="ghjhU" id="7nrA7MosITO" role="gn1nU">
              <node concept="3clFbT" id="7nrA7MosITN" role="ghjhc">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
          <node concept="gn1nE" id="7nrA7MosJkz" role="gn1nH">
            <property role="gn1nW" value="spacing" />
            <node concept="ghjhU" id="7nrA7MosJnk" role="gn1nU">
              <node concept="3cmrfG" id="7nrA7MosJnj" role="ghjhc">
                <property role="3cmrfH" value="1" />
              </node>
            </node>
          </node>
          <node concept="gmrTC" id="7nrA7MosJNB" role="gn1nJ">
            <property role="gmPZ6" value="mui.Grid" />
            <node concept="2rDjb8" id="7nrA7MosLSG" role="gn1nJ">
              <ref role="2rDjb1" node="7nrA7MorVtg" resolve="projectView" />
              <node concept="2rHscw" id="7nrA7Mot3si" role="2rDjb3">
                <ref role="2rHscx" node="szQzwto4vi" resolve="repository" />
              </node>
              <node concept="2OqwBi" id="1NezOVo7nQF" role="2rDjb3">
                <node concept="2OqwBi" id="1NezOVo7nQG" role="2Oq$k0">
                  <node concept="2OqwBi" id="1NezOVo7nQH" role="2Oq$k0">
                    <node concept="2OqwBi" id="1NezOVo7nQI" role="2Oq$k0">
                      <node concept="2rHscw" id="1NezOVo7nQJ" role="2Oq$k0">
                        <ref role="2rHscx" node="szQzwto4vi" resolve="repository" />
                      </node>
                      <node concept="3Tsc0h" id="1NezOVo7nQK" role="2OqNvi">
                        <ref role="3TtcxE" to="jh6v:qmkA5fOskn" />
                      </node>
                    </node>
                    <node concept="13MTOL" id="1NezOVo7nQL" role="2OqNvi">
                      <ref role="13MTZf" to="jh6v:qmkA5fOski" />
                    </node>
                  </node>
                  <node concept="13MTOL" id="1NezOVo7nQM" role="2OqNvi">
                    <ref role="13MTZf" to="jh6v:qmkA5fOskk" />
                  </node>
                </node>
                <node concept="1z4cxt" id="1NezOVo7nQN" role="2OqNvi">
                  <node concept="1bVj0M" id="1NezOVo7nQO" role="23t8la">
                    <node concept="3clFbS" id="1NezOVo7nQP" role="1bW5cS">
                      <node concept="3clFbF" id="1NezOVo7nQQ" role="3cqZAp">
                        <node concept="17R0WA" id="1NezOVo7nQR" role="3clFbG">
                          <node concept="2rHscw" id="1NezOVo7nQS" role="3uHU7w">
                            <ref role="2rHscx" node="szQzwto1wv" resolve="rootNodeRef" />
                          </node>
                          <node concept="2OqwBi" id="1NezOVo7nQT" role="3uHU7B">
                            <node concept="37vLTw" id="1NezOVo7nQU" role="2Oq$k0">
                              <ref role="3cqZAo" node="1NezOVo7nQW" resolve="it" />
                            </node>
                            <node concept="iZEcu" id="1NezOVo7nQV" role="2OqNvi" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="gl6BB" id="1NezOVo7nQW" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="1NezOVo7nQX" role="1tU5fm" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="gn1nE" id="7nrA7MosJNC" role="gn1nH">
              <property role="gn1nW" value="size" />
              <node concept="ghjhU" id="7nrA7MosK7x" role="gn1nU">
                <node concept="3cmrfG" id="7nrA7MosK7w" role="ghjhc">
                  <property role="3cmrfH" value="4" />
                </node>
              </node>
            </node>
          </node>
          <node concept="gmrTC" id="7nrA7MosKzO" role="gn1nJ">
            <property role="gmPZ6" value="mui.Grid" />
            <node concept="gmrTC" id="5cENyIUbq9Y" role="gn1nJ">
              <property role="gmPZ6" value="mui.Paper" />
              <node concept="gn1nE" id="5cENyIUbHGm" role="gn1nH">
                <property role="gn1nW" value="sx" />
                <node concept="gjbvi" id="5cENyIUbId$" role="gn1nU">
                  <node concept="gjbwy" id="5cENyIUbIrR" role="gjbx_">
                    <property role="gjbwO" value="padding" />
                    <node concept="ghjhU" id="5cENyIUbIEb" role="gjbwM">
                      <node concept="3cmrfG" id="46tLIHjHLpN" role="ghjhc">
                        <property role="3cmrfH" value="0" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2rDjb8" id="szQzwto1zk" role="gn1nJ">
                <ref role="2rDjb1" node="szQzwtjNz5" resolve="textEditor" />
                <node concept="2OqwBi" id="szQzwtog5T" role="2rDjb3">
                  <node concept="2OqwBi" id="szQzwtodj2" role="2Oq$k0">
                    <node concept="2OqwBi" id="szQzwto8fl" role="2Oq$k0">
                      <node concept="2OqwBi" id="szQzwto53e" role="2Oq$k0">
                        <node concept="2rHscw" id="szQzwto4zN" role="2Oq$k0">
                          <ref role="2rHscx" node="szQzwto4vi" resolve="repository" />
                        </node>
                        <node concept="3Tsc0h" id="szQzwto5Gz" role="2OqNvi">
                          <ref role="3TtcxE" to="jh6v:qmkA5fOskn" />
                        </node>
                      </node>
                      <node concept="13MTOL" id="szQzwtoaDQ" role="2OqNvi">
                        <ref role="13MTZf" to="jh6v:qmkA5fOski" />
                      </node>
                    </node>
                    <node concept="13MTOL" id="szQzwtoeQo" role="2OqNvi">
                      <ref role="13MTZf" to="jh6v:qmkA5fOskk" />
                    </node>
                  </node>
                  <node concept="1z4cxt" id="szQzwtohe3" role="2OqNvi">
                    <node concept="1bVj0M" id="szQzwtohe5" role="23t8la">
                      <node concept="3clFbS" id="szQzwtohe6" role="1bW5cS">
                        <node concept="3clFbF" id="szQzwtohPh" role="3cqZAp">
                          <node concept="17R0WA" id="szQzwtokQp" role="3clFbG">
                            <node concept="2rHscw" id="szQzwtomDd" role="3uHU7w">
                              <ref role="2rHscx" node="szQzwto1wv" resolve="rootNodeRef" />
                            </node>
                            <node concept="2OqwBi" id="szQzwtoilO" role="3uHU7B">
                              <node concept="37vLTw" id="szQzwtohPg" role="2Oq$k0">
                                <ref role="3cqZAo" node="szQzwtohe7" resolve="it" />
                              </node>
                              <node concept="iZEcu" id="szQzwtokl$" role="2OqNvi" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="gl6BB" id="szQzwtohe7" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="szQzwtohe8" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="gn1nE" id="7nrA7MosKzP" role="gn1nH">
              <property role="gn1nW" value="size" />
              <node concept="ghjhU" id="7nrA7MosKzQ" role="gn1nU">
                <node concept="3cmrfG" id="7nrA7MosKzR" role="ghjhc">
                  <property role="3cmrfH" value="8" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2rzwrA" id="szQzwto4vi" role="2rHO5H">
        <property role="TrG5h" value="repository" />
        <node concept="3Tqbb2" id="szQzwto4y5" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskm" resolve="Repository" />
        </node>
      </node>
      <node concept="2rzwrA" id="szQzwto1wv" role="2rHO5H">
        <property role="TrG5h" value="rootNodeRef" />
        <node concept="2sp9CU" id="szQzwtom0L" role="2rzwqu" />
      </node>
    </node>
    <node concept="3ywjYg" id="szQzwto0vE" role="gmrQt" />
    <node concept="2rzwrF" id="szQzwtjNz5" role="gmrQt">
      <property role="TrG5h" value="textEditor" />
      <node concept="2rzwrA" id="szQzwtjNz6" role="2rHO5H">
        <property role="TrG5h" value="rootNode" />
        <node concept="3Tqbb2" id="szQzwtjNz7" role="2rzwqu">
          <ref role="ehGHo" to="tpck:gw2VY9q" resolve="BaseConcept" />
        </node>
      </node>
      <node concept="gmrTC" id="szQzwtoAru" role="2rHO5I">
        <property role="gmPZ6" value="modelix.TextEditor" />
        <node concept="gn1nE" id="szQzwtoBY$" role="gn1nH">
          <property role="gn1nW" value="nodeRef" />
          <node concept="ghjhU" id="szQzwtoC1l" role="gn1nU">
            <node concept="3cpWs3" id="szQzwtoCLT" role="ghjhc">
              <node concept="Xl_RD" id="szQzwtoC1k" role="3uHU7B">
                <property role="Xl_RC" value="" />
              </node>
              <node concept="2OqwBi" id="2Im8FsM5CXv" role="3uHU7w">
                <node concept="2OqwBi" id="5Liq5ZQTrR" role="2Oq$k0">
                  <node concept="2YIFZM" id="5Liq5ZQSxn" role="2Oq$k0">
                    <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                    <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                    <node concept="2rHscw" id="5Liq5ZQSxp" role="37wK5m">
                      <ref role="2rHscx" node="szQzwtjNz6" resolve="rootNode" />
                    </node>
                  </node>
                  <node concept="liA8E" id="5Liq5ZQVoO" role="2OqNvi">
                    <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                  </node>
                </node>
                <node concept="liA8E" id="2Im8FsM5DHh" role="2OqNvi">
                  <ref role="37wK5l" to="jks5:~INodeReference.serialize()" resolve="serialize" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="szQzwtjNzn" role="gmrQt" />
  </node>
  <node concept="gl9ry" id="7nrA7MorVtf">
    <property role="TrG5h" value="test.projectview" />
    <node concept="2rzwrF" id="7nrA7MorVtg" role="gmrQt">
      <property role="TrG5h" value="projectView" />
      <node concept="2rzwrA" id="7nrA7MorVwI" role="2rHO5H">
        <property role="TrG5h" value="repository" />
        <node concept="3Tqbb2" id="7nrA7Mosjpv" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskm" resolve="Repository" />
        </node>
      </node>
      <node concept="2rzwrA" id="1NezOVo4r0o" role="2rHO5H">
        <property role="TrG5h" value="expandedItem" />
        <node concept="3Tqbb2" id="1NezOVo4r0w" role="2rzwqu" />
      </node>
      <node concept="gmrTC" id="7nrA7Mosjp_" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.SimpleTreeView" />
        <node concept="gn1nE" id="1NezOVo2I$U" role="gn1nH">
          <property role="gn1nW" value="defaultExpandedItems" />
          <node concept="34KBPB" id="1NezOVo4r1v" role="gn1nU">
            <node concept="3clFbS" id="1NezOVo4r1x" role="34KBRE">
              <node concept="2Gpval" id="1NezOVo4r2t" role="3cqZAp">
                <node concept="2GrKxI" id="1NezOVo4r2u" role="2Gsz3X">
                  <property role="TrG5h" value="ancestor" />
                </node>
                <node concept="2OqwBi" id="1NezOVo4raa" role="2GsD0m">
                  <node concept="2rHscw" id="1NezOVo4r2F" role="2Oq$k0">
                    <ref role="2rHscx" node="1NezOVo4r0o" resolve="expandedItem" />
                  </node>
                  <node concept="z$bX8" id="1NezOVo4rh6" role="2OqNvi" />
                </node>
                <node concept="3clFbS" id="1NezOVo4r2w" role="2LFqv$">
                  <node concept="3clFbF" id="1NezOVo4riW" role="3cqZAp">
                    <node concept="34KBLA" id="1NezOVo4riU" role="3clFbG">
                      <node concept="2OqwBi" id="1NezOVo4rj4" role="34KBHy">
                        <node concept="2OqwBi" id="1NezOVo4rj5" role="2Oq$k0">
                          <node concept="2YIFZM" id="1NezOVo4rj6" role="2Oq$k0">
                            <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                            <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                            <node concept="2GrUjf" id="1NezOVo4rml" role="37wK5m">
                              <ref role="2Gs0qQ" node="1NezOVo4r2u" resolve="ancestor" />
                            </node>
                          </node>
                          <node concept="liA8E" id="1NezOVo4rj8" role="2OqNvi">
                            <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                          </node>
                        </node>
                        <node concept="liA8E" id="1NezOVo4rj9" role="2OqNvi">
                          <ref role="37wK5l" to="jks5:~INodeReference.serialize()" resolve="serialize" />
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
          </node>
          <node concept="2OqwBi" id="7nrA7Mosmqf" role="rrkk9">
            <node concept="2rHscw" id="7nrA7MosmfI" role="2Oq$k0">
              <ref role="2rHscx" node="7nrA7MorVwI" resolve="project" />
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
        <node concept="3Tqbb2" id="7nrA7Mosnw0" role="2rzwqu" />
      </node>
      <node concept="gmrTC" id="7nrA7Mosnw4" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.TreeItem2" />
        <node concept="gn1nE" id="7nrA7Mosnw6" role="gn1nH">
          <property role="gn1nW" value="itemId" />
          <node concept="ghjhU" id="7nrA7MosnzO" role="gn1nU">
            <node concept="2OqwBi" id="5Liq5ZSO$s" role="ghjhc">
              <node concept="2OqwBi" id="5Liq5ZSO$t" role="2Oq$k0">
                <node concept="2YIFZM" id="5Liq5ZSO$u" role="2Oq$k0">
                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                  <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                  <node concept="2rHscw" id="5Liq5ZSO$v" role="37wK5m">
                    <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                  </node>
                </node>
                <node concept="liA8E" id="5Liq5ZSO$w" role="2OqNvi">
                  <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                </node>
              </node>
              <node concept="liA8E" id="5Liq5ZSO$x" role="2OqNvi">
                <ref role="37wK5l" to="jks5:~INodeReference.serialize()" resolve="serialize" />
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="7nrA7MosqTr" role="gn1nH">
          <property role="gn1nW" value="label" />
          <node concept="rtYR_" id="A3wmzsq_li" role="gn1nU">
            <node concept="gmrTC" id="A3wmzsq_mf" role="rtYRl">
              <property role="gmPZ6" value="mui.Link" />
              <node concept="gn1nE" id="A3wmzsq_nb" role="gn1nH">
                <property role="gn1nW" value="href" />
                <node concept="ghjhU" id="A3wmzsq_p2" role="gn1nU">
                  <node concept="3cpWs3" id="A3wmzsqBzy" role="ghjhc">
                    <node concept="Xl_RD" id="A3wmzsqB2A" role="3uHU7w">
                      <property role="Xl_RC" value="/" />
                    </node>
                    <node concept="3cpWs3" id="A3wmzsqB2z" role="3uHU7B">
                      <node concept="Xl_RD" id="A3wmzsq_p1" role="3uHU7B">
                        <property role="Xl_RC" value="pages/modelix/test/text-editor/" />
                      </node>
                      <node concept="2OqwBi" id="A3wmzsr3KV" role="3uHU7w">
                        <node concept="10M0yZ" id="A3wmzsr2YU" role="2Oq$k0">
                          <ref role="3cqZAo" to="geos:~SerializationUtil.INSTANCE" resolve="INSTANCE" />
                          <ref role="1PxDUh" to="geos:~SerializationUtil" resolve="SerializationUtil" />
                        </node>
                        <node concept="liA8E" id="A3wmzsr4kD" role="2OqNvi">
                          <ref role="37wK5l" to="geos:~SerializationUtil.escape(java.lang.String)" resolve="escape" />
                          <node concept="2OqwBi" id="A3wmzsr7Uj" role="37wK5m">
                            <node concept="2JrnkZ" id="A3wmzsr77$" role="2Oq$k0">
                              <node concept="2OqwBi" id="A3wmzsqC9V" role="2JrQYb">
                                <node concept="2rHscw" id="A3wmzsqBO7" role="2Oq$k0">
                                  <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                                </node>
                                <node concept="iZEcu" id="A3wmzsqCJF" role="2OqNvi" />
                              </node>
                            </node>
                            <node concept="liA8E" id="A3wmzsr8Kp" role="2OqNvi">
                              <ref role="37wK5l" to="wyt6:~Object.toString()" resolve="toString" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="ggXia" id="A3wmzsqT3u" role="gn1nJ">
                <node concept="2OqwBi" id="A3wmzsqT8L" role="ggXio">
                  <node concept="2rHscw" id="A3wmzsqT3w" role="2Oq$k0">
                    <ref role="2rHscx" node="7nrA7MosnvU" resolve="node" />
                  </node>
                  <node concept="2Iv5rx" id="A3wmzsqTWv" role="2OqNvi" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="A3wmzso$fe" role="gmrQt" />
    <node concept="2rzwqo" id="46tLIHjIcRq" role="gmrQt">
      <ref role="2rzwqp" node="7nrA7MosnvR" resolve="treeItem" />
      <node concept="2rzwrA" id="46tLIHjIdQ7" role="2rHO5H">
        <property role="TrG5h" value="project" />
        <node concept="3Tqbb2" id="46tLIHjIdQd" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:3uw$nPCBu_p" resolve="Project" />
        </node>
      </node>
      <node concept="gmrTC" id="46tLIHjIdQj" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.TreeItem2" />
        <node concept="rrkbs" id="46tLIHjIm4i" role="gn1nJ">
          <property role="TrG5h" value="moduleRef" />
          <node concept="2rDjb8" id="46tLIHjIm4j" role="rrkkB">
            <ref role="2rDjb1" node="7nrA7MosnvR" resolve="treeItem" />
            <node concept="2OqwBi" id="46tLIHjIm4k" role="2rDjb3">
              <node concept="rqPyE" id="46tLIHjIm4l" role="2Oq$k0">
                <ref role="rqPyD" node="46tLIHjIm4i" resolve="moduleRef" />
              </node>
              <node concept="3TrEf2" id="46tLIHjIm4m" role="2OqNvi">
                <ref role="3Tt5mk" to="jh6v:5100827PtfH" />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="46tLIHjIm4n" role="rrkk9">
            <node concept="2rHscw" id="46tLIHjIm4o" role="2Oq$k0">
              <ref role="2rHscx" node="46tLIHjIdQ7" resolve="project" />
            </node>
            <node concept="3Tsc0h" id="46tLIHjIm4p" role="2OqNvi">
              <ref role="3TtcxE" to="jh6v:3DfUugBU39C" />
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="46tLIHjIdQq" role="gn1nH">
          <property role="gn1nW" value="itemId" />
          <node concept="ghjhU" id="46tLIHjIdQr" role="gn1nU">
            <node concept="2OqwBi" id="A3wmzsojIl" role="ghjhc">
              <node concept="2OqwBi" id="A3wmzsojIm" role="2Oq$k0">
                <node concept="2YIFZM" id="A3wmzsojIn" role="2Oq$k0">
                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                  <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                  <node concept="2rHscw" id="A3wmzsojIo" role="37wK5m">
                    <ref role="2rHscx" node="46tLIHjIdQ7" resolve="project" />
                  </node>
                </node>
                <node concept="liA8E" id="A3wmzsojIp" role="2OqNvi">
                  <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                </node>
              </node>
              <node concept="liA8E" id="A3wmzsojIq" role="2OqNvi">
                <ref role="37wK5l" to="jks5:~INodeReference.serialize()" resolve="serialize" />
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="46tLIHjIdQv" role="gn1nH">
          <property role="gn1nW" value="label" />
          <node concept="ghjhU" id="46tLIHjIdQw" role="gn1nU">
            <node concept="2OqwBi" id="46tLIHjIjh3" role="ghjhc">
              <node concept="2rHscw" id="46tLIHjIiVq" role="2Oq$k0">
                <ref role="2rHscx" node="46tLIHjIdQ7" resolve="project" />
              </node>
              <node concept="3TrcHB" id="46tLIHjIjWV" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="7nrA7MosnvQ" role="gmrQt" />
    <node concept="2rzwqo" id="7nrA7Moss83" role="gmrQt">
      <ref role="2rzwqp" node="7nrA7MosnvR" resolve="treeItem" />
      <node concept="2rzwrA" id="7nrA7Mosspg" role="2rHO5H">
        <property role="TrG5h" value="module" />
        <node concept="3Tqbb2" id="7nrA7Mossph" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskf" resolve="Module" />
        </node>
      </node>
      <node concept="gmrTC" id="7nrA7Mosspk" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.TreeItem2" />
        <node concept="rrkbs" id="7nrA7MostPn" role="gn1nJ">
          <property role="TrG5h" value="model" />
          <node concept="2rDjb8" id="7nrA7Mosudm" role="rrkkB">
            <ref role="2rDjb1" node="7nrA7MosnvR" resolve="treeItem" />
            <node concept="rqPyE" id="7nrA7Mosum0" role="2rDjb3">
              <ref role="rqPyD" node="7nrA7MostPn" resolve="model" />
            </node>
          </node>
          <node concept="2OqwBi" id="7nrA7MostXV" role="rrkk9">
            <node concept="2rHscw" id="7nrA7MostPy" role="2Oq$k0">
              <ref role="2rHscx" node="7nrA7Mosspg" resolve="module" />
            </node>
            <node concept="3Tsc0h" id="7nrA7Mosua3" role="2OqNvi">
              <ref role="3TtcxE" to="jh6v:qmkA5fOski" resolve="models" />
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="7nrA7Mosspl" role="gn1nH">
          <property role="gn1nW" value="itemId" />
          <node concept="ghjhU" id="7nrA7Mosspm" role="gn1nU">
            <node concept="2OqwBi" id="A3wmzsoh5w" role="ghjhc">
              <node concept="2OqwBi" id="A3wmzsoh5x" role="2Oq$k0">
                <node concept="2YIFZM" id="A3wmzsoh5y" role="2Oq$k0">
                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                  <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                  <node concept="2rHscw" id="A3wmzsoh5z" role="37wK5m">
                    <ref role="2rHscx" node="7nrA7Mosspg" resolve="module" />
                  </node>
                </node>
                <node concept="liA8E" id="A3wmzsoh5$" role="2OqNvi">
                  <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                </node>
              </node>
              <node concept="liA8E" id="A3wmzsoh5_" role="2OqNvi">
                <ref role="37wK5l" to="jks5:~INodeReference.serialize()" resolve="serialize" />
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="7nrA7Mosspq" role="gn1nH">
          <property role="gn1nW" value="label" />
          <node concept="ghjhU" id="7nrA7Mosspr" role="gn1nU">
            <node concept="2OqwBi" id="7nrA7Mossps" role="ghjhc">
              <node concept="2rHscw" id="7nrA7Mosspt" role="2Oq$k0">
                <ref role="2rHscx" node="7nrA7Mosspg" resolve="module" />
              </node>
              <node concept="3TrcHB" id="7nrA7Mosspu" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="7nrA7MostbO" role="gmrQt" />
    <node concept="2rzwqo" id="7nrA7MossAm" role="gmrQt">
      <ref role="2rzwqp" node="7nrA7MosnvR" resolve="treeItem" />
      <node concept="2rzwrA" id="7nrA7MossAn" role="2rHO5H">
        <property role="TrG5h" value="model" />
        <node concept="3Tqbb2" id="7nrA7MossAo" role="2rzwqu">
          <ref role="ehGHo" to="jh6v:qmkA5fOskc" resolve="Model" />
        </node>
      </node>
      <node concept="gmrTC" id="7nrA7MossAp" role="2rHO5I">
        <property role="gmPZ6" value="mui.treeview.TreeItem2" />
        <node concept="rrkbs" id="7nrA7MosuxJ" role="gn1nJ">
          <property role="TrG5h" value="root" />
          <node concept="2rDjb8" id="7nrA7MosuMB" role="rrkkB">
            <ref role="2rDjb1" node="7nrA7MosnvR" resolve="treeItem" />
            <node concept="rqPyE" id="7nrA7MosuUP" role="2rDjb3">
              <ref role="rqPyD" node="7nrA7MosuxJ" resolve="root" />
            </node>
          </node>
          <node concept="2OqwBi" id="7nrA7MosuE2" role="rrkk9">
            <node concept="2rHscw" id="7nrA7MosuxU" role="2Oq$k0">
              <ref role="2rHscx" node="7nrA7MossAn" resolve="model" />
            </node>
            <node concept="3Tsc0h" id="7nrA7MosuJy" role="2OqNvi">
              <ref role="3TtcxE" to="jh6v:qmkA5fOskk" resolve="rootNodes" />
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="7nrA7MossAq" role="gn1nH">
          <property role="gn1nW" value="itemId" />
          <node concept="ghjhU" id="7nrA7MossAr" role="gn1nU">
            <node concept="2OqwBi" id="A3wmzsnOib" role="ghjhc">
              <node concept="2OqwBi" id="A3wmzsnOic" role="2Oq$k0">
                <node concept="2YIFZM" id="A3wmzsnOid" role="2Oq$k0">
                  <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                  <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                  <node concept="2rHscw" id="A3wmzsnOie" role="37wK5m">
                    <ref role="2rHscx" node="7nrA7MossAn" resolve="model" />
                  </node>
                </node>
                <node concept="liA8E" id="A3wmzsnOif" role="2OqNvi">
                  <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                </node>
              </node>
              <node concept="liA8E" id="A3wmzsnOig" role="2OqNvi">
                <ref role="37wK5l" to="jks5:~INodeReference.serialize()" resolve="serialize" />
              </node>
            </node>
          </node>
        </node>
        <node concept="gn1nE" id="7nrA7MossAv" role="gn1nH">
          <property role="gn1nW" value="label" />
          <node concept="rtYR_" id="A3wmzspK5O" role="gn1nU">
            <node concept="gmrTC" id="A3wmzspK6L" role="rtYRl">
              <property role="gmPZ6" value="mui.Stack" />
              <node concept="gn1nE" id="A3wmzspVCj" role="gn1nH">
                <property role="gn1nW" value="direction" />
                <node concept="ghjhU" id="A3wmzspVEa" role="gn1nU">
                  <node concept="Xl_RD" id="A3wmzspVE9" role="ghjhc">
                    <property role="Xl_RC" value="row" />
                  </node>
                </node>
              </node>
              <node concept="gn1nE" id="A3wmzspVFo" role="gn1nH">
                <property role="gn1nW" value="spacing" />
                <node concept="ghjhU" id="A3wmzspVHf" role="gn1nU">
                  <node concept="3b6qkQ" id="A3wmzsqr2h" role="ghjhc">
                    <property role="$nhwW" value="0.5" />
                  </node>
                </node>
              </node>
              <node concept="gmrTC" id="A3wmzspK7I" role="gn1nJ">
                <property role="gmPZ6" value="mui.icons.Warning" />
              </node>
              <node concept="gmrTC" id="A3wmzsq8mC" role="gn1nJ">
                <property role="gmPZ6" value="mui.Typography" />
                <node concept="ggXia" id="A3wmzspK7L" role="gn1nJ">
                  <node concept="2OqwBi" id="7nrA7MossAx" role="ggXio">
                    <node concept="2rHscw" id="7nrA7MossAy" role="2Oq$k0">
                      <ref role="2rHscx" node="7nrA7MossAn" resolve="module" />
                    </node>
                    <node concept="3TrcHB" id="7nrA7MossAz" role="2OqNvi">
                      <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
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
</model>

