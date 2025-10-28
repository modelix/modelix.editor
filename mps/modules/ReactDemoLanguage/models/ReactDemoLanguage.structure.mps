<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1570828e-e9a4-47ff-95d9-80c800704647(ReactDemoLanguage.structure)">
  <persistence version="9" />
  <languages>
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
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
  <node concept="1TIwiD" id="2CeLAhmF5rC">
    <property role="EcuMT" value="3030577733520086760" />
    <property role="TrG5h" value="ReactRoot" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="2vPZMAmue7o" role="1TKVEi">
      <property role="IQ2ns" value="2879488090856546776" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="elements" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="2vPZMAmue7m" resolve="Element" />
    </node>
    <node concept="PrWs8" id="2vPZMAn2brr" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="2vPZMAmue7m">
    <property role="EcuMT" value="2879488090856546774" />
    <property role="TrG5h" value="Element" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="2vPZMAmue7n" role="1TKVEl">
      <property role="IQ2nx" value="2879488090856546775" />
      <property role="TrG5h" value="label" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="2vPZMAnpuJg">
    <property role="EcuMT" value="2879488090872081360" />
    <property role="TrG5h" value="TreeNode" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="2vPZMAnpuJh" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="2vPZMAnpuJi" role="1TKVEi">
      <property role="IQ2ns" value="2879488090872081362" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="children" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="2vPZMAnpuJg" resolve="TreeNode" />
    </node>
    <node concept="1TJgyi" id="2vPZMAnR$xd" role="1TKVEl">
      <property role="IQ2nx" value="2879488090879969357" />
      <property role="TrG5h" value="a" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="2vPZMAoMgd3" role="1TKVEl">
      <property role="IQ2nx" value="2879488090895352643" />
      <property role="TrG5h" value="b" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="2vPZMAnU5R$">
    <property role="EcuMT" value="2879488090880630244" />
    <property role="TrG5h" value="ReadOrEdit" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="2vPZMAnWa4r" role="1TKVEl">
      <property role="IQ2nx" value="2879488090881171739" />
      <property role="TrG5h" value="a" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="2vPZMAnWa4s" role="1TKVEl">
      <property role="IQ2nx" value="2879488090881171740" />
      <property role="TrG5h" value="b" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="2vPZMAnWa4t" role="1TKVEl">
      <property role="IQ2nx" value="2879488090881171741" />
      <property role="TrG5h" value="c" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="cqTc8JdjJa">
    <property role="EcuMT" value="223742654175067082" />
    <property role="TrG5h" value="Blank" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
  <node concept="1TIwiD" id="G39ofDDj5m">
    <property role="EcuMT" value="793519207838200150" />
    <property role="TrG5h" value="NewTree" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="G39ofDDjEL" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="2NkZbYerYSm" role="1TKVEi">
      <property role="IQ2ns" value="3230484732390141462" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="root" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="2NkZbYerWzG" resolve="NewTreeItem" />
    </node>
  </node>
  <node concept="1TIwiD" id="2NkZbYerWzG">
    <property role="EcuMT" value="3230484732390131948" />
    <property role="TrG5h" value="NewTreeItem" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="2NkZbYerX97" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="2NkZbYerXrE" role="1TKVEl">
      <property role="IQ2nx" value="3230484732390135530" />
      <property role="TrG5h" value="a" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="2NkZbYerY0J" role="1TKVEl">
      <property role="IQ2nx" value="3230484732390137903" />
      <property role="TrG5h" value="b" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyj" id="2NkZbYerZtr" role="1TKVEi">
      <property role="IQ2ns" value="3230484732390143835" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="children" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="2NkZbYerWzG" resolve="NewTreeItem" />
    </node>
  </node>
  <node concept="1TIwiD" id="2iVdnDeS_Ov">
    <property role="EcuMT" value="2646768005436038431" />
    <property role="TrG5h" value="WidgetTest" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="2iVdnDeSAqk" role="1TKVEl">
      <property role="IQ2nx" value="2646768005436040852" />
      <property role="TrG5h" value="text" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="2iVdnDeSBj3" role="1TKVEl">
      <property role="IQ2nx" value="2646768005436044483" />
      <property role="TrG5h" value="bool" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="2iVdnDeSD4x" role="1TKVEl">
      <property role="IQ2nx" value="2646768005436051745" />
      <property role="TrG5h" value="number" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
    </node>
    <node concept="1TJgyi" id="1XshCcKEWIM" role="1TKVEl">
      <property role="IQ2nx" value="2259758642304371634" />
      <property role="TrG5h" value="droppy" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="5KtU3pXuL15">
    <property role="EcuMT" value="6637716746545074245" />
    <property role="TrG5h" value="RefTest" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="5KtU3pXwbBQ" role="1TKVEi">
      <property role="IQ2ns" value="6637716746545445366" />
      <property role="20kJfa" value="target" />
      <ref role="20lvS9" node="5KtU3pXuL15" resolve="RefTest" />
    </node>
    <node concept="PrWs8" id="5KtU3pXZelT" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="3d2g73CmXYi">
    <property role="EcuMT" value="3693585498076077970" />
    <property role="TrG5h" value="ErrorChecking" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="3d2g73CmY$t" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="7$1mkeAymFe" role="1TKVEl">
      <property role="IQ2nx" value="8719348500657695438" />
      <property role="TrG5h" value="s" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="1XYAF4MuPcd">
    <property role="EcuMT" value="2269421348088140557" />
    <property role="TrG5h" value="Record" />
    <property role="19KtqR" value="true" />
    <property role="3GE5qa" value="record" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1XYAF4MuRh6" role="1TKVEi">
      <property role="IQ2ns" value="2269421348088149062" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="members" />
      <ref role="20lvS9" node="1XYAF4MuQ5s" resolve="Member" />
    </node>
    <node concept="PrWs8" id="af0_0CZKxl" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1XYAF4MuQ5s">
    <property role="EcuMT" value="2269421348088144220" />
    <property role="3GE5qa" value="record" />
    <property role="TrG5h" value="Member" />
    <property role="19KtqR" value="true" />
    <property role="34LRSv" value="member" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1XYAF4MuQFh" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="1XYAF4MuUxD" role="1TKVEi">
      <property role="IQ2ns" value="2269421348088162409" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="1XYAF4MuRQV" resolve="Type" />
    </node>
  </node>
  <node concept="1TIwiD" id="1XYAF4MuRQV">
    <property role="EcuMT" value="2269421348088151483" />
    <property role="3GE5qa" value="record" />
    <property role="TrG5h" value="Type" />
    <property role="R5$K7" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
  <node concept="1TIwiD" id="1XYAF4MuSsK">
    <property role="EcuMT" value="2269421348088153904" />
    <property role="3GE5qa" value="record" />
    <property role="TrG5h" value="StringType" />
    <property role="34LRSv" value="string" />
    <ref role="1TJDcQ" node="1XYAF4MuRQV" resolve="Type" />
  </node>
  <node concept="1TIwiD" id="1XYAF4MuTlv">
    <property role="EcuMT" value="2269421348088157535" />
    <property role="3GE5qa" value="record" />
    <property role="TrG5h" value="IntType" />
    <property role="34LRSv" value="int" />
    <ref role="1TJDcQ" node="1XYAF4MuRQV" resolve="Type" />
  </node>
  <node concept="1TIwiD" id="1XYAF4MuTCq">
    <property role="EcuMT" value="2269421348088158746" />
    <property role="3GE5qa" value="record" />
    <property role="TrG5h" value="BoolType" />
    <property role="34LRSv" value="bool" />
    <ref role="1TJDcQ" node="1XYAF4MuRQV" resolve="Type" />
  </node>
</model>

