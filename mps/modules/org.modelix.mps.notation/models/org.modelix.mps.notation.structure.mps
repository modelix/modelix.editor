<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:37580d55-803b-40f6-8108-d95a9fce8d6e(org.modelix.mps.notation.structure)">
  <persistence version="9" />
  <languages>
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" />
    <import index="hcm8" ref="r:72a7bf00-0175-42ca-b99b-fe8519b6a16f(jetbrains.mps.kotlin.structure)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="7862711839422615209" name="jetbrains.mps.lang.structure.structure.DocumentedNodeAnnotation" flags="ng" index="t5JxF">
        <property id="7862711839422615217" name="text" index="t5JxN" />
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
      <concept id="8842732777748464990" name="jetbrains.mps.lang.structure.structure.RefPresentationTemplate" flags="ng" index="ROjv2" />
      <concept id="8842732777748207592" name="jetbrains.mps.lang.structure.structure.SmartReferenceAttribute" flags="ng" index="RPilO">
        <reference id="8842732777748207597" name="charactersticReference" index="RPilL" />
        <child id="8842732777748474935" name="refPresentationTemplate" index="ROhUF" />
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
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="7dm8yUsM9Ro">
    <property role="EcuMT" value="8310867745953062360" />
    <property role="TrG5h" value="NotationModule" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7dm8yUsMfq9" role="1TKVEi">
      <property role="IQ2ns" value="8310867745953085065" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="content" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7dm8yUsMflU" resolve="INotationModuleContent" />
    </node>
    <node concept="PrWs8" id="7dm8yUsMfwV" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="PlHQZ" id="7dm8yUsMflU">
    <property role="EcuMT" value="8310867745953084794" />
    <property role="TrG5h" value="INotationModuleContent" />
  </node>
  <node concept="1TIwiD" id="7dm8yUsMf_c">
    <property role="EcuMT" value="8310867745953085772" />
    <property role="TrG5h" value="EmptyLine" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="7dm8yUsMfEi" role="PzmwI">
      <ref role="PrY4T" node="7dm8yUsMflU" resolve="INotationModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="7dm8yUsMfHH">
    <property role="EcuMT" value="8310867745953086317" />
    <property role="TrG5h" value="ConceptNotation" />
    <property role="34LRSv" value="notation" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="1zXwHaHuRnq" role="1TKVEl">
      <property role="IQ2nx" value="1800739267383358938" />
      <property role="TrG5h" value="applicableToSubconcepts" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyj" id="7dm8yUsMfYJ" role="1TKVEi">
      <property role="IQ2ns" value="8310867745953087407" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="cell" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7dm8yUsMxhg" resolve="ICell" />
    </node>
    <node concept="1TJgyj" id="7dm8yUsMfZC" role="1TKVEi">
      <property role="IQ2ns" value="8310867745953087464" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="condition" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="7dm8yUsMfNE" role="1TKVEi">
      <property role="IQ2ns" value="8310867745953086698" />
      <property role="20kJfa" value="concept" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
    </node>
    <node concept="PrWs8" id="7dm8yUsMfLW" role="PzmwI">
      <ref role="PrY4T" node="7dm8yUsMflU" resolve="INotationModuleContent" />
    </node>
  </node>
  <node concept="PlHQZ" id="7dm8yUsMxhg">
    <property role="EcuMT" value="8310867745953158224" />
    <property role="TrG5h" value="ICell" />
  </node>
  <node concept="1TIwiD" id="7dm8yUsMxrq">
    <property role="EcuMT" value="8310867745953158874" />
    <property role="TrG5h" value="ConstantCell" />
    <property role="34LRSv" value="&quot;" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyi" id="7dm8yUsMxD1" role="1TKVEl">
      <property role="IQ2nx" value="8310867745953159745" />
      <property role="TrG5h" value="text" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="7dm8yUsMxww">
    <property role="EcuMT" value="8310867745953159200" />
    <property role="TrG5h" value="Cell" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="7dm8yUsMxzU" role="PzmwI">
      <ref role="PrY4T" node="7dm8yUsMxhg" resolve="ICell" />
    </node>
  </node>
  <node concept="1TIwiD" id="CUW2QYKJtX">
    <property role="EcuMT" value="737165568293140349" />
    <property role="TrG5h" value="StaticCollectionCell" />
    <property role="34LRSv" value="[" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="CUW2QYKJ$J" role="1TKVEi">
      <property role="IQ2ns" value="737165568293140783" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="cells" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7dm8yUsMxhg" resolve="ICell" />
    </node>
    <node concept="1TJgyj" id="CUW2QYKL5L" role="1TKVEi">
      <property role="IQ2ns" value="737165568293146993" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="layout" />
      <ref role="20lvS9" node="CUW2QYKK2t" resolve="CollectionLayout" />
    </node>
  </node>
  <node concept="1TIwiD" id="CUW2QYKK2t">
    <property role="EcuMT" value="737165568293142685" />
    <property role="TrG5h" value="CollectionLayout" />
    <property role="R5$K7" value="true" />
    <property role="3GE5qa" value="layout" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
  <node concept="1TIwiD" id="CUW2QYKK8o">
    <property role="EcuMT" value="737165568293143064" />
    <property role="TrG5h" value="HorizontalLayout" />
    <property role="34LRSv" value="horizontal" />
    <property role="3GE5qa" value="layout" />
    <ref role="1TJDcQ" node="CUW2QYKK2t" resolve="CollectionLayout" />
  </node>
  <node concept="1TIwiD" id="CUW2QYKKdt">
    <property role="EcuMT" value="737165568293143389" />
    <property role="TrG5h" value="VerticalLayout" />
    <property role="34LRSv" value="vertical" />
    <property role="3GE5qa" value="layout" />
    <ref role="1TJDcQ" node="CUW2QYKK2t" resolve="CollectionLayout" />
  </node>
  <node concept="1TIwiD" id="CUW2QYKUUq">
    <property role="EcuMT" value="737165568293187226" />
    <property role="TrG5h" value="PropertyCell" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="CUW2QYKUZw" role="1TKVEi">
      <property role="IQ2ns" value="737165568293187552" />
      <property role="20kJfa" value="property" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
    </node>
    <node concept="1TJgyi" id="f1Ei69rzUi" role="1TKVEl">
      <property role="IQ2nx" value="270683414123658898" />
      <property role="TrG5h" value="regex" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="CUW2QYMiki">
    <property role="EcuMT" value="737165568293545234" />
    <property role="TrG5h" value="ChildrenCollectionCell" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyi" id="CUW2QYMiCG" role="1TKVEl">
      <property role="IQ2nx" value="737165568293546540" />
      <property role="TrG5h" value="separator" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyj" id="CUW2QYMipn" role="1TKVEi">
      <property role="IQ2ns" value="737165568293545559" />
      <property role="20kJfa" value="link" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxE" resolve="LinkDeclaration" />
    </node>
    <node concept="1TJgyj" id="CUW2QYMiut" role="1TKVEi">
      <property role="IQ2ns" value="737165568293545885" />
      <property role="20kJfa" value="subconceptToInsert" />
      <ref role="20lvS9" to="tpce:h0PkWnZ" resolve="AbstractConceptDeclaration" />
    </node>
    <node concept="1TJgyj" id="CUW2QYMi$q" role="1TKVEi">
      <property role="IQ2ns" value="737165568293546266" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="layout" />
      <ref role="20lvS9" node="CUW2QYKK2t" resolve="CollectionLayout" />
    </node>
    <node concept="1TJgyj" id="6xJrM0NrOsd" role="1TKVEi">
      <property role="IQ2ns" value="7525355686451955469" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="separatorCell" />
      <ref role="20lvS9" node="7dm8yUsMxww" resolve="Cell" />
    </node>
    <node concept="RPilO" id="CUW2QYMjoG" role="lGtFl">
      <ref role="RPilL" node="CUW2QYMipn" resolve="link" />
      <node concept="ROjv2" id="CUW2QYMjrg" role="ROhUF" />
    </node>
  </node>
  <node concept="1TIwiD" id="CUW2QYMXaO">
    <property role="EcuMT" value="737165568293720756" />
    <property role="TrG5h" value="IndentCell" />
    <property role="34LRSv" value="--&gt;" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
  </node>
  <node concept="1TIwiD" id="CUW2QYOmUP">
    <property role="EcuMT" value="737165568294088373" />
    <property role="TrG5h" value="WithIndentCell" />
    <property role="34LRSv" value="indented" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="CUW2QYOnl8" role="1TKVEi">
      <property role="IQ2ns" value="737165568294090056" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="cells" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="7dm8yUsMxhg" resolve="ICell" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhE_FoM">
    <property role="EcuMT" value="635805674430182962" />
    <property role="TrG5h" value="ConceptAliasCell" />
    <property role="34LRSv" value="alias" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
  </node>
  <node concept="1TIwiD" id="ziPuhE_FoY">
    <property role="EcuMT" value="635805674430182974" />
    <property role="TrG5h" value="BL_ExpressionCell" />
    <property role="34LRSv" value="*(" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="ziPuhE_Fp2" role="1TKVEi">
      <property role="IQ2ns" value="635805674430182978" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="expression" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhE_FrH">
    <property role="EcuMT" value="635805674430183149" />
    <property role="TrG5h" value="FlagCell" />
    <property role="34LRSv" value="flag" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="ziPuhE_FrT" role="1TKVEi">
      <property role="IQ2ns" value="635805674430183161" />
      <property role="20kJfa" value="property" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxF" resolve="PropertyDeclaration" />
    </node>
    <node concept="1TJgyi" id="ziPuhE_FrL" role="1TKVEl">
      <property role="IQ2nx" value="635805674430183153" />
      <property role="TrG5h" value="text" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="ziPuhE_FrO" role="1TKVEl">
      <property role="IQ2nx" value="635805674430183156" />
      <property role="TrG5h" value="inverted" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhE_TwU">
    <property role="EcuMT" value="635805674430240826" />
    <property role="TrG5h" value="KT_NotationNodeExpression" />
    <property role="34LRSv" value="_" />
    <property role="3GE5qa" value="expressions" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="ziPuhE_TwW" role="PzmwI">
      <ref role="PrY4T" to="hcm8:2yYXHtl6Jjg" resolve="IExpression" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhE_VbT">
    <property role="EcuMT" value="635805674430247673" />
    <property role="TrG5h" value="OptionalCell" />
    <property role="34LRSv" value="?" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="ziPuhE_VbX" role="1TKVEi">
      <property role="IQ2ns" value="635805674430247677" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="cell" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="7dm8yUsMxhg" resolve="ICell" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhEA2a_">
    <property role="EcuMT" value="635805674430276261" />
    <property role="TrG5h" value="ReferenceCell" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="22f9nDgMtfW" role="1TKVEi">
      <property role="IQ2ns" value="2346135138154959868" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="renderTarget" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="ziPuhEA2aC" role="1TKVEi">
      <property role="IQ2ns" value="635805674430276264" />
      <property role="20kJfa" value="link" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxE" resolve="LinkDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhEA4oz">
    <property role="EcuMT" value="635805674430285347" />
    <property role="TrG5h" value="RemoveSpace" />
    <property role="34LRSv" value="&gt;&lt;" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="ziPuhEA4o_" role="PzmwI">
      <ref role="PrY4T" node="7dm8yUsMxhg" resolve="ICell" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhEA4oI">
    <property role="EcuMT" value="635805674430285358" />
    <property role="TrG5h" value="SingleChildCell" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyj" id="ziPuhEA4oM" role="1TKVEi">
      <property role="IQ2ns" value="635805674430285362" />
      <property role="20kJfa" value="link" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpce:f_TJgxE" resolve="LinkDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="ziPuhEAsOy">
    <property role="EcuMT" value="635805674430385442" />
    <property role="TrG5h" value="SubstituteCell" />
    <property role="34LRSv" value="substitute" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
    <node concept="1TJgyi" id="ziPuhEAsOB" role="1TKVEl">
      <property role="IQ2nx" value="635805674430385447" />
      <property role="TrG5h" value="text" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="t5JxF" id="ziPuhEAsOz" role="lGtFl">
      <property role="t5JxN" value="Specified the text used in the code completion menu when creating the concept" />
    </node>
  </node>
  <node concept="1TIwiD" id="4dQjfTHYohE">
    <property role="EcuMT" value="4861157503443502186" />
    <property role="TrG5h" value="NewLineCell" />
    <property role="34LRSv" value="\n" />
    <ref role="1TJDcQ" node="7dm8yUsMxww" resolve="Cell" />
  </node>
  <node concept="1TIwiD" id="22f9nDgNr2y">
    <property role="EcuMT" value="2346135138155212962" />
    <property role="TrG5h" value="BL_NotationNodeExpression" />
    <property role="34LRSv" value="_" />
    <property role="3GE5qa" value="expressions" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
  </node>
  <node concept="1TIwiD" id="22f9nDgOIIh">
    <property role="EcuMT" value="2346135138155555729" />
    <property role="TrG5h" value="BL_ReferenceTargetExpression" />
    <property role="3GE5qa" value="expressions" />
    <property role="34LRSv" value="target" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
  </node>
</model>

