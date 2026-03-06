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
    <import index="6zt5" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.mps.multiplatform.model(org.modelix.mps.editor.common.stubs/)" />
    <import index="jks5" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.api(org.modelix.mps.editor.common.stubs/)" implicit="true" />
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
      <concept id="8876946878573696709" name="org.modelix.mps.react.structure.ReactModule" flags="ng" index="gl9ry">
        <child id="8876946878573903290" name="content" index="gmrQt" />
      </concept>
      <concept id="8876946878573903439" name="org.modelix.mps.react.structure.GenericReactComponent" flags="ng" index="gmrTC">
        <property id="8876946878573977569" name="componentType" index="gmPZ6" />
        <child id="8876946878574187978" name="properties" index="gn1nH" />
        <child id="8876946878574187976" name="children" index="gn1nJ" />
      </concept>
      <concept id="8876946878574187981" name="org.modelix.mps.react.structure.Property" flags="ng" index="gn1nE">
        <property id="8876946878574187995" name="propertyName" index="gn1nW" />
        <child id="8876946878574187997" name="value" index="gn1nU" />
      </concept>
      <concept id="1612157992440222093" name="org.modelix.mps.react.structure.ForEachInteratorVariableReference" flags="ng" index="rqPyE">
        <reference id="1612157992440222094" name="forEach" index="rqPyD" />
      </concept>
      <concept id="1612157992440089595" name="org.modelix.mps.react.structure.ForEachComponent" flags="ng" index="rrkbs">
        <child id="1612157992440089646" name="input" index="rrkk9" />
        <child id="1612157992440089600" name="component" index="rrkkB" />
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
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
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
      <concept id="8329979535468945057" name="jetbrains.mps.lang.smodel.structure.Node_PresentationOperation" flags="ng" index="2Iv5rx" />
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
    <node concept="3ywjYg" id="szQzwtjNz4" role="gmrQt" />
    <node concept="2rzwrF" id="szQzwto0YX" role="gmrQt">
      <property role="TrG5h" value="textEditorForRef" />
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
      <node concept="2rDjb8" id="szQzwto1zk" role="2rHO5I">
        <ref role="2rDjb1" node="szQzwtjNz5" resolve="textEditor" />
        <node concept="2OqwBi" id="szQzwtog5T" role="2rDjb3">
          <node concept="2OqwBi" id="szQzwtodj2" role="2Oq$k0">
            <node concept="2OqwBi" id="szQzwto8fl" role="2Oq$k0">
              <node concept="2OqwBi" id="szQzwto53e" role="2Oq$k0">
                <node concept="2rHscw" id="szQzwto4zN" role="2Oq$k0">
                  <ref role="2rHscx" node="szQzwto4vi" resolve="repository" />
                </node>
                <node concept="3Tsc0h" id="szQzwto5Gz" role="2OqNvi">
                  <ref role="3TtcxE" to="jh6v:qmkA5fOskn" resolve="modules" />
                </node>
              </node>
              <node concept="13MTOL" id="szQzwtoaDQ" role="2OqNvi">
                <ref role="13MTZf" to="jh6v:qmkA5fOski" resolve="models" />
              </node>
            </node>
            <node concept="13MTOL" id="szQzwtoeQo" role="2OqNvi">
              <ref role="13MTZf" to="jh6v:qmkA5fOskk" resolve="rootNodes" />
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
    <node concept="3ywjYg" id="szQzwto0vE" role="gmrQt" />
    <node concept="2rzwrF" id="szQzwtjNz5" role="gmrQt">
      <property role="TrG5h" value="textEditor" />
      <node concept="2rzwrA" id="szQzwtjNz6" role="2rHO5H">
        <property role="TrG5h" value="rootNode" />
        <node concept="3Tqbb2" id="szQzwtjNz7" role="2rzwqu">
          <ref role="ehGHo" to="tpck:gw2VY9q" resolve="BaseConcept" />
        </node>
      </node>
      <node concept="gmrTC" id="szQzwtjNz8" role="2rHO5I">
        <property role="gmPZ6" value="html.div" />
        <node concept="gmrTC" id="szQzwtoIfX" role="gn1nJ">
          <property role="gmPZ6" value="html.div" />
          <node concept="ggXia" id="szQzwtoIfZ" role="gn1nJ">
            <node concept="3cpWs3" id="szQzwtoJn9" role="ggXio">
              <node concept="2OqwBi" id="szQzwtoJGH" role="3uHU7w">
                <node concept="2rHscw" id="szQzwtoJnh" role="2Oq$k0">
                  <ref role="2rHscx" node="szQzwtjNz6" resolve="rootNode" />
                </node>
                <node concept="2Iv5rx" id="szQzwtoKaX" role="2OqNvi" />
              </node>
              <node concept="Xl_RD" id="szQzwtoIB6" role="3uHU7B">
                <property role="Xl_RC" value="Text editor for " />
              </node>
            </node>
          </node>
        </node>
        <node concept="gmrTC" id="szQzwtoNwN" role="gn1nJ">
          <property role="gmPZ6" value="html.br" />
        </node>
        <node concept="gmrTC" id="szQzwtoAru" role="gn1nJ">
          <property role="gmPZ6" value="modelix.TextEditor" />
          <node concept="gn1nE" id="szQzwtoBY$" role="gn1nH">
            <property role="gn1nW" value="nodeRef" />
            <node concept="ghjhU" id="szQzwtoC1l" role="gn1nU">
              <node concept="3cpWs3" id="szQzwtoCLT" role="ghjhc">
                <node concept="Xl_RD" id="szQzwtoC1k" role="3uHU7B">
                  <property role="Xl_RC" value="" />
                </node>
                <node concept="2OqwBi" id="2Im8FsM5CXv" role="3uHU7w">
                  <node concept="2YIFZM" id="2Im8FsM5rK4" role="2Oq$k0">
                    <ref role="37wK5l" to="zxfz:~MPSReferencesKt.toModelix(org.jetbrains.mps.openapi.model.SNodeReference)" resolve="toModelix" />
                    <ref role="1Pybhc" to="zxfz:~MPSReferencesKt" resolve="MPSReferencesKt" />
                    <node concept="2OqwBi" id="szQzwtoDkx" role="37wK5m">
                      <node concept="2rHscw" id="szQzwtoCYy" role="2Oq$k0">
                        <ref role="2rHscx" node="szQzwtjNz6" resolve="rootNode" />
                      </node>
                      <node concept="iZEcu" id="szQzwtoDJh" role="2OqNvi" />
                    </node>
                  </node>
                  <node concept="liA8E" id="2Im8FsM5DHh" role="2OqNvi">
                    <ref role="37wK5l" to="6zt5:~MPSNodeReference.serialize()" resolve="serialize" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3ywjYg" id="szQzwtjNzn" role="gmrQt" />
  </node>
</model>

