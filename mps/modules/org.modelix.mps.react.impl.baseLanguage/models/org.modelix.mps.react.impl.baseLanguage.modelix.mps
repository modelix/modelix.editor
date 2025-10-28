<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:df59f69d-9a55-4dca-91f0-e1520e09c6d5(org.modelix.mps.react.impl.baseLanguage.modelix)">
  <persistence version="9" />
  <languages>
    <use id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="1ut2" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.mpsadapters.tomps(org.modelix.mps.editor.common.stubs/)" />
    <import index="jks5" ref="208eaf68-fd3a-497a-a4b6-4923ff457c3b/java:org.modelix.model.api(org.modelix.mps.editor.common.stubs/)" implicit="true" />
  </imports>
  <registry>
    <language id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react">
      <concept id="8876946878574570414" name="org.modelix.mps.react.structure.ComponentNodeExpression" flags="ng" index="ggAI9" />
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
      <concept id="8876946878573903262" name="org.modelix.mps.react.structure.ConceptRenderer" flags="ng" index="gmrQT">
        <reference id="8310867745953086698" name="concept" index="3JBHV4" />
        <child id="8876946878573903455" name="components" index="gmrTS" />
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
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
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
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="gl9ry" id="7GLg2tFqtQD">
    <property role="TrG5h" value="react.baseLanguage" />
    <node concept="gmrQT" id="1DfG1xprj3z" role="gmrQt">
      <ref role="3JBHV4" to="tpee:fz12cDA" resolve="ClassConcept" />
      <node concept="gmrTC" id="1DfG1xprj6c" role="gmrTS">
        <property role="gmPZ6" value="html.div" />
        <node concept="gn1nE" id="5V0cDfz3oIQ" role="gn1nH">
          <property role="gn1nW" value="style" />
          <node concept="gjbvi" id="5V0cDfz3oLt" role="gn1nU">
            <node concept="gjbwy" id="5V0cDfz3oLw" role="gjbx_">
              <property role="gjbwO" value="display" />
              <node concept="ghjhU" id="5V0cDfz3oL_" role="gjbwM">
                <node concept="Xl_RD" id="5V0cDfz3oL$" role="ghjhc">
                  <property role="Xl_RC" value="flex" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="gmrTC" id="67j$1x53I$4" role="gn1nJ">
          <property role="gmPZ6" value="mui.Card" />
          <node concept="gn1nE" id="5V0cDfz3FkS" role="gn1nH">
            <property role="gn1nW" value="style" />
            <node concept="gjbvi" id="5V0cDfz3Fnv" role="gn1nU">
              <node concept="gjbwy" id="5V0cDfz3Fny" role="gjbx_">
                <property role="gjbwO" value="margin" />
                <node concept="ghjhU" id="5V0cDfz3FnB" role="gjbwM">
                  <node concept="Xl_RD" id="5V0cDfz3FnA" role="ghjhc">
                    <property role="Xl_RC" value="20px" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="gmrTC" id="5V0cDfz3An3" role="gn1nJ">
            <property role="gmPZ6" value="mui.CardContent" />
            <node concept="gmrTC" id="67j$1x53Gje" role="gn1nJ">
              <property role="gmPZ6" value="modelix.ImageBasedEditor" />
              <node concept="gn1nE" id="67j$1x53Gjh" role="gn1nH">
                <property role="gn1nW" value="nodeRef" />
                <node concept="ghjhU" id="67j$1x53Gjm" role="gn1nU">
                  <node concept="2OqwBi" id="67j$1x53Imj" role="ghjhc">
                    <node concept="2OqwBi" id="67j$1x53Gqm" role="2Oq$k0">
                      <node concept="2YIFZM" id="67j$1x53Gjw" role="2Oq$k0">
                        <ref role="37wK5l" to="1ut2:~ModelixNodeAsMPSNode.toModelixNode(org.jetbrains.mps.openapi.model.SNode)" resolve="toModelixNode" />
                        <ref role="1Pybhc" to="1ut2:~ModelixNodeAsMPSNode" resolve="ModelixNodeAsMPSNode" />
                        <node concept="ggAI9" id="67j$1x53GjD" role="37wK5m" />
                      </node>
                      <node concept="liA8E" id="67j$1x53Icl" role="2OqNvi">
                        <ref role="37wK5l" to="jks5:~INode.getReference()" resolve="getReference" />
                      </node>
                    </node>
                    <node concept="liA8E" id="67j$1x53Ix0" role="2OqNvi">
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
  </node>
</model>

