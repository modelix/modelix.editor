<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:184047e0-0f39-454d-9ffe-ea892e7db656(org.modelix.mps.webaspect.genplan)">
  <persistence version="9" />
  <languages>
    <use id="7ab1a6fa-0a11-4b95-9e48-75f363d6cb00" name="jetbrains.mps.lang.generator.plan" version="2" />
  </languages>
  <imports />
  <registry>
    <language id="7ab1a6fa-0a11-4b95-9e48-75f363d6cb00" name="jetbrains.mps.lang.generator.plan">
      <concept id="1152961914448136207" name="jetbrains.mps.lang.generator.plan.structure.LanguageEntry" flags="ng" index="2Qf6Nf">
        <child id="1152961914448136208" name="language" index="2Qf6Ng" />
      </concept>
      <concept id="1820634577908471803" name="jetbrains.mps.lang.generator.plan.structure.Plan" flags="ng" index="2VgMpV">
        <child id="1820634577908471815" name="steps" index="2VgMA7" />
      </concept>
      <concept id="1820634577908471810" name="jetbrains.mps.lang.generator.plan.structure.Transform" flags="ng" index="2VgMA2">
        <property id="2209292798354050154" name="individualStepPerGenerator" index="1s431M" />
        <child id="1152961914448142326" name="entries" index="2Qf7GQ" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="3542851458883438784" name="jetbrains.mps.lang.smodel.structure.LanguageId" flags="nn" index="2V$Bhx">
        <property id="3542851458883439831" name="namespace" index="2V$B1Q" />
        <property id="3542851458883439832" name="languageId" index="2V$B1T" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="2VgMpV" id="22f9nDgQKqh">
    <property role="TrG5h" value="ModelixWebAspectGenPlan" />
    <node concept="2VgMA2" id="22f9nDgQKqK" role="2VgMA7">
      <property role="1s431M" value="true" />
      <node concept="2Qf6Nf" id="22f9nDgQKqL" role="2Qf7GQ">
        <node concept="2V$Bhx" id="22f9nDgQKqM" role="2Qf6Ng">
          <property role="2V$B1T" value="c7b55726-1795-47bd-aa21-714ac1e30f21" />
          <property role="2V$B1Q" value="org.modelix.mps.notation" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="54VjPcDeUFN" role="2Qf7GQ">
        <node concept="2V$Bhx" id="54VjPcDeUFT" role="2Qf6Ng">
          <property role="2V$B1T" value="67accce2-9676-4728-9e9c-8b15ea30d924" />
          <property role="2V$B1Q" value="org.modelix.mps.react" />
        </node>
      </node>
    </node>
    <node concept="2VgMA2" id="2QtC6yZ8Ed8" role="2VgMA7">
      <property role="1s431M" value="true" />
      <node concept="2Qf6Nf" id="2QtC6yZ8EeY" role="2Qf7GQ">
        <node concept="2V$Bhx" id="2QtC6z0YK9o" role="2Qf6Ng">
          <property role="2V$B1T" value="515552c7-fcc0-4ab4-9789-2f3c49344e85" />
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage.varVariable" />
        </node>
      </node>
    </node>
    <node concept="2VgMA2" id="2QtC6z0YK9l" role="2VgMA7">
      <property role="1s431M" value="true" />
      <node concept="2Qf6Nf" id="2QtC6z0YK9m" role="2Qf7GQ">
        <node concept="2V$Bhx" id="2QtC6z0YK9n" role="2Qf6Ng">
          <property role="2V$B1T" value="fd392034-7849-419d-9071-12563d152375" />
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage.closures" />
        </node>
      </node>
    </node>
    <node concept="2VgMA2" id="2QtC6z08pBM" role="2VgMA7">
      <property role="1s431M" value="true" />
      <node concept="2Qf6Nf" id="2QtC6z08pBN" role="2Qf7GQ">
        <node concept="2V$Bhx" id="2QtC6z08pBP" role="2Qf6Ng">
          <property role="2V$B1T" value="83888646-71ce-4f1c-9c53-c54016f6ad4f" />
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage.collections" />
        </node>
      </node>
    </node>
    <node concept="2VgMA2" id="1edLqv8PKEM" role="2VgMA7">
      <property role="1s431M" value="true" />
      <node concept="2Qf6Nf" id="5MaUe7C0H$E" role="2Qf7GQ">
        <node concept="2V$Bhx" id="5MaUe7C0H$G" role="2Qf6Ng">
          <property role="2V$B1T" value="774bf8a0-62e5-41e1-af63-f4812e60e48b" />
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage.checkedDots" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="1edLqv8PKF5" role="2Qf7GQ">
        <node concept="2V$Bhx" id="1edLqv8PKF9" role="2Qf6Ng">
          <property role="2V$B1T" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1" />
          <property role="2V$B1Q" value="jetbrains.mps.lang.smodel" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="1edLqv8PKFb" role="2Qf7GQ">
        <node concept="2V$Bhx" id="1edLqv8PKFh" role="2Qf6Ng">
          <property role="2V$B1T" value="f3061a53-9226-4cc5-a443-f952ceaf5816" />
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="5zC25uAyVUC" role="2Qf7GQ">
        <node concept="2V$Bhx" id="5zC25uAyVUK" role="2Qf6Ng">
          <property role="2V$B1T" value="df345b11-b8c7-4213-ac66-48d2a9b75d88" />
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguageInternal" />
        </node>
      </node>
    </node>
  </node>
</model>

