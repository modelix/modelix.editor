<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:124b74ee-0d47-4037-b8eb-4bd3c9cd1d35(org.modelix.mps.react.muicomponents.stdlib)">
  <persistence version="9" />
  <languages>
    <use id="09a61cec-0c2d-4a90-b590-25e493b12f35" name="org.modelix.mps.react.muicomponents" version="0" />
    <use id="67accce2-9676-4728-9e9c-8b15ea30d924" name="org.modelix.mps.react" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
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
      <concept id="793519207829949608" name="org.modelix.mps.react.muicomponents.structure.BorderAndShade" flags="ng" index="3y96$F">
        <property id="793519207829956770" name="padding" index="3y94Ox" />
        <property id="793519207831838791" name="margin" index="3yhKn4" />
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
    <node concept="3y96$F" id="2NkZbYfBifG" role="gmrQt">
      <property role="TrG5h" value="inset" />
      <property role="3yhKn4" value="10px 10px" />
    </node>
    <node concept="3ywjYg" id="1LliyakImP8" role="gmrQt" />
    <node concept="GuJNq" id="1LliyakInqe" role="gmrQt">
      <property role="3z6gAX" value="2vPZMAn_7Nn/bold" />
      <property role="TrG5h" value="default" />
    </node>
    <node concept="3ywjYg" id="1LliyakInqd" role="gmrQt" />
  </node>
</model>

