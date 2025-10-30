<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:41b64586-29ed-47f5-b907-44be07261bbc(org.modelix.mps.react.structure)">
  <persistence version="9" />
  <languages>
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="1082978499127" name="jetbrains.mps.lang.structure.structure.ConstrainedDataTypeDeclaration" flags="ng" index="Az7Fb">
        <property id="1083066089218" name="constraint" index="FLfZY" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ" />
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
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
  <node concept="1TIwiD" id="7GLg2tFptr5">
    <property role="EcuMT" value="8876946878573696709" />
    <property role="TrG5h" value="ReactModule" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFqfQU" role="1TKVEi">
      <property role="IQ2ns" value="8876946878573903290" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="content" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
    <node concept="PrWs8" id="7GLg2tFqfQs" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFqfQu">
    <property role="EcuMT" value="8876946878573903262" />
    <property role="TrG5h" value="ConceptRenderer" />
    <property role="34LRSv" value="concept renderer" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFqfTv" role="1TKVEi">
      <property role="IQ2ns" value="8876946878573903455" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="components" />
      <property role="20lbJX" value="fLJekj6/_1__n" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="1TJgyj" id="7dm8yUsMfNE" role="1TKVEi">
      <property role="IQ2ns" value="8310867745953086698" />
      <property role="20kJfa" value="concept" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
    </node>
    <node concept="PrWs8" id="7GLg2tFqxL3" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
    <node concept="PrWs8" id="4Dhs5NioJuc" role="PzmwI">
      <ref role="PrY4T" node="4Dhs5NioJrd" resolve="IContextVariablesProvider" />
    </node>
  </node>
  <node concept="PlHQZ" id="7GLg2tFqfQG">
    <property role="EcuMT" value="8876946878573903276" />
    <property role="TrG5h" value="IReactModuleContent" />
  </node>
  <node concept="PlHQZ" id="7GLg2tFqfT1">
    <property role="EcuMT" value="8876946878573903425" />
    <property role="TrG5h" value="IReactComponent" />
  </node>
  <node concept="1TIwiD" id="7GLg2tFqfTf">
    <property role="EcuMT" value="8876946878573903439" />
    <property role="TrG5h" value="GenericReactComponent" />
    <property role="34LRSv" value="generic" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFrlna" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574187978" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="properties" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7GLg2tFrlnd" resolve="Property" />
    </node>
    <node concept="1TJgyj" id="7GLg2tFrln8" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574187976" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="children" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="1TJgyj" id="4Dhs5Nildlt" role="1TKVEi">
      <property role="IQ2ns" value="5355184975888307549" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="stateVariables" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="4Dhs5NildkH" resolve="StateVariable" />
    </node>
    <node concept="1TJgyi" id="7GLg2tFqxZx" role="1TKVEl">
      <property role="IQ2nx" value="8876946878573977569" />
      <property role="TrG5h" value="componentType" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="PrWs8" id="7GLg2tFqfTt" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="PrWs8" id="6Ddb4_fOXV5" role="PzmwI">
      <ref role="PrY4T" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
    </node>
    <node concept="PrWs8" id="fDKzOGAxnW" role="PzmwI">
      <ref role="PrY4T" node="fDKzOGAvlK" resolve="IGeneratesCustomHandlerBuilder" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFrlnd">
    <property role="EcuMT" value="8876946878574187981" />
    <property role="TrG5h" value="Property" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFrlnt" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574187997" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFt7hf" resolve="IPropertyValue" />
    </node>
    <node concept="1TJgyi" id="7GLg2tFrlnr" role="1TKVEl">
      <property role="IQ2nx" value="8876946878574187995" />
      <property role="TrG5h" value="propertyName" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFsmVl">
    <property role="EcuMT" value="8876946878574456533" />
    <property role="TrG5h" value="ChildrenComponent" />
    <property role="34LRSv" value="children" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFsmV_" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574456549" />
      <property role="20kJfa" value="link" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxE" resolve="LinkDeclaration" />
    </node>
    <node concept="PrWs8" id="7GLg2tFsmVz" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFsDiH">
    <property role="EcuMT" value="8876946878574531757" />
    <property role="TrG5h" value="TextComponent" />
    <property role="34LRSv" value="text" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFsDiZ" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574531775" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="7GLg2tFsDiV" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFsMII">
    <property role="EcuMT" value="8876946878574570414" />
    <property role="TrG5h" value="ComponentNodeExpression" />
    <property role="34LRSv" value="node" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
  </node>
  <node concept="PlHQZ" id="7GLg2tFt7hf">
    <property role="EcuMT" value="8876946878574654543" />
    <property role="TrG5h" value="IPropertyValue" />
  </node>
  <node concept="1TIwiD" id="7GLg2tFt7ht">
    <property role="EcuMT" value="8876946878574654557" />
    <property role="TrG5h" value="PrimitivePropertyValue" />
    <property role="34LRSv" value="primitive" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFt7hF" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574654571" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="7GLg2tFt7hH" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFt7hf" resolve="IPropertyValue" />
    </node>
    <node concept="PrWs8" id="7GLg2tFvHls" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFvHlb" resolve="IJsonValue" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFtr2m">
    <property role="EcuMT" value="8876946878574735510" />
    <property role="TrG5h" value="PropertyChangeHandler" />
    <property role="34LRSv" value="changeProperty" />
    <property role="3GE5qa" value="function" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFtsLs" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574742620" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="node" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="7GLg2tFtsLQ" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574742646" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFtsLA" resolve="JsCode" />
    </node>
    <node concept="1TJgyj" id="7GLg2tFtsLo" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574742616" />
      <property role="20kJfa" value="property" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
    </node>
    <node concept="PrWs8" id="7GLg2tFtr2$" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFtryt" resolve="IJsFunctionImplementation" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFtr2B">
    <property role="EcuMT" value="8876946878574735527" />
    <property role="TrG5h" value="JsFunctionPropertyValue" />
    <property role="34LRSv" value="function" />
    <property role="3GE5qa" value="function" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFtr37" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574735559" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameters" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7GLg2tFtr2R" resolve="JsFunctionParameter" />
    </node>
    <node concept="1TJgyj" id="7GLg2tFtryq" role="1TKVEi">
      <property role="IQ2ns" value="8876946878574737562" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="implementation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFtryt" resolve="IJsFunctionImplementation" />
    </node>
    <node concept="PrWs8" id="7GLg2tFtr2P" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFt7hf" resolve="IPropertyValue" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFtr2R">
    <property role="EcuMT" value="8876946878574735543" />
    <property role="TrG5h" value="JsFunctionParameter" />
    <property role="3GE5qa" value="function" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="7GLg2tFtr35" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="PlHQZ" id="7GLg2tFtryt">
    <property role="EcuMT" value="8876946878574737565" />
    <property role="TrG5h" value="IJsFunctionImplementation" />
    <property role="3GE5qa" value="function" />
  </node>
  <node concept="1TIwiD" id="7GLg2tFtsLA">
    <property role="EcuMT" value="8876946878574742630" />
    <property role="TrG5h" value="JsCode" />
    <property role="3GE5qa" value="function" />
    <property role="34LRSv" value="js" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="7GLg2tFtsLO" role="1TKVEl">
      <property role="IQ2nx" value="8876946878574742644" />
      <property role="TrG5h" value="code" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFvvvP">
    <property role="EcuMT" value="8876946878575278069" />
    <property role="TrG5h" value="JsonObjectValue" />
    <property role="34LRSv" value="object" />
    <property role="3GE5qa" value="object" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFvvx2" role="1TKVEi">
      <property role="IQ2ns" value="8876946878575278146" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="members" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7GLg2tFvvw5" resolve="JsonObjectMember" />
    </node>
    <node concept="PrWs8" id="7GLg2tFvvw3" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFt7hf" resolve="IPropertyValue" />
    </node>
    <node concept="PrWs8" id="7GLg2tFvHlp" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFvHlb" resolve="IJsonValue" />
    </node>
  </node>
  <node concept="1TIwiD" id="7GLg2tFvvw5">
    <property role="EcuMT" value="8876946878575278085" />
    <property role="3GE5qa" value="object" />
    <property role="TrG5h" value="JsonObjectMember" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7GLg2tFvvwl" role="1TKVEi">
      <property role="IQ2ns" value="8876946878575278101" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFvHlb" resolve="IJsonValue" />
    </node>
    <node concept="1TJgyi" id="7GLg2tFvvwj" role="1TKVEl">
      <property role="IQ2nx" value="8876946878575278099" />
      <property role="TrG5h" value="key" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="PlHQZ" id="7GLg2tFvHlb">
    <property role="EcuMT" value="8876946878575334731" />
    <property role="3GE5qa" value="object" />
    <property role="TrG5h" value="IJsonValue" />
  </node>
  <node concept="1TIwiD" id="7FW3vHxyY0u">
    <property role="EcuMT" value="8861973540082802718" />
    <property role="TrG5h" value="ComponentPropertyValue" />
    <property role="34LRSv" value="component" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7FW3vHxyY0I" role="1TKVEi">
      <property role="IQ2ns" value="8861973540082802734" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="component" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="PrWs8" id="7FW3vHxyY0G" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFt7hf" resolve="IPropertyValue" />
    </node>
  </node>
  <node concept="1TIwiD" id="1DfG1xprjRC">
    <property role="EcuMT" value="1895927586772303336" />
    <property role="TrG5h" value="JsonArray" />
    <property role="34LRSv" value="array" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1DfG1xprsHD" role="1TKVEi">
      <property role="IQ2ns" value="1895927586772339561" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="elements" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7GLg2tFvHlb" resolve="IJsonValue" />
    </node>
    <node concept="PrWs8" id="1DfG1xprsH$" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFt7hf" resolve="IPropertyValue" />
    </node>
    <node concept="PrWs8" id="1DfG1xprsHA" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFvHlb" resolve="IJsonValue" />
    </node>
  </node>
  <node concept="1TIwiD" id="1pvyisdcGJV">
    <property role="EcuMT" value="1612157992440089595" />
    <property role="TrG5h" value="ForEachComponent" />
    <property role="34LRSv" value="foreach" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1pvyisdcGK0" role="1TKVEi">
      <property role="IQ2ns" value="1612157992440089600" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="component" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="1TJgyj" id="1pvyisdcGKI" role="1TKVEi">
      <property role="IQ2ns" value="1612157992440089646" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="input" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="1pvyisdcGJW" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="PrWs8" id="1pvyisddlm0" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="PrWs8" id="4Dhs5NioM1P" role="PzmwI">
      <ref role="PrY4T" node="4Dhs5NioJrd" resolve="IContextVariablesProvider" />
    </node>
  </node>
  <node concept="1TIwiD" id="1pvyisddd6d">
    <property role="EcuMT" value="1612157992440222093" />
    <property role="TrG5h" value="ForEachInteratorVariableReference" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="1pvyisddd6e" role="1TKVEi">
      <property role="IQ2ns" value="1612157992440222094" />
      <property role="20kJfa" value="forEach" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1pvyisdcGJV" resolve="ForEachComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="2ti6llKMteA">
    <property role="EcuMT" value="2833354970324652966" />
    <property role="TrG5h" value="When" />
    <property role="34LRSv" value="when" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="2ti6llKMteF" role="1TKVEi">
      <property role="IQ2ns" value="2833354970324652971" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="cases" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="2ti6llKMteI" resolve="WhenCase" />
    </node>
    <node concept="1TJgyj" id="2ti6llKMteD" role="1TKVEi">
      <property role="IQ2ns" value="2833354970324652969" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="else" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="PrWs8" id="2ti6llKMteB" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="2ti6llKMteI">
    <property role="EcuMT" value="2833354970324652974" />
    <property role="TrG5h" value="WhenCase" />
    <property role="34LRSv" value="case" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="2ti6llKMteJ" role="1TKVEi">
      <property role="IQ2ns" value="2833354970324652975" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="condition" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="2ti6llKMteL" role="1TKVEi">
      <property role="IQ2ns" value="2833354970324652977" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="compnent" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="2ti6llKNqWf">
    <property role="EcuMT" value="2833354970324905743" />
    <property role="TrG5h" value="RenderNode" />
    <property role="34LRSv" value="render default" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="2ti6llKNqWi" role="1TKVEi">
      <property role="IQ2ns" value="2833354970324905746" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="nodeToRender" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="2ti6llKNqWg" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="4_K3r3dnx5v">
    <property role="EcuMT" value="5291744615171232095" />
    <property role="3GE5qa" value="function" />
    <property role="TrG5h" value="CustomHandler" />
    <property role="34LRSv" value="custom" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4_K3r3dn$YW" role="1TKVEi">
      <property role="IQ2ns" value="5291744615171248060" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="serverSideParameters" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="4_K3r3dnx5y" resolve="CustomHandlerParameter" />
    </node>
    <node concept="1TJgyj" id="4_K3r3dn$YY" role="1TKVEi">
      <property role="IQ2ns" value="5291744615171248062" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="body" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
    <node concept="PrWs8" id="4_K3r3dnx5w" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFtryt" resolve="IJsFunctionImplementation" />
    </node>
  </node>
  <node concept="1TIwiD" id="4_K3r3dnx5y">
    <property role="EcuMT" value="5291744615171232098" />
    <property role="3GE5qa" value="function" />
    <property role="TrG5h" value="CustomHandlerParameter" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4_K3r3dn$XV" role="1TKVEi">
      <property role="IQ2ns" value="5291744615171247995" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="value" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFtsLA" resolve="JsCode" />
    </node>
    <node concept="PrWs8" id="4_K3r3dnx5z" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhRRqR">
    <property role="EcuMT" value="5355184975880615607" />
    <property role="TrG5h" value="NamedRenderer" />
    <property role="3GE5qa" value="named-renderer" />
    <property role="34LRSv" value="named renderer" />
    <ref role="1TJDcQ" node="4Dhs5NhTz4H" resolve="NamedRendererBase" />
    <node concept="PrWs8" id="4Dhs5NhRRqS" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
    <node concept="PrWs8" id="4Dhs5NhRRqV" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhRRqU">
    <property role="EcuMT" value="5355184975880615610" />
    <property role="3GE5qa" value="named-renderer" />
    <property role="TrG5h" value="NamedRendererParameter" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4Dhs5NhRRr2" role="1TKVEi">
      <property role="IQ2ns" value="5355184975880615618" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1H" resolve="Type" />
    </node>
    <node concept="PrWs8" id="4Dhs5NhRRr0" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhRRr4">
    <property role="EcuMT" value="5355184975880615620" />
    <property role="3GE5qa" value="named-renderer" />
    <property role="TrG5h" value="NamedRendererOverload" />
    <property role="34LRSv" value="overload" />
    <ref role="1TJDcQ" node="4Dhs5NhTz4H" resolve="NamedRendererBase" />
    <node concept="1TJgyj" id="4Dhs5NhRRr5" role="1TKVEi">
      <property role="IQ2ns" value="5355184975880615621" />
      <property role="20kJfa" value="overloaded" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4Dhs5NhRRqR" resolve="NamedRenderer" />
    </node>
    <node concept="PrWs8" id="4Dhs5NhRRr7" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhTbdW">
    <property role="EcuMT" value="5355184975880958844" />
    <property role="3GE5qa" value="named-renderer" />
    <property role="TrG5h" value="NamedRendererParameterReference" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="4Dhs5NhTbdX" role="1TKVEi">
      <property role="IQ2ns" value="5355184975880958845" />
      <property role="20kJfa" value="decl" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4Dhs5NhRRqU" resolve="NamedRendererParameter" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhTz4H">
    <property role="EcuMT" value="5355184975881056557" />
    <property role="3GE5qa" value="named-renderer" />
    <property role="TrG5h" value="NamedRendererBase" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="4Dhs5NioMtG" role="PzmwI">
      <ref role="PrY4T" node="4Dhs5NioJrd" resolve="IContextVariablesProvider" />
    </node>
    <node concept="1TJgyj" id="4Dhs5NhTz4L" role="1TKVEi">
      <property role="IQ2ns" value="5355184975881056561" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameters" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="4Dhs5NhRRqU" resolve="NamedRendererParameter" />
    </node>
    <node concept="1TJgyj" id="4Dhs5NhTz4M" role="1TKVEi">
      <property role="IQ2ns" value="5355184975881056562" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="components" />
      <property role="20lbJX" value="fLJekj6/_1__n" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="PrWs8" id="4Dhs5NhTz4J" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhURAh">
    <property role="EcuMT" value="5355184975881402769" />
    <property role="3GE5qa" value="function" />
    <property role="TrG5h" value="CustomHandlerParameterReference" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="4Dhs5NhURAi" role="1TKVEi">
      <property role="IQ2ns" value="5355184975881402770" />
      <property role="20kJfa" value="decl" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4_K3r3dnx5y" resolve="CustomHandlerParameter" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NhX4ak">
    <property role="EcuMT" value="5355184975881978516" />
    <property role="3GE5qa" value="named-renderer" />
    <property role="TrG5h" value="CallNamedRenderer" />
    <property role="34LRSv" value="render named" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4Dhs5NhX4av" role="1TKVEi">
      <property role="IQ2ns" value="5355184975881978527" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameterValues" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="4Dhs5NhX4at" role="1TKVEi">
      <property role="IQ2ns" value="5355184975881978525" />
      <property role="20kJfa" value="renderer" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4Dhs5NhRRqR" resolve="NamedRenderer" />
    </node>
    <node concept="PrWs8" id="4Dhs5NhX4ar" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NildkH">
    <property role="EcuMT" value="5355184975888307501" />
    <property role="TrG5h" value="StateVariable" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4Dhs5NildkQ" role="1TKVEi">
      <property role="IQ2ns" value="5355184975888307510" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1H" resolve="Type" />
    </node>
    <node concept="1TJgyj" id="4Dhs5Nile3D" role="1TKVEi">
      <property role="IQ2ns" value="5355184975888310505" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="initializer" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="4Dhs5NildkO" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="4Dhs5NilDPI">
    <property role="EcuMT" value="5355184975888424302" />
    <property role="TrG5h" value="StateVariableReference" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="4Dhs5NilDPP" role="1TKVEi">
      <property role="IQ2ns" value="5355184975888424309" />
      <property role="20kJfa" value="decl" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4Dhs5NildkH" resolve="StateVariable" />
    </node>
  </node>
  <node concept="PlHQZ" id="4Dhs5NioJrd">
    <property role="EcuMT" value="5355184975889233613" />
    <property role="TrG5h" value="IContextVariablesProvider" />
  </node>
  <node concept="1TIwiD" id="1hCkroLrV86">
    <property role="EcuMT" value="1470515121291768326" />
    <property role="TrG5h" value="IncrementalPolymorhpicFunction" />
    <property role="3GE5qa" value="incrementalFunction" />
    <property role="34LRSv" value="function" />
    <ref role="1TJDcQ" node="1hCkroLrV8d" resolve="IncrementalPolymorhpicFunctionBase" />
    <node concept="1TJgyj" id="1hCkroLvL9s" role="1TKVEi">
      <property role="IQ2ns" value="1470515121292776028" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="returnType" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1H" resolve="Type" />
    </node>
    <node concept="PrWs8" id="1hCkroLrV8E" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1hCkroLrV87">
    <property role="EcuMT" value="1470515121291768327" />
    <property role="3GE5qa" value="incrementalFunction" />
    <property role="TrG5h" value="IncrementalPolymorhpicFunctionOverload" />
    <property role="34LRSv" value="function overload" />
    <ref role="1TJDcQ" node="1hCkroLrV8d" resolve="IncrementalPolymorhpicFunctionBase" />
    <node concept="1TJgyj" id="1hCkroLrV8C" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291768360" />
      <property role="20kJfa" value="overloaded" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1hCkroLrV86" resolve="IncrementalPolymorhpicFunction" />
    </node>
  </node>
  <node concept="1TIwiD" id="1hCkroLrV8c">
    <property role="EcuMT" value="1470515121291768332" />
    <property role="3GE5qa" value="incrementalFunction" />
    <property role="TrG5h" value="IncrementalPolymorhpicFunctionParameter" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1hCkroLsgra" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291855562" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1H" resolve="Type" />
    </node>
    <node concept="PrWs8" id="1hCkroLsgr8" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1hCkroLrV8d">
    <property role="EcuMT" value="1470515121291768333" />
    <property role="3GE5qa" value="incrementalFunction" />
    <property role="TrG5h" value="IncrementalPolymorhpicFunctionBase" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1hCkroLrV8$" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291768356" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="condition" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="1hCkroLrV8v" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291768351" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="body" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
    <node concept="1TJgyj" id="1hCkroLrV8x" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291768353" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameters" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="1hCkroLrV8c" resolve="IncrementalPolymorhpicFunctionParameter" />
    </node>
    <node concept="PrWs8" id="1hCkroLrV8e" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
    <node concept="PrWs8" id="fDKzOGAvlL" role="PzmwI">
      <ref role="PrY4T" node="fDKzOGAvlK" resolve="IGeneratesCustomHandlerBuilder" />
    </node>
  </node>
  <node concept="1TIwiD" id="1hCkroLrV8u">
    <property role="EcuMT" value="1470515121291768350" />
    <property role="3GE5qa" value="incrementalFunction" />
    <property role="TrG5h" value="IncrementalPolymorhpicFunctionParameterReference" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="1hCkroLxGy4" role="1TKVEi">
      <property role="IQ2ns" value="1470515121293281412" />
      <property role="20kJfa" value="decl" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1hCkroLrV8c" resolve="IncrementalPolymorhpicFunctionParameter" />
    </node>
  </node>
  <node concept="1TIwiD" id="1hCkroLrV8G">
    <property role="EcuMT" value="1470515121291768364" />
    <property role="3GE5qa" value="incrementalFunction" />
    <property role="TrG5h" value="IncrementalPolymorhpicFunctionCall" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="1hCkroLrV8J" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291768367" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameterValues" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="1hCkroLrV8H" role="1TKVEi">
      <property role="IQ2ns" value="1470515121291768365" />
      <property role="20kJfa" value="decl" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1hCkroLrV86" resolve="IncrementalPolymorhpicFunction" />
    </node>
  </node>
  <node concept="1TIwiD" id="425sFRq4c48">
    <property role="EcuMT" value="4649248350062821640" />
    <property role="TrG5h" value="CustomAction" />
    <property role="34LRSv" value="action" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="425sFRq4c49" role="1TKVEi">
      <property role="IQ2ns" value="4649248350062821641" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="label" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="425sFRq4c4b" role="1TKVEi">
      <property role="IQ2ns" value="4649248350062821643" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="body" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
  </node>
  <node concept="1TIwiD" id="425sFRq68vS">
    <property role="EcuMT" value="4649248350063331320" />
    <property role="TrG5h" value="CustomActionList" />
    <property role="34LRSv" value="action list" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="425sFRq68vT" role="1TKVEi">
      <property role="IQ2ns" value="4649248350063331321" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="actions" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="425sFRq4c48" resolve="CustomAction" />
    </node>
  </node>
  <node concept="1TIwiD" id="33yYwGTIcLv">
    <property role="EcuMT" value="3522652784677145695" />
    <property role="TrG5h" value="NullComponent" />
    <property role="34LRSv" value="null" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="33yYwGTIcLw" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="7gSxYrNaHs4">
    <property role="EcuMT" value="8374592933087336196" />
    <property role="TrG5h" value="IfComp" />
    <property role="34LRSv" value="if" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="7gSxYrNaHs5" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
    <node concept="1TJgyj" id="7gSxYrNaHs6" role="1TKVEi">
      <property role="IQ2ns" value="8374592933087336198" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="condition" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="7gSxYrNaHs7" role="1TKVEi">
      <property role="IQ2ns" value="8374592933087336199" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="child" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7GLg2tFqfT1" resolve="IReactComponent" />
    </node>
  </node>
  <node concept="1TIwiD" id="G39ofDwxCj">
    <property role="EcuMT" value="793519207835900435" />
    <property role="TrG5h" value="EmptyContent" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="G39ofDwydI" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
  </node>
  <node concept="PlHQZ" id="fDKzOGAvlK">
    <property role="EcuMT" value="281970019684447600" />
    <property role="TrG5h" value="IGeneratesCustomHandlerBuilder" />
  </node>
  <node concept="1TIwiD" id="6eUjE42h0Dj">
    <property role="EcuMT" value="7186142608857762387" />
    <property role="TrG5h" value="Page" />
    <property role="19KtqR" value="true" />
    <property role="3GE5qa" value="pages" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="1TJgyj" id="6eUjE42iNFO" role="1TKVEi">
      <property role="IQ2ns" value="7186142608858233588" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="path" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="6eUjE42hlnc" resolve="PagePath" />
    </node>
    <node concept="1TJgyj" id="6eUjE42h0Dp" role="1TKVEi">
      <property role="IQ2ns" value="7186142608857762393" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameters" />
      <ref role="20lvS9" node="6eUjE42h0Dn" resolve="PageParameter" />
    </node>
    <node concept="1TJgyj" id="6eUjE42h4bI" role="1TKVEi">
      <property role="IQ2ns" value="7186142608857776878" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="content" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4Dhs5NhX4ak" resolve="CallNamedRenderer" />
    </node>
    <node concept="PrWs8" id="6eUjE42oUvM" role="PzmwI">
      <ref role="PrY4T" node="7GLg2tFqfQG" resolve="IReactModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="6eUjE42h0Dn">
    <property role="EcuMT" value="7186142608857762391" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="PageParameter" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="1TJgyj" id="6eUjE42h0Dr" role="1TKVEi">
      <property role="IQ2ns" value="7186142608857762395" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="6eUjE42h0Dq" resolve="IPageParameterType" />
    </node>
    <node concept="PrWs8" id="6eUjE42h0Do" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="PlHQZ" id="6eUjE42h0Dq">
    <property role="EcuMT" value="7186142608857762394" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="IPageParameterType" />
  </node>
  <node concept="1TIwiD" id="6eUjE42h5St">
    <property role="EcuMT" value="7186142608857783837" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="ContextRepositoryExpression" />
    <property role="34LRSv" value="repository" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
  </node>
  <node concept="1TIwiD" id="6eUjE42hlnc">
    <property role="EcuMT" value="7186142608857847244" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="PagePath" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="1TJgyj" id="6eUjE42hnWE" role="1TKVEi">
      <property role="IQ2ns" value="7186142608857857834" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parts" />
      <property role="20lbJX" value="fLJekj6/_1__n" />
      <ref role="20lvS9" node="6eUjE42hlne" resolve="IPagePathPart" />
    </node>
  </node>
  <node concept="PlHQZ" id="6eUjE42hlne">
    <property role="TrG5h" value="IPagePathPart" />
    <property role="3GE5qa" value="pages" />
    <property role="EcuMT" value="7186142608857847245" />
  </node>
  <node concept="1TIwiD" id="6eUjE42hnW_">
    <property role="EcuMT" value="7186142608857857829" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="StaticPagePathPart" />
    <property role="34LRSv" value="&quot;" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="1TJgyi" id="6eUjE42hnWA" role="1TKVEl">
      <property role="IQ2nx" value="7186142608857857830" />
      <property role="TrG5h" value="value" />
      <ref role="AX2Wp" node="6eUjE42j1Hl" resolve="URLCharacters" />
    </node>
    <node concept="PrWs8" id="6eUjE42iPwy" role="PzmwI">
      <ref role="PrY4T" node="6eUjE42hlne" resolve="IPagePathPart" />
    </node>
  </node>
  <node concept="1TIwiD" id="6eUjE42hnWB">
    <property role="EcuMT" value="7186142608857857831" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="VariablePagePathPart" />
    <property role="34LRSv" value="{" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="PrWs8" id="6eUjE42hnWD" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="PrWs8" id="6eUjE42iPwx" role="PzmwI">
      <ref role="PrY4T" node="6eUjE42hlne" resolve="IPagePathPart" />
    </node>
  </node>
  <node concept="Az7Fb" id="6eUjE42j1Hl">
    <property role="3F6X1D" value="7186142608858291029" />
    <property role="3GE5qa" value="pages" />
    <property role="TrG5h" value="URLCharacters" />
    <property role="FLfZY" value="[a-z][a-z\\-0-9]*" />
  </node>
</model>

