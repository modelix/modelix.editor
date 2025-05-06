<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:f15de0ef-f102-4f26-b0fe-38162dc98a6a(org.modelix.mps.react.stdlib.modelix)">
  <persistence version="9" />
  <languages>
    <use id="09a61cec-0c2d-4a90-b590-25e493b12f35" name="org.modelix.mps.react.muicomponents" version="0" />
    <use id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react" version="0" />
  </languages>
  <imports />
  <registry>
    <language id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react">
      <concept id="8876946878573696709" name="org.modelix.mps.react.structure.ReactModule" flags="ng" index="gl9ry">
        <child id="8876946878573903290" name="content" index="gmrQt" />
      </concept>
      <concept id="793519207835900435" name="org.modelix.mps.react.structure.EmptyContent" flags="ng" index="3ywjYg" />
    </language>
    <language id="09a61cec-0c2d-4a90-b590-25e493b12f35" name="org.modelix.mps.react.muicomponents">
      <concept id="223742654177875992" name="org.modelix.mps.react.muicomponents.structure.Typography" flags="ng" index="GuJNq">
        <property id="793519207812312126" name="style" index="3z6gAX" />
      </concept>
      <concept id="223742654177875993" name="org.modelix.mps.react.muicomponents.structure.Color" flags="ng" index="GuJNr">
        <property id="223742654177875994" name="value" index="GuJNo" />
      </concept>
      <concept id="793519207829949608" name="org.modelix.mps.react.muicomponents.structure.BorderAndShade" flags="ng" index="3y96$F">
        <property id="793519207829956770" name="padding" index="3y94Ox" />
        <property id="793519207831838791" name="margin" index="3yhKn4" />
        <child id="793519207829962702" name="shadeColor" index="3y95Dd" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="gl9ry" id="1LliyakIjE$">
    <property role="TrG5h" value="Styles" />
    <node concept="3y96$F" id="G39ofDbEQO" role="gmrQt">
      <property role="TrG5h" value="default" />
      <property role="3y94Ox" value="5px 20px" />
      <property role="3yhKn4" value="10px 10px" />
    </node>
    <node concept="3y96$F" id="4fhsnyrLq6r" role="gmrQt">
      <property role="TrG5h" value="grey" />
      <property role="3y94Ox" value="5px 20px" />
      <property role="3yhKn4" value="10px 10px" />
      <node concept="GuJNr" id="4fhsnyrLqY2" role="3y95Dd">
        <property role="GuJNo" value="cccccc" />
      </node>
    </node>
    <node concept="3y96$F" id="2NkZbYfBifG" role="gmrQt">
      <property role="TrG5h" value="inset" />
      <property role="3yhKn4" value="10px 10px" />
    </node>
    <node concept="3ywjYg" id="1LliyakImP8" role="gmrQt" />
    <node concept="GuJNq" id="1LliyakInqe" role="gmrQt">
      <property role="TrG5h" value="default" />
    </node>
    <node concept="GuJNq" id="4fhsnyrKFa$" role="gmrQt">
      <property role="TrG5h" value="bold" />
      <property role="3z6gAX" value="2vPZMAn_7Nn/bold" />
    </node>
    <node concept="3ywjYg" id="1LliyakInqd" role="gmrQt" />
  </node>
</model>

