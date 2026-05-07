<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:89927765-e0b0-4c5f-8a95-aa6ee38d73fd(org.modelix.mps.editor.build)">
  <persistence version="9" />
  <languages>
    <use id="798100da-4f0a-421a-b991-71f8c50ce5d2" name="jetbrains.mps.build" version="0" />
    <use id="0cf935df-4699-4e9c-a132-fa109541cba3" name="jetbrains.mps.build.mps" version="8" />
  </languages>
  <imports>
    <import index="ffeo" ref="r:874d959d-e3b4-4d04-b931-ca849af130dd(jetbrains.mps.ide.build)" />
  </imports>
  <registry>
    <language id="798100da-4f0a-421a-b991-71f8c50ce5d2" name="jetbrains.mps.build">
      <concept id="5481553824944787378" name="jetbrains.mps.build.structure.BuildSourceProjectRelativePath" flags="ng" index="55IIr" />
      <concept id="7321017245476976379" name="jetbrains.mps.build.structure.BuildRelativePath" flags="ng" index="iG8Mu">
        <child id="7321017245477039051" name="compositePart" index="iGT6I" />
      </concept>
      <concept id="4993211115183325728" name="jetbrains.mps.build.structure.BuildProjectDependency" flags="ng" index="2sgV4H">
        <reference id="5617550519002745380" name="script" index="1l3spb" />
        <child id="4129895186893471026" name="artifacts" index="2JcizS" />
      </concept>
      <concept id="2750015747481074431" name="jetbrains.mps.build.structure.BuildLayout_Files" flags="ng" index="2HvfSZ">
        <child id="2750015747481074432" name="path" index="2HvfZ0" />
      </concept>
      <concept id="4380385936562003279" name="jetbrains.mps.build.structure.BuildString" flags="ng" index="NbPM2">
        <child id="4903714810883783243" name="parts" index="3MwsjC" />
      </concept>
      <concept id="8618885170173601777" name="jetbrains.mps.build.structure.BuildCompositePath" flags="nn" index="2Ry0Ak">
        <property id="8618885170173601779" name="head" index="2Ry0Am" />
        <child id="8618885170173601778" name="tail" index="2Ry0An" />
      </concept>
      <concept id="2539347366864541544" name="jetbrains.mps.build.structure.BuildSourceArchiveRelativePath" flags="ng" index="30tkmh">
        <child id="2539347366864648268" name="archivePath" index="30tYEP" />
      </concept>
      <concept id="6647099934206700647" name="jetbrains.mps.build.structure.BuildJavaPlugin" flags="ng" index="10PD9b" />
      <concept id="7389400916848050071" name="jetbrains.mps.build.structure.BuildLayout_Zip" flags="ng" index="3981dG" />
      <concept id="7389400916848050060" name="jetbrains.mps.build.structure.BuildLayout_NamedContainer" flags="ng" index="3981dR">
        <child id="4380385936562148502" name="containerName" index="Nbhlr" />
      </concept>
      <concept id="7389400916848036984" name="jetbrains.mps.build.structure.BuildLayout_Folder" flags="ng" index="398223" />
      <concept id="7389400916848136194" name="jetbrains.mps.build.structure.BuildFolderMacro" flags="ng" index="398rNT">
        <child id="7389400916848144618" name="defaultPath" index="398pKh" />
      </concept>
      <concept id="7389400916848153117" name="jetbrains.mps.build.structure.BuildSourceMacroRelativePath" flags="ng" index="398BVA">
        <reference id="7389400916848153130" name="macro" index="398BVh" />
      </concept>
      <concept id="5617550519002745364" name="jetbrains.mps.build.structure.BuildLayout" flags="ng" index="1l3spV" />
      <concept id="5617550519002745363" name="jetbrains.mps.build.structure.BuildProject" flags="ng" index="1l3spW">
        <property id="5204048710541015587" name="internalBaseDirectory" index="2DA0ip" />
        <child id="6647099934206700656" name="plugins" index="10PD9s" />
        <child id="7389400916848080626" name="parts" index="3989C9" />
        <child id="5617550519002745381" name="dependencies" index="1l3spa" />
        <child id="5617550519002745378" name="macros" index="1l3spd" />
        <child id="5617550519002745372" name="layout" index="1l3spN" />
      </concept>
      <concept id="8654221991637384182" name="jetbrains.mps.build.structure.BuildFileIncludesSelector" flags="ng" index="3qWCbU">
        <property id="8654221991637384184" name="pattern" index="3qWCbO" />
      </concept>
      <concept id="4701820937132344003" name="jetbrains.mps.build.structure.BuildLayout_Container" flags="ngI" index="1y1bJS">
        <child id="7389400916848037006" name="children" index="39821P" />
      </concept>
      <concept id="841011766566059607" name="jetbrains.mps.build.structure.BuildStringNotEmpty" flags="ng" index="3_J27D" />
      <concept id="5248329904287794596" name="jetbrains.mps.build.structure.BuildInputFiles" flags="ng" index="3LXTmp">
        <child id="5248329904287794598" name="dir" index="3LXTmr" />
        <child id="5248329904287794679" name="selectors" index="3LXTna" />
      </concept>
      <concept id="4903714810883702019" name="jetbrains.mps.build.structure.BuildTextStringPart" flags="ng" index="3Mxwew">
        <property id="4903714810883755350" name="text" index="3MwjfP" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="0cf935df-4699-4e9c-a132-fa109541cba3" name="jetbrains.mps.build.mps">
      <concept id="6592112598314586625" name="jetbrains.mps.build.mps.structure.BuildMps_IdeaPluginGroup" flags="ng" index="m$f5U">
        <reference id="6592112598314586626" name="group" index="m$f5T" />
      </concept>
      <concept id="6592112598314498932" name="jetbrains.mps.build.mps.structure.BuildMps_IdeaPlugin" flags="ng" index="m$_wf">
        <property id="6592112598314498927" name="id" index="m$_wk" />
        <child id="6592112598314498931" name="version" index="m$_w8" />
        <child id="6592112598314499050" name="content" index="m$_yh" />
        <child id="6592112598314499028" name="dependencies" index="m$_yJ" />
        <child id="6592112598314499021" name="name" index="m$_yQ" />
        <child id="6592112598314855574" name="containerName" index="m_cZH" />
      </concept>
      <concept id="6592112598314498926" name="jetbrains.mps.build.mps.structure.BuildMpsLayout_Plugin" flags="ng" index="m$_wl">
        <reference id="6592112598314801433" name="plugin" index="m_rDy" />
        <child id="3570488090019868128" name="packagingType" index="pUk7w" />
      </concept>
      <concept id="6592112598314499027" name="jetbrains.mps.build.mps.structure.BuildMps_IdeaPluginDependency" flags="ng" index="m$_yC">
        <reference id="6592112598314499066" name="target" index="m$_y1" />
      </concept>
      <concept id="3570488090019868065" name="jetbrains.mps.build.mps.structure.BuildMpsLayout_AutoPluginLayoutType" flags="ng" index="pUk6x" />
      <concept id="1500819558095907805" name="jetbrains.mps.build.mps.structure.BuildMps_Group" flags="ng" index="2G$12M">
        <child id="1500819558095907806" name="modules" index="2G$12L" />
      </concept>
      <concept id="8971171305100238972" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleDependencyTargetLanguage" flags="ng" index="Rbm2T">
        <reference id="3189788309731922643" name="language" index="1E1Vl2" />
      </concept>
      <concept id="868032131020265945" name="jetbrains.mps.build.mps.structure.BuildMPSPlugin" flags="ng" index="3b7kt6" />
      <concept id="5253498789149381388" name="jetbrains.mps.build.mps.structure.BuildMps_Module" flags="ng" index="3bQrTs">
        <property id="2928402740576877067" name="javaCode" index="3vZFNd" />
        <child id="5253498789149547825" name="sources" index="3bR31x" />
        <child id="5253498789149547704" name="dependencies" index="3bR37C" />
      </concept>
      <concept id="5253498789149585690" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleDependencyOnModule" flags="ng" index="3bR9La">
        <property id="5253498789149547713" name="reexport" index="3bR36h" />
        <reference id="5253498789149547705" name="module" index="3bR37D" />
      </concept>
      <concept id="763829979718664966" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleResources" flags="ng" index="3rtmxn">
        <child id="763829979718664967" name="files" index="3rtmxm" />
      </concept>
      <concept id="5507251971038816436" name="jetbrains.mps.build.mps.structure.BuildMps_Generator" flags="ng" index="1yeLz9" />
      <concept id="4278635856200817744" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleModelRoot" flags="ng" index="1BupzO">
        <property id="8137134783396907368" name="convert2binary" index="1Hdu6h" />
        <property id="8137134783396676838" name="extracted" index="1HemKv" />
        <property id="2889113830911481881" name="deployFolderName" index="3ZfqAx" />
        <child id="8137134783396676835" name="location" index="1HemKq" />
      </concept>
      <concept id="4278635856200826393" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleDependencyJar" flags="ng" index="1BurEX">
        <child id="4278635856200826394" name="path" index="1BurEY" />
      </concept>
      <concept id="4278635856200794926" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleDependencyExtendLanguage" flags="ng" index="1Busua">
        <reference id="4278635856200794928" name="language" index="1Busuk" />
      </concept>
      <concept id="3189788309731981027" name="jetbrains.mps.build.mps.structure.BuildMps_ModuleSolutionRuntime" flags="ng" index="1E0d5M">
        <reference id="3189788309731981028" name="solution" index="1E0d5P" />
      </concept>
      <concept id="3189788309731840247" name="jetbrains.mps.build.mps.structure.BuildMps_Solution" flags="ng" index="1E1JtA" />
      <concept id="3189788309731840248" name="jetbrains.mps.build.mps.structure.BuildMps_Language" flags="ng" index="1E1JtD">
        <child id="3189788309731917348" name="runtime" index="1E1XAP" />
        <child id="9200313594498201639" name="generator" index="1TViLv" />
      </concept>
      <concept id="322010710375794190" name="jetbrains.mps.build.mps.structure.BuildMps_DevKit" flags="ng" index="3LEwk6">
        <child id="322010710375832962" name="exports" index="3LEDUa" />
      </concept>
      <concept id="322010710375832938" name="jetbrains.mps.build.mps.structure.BuildMps_DevKitExportLanguage" flags="ng" index="3LEDTy">
        <reference id="322010710375832947" name="language" index="3LEDTV" />
      </concept>
      <concept id="322010710375832954" name="jetbrains.mps.build.mps.structure.BuildMps_DevKitExportSolution" flags="ng" index="3LEDTM">
        <reference id="322010710375832955" name="solution" index="3LEDTN" />
      </concept>
      <concept id="322010710375871467" name="jetbrains.mps.build.mps.structure.BuildMps_AbstractModule" flags="ng" index="3LEN3z">
        <property id="8369506495128725901" name="compact" index="BnDLt" />
        <property id="322010710375892619" name="uuid" index="3LESm3" />
        <child id="322010710375956261" name="path" index="3LF7KH" />
      </concept>
      <concept id="7259033139236285166" name="jetbrains.mps.build.mps.structure.BuildMps_ExtractedModuleDependency" flags="nn" index="1SiIV0">
        <child id="7259033139236285167" name="dependency" index="1SiIV1" />
      </concept>
    </language>
  </registry>
  <node concept="1l3spW" id="5DFJIKtieLf">
    <property role="TrG5h" value="org.modelix.editor" />
    <property role="2DA0ip" value="../.." />
    <node concept="10PD9b" id="5DFJIKtieLg" role="10PD9s" />
    <node concept="3b7kt6" id="5DFJIKtieLh" role="10PD9s" />
    <node concept="398rNT" id="5DFJIKtieLi" role="1l3spd">
      <property role="TrG5h" value="mps_home" />
    </node>
    <node concept="398rNT" id="5DFJIKtieLl" role="1l3spd">
      <property role="TrG5h" value="mbeddr.github.core.home" />
    </node>
    <node concept="398rNT" id="5DFJIKtij1E" role="1l3spd">
      <property role="TrG5h" value="reactSSR" />
      <node concept="55IIr" id="5DFJIKtij1G" role="398pKh">
        <node concept="2Ry0Ak" id="5DFJIKtij1J" role="iGT6I">
          <property role="2Ry0Am" value=".." />
          <node concept="2Ry0Ak" id="5DFJIKtijHM" role="2Ry0An">
            <property role="2Ry0Am" value="react-ssr-mps" />
            <node concept="2Ry0Ak" id="5DFJIKtijKJ" role="2Ry0An">
              <property role="2Ry0Am" value="build" />
              <node concept="2Ry0Ak" id="5DFJIKtijM0" role="2Ry0An">
                <property role="2Ry0Am" value="stubs-solution-sources" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="398rNT" id="5DFJIKtijNt" role="1l3spd">
      <property role="TrG5h" value="modelix.editor" />
      <node concept="55IIr" id="5DFJIKtijNv" role="398pKh">
        <node concept="2Ry0Ak" id="5DFJIKtijNy" role="iGT6I">
          <property role="2Ry0Am" value=".." />
        </node>
      </node>
    </node>
    <node concept="2sgV4H" id="5DFJIKtieLj" role="1l3spa">
      <ref role="1l3spb" to="ffeo:3IKDaVZmzS6" />
      <node concept="398BVA" id="5DFJIKtieLk" role="2JcizS">
        <ref role="398BVh" node="5DFJIKtieLi" resolve="mps_home" />
      </node>
    </node>
    <node concept="1l3spV" id="5DFJIKtieMi" role="1l3spN">
      <node concept="3981dG" id="5DFJIKtieMj" role="39821P">
        <node concept="3_J27D" id="5DFJIKtieMk" role="Nbhlr">
          <node concept="3Mxwew" id="5DFJIKtieMl" role="3MwsjC">
            <property role="3MwjfP" value="org.modelix.editor.zip" />
          </node>
        </node>
        <node concept="m$_wl" id="5DFJIKtieMm" role="39821P">
          <ref role="m_rDy" node="5DFJIKtieM7" resolve="org.modelix.editor" />
          <node concept="pUk6x" id="5DFJIKtieMn" role="pUk7w" />
          <node concept="398223" id="5DFJIKtieSH" role="39821P">
            <node concept="3_J27D" id="5DFJIKtieSJ" role="Nbhlr">
              <node concept="3Mxwew" id="5DFJIKtieSL" role="3MwsjC">
                <property role="3MwjfP" value="lib" />
              </node>
            </node>
            <node concept="2HvfSZ" id="5DFJIKtieSM" role="39821P">
              <node concept="398BVA" id="5DFJIKtijIe" role="2HvfZ0">
                <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
                <node concept="2Ry0Ak" id="5DFJIKtimAX" role="iGT6I">
                  <property role="2Ry0Am" value="react-ssr-mps" />
                  <node concept="2Ry0Ak" id="5DFJIKtimXP" role="2Ry0An">
                    <property role="2Ry0Am" value="build" />
                    <node concept="2Ry0Ak" id="5DFJIKtimXS" role="2Ry0An">
                      <property role="2Ry0Am" value="idea-sandbox" />
                      <node concept="2Ry0Ak" id="5DFJIKtjoCw" role="2Ry0An">
                        <property role="2Ry0Am" value="plugins" />
                        <node concept="2Ry0Ak" id="5DFJIKtjp0z" role="2Ry0An">
                          <property role="2Ry0Am" value="react-ssr-mps" />
                          <node concept="2Ry0Ak" id="5DFJIKtjpKA" role="2Ry0An">
                            <property role="2Ry0Am" value="lib" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="2HvfSZ" id="5DFJIKtieV7" role="39821P">
              <node concept="398BVA" id="5DFJIKtinN2" role="2HvfZ0">
                <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
                <node concept="2Ry0Ak" id="5DFJIKtinNb" role="iGT6I">
                  <property role="2Ry0Am" value="editor-common-mps" />
                  <node concept="2Ry0Ak" id="5DFJIKtinNd" role="2Ry0An">
                    <property role="2Ry0Am" value="build" />
                    <node concept="2Ry0Ak" id="5DFJIKtinNe" role="2Ry0An">
                      <property role="2Ry0Am" value="idea-sandbox" />
                      <node concept="2Ry0Ak" id="5DFJIKtinNf" role="2Ry0An">
                        <property role="2Ry0Am" value="plugins" />
                        <node concept="2Ry0Ak" id="5DFJIKtinNg" role="2Ry0An">
                          <property role="2Ry0Am" value="editor-common-mps" />
                          <node concept="2Ry0Ak" id="5DFJIKtinNh" role="2Ry0An">
                            <property role="2Ry0Am" value="lib" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="2HvfSZ" id="5DFJIKtjnwj" role="39821P">
              <node concept="398BVA" id="5DFJIKtjnSn" role="2HvfZ0">
                <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
                <node concept="2Ry0Ak" id="5DFJIKtjogr" role="iGT6I">
                  <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                  <node concept="2Ry0Ak" id="5DFJIKtjogu" role="2Ry0An">
                    <property role="2Ry0Am" value="build" />
                    <node concept="2Ry0Ak" id="5DFJIKtjrgE" role="2Ry0An">
                      <property role="2Ry0Am" value="idea-sandbox" />
                      <node concept="2Ry0Ak" id="5DFJIKtjrCH" role="2Ry0An">
                        <property role="2Ry0Am" value="plugins" />
                        <node concept="2Ry0Ak" id="5DFJIKtjrCK" role="2Ry0An">
                          <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                          <node concept="2Ry0Ak" id="5DFJIKtjrCM" role="2Ry0An">
                            <property role="2Ry0Am" value="lib" />
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
    <node concept="m$_wf" id="5DFJIKtieM7" role="3989C9">
      <property role="m$_wk" value="org.modelix.editor" />
      <node concept="3_J27D" id="5DFJIKtieM8" role="m$_yQ">
        <node concept="3Mxwew" id="5DFJIKtieM9" role="3MwsjC">
          <property role="3MwjfP" value="org.modelix.editor" />
        </node>
      </node>
      <node concept="3_J27D" id="5DFJIKtieMa" role="m$_w8">
        <node concept="3Mxwew" id="5DFJIKtieMb" role="3MwsjC">
          <property role="3MwjfP" value="1.0" />
        </node>
      </node>
      <node concept="m$f5U" id="5DFJIKtieMc" role="m$_yh">
        <ref role="m$f5T" node="5DFJIKtieM6" resolve="org.modelix.editor" />
      </node>
      <node concept="m$f5U" id="5DFJIKtif09" role="m$_yh">
        <ref role="m$f5T" node="5DFJIKtieQw" resolve="stubs" />
      </node>
      <node concept="m$_yC" id="5DFJIKtieMd" role="m$_yJ">
        <ref role="m$_y1" to="ffeo:4k71ibbKLe8" />
      </node>
      <node concept="m$_yC" id="5DFJIKtjctM" role="m$_yJ">
        <ref role="m$_y1" to="ffeo:1diEraJ0skp" />
      </node>
      <node concept="m$_yC" id="5DFJIKtjeso" role="m$_yJ">
        <ref role="m$_y1" to="ffeo:5xhjlkpPhJu" />
      </node>
      <node concept="3_J27D" id="5DFJIKtieMe" role="m_cZH">
        <node concept="3Mxwew" id="5DFJIKtieMf" role="3MwsjC">
          <property role="3MwjfP" value="org.modelix.editor" />
        </node>
      </node>
    </node>
    <node concept="2G$12M" id="5DFJIKtieQw" role="3989C9">
      <property role="TrG5h" value="stubs" />
      <node concept="1E1JtA" id="5DFJIKtieTK" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.editor.common.stubs" />
        <property role="3LESm3" value="208eaf68-fd3a-497a-a4b6-4923ff457c3b" />
        <property role="3vZFNd" value="3kCd1ud3JDF/none" />
        <node concept="30tkmh" id="5DFJIKtieUd" role="3LF7KH">
          <node concept="398BVA" id="5DFJIKtipWv" role="30tYEP">
            <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
            <node concept="2Ry0Ak" id="5DFJIKtipWE" role="iGT6I">
              <property role="2Ry0Am" value="editor-common-mps" />
              <node concept="2Ry0Ak" id="5DFJIKtipWF" role="2Ry0An">
                <property role="2Ry0Am" value="build" />
                <node concept="2Ry0Ak" id="5DFJIKtipWG" role="2Ry0An">
                  <property role="2Ry0Am" value="idea-sandbox" />
                  <node concept="2Ry0Ak" id="5DFJIKtipWH" role="2Ry0An">
                    <property role="2Ry0Am" value="plugins" />
                    <node concept="2Ry0Ak" id="5DFJIKtipWI" role="2Ry0An">
                      <property role="2Ry0Am" value="editor-common-mps" />
                      <node concept="2Ry0Ak" id="5DFJIKtipWJ" role="2Ry0An">
                        <property role="2Ry0Am" value="languages" />
                        <node concept="2Ry0Ak" id="5DFJIKtipWK" role="2Ry0An">
                          <property role="2Ry0Am" value="org.modelix.mps.editor.common.stubs.jar" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2Ry0Ak" id="5DFJIKtieUf" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieUi" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.editor.common.stubs" />
              <node concept="2Ry0Ak" id="5DFJIKtieUl" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.editor.common.stubs.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieUm" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieUn" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:mXGwHwhVPj" resolve="JDK" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieUo" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieUp" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:44LXwdzyvTi" resolve="Annotations" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieUq" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieUr" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1TaHNgiIbIQ" resolve="MPS.Core" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieUs" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieUt" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1ia2VB5guYy" resolve="MPS.IDEA" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieUu" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieUv" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1H905DlDUSw" resolve="MPS.OpenAPI" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtimY3" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimY4" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimXV" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimXW" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimXX" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimXY" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimXZ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimY0" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimY1" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimY2" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-netty-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimYd" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimYe" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimY5" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimY6" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimY7" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimY8" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimY9" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimYa" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimYb" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimYc" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-ktor-server-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimYn" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimYo" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimYf" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimYg" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimYh" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimYi" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimYj" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimYk" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimYl" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimYm" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-websockets-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimYx" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimYy" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimYp" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimYq" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimYr" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimYs" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimYt" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimYu" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimYv" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimYw" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-html-builder-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimYF" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimYG" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimYz" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimY$" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimY_" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimYA" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimYB" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimYC" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimYD" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimYE" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-server-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimYP" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimYQ" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimYH" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimYI" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimYJ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimYK" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimYL" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimYM" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimYN" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimYO" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-ktor-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimYZ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZ0" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimYR" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimYS" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimYT" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimYU" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimYV" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimYW" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimYX" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimYY" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimZ9" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZa" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZ1" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZ2" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZ3" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimZ4" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimZ5" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimZ6" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimZ7" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimZ8" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-serialization-core-jvm-1.9.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimZj" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZk" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZb" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZc" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZd" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimZe" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimZf" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimZg" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimZh" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimZi" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-serialization-json-jvm-1.9.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimZt" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZu" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZl" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZm" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZn" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimZo" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimZp" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimZq" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimZr" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimZs" role="2Ry0An">
                            <property role="2Ry0Am" value="reverse-mpsadapters-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimZB" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZC" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZv" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZw" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZx" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimZy" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimZz" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimZ$" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimZ_" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimZA" role="2Ry0An">
                            <property role="2Ry0Am" value="model-adapters-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimZL" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZM" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZD" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZE" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZF" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimZG" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimZH" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimZI" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimZJ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimZK" role="2Ry0An">
                            <property role="2Ry0Am" value="incremental-jvm-0.3.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtimZV" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtimZW" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZN" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZO" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZP" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtimZQ" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtimZR" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtimZS" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtimZT" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtimZU" role="2Ry0An">
                            <property role="2Ry0Am" value="dependency-tracking-jvm-0.3.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin05" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin06" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtimZX" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtimZY" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtimZZ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin00" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin01" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin02" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin03" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin04" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-logging-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin0f" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin0g" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin07" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin08" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin09" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin0a" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin0b" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin0c" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin0d" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin0e" role="2Ry0An">
                            <property role="2Ry0Am" value="logback-classic-1.5.32.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin0p" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin0q" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin0h" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin0i" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin0j" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin0k" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin0l" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin0m" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin0n" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin0o" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-core-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin0z" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin0$" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin0r" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin0s" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin0t" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin0u" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin0v" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin0w" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin0x" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin0y" role="2Ry0An">
                            <property role="2Ry0Am" value="model-api-gen-runtime-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin0H" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin0I" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin0_" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin0A" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin0B" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin0C" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin0D" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin0E" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin0F" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin0G" role="2Ry0An">
                            <property role="2Ry0Am" value="mps-multiplatform-lib-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin0R" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin0S" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin0J" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin0K" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin0L" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin0M" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin0N" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin0O" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin0P" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin0Q" role="2Ry0An">
                            <property role="2Ry0Am" value="model-datastructure-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin11" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin12" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin0T" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin0U" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin0V" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin0W" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin0X" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin0Y" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin0Z" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin10" role="2Ry0An">
                            <property role="2Ry0Am" value="model-api-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin1b" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin1c" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin13" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin14" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin15" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin16" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin17" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin18" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin19" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin1a" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-logging-jvm-3.0.5.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin1l" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin1m" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin1d" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin1e" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin1f" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin1g" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin1h" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin1i" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin1j" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin1k" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-http-cio-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin1v" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin1w" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin1n" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin1o" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin1p" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin1q" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin1r" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin1s" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin1t" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin1u" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-websocket-serialization-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin1D" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin1E" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin1x" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin1y" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin1z" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin1$" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin1_" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin1A" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin1B" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin1C" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-serialization-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin1N" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin1O" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin1F" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin1G" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin1H" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin1I" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin1J" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin1K" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin1L" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin1M" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-websockets-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin1X" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin1Y" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin1P" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin1Q" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin1R" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin1S" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin1T" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin1U" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin1V" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin1W" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-http-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin27" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin28" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin1Z" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin20" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin21" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin22" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin23" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin24" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin25" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin26" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-events-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin2h" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin2i" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin29" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin2a" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin2b" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin2c" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin2d" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin2e" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin2f" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin2g" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-network-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin2r" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin2s" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin2j" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin2k" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin2l" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin2m" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin2n" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin2o" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin2p" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin2q" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-utils-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin2_" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin2A" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin2t" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin2u" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin2v" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin2w" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin2x" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin2y" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin2z" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin2$" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-io-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin2J" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin2K" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin2B" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin2C" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin2D" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin2E" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin2F" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin2G" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin2H" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin2I" role="2Ry0An">
                            <property role="2Ry0Am" value="slf4j-api-2.0.17.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin2T" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin2U" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin2L" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin2M" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin2N" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin2O" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin2P" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin2Q" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin2R" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin2S" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-serialization-json-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin33" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin34" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin2V" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin2W" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin2X" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin2Y" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin2Z" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin30" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin31" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin32" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin3d" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin3e" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin35" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin36" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin37" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin38" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin39" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin3a" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin3b" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin3c" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-logging-jvm-7.0.14.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin3n" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin3o" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin3f" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin3g" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin3h" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin3i" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin3j" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin3k" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin3l" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin3m" role="2Ry0An">
                            <property role="2Ry0Am" value="logback-core-1.5.32.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin3x" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin3y" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin3p" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin3q" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin3r" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin3s" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin3t" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin3u" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin3v" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin3w" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-html-jvm-0.12.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin3F" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin3G" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin3z" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin3$" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin3_" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin3A" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin3B" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin3C" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin3D" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin3E" role="2Ry0An">
                            <property role="2Ry0Am" value="datastructures-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin3P" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin3Q" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin3H" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin3I" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin3J" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin3K" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin3L" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin3M" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin3N" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin3O" role="2Ry0An">
                            <property role="2Ry0Am" value="streams-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin3Z" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin40" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin3R" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin3S" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin3T" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin3U" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin3V" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin3W" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin3X" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin3Y" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-utils-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin49" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin4a" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin41" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin42" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin43" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin44" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin45" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin46" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin47" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin48" role="2Ry0An">
                            <property role="2Ry0Am" value="core-3.1.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin4j" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin4k" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin4b" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin4c" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin4d" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin4e" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin4f" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin4g" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin4h" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin4i" role="2Ry0An">
                            <property role="2Ry0Am" value="stable-api-1.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin4t" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin4u" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin4l" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin4m" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin4n" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin4o" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin4p" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin4q" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin4r" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin4s" role="2Ry0An">
                            <property role="2Ry0Am" value="config-1.4.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin4B" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin4C" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin4v" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin4w" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin4x" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin4y" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin4z" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin4$" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin4_" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin4A" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-reflect-2.2.21.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin4L" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin4M" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin4D" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin4E" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin4F" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin4G" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin4H" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin4I" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin4J" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin4K" role="2Ry0An">
                            <property role="2Ry0Am" value="jansi-2.4.2.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin4V" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin4W" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin4N" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin4O" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin4P" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin4Q" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin4R" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin4S" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin4T" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin4U" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-http2-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin55" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin56" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin4X" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin4Y" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin4Z" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin50" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin51" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin52" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin53" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin54" role="2Ry0An">
                            <property role="2Ry0Am" value="alpn-api-1.1.3.v20160715.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin5f" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin5g" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin57" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin58" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin59" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin5a" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin5b" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin5c" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin5d" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin5e" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-native-kqueue-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin5p" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin5q" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin5h" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin5i" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin5j" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin5k" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin5l" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin5m" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin5n" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin5o" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-native-epoll-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin5z" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin5$" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin5r" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin5s" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin5t" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin5u" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin5v" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin5w" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin5x" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin5y" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-serialization-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin5H" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin5I" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin5_" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin5A" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin5B" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin5C" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin5D" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin5E" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin5F" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin5G" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-stdlib-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin5R" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin5S" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin5J" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin5K" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin5L" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin5M" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin5N" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin5O" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin5P" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin5Q" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-http-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin61" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin62" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin5T" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin5U" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin5V" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin5W" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin5X" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin5Y" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin5Z" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin60" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-handler-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin6b" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin6c" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin63" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin64" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin65" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin66" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin67" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin68" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin69" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin6a" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-compression-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin6l" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin6m" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin6d" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin6e" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin6f" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin6g" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin6h" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin6i" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin6j" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin6k" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-base-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin6v" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin6w" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin6n" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin6o" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin6p" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin6q" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin6r" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin6s" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin6t" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin6u" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-classes-kqueue-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin6D" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin6E" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin6x" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin6y" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin6z" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin6$" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin6_" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin6A" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin6B" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin6C" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-classes-epoll-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin6N" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin6O" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin6F" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin6G" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin6H" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin6I" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin6J" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin6K" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin6L" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin6M" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-native-unix-common-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin6X" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin6Y" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin6P" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin6Q" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin6R" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin6S" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin6T" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin6U" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin6V" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin6W" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin77" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin78" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin6Z" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin70" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin71" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin72" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin73" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin74" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin75" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin76" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-buffer-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin7h" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin7i" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin79" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin7a" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin7b" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin7c" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin7d" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin7e" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin7f" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin7g" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-resolver-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin7r" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin7s" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin7j" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin7k" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin7l" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin7m" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin7n" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin7o" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin7p" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin7q" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-common-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin7_" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin7A" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin7t" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin7u" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin7v" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin7w" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin7x" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin7y" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin7z" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin7$" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-utils-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin7J" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin7K" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin7B" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin7C" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin7D" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin7E" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin7F" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin7G" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin7H" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin7I" role="2Ry0An">
                            <property role="2Ry0Am" value="annotations-13.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin7T" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin7U" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin7L" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin7M" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin7N" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin7O" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin7P" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin7Q" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin7R" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin7S" role="2Ry0An">
                            <property role="2Ry0Am" value="commons-collections4-4.5.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin83" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin84" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin7V" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin7W" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin7X" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin7Y" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin7Z" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin80" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin81" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin82" role="2Ry0An">
                            <property role="2Ry0Am" value="kaml-jvm-0.104.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin8d" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin8e" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin85" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin86" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin87" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin88" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin89" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin8a" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin8b" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin8c" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-datetime-jvm-0.6.2.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin8n" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin8o" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin8f" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin8g" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin8h" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin8i" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin8j" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin8k" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin8l" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin8m" role="2Ry0An">
                            <property role="2Ry0Am" value="snakeyaml-engine-kmp-jvm-4.0.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin8x" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin8y" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin8p" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin8q" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin8r" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin8s" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin8t" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin8u" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin8v" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin8w" role="2Ry0An">
                            <property role="2Ry0Am" value="guava-33.5.0-jre.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin8F" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin8G" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin8z" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin8$" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin8_" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin8A" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin8B" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin8C" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin8D" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin8E" role="2Ry0An">
                            <property role="2Ry0Am" value="coroutines-interop-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin8P" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin8Q" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin8H" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin8I" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin8J" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin8K" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin8L" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin8M" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin8N" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin8O" role="2Ry0An">
                            <property role="2Ry0Am" value="okio-jvm-3.16.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin8Z" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin90" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin8R" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin8S" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin8T" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin8U" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin8V" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin8W" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin8X" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin8Y" role="2Ry0An">
                            <property role="2Ry0Am" value="failureaccess-1.0.3.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin99" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin9a" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin91" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin92" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin93" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin94" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin95" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin96" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin97" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin98" role="2Ry0An">
                            <property role="2Ry0Am" value="listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin9j" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin9k" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin9b" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin9c" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin9d" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin9e" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin9f" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin9g" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin9h" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin9i" role="2Ry0An">
                            <property role="2Ry0Am" value="jspecify-1.0.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin9t" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin9u" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin9l" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin9m" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin9n" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin9o" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin9p" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin9q" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin9r" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin9s" role="2Ry0An">
                            <property role="2Ry0Am" value="error_prone_annotations-2.41.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin9B" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin9C" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin9v" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin9w" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin9x" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin9y" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin9z" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin9$" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin9_" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin9A" role="2Ry0An">
                            <property role="2Ry0Am" value="j2objc-annotations-3.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin9L" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin9M" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin9D" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin9E" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin9F" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin9G" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin9H" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin9I" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin9J" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin9K" role="2Ry0An">
                            <property role="2Ry0Am" value="sha2-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtin9V" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtin9W" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin9N" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin9O" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin9P" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtin9Q" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtin9R" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtin9S" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtin9T" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtin9U" role="2Ry0An">
                            <property role="2Ry0Am" value="reaktive-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtina5" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtina6" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtin9X" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtin9Y" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtin9Z" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtina0" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtina1" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtina2" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtina3" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtina4" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-io-core-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinaf" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinag" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtina7" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtina8" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtina9" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinaa" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinab" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinac" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinad" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinae" role="2Ry0An">
                            <property role="2Ry0Am" value="urlencoder-lib-jvm-1.6.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinap" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinaq" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinah" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinai" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinaj" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinak" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinal" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinam" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinan" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinao" role="2Ry0An">
                            <property role="2Ry0Am" value="digest-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinaz" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtina$" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinar" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinas" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinat" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinau" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinav" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinaw" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinax" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinay" role="2Ry0An">
                            <property role="2Ry0Am" value="bits-jvm-0.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinaH" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinaI" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtina_" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinaA" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinaB" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinaC" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinaD" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinaE" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinaF" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinaG" role="2Ry0An">
                            <property role="2Ry0Am" value="endian-jvm-0.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinaR" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinaS" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinaJ" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinaK" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinaL" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinaM" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinaN" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinaO" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinaP" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinaQ" role="2Ry0An">
                            <property role="2Ry0Am" value="utils-internal-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinb1" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinb2" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinaT" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinaU" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinaV" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinaW" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinaX" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinaY" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinaZ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinb0" role="2Ry0An">
                            <property role="2Ry0Am" value="reaktive-annotations-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinbb" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinbc" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinb3" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinb4" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinb5" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinb6" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinb7" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinb8" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinb9" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinba" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-io-bytestring-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinbl" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinbm" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinbd" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinbe" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinbf" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinbg" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinbh" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinbi" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinbj" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinbk" role="2Ry0An">
                            <property role="2Ry0Am" value="core-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinbv" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinbw" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinbn" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinbo" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinbp" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinbq" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinbr" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinbs" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinbt" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinbu" role="2Ry0An">
                            <property role="2Ry0Am" value="error-jvm-0.4.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinbD" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinbE" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinbx" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinby" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinbz" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinb$" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinb_" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinbA" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinbB" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinbC" role="2Ry0An">
                            <property role="2Ry0Am" value="editor-common-mps-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinbN" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinbO" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinbF" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinbG" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinbH" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinbI" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinbJ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinbK" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinbL" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinbM" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-netty-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinbX" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinbY" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinbP" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinbQ" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinbR" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinbS" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinbT" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinbU" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinbV" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinbW" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-ktor-server-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinc7" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinc8" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinbZ" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinc0" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinc1" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinc2" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinc3" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinc4" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinc5" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinc6" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-websockets-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinch" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinci" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinc9" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinca" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtincb" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtincc" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtincd" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtince" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtincf" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtincg" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-html-builder-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtincr" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtincs" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtincj" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinck" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtincl" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtincm" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtincn" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinco" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtincp" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtincq" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-server-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinc_" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtincA" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinct" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtincu" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtincv" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtincw" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtincx" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtincy" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtincz" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinc$" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-ktor-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtincJ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtincK" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtincB" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtincC" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtincD" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtincE" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtincF" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtincG" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtincH" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtincI" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtincT" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtincU" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtincL" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtincM" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtincN" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtincO" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtincP" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtincQ" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtincR" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtincS" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-serialization-core-jvm-1.9.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtind3" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtind4" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtincV" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtincW" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtincX" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtincY" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtincZ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtind0" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtind1" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtind2" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-serialization-json-jvm-1.9.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtindd" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinde" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtind5" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtind6" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtind7" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtind8" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtind9" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinda" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtindb" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtindc" role="2Ry0An">
                            <property role="2Ry0Am" value="reverse-mpsadapters-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtindn" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtindo" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtindf" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtindg" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtindh" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtindi" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtindj" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtindk" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtindl" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtindm" role="2Ry0An">
                            <property role="2Ry0Am" value="model-adapters-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtindx" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtindy" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtindp" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtindq" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtindr" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinds" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtindt" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtindu" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtindv" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtindw" role="2Ry0An">
                            <property role="2Ry0Am" value="incremental-jvm-0.3.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtindF" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtindG" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtindz" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtind$" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtind_" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtindA" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtindB" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtindC" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtindD" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtindE" role="2Ry0An">
                            <property role="2Ry0Am" value="dependency-tracking-jvm-0.3.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtindP" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtindQ" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtindH" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtindI" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtindJ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtindK" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtindL" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtindM" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtindN" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtindO" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-logging-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtindZ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtine0" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtindR" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtindS" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtindT" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtindU" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtindV" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtindW" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtindX" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtindY" role="2Ry0An">
                            <property role="2Ry0Am" value="logback-classic-1.5.32.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtine9" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinea" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtine1" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtine2" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtine3" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtine4" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtine5" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtine6" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtine7" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtine8" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-server-core-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinej" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinek" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtineb" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinec" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtined" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinee" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinef" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtineg" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtineh" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinei" role="2Ry0An">
                            <property role="2Ry0Am" value="model-api-gen-runtime-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinet" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtineu" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinel" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinem" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinen" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtineo" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinep" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtineq" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiner" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtines" role="2Ry0An">
                            <property role="2Ry0Am" value="mps-multiplatform-lib-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtineB" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtineC" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinev" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinew" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinex" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiney" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinez" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtine$" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtine_" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtineA" role="2Ry0An">
                            <property role="2Ry0Am" value="model-datastructure-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtineL" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtineM" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtineD" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtineE" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtineF" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtineG" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtineH" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtineI" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtineJ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtineK" role="2Ry0An">
                            <property role="2Ry0Am" value="model-api-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtineV" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtineW" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtineN" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtineO" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtineP" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtineQ" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtineR" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtineS" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtineT" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtineU" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-logging-jvm-3.0.5.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinf5" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinf6" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtineX" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtineY" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtineZ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinf0" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinf1" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinf2" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinf3" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinf4" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-http-cio-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinff" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinfg" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinf7" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinf8" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinf9" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinfa" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinfb" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinfc" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinfd" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinfe" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-websocket-serialization-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinfp" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinfq" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinfh" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinfi" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinfj" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinfk" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinfl" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinfm" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinfn" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinfo" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-serialization-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinfz" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinf$" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinfr" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinfs" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinft" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinfu" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinfv" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinfw" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinfx" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinfy" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-websockets-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinfH" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinfI" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinf_" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinfA" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinfB" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinfC" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinfD" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinfE" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinfF" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinfG" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-http-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinfR" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinfS" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinfJ" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinfK" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinfL" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinfM" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinfN" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinfO" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinfP" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinfQ" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-events-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKting1" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKting2" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinfT" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinfU" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinfV" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinfW" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinfX" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinfY" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinfZ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKting0" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-network-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtingb" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtingc" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKting3" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKting4" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKting5" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKting6" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKting7" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKting8" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKting9" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinga" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-utils-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtingl" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtingm" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtingd" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinge" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtingf" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtingg" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtingh" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtingi" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtingj" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtingk" role="2Ry0An">
                            <property role="2Ry0Am" value="ktor-io-jvm-3.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtingv" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtingw" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtingn" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtingo" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtingp" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtingq" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtingr" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtings" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtingt" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtingu" role="2Ry0An">
                            <property role="2Ry0Am" value="slf4j-api-2.0.17.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtingD" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtingE" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtingx" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtingy" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtingz" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKting$" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKting_" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtingA" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtingB" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtingC" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-serialization-json-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtingN" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtingO" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtingF" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtingG" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtingH" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtingI" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtingJ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtingK" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtingL" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtingM" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtingX" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtingY" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtingP" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtingQ" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtingR" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtingS" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtingT" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtingU" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtingV" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtingW" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-logging-jvm-7.0.14.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinh7" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinh8" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtingZ" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinh0" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinh1" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinh2" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinh3" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinh4" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinh5" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinh6" role="2Ry0An">
                            <property role="2Ry0Am" value="logback-core-1.5.32.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinhh" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinhi" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinh9" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinha" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinhb" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinhc" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinhd" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinhe" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinhf" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinhg" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-html-jvm-0.12.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinhr" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinhs" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinhj" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinhk" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinhl" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinhm" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinhn" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinho" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinhp" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinhq" role="2Ry0An">
                            <property role="2Ry0Am" value="datastructures-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinh_" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinhA" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinht" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinhu" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinhv" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinhw" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinhx" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinhy" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinhz" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinh$" role="2Ry0An">
                            <property role="2Ry0Am" value="streams-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinhJ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinhK" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinhB" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinhC" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinhD" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinhE" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinhF" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinhG" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinhH" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinhI" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-utils-jvm-18.6.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinhT" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinhU" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinhL" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinhM" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinhN" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinhO" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinhP" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinhQ" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinhR" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinhS" role="2Ry0An">
                            <property role="2Ry0Am" value="core-3.1.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtini3" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtini4" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinhV" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinhW" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinhX" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinhY" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinhZ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtini0" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtini1" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtini2" role="2Ry0An">
                            <property role="2Ry0Am" value="stable-api-1.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinid" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinie" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtini5" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtini6" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtini7" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtini8" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtini9" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinia" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinib" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinic" role="2Ry0An">
                            <property role="2Ry0Am" value="config-1.4.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinin" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinio" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinif" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinig" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinih" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinii" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinij" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinik" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinil" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinim" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-reflect-2.2.21.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinix" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiniy" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinip" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiniq" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinir" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinis" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinit" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiniu" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiniv" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiniw" role="2Ry0An">
                            <property role="2Ry0Am" value="jansi-2.4.2.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiniF" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiniG" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiniz" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtini$" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtini_" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiniA" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiniB" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiniC" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiniD" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiniE" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-http2-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiniP" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiniQ" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiniH" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiniI" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiniJ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiniK" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiniL" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiniM" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiniN" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiniO" role="2Ry0An">
                            <property role="2Ry0Am" value="alpn-api-1.1.3.v20160715.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiniZ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinj0" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiniR" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiniS" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiniT" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiniU" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiniV" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiniW" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiniX" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiniY" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-native-kqueue-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinj9" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinja" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinj1" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinj2" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinj3" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinj4" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinj5" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinj6" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinj7" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinj8" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-native-epoll-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinjj" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinjk" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinjb" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinjc" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinjd" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinje" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinjf" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinjg" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinjh" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinji" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-krpc-serialization-core-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinjt" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinju" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinjl" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinjm" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinjn" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinjo" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinjp" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinjq" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinjr" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinjs" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-stdlib-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinjB" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinjC" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinjv" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinjw" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinjx" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinjy" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinjz" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinj$" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinj_" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinjA" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-http-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinjL" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinjM" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinjD" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinjE" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinjF" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinjG" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinjH" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinjI" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinjJ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinjK" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-handler-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinjV" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinjW" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinjN" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinjO" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinjP" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinjQ" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinjR" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinjS" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinjT" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinjU" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-compression-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtink5" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtink6" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinjX" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinjY" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinjZ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtink0" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtink1" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtink2" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtink3" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtink4" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-codec-base-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinkf" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinkg" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtink7" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtink8" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtink9" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinka" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinkb" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinkc" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinkd" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinke" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-classes-kqueue-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinkp" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinkq" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinkh" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinki" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinkj" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinkk" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinkl" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinkm" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinkn" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinko" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-classes-epoll-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinkz" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtink$" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinkr" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinks" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinkt" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinku" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinkv" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinkw" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinkx" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinky" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-native-unix-common-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinkH" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinkI" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtink_" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinkA" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinkB" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinkC" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinkD" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinkE" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinkF" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinkG" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-transport-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinkR" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinkS" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinkJ" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinkK" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinkL" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinkM" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinkN" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinkO" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinkP" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinkQ" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-buffer-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinl1" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinl2" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinkT" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinkU" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinkV" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinkW" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinkX" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinkY" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinkZ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinl0" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-resolver-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinlb" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinlc" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinl3" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinl4" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinl5" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinl6" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinl7" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinl8" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinl9" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinla" role="2Ry0An">
                            <property role="2Ry0Am" value="netty-common-4.2.4.Final.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinll" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinlm" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinld" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinle" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinlf" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinlg" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinlh" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinli" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinlj" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinlk" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-rpc-utils-jvm-0.10.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinlv" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinlw" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinln" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinlo" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinlp" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinlq" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinlr" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinls" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinlt" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinlu" role="2Ry0An">
                            <property role="2Ry0Am" value="annotations-13.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinlD" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinlE" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinlx" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinly" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinlz" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinl$" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinl_" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinlA" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinlB" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinlC" role="2Ry0An">
                            <property role="2Ry0Am" value="commons-collections4-4.5.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinlN" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinlO" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinlF" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinlG" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinlH" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinlI" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinlJ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinlK" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinlL" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinlM" role="2Ry0An">
                            <property role="2Ry0Am" value="kaml-jvm-0.104.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinlX" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinlY" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinlP" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinlQ" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinlR" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinlS" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinlT" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinlU" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinlV" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinlW" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-datetime-jvm-0.6.2.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinm7" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinm8" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinlZ" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinm0" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinm1" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinm2" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinm3" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinm4" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinm5" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinm6" role="2Ry0An">
                            <property role="2Ry0Am" value="snakeyaml-engine-kmp-jvm-4.0.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinmh" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinmi" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinm9" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinma" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinmb" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinmc" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinmd" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinme" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinmf" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinmg" role="2Ry0An">
                            <property role="2Ry0Am" value="guava-33.5.0-jre.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinmr" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinms" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinmj" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinmk" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinml" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinmm" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinmn" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinmo" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinmp" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinmq" role="2Ry0An">
                            <property role="2Ry0Am" value="coroutines-interop-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinm_" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinmA" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinmt" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinmu" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinmv" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinmw" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinmx" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinmy" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinmz" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinm$" role="2Ry0An">
                            <property role="2Ry0Am" value="okio-jvm-3.16.4.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinmJ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinmK" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinmB" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinmC" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinmD" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinmE" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinmF" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinmG" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinmH" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinmI" role="2Ry0An">
                            <property role="2Ry0Am" value="failureaccess-1.0.3.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinmT" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinmU" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinmL" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinmM" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinmN" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinmO" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinmP" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinmQ" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinmR" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinmS" role="2Ry0An">
                            <property role="2Ry0Am" value="listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinn3" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinn4" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinmV" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinmW" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinmX" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinmY" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinmZ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinn0" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinn1" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinn2" role="2Ry0An">
                            <property role="2Ry0Am" value="jspecify-1.0.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinnd" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinne" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinn5" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinn6" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinn7" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinn8" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinn9" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinna" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinnb" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinnc" role="2Ry0An">
                            <property role="2Ry0Am" value="error_prone_annotations-2.41.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinnn" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinno" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinnf" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinng" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinnh" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinni" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinnj" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinnk" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinnl" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinnm" role="2Ry0An">
                            <property role="2Ry0Am" value="j2objc-annotations-3.1.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinnx" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinny" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinnp" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinnq" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinnr" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinns" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinnt" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinnu" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinnv" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinnw" role="2Ry0An">
                            <property role="2Ry0Am" value="sha2-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinnF" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinnG" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinnz" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinn$" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinn_" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinnA" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinnB" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinnC" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinnD" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinnE" role="2Ry0An">
                            <property role="2Ry0Am" value="reaktive-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinnP" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinnQ" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinnH" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinnI" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinnJ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinnK" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinnL" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinnM" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinnN" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinnO" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-io-core-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinnZ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtino0" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinnR" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinnS" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinnT" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinnU" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinnV" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinnW" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinnX" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinnY" role="2Ry0An">
                            <property role="2Ry0Am" value="urlencoder-lib-jvm-1.6.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtino9" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinoa" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtino1" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtino2" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtino3" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtino4" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtino5" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtino6" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtino7" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtino8" role="2Ry0An">
                            <property role="2Ry0Am" value="digest-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinoj" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinok" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinob" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinoc" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinod" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinoe" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinof" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinog" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinoh" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinoi" role="2Ry0An">
                            <property role="2Ry0Am" value="bits-jvm-0.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinot" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinou" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinol" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinom" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinon" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinoo" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinop" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinoq" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinor" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinos" role="2Ry0An">
                            <property role="2Ry0Am" value="endian-jvm-0.3.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinoB" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinoC" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinov" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinow" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinox" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinoy" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinoz" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtino$" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtino_" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinoA" role="2Ry0An">
                            <property role="2Ry0Am" value="utils-internal-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinoL" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinoM" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinoD" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinoE" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinoF" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinoG" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinoH" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinoI" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinoJ" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinoK" role="2Ry0An">
                            <property role="2Ry0Am" value="reaktive-annotations-jvm-2.2.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinoV" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinoW" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinoN" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinoO" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinoP" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinoQ" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinoR" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinoS" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinoT" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinoU" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlinx-io-bytestring-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinp5" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinp6" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinoX" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinoY" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinoZ" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinp0" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinp1" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinp2" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinp3" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinp4" role="2Ry0An">
                            <property role="2Ry0Am" value="core-jvm-0.8.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinpf" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinpg" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinp7" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinp8" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinp9" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinpa" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinpb" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinpc" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinpd" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinpe" role="2Ry0An">
                            <property role="2Ry0Am" value="error-jvm-0.4.0.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtinpp" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtinpq" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtinph" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinpi" role="iGT6I">
                <property role="2Ry0Am" value="editor-common-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinpj" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtinpk" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtinpl" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtinpm" role="2Ry0An">
                        <property role="2Ry0Am" value="editor-common-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtinpn" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtinpo" role="2Ry0An">
                            <property role="2Ry0Am" value="editor-common-mps-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
      <node concept="1E1JtA" id="5DFJIKtizJH" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.editor.ssr.stubs" />
        <property role="3LESm3" value="771cf896-ab1b-409b-93b4-48c3bbb6b23f" />
        <property role="3vZFNd" value="3kCd1ud3JDF/none" />
        <node concept="30tkmh" id="5DFJIKtiER9" role="3LF7KH">
          <node concept="398BVA" id="5DFJIKti$6x" role="30tYEP">
            <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
            <node concept="2Ry0Ak" id="5DFJIKtiAf5" role="iGT6I">
              <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
              <node concept="2Ry0Ak" id="5DFJIKtiAWC" role="2Ry0An">
                <property role="2Ry0Am" value="build" />
                <node concept="2Ry0Ak" id="5DFJIKtiBEb" role="2Ry0An">
                  <property role="2Ry0Am" value="idea-sandbox" />
                  <node concept="2Ry0Ak" id="5DFJIKtiCnI" role="2Ry0An">
                    <property role="2Ry0Am" value="plugins" />
                    <node concept="2Ry0Ak" id="5DFJIKtiD5h" role="2Ry0An">
                      <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                      <node concept="2Ry0Ak" id="5DFJIKtiDMO" role="2Ry0An">
                        <property role="2Ry0Am" value="languages" />
                        <node concept="2Ry0Ak" id="5DFJIKtiEwn" role="2Ry0An">
                          <property role="2Ry0Am" value="org.modelix.mps.editor.ssr.stubs.jar" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2Ry0Ak" id="5DFJIKtiERb" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtiFVu" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.editor.ssr.stubs" />
              <node concept="2Ry0Ak" id="5DFJIKtiGD1" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.editor.ssr.stubs.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiHlM" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtiHlN" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:mXGwHwhVPj" resolve="JDK" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiHlO" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtiHlP" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:44LXwdzyvTi" resolve="Annotations" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiHlQ" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtiHlR" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1ia2VB5guYy" resolve="MPS.IDEA" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiHlS" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtiHlT" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" node="5DFJIKtieTK" resolve="org.modelix.mps.editor.common.stubs" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiHlU" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtiHlV" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1H905DlDUSw" resolve="MPS.OpenAPI" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiHm4" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHm5" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHlW" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHlX" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHlY" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHlZ" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHm0" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHm1" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHm2" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHm3" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-ssr-server-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHme" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHmf" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHm6" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHm7" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHm8" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHm9" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHma" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHmb" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHmc" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHmd" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-ssr-common-jvm-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHmo" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHmp" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHmg" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHmh" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHmi" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHmj" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHmk" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHml" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHmm" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHmn" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-jvm-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHmy" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHmz" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHmq" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHmr" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHms" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHmt" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHmu" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHmv" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHmw" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHmx" role="2Ry0An">
                            <property role="2Ry0Am" value="parser-jvm-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHmG" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHmH" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHm$" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHm_" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHmA" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHmB" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHmC" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHmD" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHmE" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHmF" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-ssr-mps-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHmQ" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHmR" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHmI" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHmJ" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHmK" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHmL" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHmM" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHmN" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHmO" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHmP" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-ssr-server-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHn0" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHn1" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHmS" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHmT" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHmU" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHmV" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHmW" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHmX" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHmY" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHmZ" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-ssr-common-jvm-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHna" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHnb" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHn2" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHn3" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHn4" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHn5" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHn6" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHn7" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHn8" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHn9" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-jvm-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHnk" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHnl" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHnc" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHnd" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHne" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHnf" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHng" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHnh" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHni" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHnj" role="2Ry0An">
                            <property role="2Ry0Am" value="parser-jvm-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiHnu" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiHnv" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiHnm" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiHnn" role="iGT6I">
                <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiHno" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiHnp" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiHnq" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiHnr" role="2Ry0An">
                        <property role="2Ry0Am" value="projectional-editor-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiHns" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiHnt" role="2Ry0An">
                            <property role="2Ry0Am" value="projectional-editor-ssr-mps-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
      <node concept="1E1JtD" id="5DFJIKtiZA1" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.model.repositoryconcepts" />
        <property role="3LESm3" value="0a7577d1-d4e5-431d-98b1-fae38f9aee80" />
        <node concept="30tkmh" id="5DFJIKtj5Al" role="3LF7KH">
          <node concept="398BVA" id="5DFJIKtiZY5" role="30tYEP">
            <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
            <node concept="2Ry0Ak" id="5DFJIKtj0m8" role="iGT6I">
              <property role="2Ry0Am" value="mps" />
              <node concept="2Ry0Ak" id="5DFJIKtj1Qa" role="2Ry0An">
                <property role="2Ry0Am" value="build" />
                <node concept="2Ry0Ak" id="5DFJIKtj3md" role="2Ry0An">
                  <property role="2Ry0Am" value="repositoryConcepts" />
                  <node concept="2Ry0Ak" id="5DFJIKtj4ug" role="2Ry0An">
                    <property role="2Ry0Am" value="packaged-modules" />
                    <node concept="2Ry0Ak" id="5DFJIKtj5ej" role="2Ry0An">
                      <property role="2Ry0Am" value="org.modelix.model.repositoryconcepts-src.jar" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2Ry0Ak" id="5DFJIKtj5An" role="iGT6I">
            <property role="2Ry0Am" value="module" />
            <node concept="2Ry0Ak" id="5DFJIKtj6Iq" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.model.repositoryconcepts.mpl" />
            </node>
          </node>
        </node>
        <node concept="3rtmxn" id="5DFJIKtjbg_" role="3bR31x">
          <node concept="3LXTmp" id="5DFJIKtjbgA" role="3rtmxm">
            <node concept="30tkmh" id="5DFJIKtjbgB" role="3LXTmr">
              <node concept="398BVA" id="5DFJIKtjbgC" role="30tYEP">
                <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
                <node concept="2Ry0Ak" id="5DFJIKtjbgD" role="iGT6I">
                  <property role="2Ry0Am" value="mps" />
                  <node concept="2Ry0Ak" id="5DFJIKtjbgE" role="2Ry0An">
                    <property role="2Ry0Am" value="build" />
                    <node concept="2Ry0Ak" id="5DFJIKtjbgF" role="2Ry0An">
                      <property role="2Ry0Am" value="repositoryConcepts" />
                      <node concept="2Ry0Ak" id="5DFJIKtjbgG" role="2Ry0An">
                        <property role="2Ry0Am" value="packaged-modules" />
                        <node concept="2Ry0Ak" id="5DFJIKtjbgH" role="2Ry0An">
                          <property role="2Ry0Am" value="org.modelix.model.repositoryconcepts-src.jar" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2Ry0Ak" id="5DFJIKtjbgI" role="iGT6I">
                <property role="2Ry0Am" value="module" />
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtjbgK" role="3LXTna">
              <property role="3qWCbO" value="icons/**, resources/**" />
            </node>
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtjd_i" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtjd_j" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtjd_3" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtjd_4" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtjd_5" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtjd_6" role="2Ry0An">
                    <property role="2Ry0Am" value="repositoryConcepts" />
                    <node concept="2Ry0Ak" id="5DFJIKtjd_7" role="2Ry0An">
                      <property role="2Ry0Am" value="packaged-modules" />
                      <node concept="2Ry0Ak" id="5DFJIKtjd_8" role="2Ry0An">
                        <property role="2Ry0Am" value="org.modelix.model.repositoryconcepts-src.jar!" />
                        <node concept="2Ry0Ak" id="5DFJIKtjd_9" role="2Ry0An">
                          <property role="2Ry0Am" value="module" />
                          <node concept="2Ry0Ak" id="5DFJIKtjd_a" role="2Ry0An">
                            <property role="2Ry0Am" value="models" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtjd_k" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1E1JtA" id="5DFJIKtieQy" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.react.ssr.stubs" />
        <property role="3LESm3" value="83a7cbdc-dd9d-4dad-be97-957aa1b07375" />
        <property role="3vZFNd" value="3kCd1ud3JDF/none" />
        <node concept="30tkmh" id="5DFJIKtivc9" role="3LF7KH">
          <node concept="398BVA" id="5DFJIKtijNf" role="30tYEP">
            <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
            <node concept="2Ry0Ak" id="5DFJIKtijNm" role="iGT6I">
              <property role="2Ry0Am" value="react-ssr-mps" />
              <node concept="2Ry0Ak" id="5DFJIKtijNo" role="2Ry0An">
                <property role="2Ry0Am" value="build" />
                <node concept="2Ry0Ak" id="5DFJIKtijNp" role="2Ry0An">
                  <property role="2Ry0Am" value="idea-sandbox" />
                  <node concept="2Ry0Ak" id="5DFJIKtiroD" role="2Ry0An">
                    <property role="2Ry0Am" value="plugins" />
                    <node concept="2Ry0Ak" id="5DFJIKtis4G" role="2Ry0An">
                      <property role="2Ry0Am" value="react-ssr-mps" />
                      <node concept="2Ry0Ak" id="5DFJIKtisKJ" role="2Ry0An">
                        <property role="2Ry0Am" value="languages" />
                        <node concept="2Ry0Ak" id="5DFJIKtiuuM" role="2Ry0An">
                          <property role="2Ry0Am" value="org.modelix.mps.react.ssr.stubs.jar" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2Ry0Ak" id="5DFJIKtivcb" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtiw$e" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.react.ssr.stubs" />
              <node concept="2Ry0Ak" id="5DFJIKtixWi" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.react.ssr.stubs.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieR7" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieR8" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:mXGwHwhVPj" resolve="JDK" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieR9" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieRa" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1ia2VB5guYy" resolve="MPS.IDEA" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieRb" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieRc" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" to="ffeo:1H905DlDUSw" resolve="MPS.OpenAPI" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieVi" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieVj" role="1SiIV1">
            <property role="3bR36h" value="true" />
            <ref role="3bR37D" node="5DFJIKtieTK" resolve="org.modelix.mps.editor.common.stubs" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtiyDb" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiyDc" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiyD3" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiyD4" role="iGT6I">
                <property role="2Ry0Am" value="react-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiyD5" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiyD6" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiyD7" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiyD8" role="2Ry0An">
                        <property role="2Ry0Am" value="react-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiyD9" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiyDa" role="2Ry0An">
                            <property role="2Ry0Am" value="react-ssr-server-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiyDl" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiyDm" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiyDd" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiyDe" role="iGT6I">
                <property role="2Ry0Am" value="react-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiyDf" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiyDg" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiyDh" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiyDi" role="2Ry0An">
                        <property role="2Ry0Am" value="react-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiyDj" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiyDk" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-reflect-2.2.10.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiyDv" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiyDw" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiyDn" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiyDo" role="iGT6I">
                <property role="2Ry0Am" value="react-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiyDp" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiyDq" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiyDr" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiyDs" role="2Ry0An">
                        <property role="2Ry0Am" value="react-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiyDt" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiyDu" role="2Ry0An">
                            <property role="2Ry0Am" value="react-ssr-mps-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiyDD" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiyDE" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiyDx" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiyDy" role="iGT6I">
                <property role="2Ry0Am" value="react-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiyDz" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiyD$" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiyD_" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiyDA" role="2Ry0An">
                        <property role="2Ry0Am" value="react-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiyDB" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiyDC" role="2Ry0An">
                            <property role="2Ry0Am" value="react-ssr-server-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiyDN" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiyDO" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiyDF" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiyDG" role="iGT6I">
                <property role="2Ry0Am" value="react-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiyDH" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiyDI" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiyDJ" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiyDK" role="2Ry0An">
                        <property role="2Ry0Am" value="react-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiyDL" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiyDM" role="2Ry0An">
                            <property role="2Ry0Am" value="kotlin-reflect-2.2.10.jar" />
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
        <node concept="1SiIV0" id="5DFJIKtiyDX" role="3bR37C">
          <node concept="1BurEX" id="5DFJIKtiyDY" role="1SiIV1">
            <node concept="398BVA" id="5DFJIKtiyDP" role="1BurEY">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtiyDQ" role="iGT6I">
                <property role="2Ry0Am" value="react-ssr-mps" />
                <node concept="2Ry0Ak" id="5DFJIKtiyDR" role="2Ry0An">
                  <property role="2Ry0Am" value="build" />
                  <node concept="2Ry0Ak" id="5DFJIKtiyDS" role="2Ry0An">
                    <property role="2Ry0Am" value="idea-sandbox" />
                    <node concept="2Ry0Ak" id="5DFJIKtiyDT" role="2Ry0An">
                      <property role="2Ry0Am" value="plugins" />
                      <node concept="2Ry0Ak" id="5DFJIKtiyDU" role="2Ry0An">
                        <property role="2Ry0Am" value="react-ssr-mps" />
                        <node concept="2Ry0Ak" id="5DFJIKtiyDV" role="2Ry0An">
                          <property role="2Ry0Am" value="lib" />
                          <node concept="2Ry0Ak" id="5DFJIKtiyDW" role="2Ry0An">
                            <property role="2Ry0Am" value="react-ssr-mps-1.10.0-20-g33d5a61-dirty-SNAPSHOT.jar" />
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
    <node concept="2G$12M" id="5DFJIKtieM6" role="3989C9">
      <property role="TrG5h" value="org.modelix.editor" />
      <node concept="1E1JtD" id="5DFJIKtieLr" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.react" />
        <property role="3LESm3" value="67accce2-9676-4728-9e9c-8b15ea30d924" />
        <node concept="55IIr" id="5DFJIKtieLm" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLn" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieLo" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.react" />
              <node concept="2Ry0Ak" id="5DFJIKtieLp" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.react.mpl" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMo" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieMp" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6KXW" resolve="jetbrains.mps.lang.core" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMq" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieMr" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:1TaHNgiIbIZ" resolve="MPS.Editor" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMs" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieMt" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6LfQ" resolve="jetbrains.mps.kernel" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMu" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieMv" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:3qkjbZn8cF0" resolve="jetbrains.mps.lang.feedback.problem.legacy-constraints" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMw" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieMx" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:3qkjbZn808a" resolve="jetbrains.mps.lang.constraints.rules.runtime" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMy" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieMz" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6LaO" resolve="jetbrains.mps.lang.structure" />
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieMC" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtinqA" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinqt" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinqu" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinqv" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinqw" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.react" />
                    <node concept="2Ry0Ak" id="5DFJIKtinqx" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtinqB" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMF" role="3bR37C">
          <node concept="1Busua" id="5DFJIKtieMG" role="1SiIV1">
            <ref role="1Busuk" to="ffeo:7Kfy9QB6KYb" resolve="jetbrains.mps.baseLanguage" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieMH" role="3bR37C">
          <node concept="Rbm2T" id="5DFJIKtieMI" role="1SiIV1">
            <ref role="1E1Vl2" to="ffeo:7Kfy9QB6L9O" resolve="jetbrains.mps.lang.smodel" />
          </node>
        </node>
        <node concept="1yeLz9" id="5DFJIKtieMJ" role="1TViLv">
          <property role="TrG5h" value="org.modelix.mps.react.generator" />
          <property role="3LESm3" value="cd8940fe-d25b-4a89-862a-d6c143263ab2" />
          <node concept="1SiIV0" id="5DFJIKtieMK" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieML" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:mXGwHwhVPj" resolve="JDK" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieMM" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieMN" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:44LXwdzyvTi" resolve="Annotations" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieMO" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieMP" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:1ia2VB5guYy" resolve="MPS.IDEA" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieMQ" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieMR" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:7Kfy9QB6KZG" resolve="jetbrains.mps.baseLanguage.closures" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieMS" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieMT" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:7Kfy9QB6L9O" resolve="jetbrains.mps.lang.smodel" />
            </node>
          </node>
          <node concept="1BupzO" id="5DFJIKtieMZ" role="3bR31x">
            <property role="3ZfqAx" value="generator/templates" />
            <property role="1Hdu6h" value="true" />
            <property role="1HemKv" value="true" />
            <node concept="3LXTmp" id="5DFJIKtinqN" role="1HemKq">
              <node concept="398BVA" id="5DFJIKtinqC" role="3LXTmr">
                <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
                <node concept="2Ry0Ak" id="5DFJIKtinqD" role="iGT6I">
                  <property role="2Ry0Am" value="mps" />
                  <node concept="2Ry0Ak" id="5DFJIKtinqE" role="2Ry0An">
                    <property role="2Ry0Am" value="modules" />
                    <node concept="2Ry0Ak" id="5DFJIKtinqF" role="2Ry0An">
                      <property role="2Ry0Am" value="org.modelix.mps.react" />
                      <node concept="2Ry0Ak" id="5DFJIKtinqG" role="2Ry0An">
                        <property role="2Ry0Am" value="generator" />
                        <node concept="2Ry0Ak" id="5DFJIKtinqH" role="2Ry0An">
                          <property role="2Ry0Am" value="templates" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3qWCbU" id="5DFJIKtinqO" role="3LXTna">
                <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
              </node>
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieRX" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieRY" role="1SiIV1">
              <ref role="3bR37D" node="5DFJIKtieQy" resolve="org.modelix.mps.react.ssr.stubs" />
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieRQ" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieRR" role="1SiIV1">
            <ref role="3bR37D" node="5DFJIKtieQy" resolve="org.modelix.mps.react.ssr.stubs" />
          </node>
        </node>
        <node concept="1E0d5M" id="5DFJIKtieRW" role="1E1XAP">
          <ref role="1E0d5P" node="5DFJIKtieQy" resolve="org.modelix.mps.react.ssr.stubs" />
        </node>
        <node concept="3rtmxn" id="5DFJIKtiz24" role="3bR31x">
          <node concept="3LXTmp" id="5DFJIKtiz25" role="3rtmxm">
            <node concept="55IIr" id="5DFJIKtiz26" role="3LXTmr">
              <node concept="2Ry0Ak" id="5DFJIKtiz27" role="iGT6I">
                <property role="2Ry0Am" value="modules" />
                <node concept="2Ry0Ak" id="5DFJIKtiz28" role="2Ry0An">
                  <property role="2Ry0Am" value="org.modelix.mps.react" />
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtiz2a" role="3LXTna">
              <property role="3qWCbO" value="icons/**, resources/**" />
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtj8Z0" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtj8Z1" role="1SiIV1">
            <ref role="3bR37D" node="5DFJIKtiZA1" resolve="org.modelix.model.repositoryconcepts" />
          </node>
        </node>
      </node>
      <node concept="1E1JtD" id="5DFJIKtieLx" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.notation" />
        <property role="3LESm3" value="c7b55726-1795-47bd-aa21-714ac1e30f21" />
        <node concept="55IIr" id="5DFJIKtieLs" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLt" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieLu" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.notation" />
              <node concept="2Ry0Ak" id="5DFJIKtieLv" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.notation.mpl" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieN2" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieN3" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6KYb" resolve="jetbrains.mps.baseLanguage" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieN4" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieN5" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6LfQ" resolve="jetbrains.mps.kernel" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieN6" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieN7" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6LaO" resolve="jetbrains.mps.lang.structure" />
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieNc" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtinqY" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinqP" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinqQ" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinqR" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinqS" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.notation" />
                    <node concept="2Ry0Ak" id="5DFJIKtinqT" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtinqZ" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNf" role="3bR37C">
          <node concept="1Busua" id="5DFJIKtieNg" role="1SiIV1">
            <ref role="1Busuk" to="ffeo:Ye$g8PO8Uc" resolve="jetbrains.mps.kotlin" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNh" role="3bR37C">
          <node concept="1Busua" id="5DFJIKtieNi" role="1SiIV1">
            <ref role="1Busuk" to="ffeo:7Kfy9QB6KYb" resolve="jetbrains.mps.baseLanguage" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNj" role="3bR37C">
          <node concept="Rbm2T" id="5DFJIKtieNk" role="1SiIV1">
            <ref role="1E1Vl2" to="ffeo:Ye$g8PO8Uc" resolve="jetbrains.mps.kotlin" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNl" role="3bR37C">
          <node concept="Rbm2T" id="5DFJIKtieNm" role="1SiIV1">
            <ref role="1E1Vl2" to="ffeo:7Kfy9QB6L9O" resolve="jetbrains.mps.lang.smodel" />
          </node>
        </node>
        <node concept="1yeLz9" id="5DFJIKtieNn" role="1TViLv">
          <property role="TrG5h" value="org.modelix.mps.notation.generator" />
          <property role="3LESm3" value="f17e23b2-e165-4228-abab-9206f068490b" />
          <node concept="1SiIV0" id="5DFJIKtieNo" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieNp" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:mXGwHwhVPj" resolve="JDK" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieNq" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieNr" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:7Kfy9QB6Lg8" resolve="jetbrains.mps.runtime" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieNs" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieNt" role="1SiIV1">
              <ref role="3bR37D" to="ffeo:7Kfy9QB6LaO" resolve="jetbrains.mps.lang.structure" />
            </node>
          </node>
          <node concept="1BupzO" id="5DFJIKtieNz" role="3bR31x">
            <property role="3ZfqAx" value="generator/templates" />
            <property role="1Hdu6h" value="true" />
            <property role="1HemKv" value="true" />
            <node concept="3LXTmp" id="5DFJIKtinrb" role="1HemKq">
              <node concept="398BVA" id="5DFJIKtinr0" role="3LXTmr">
                <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
                <node concept="2Ry0Ak" id="5DFJIKtinr1" role="iGT6I">
                  <property role="2Ry0Am" value="mps" />
                  <node concept="2Ry0Ak" id="5DFJIKtinr2" role="2Ry0An">
                    <property role="2Ry0Am" value="modules" />
                    <node concept="2Ry0Ak" id="5DFJIKtinr3" role="2Ry0An">
                      <property role="2Ry0Am" value="org.modelix.mps.notation" />
                      <node concept="2Ry0Ak" id="5DFJIKtinr4" role="2Ry0An">
                        <property role="2Ry0Am" value="generator" />
                        <node concept="2Ry0Ak" id="5DFJIKtinr5" role="2Ry0An">
                          <property role="2Ry0Am" value="templates" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3qWCbU" id="5DFJIKtinrc" role="3LXTna">
                <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
              </node>
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtieVx" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtieVy" role="1SiIV1">
              <ref role="3bR37D" node="5DFJIKtieTK" resolve="org.modelix.mps.editor.common.stubs" />
            </node>
          </node>
          <node concept="1SiIV0" id="5DFJIKtiIa3" role="3bR37C">
            <node concept="3bR9La" id="5DFJIKtiIa4" role="1SiIV1">
              <ref role="3bR37D" node="5DFJIKtizJH" resolve="org.modelix.mps.editor.ssr.stubs" />
            </node>
          </node>
        </node>
        <node concept="1E0d5M" id="5DFJIKtiIa2" role="1E1XAP">
          <ref role="1E0d5P" node="5DFJIKtizJH" resolve="org.modelix.mps.editor.ssr.stubs" />
        </node>
        <node concept="3rtmxn" id="5DFJIKtiIyX" role="3bR31x">
          <node concept="3LXTmp" id="5DFJIKtiIyY" role="3rtmxm">
            <node concept="55IIr" id="5DFJIKtiIyZ" role="3LXTmr">
              <node concept="2Ry0Ak" id="5DFJIKtiIz0" role="iGT6I">
                <property role="2Ry0Am" value="modules" />
                <node concept="2Ry0Ak" id="5DFJIKtiIz1" role="2Ry0An">
                  <property role="2Ry0Am" value="org.modelix.mps.notation" />
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtiIz3" role="3LXTna">
              <property role="3qWCbO" value="icons/**, resources/**" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1E1JtA" id="5DFJIKtieLB" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.webaspect.runtime" />
        <property role="3LESm3" value="29748631-931f-4cbc-96da-5f1be8642fef" />
        <node concept="55IIr" id="5DFJIKtieLy" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLz" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieL$" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.webaspect.runtime" />
              <node concept="2Ry0Ak" id="5DFJIKtieL_" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.webaspect.runtime.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieNE" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtinrm" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinrd" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinre" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinrf" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinrg" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.webaspect.runtime" />
                    <node concept="2Ry0Ak" id="5DFJIKtinrh" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtinrn" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1E1JtA" id="5DFJIKtieLH" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.notation.impl.baseLanguage" />
        <property role="3LESm3" value="43d5203d-a568-4046-a632-7e36423e5142" />
        <node concept="55IIr" id="5DFJIKtieLC" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLD" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieLE" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.notation.impl.baseLanguage" />
              <node concept="2Ry0Ak" id="5DFJIKtieLF" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.notation.impl.baseLanguage.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNH" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieNI" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6Lc2" resolve="jetbrains.mps.lang.typesystem" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNJ" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieNK" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:3HV74$ebibC" resolve="jetbrains.mps.lang.text" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNL" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieNM" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6KYb" resolve="jetbrains.mps.baseLanguage" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNN" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieNO" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6L9O" resolve="jetbrains.mps.lang.smodel" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieNP" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieNQ" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6KZc" resolve="jetbrains.mps.baseLanguage.checkedDots" />
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieNV" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtinrx" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinro" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinrp" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinrq" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinrr" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.notation.impl.baseLanguage" />
                    <node concept="2Ry0Ak" id="5DFJIKtinrs" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtinry" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3LEwk6" id="5DFJIKtieLN" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.webaspect.devkit" />
        <property role="3LESm3" value="46d68387-81c7-4c54-9dd2-2717eb3f009b" />
        <node concept="55IIr" id="5DFJIKtieLI" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLJ" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieLK" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.webaspect.devkit" />
              <node concept="2Ry0Ak" id="5DFJIKtieLL" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.webaspect.devkit.devkit" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3LEDTy" id="5DFJIKtieNY" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:7Kfy9QB6KYb" resolve="jetbrains.mps.baseLanguage" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieNZ" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:7Kfy9QB6L9O" resolve="jetbrains.mps.lang.smodel" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO0" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:Ye$g8PO8Uc" resolve="jetbrains.mps.kotlin" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO1" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:1G33vFCcOiL" resolve="jetbrains.mps.kotlin.internal" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO2" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:1G33vFC9d3f" resolve="jetbrains.mps.kotlin.smodel" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO3" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:7Kfy9QB6KZ0" resolve="jetbrains.mps.baseLanguageInternal" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO4" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:7Kfy9QB6KZG" resolve="jetbrains.mps.baseLanguage.closures" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO5" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:1d41uYMTTNW" resolve="jetbrains.mps.baseLanguage.varVariable" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO6" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:7Kfy9QB6L0h" resolve="jetbrains.mps.baseLanguage.collections" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieO7" role="3LEDUa">
          <ref role="3LEDTV" to="ffeo:7Kfy9QB6KZc" resolve="jetbrains.mps.baseLanguage.checkedDots" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieRB" role="3LEDUa">
          <ref role="3LEDTV" node="5DFJIKtieLx" resolve="org.modelix.mps.notation" />
        </node>
        <node concept="3LEDTy" id="5DFJIKtieRC" role="3LEDUa">
          <ref role="3LEDTV" node="5DFJIKtieLr" resolve="org.modelix.mps.react" />
        </node>
        <node concept="3LEDTM" id="5DFJIKtieRD" role="3LEDUa">
          <ref role="3LEDTN" node="5DFJIKtieM5" resolve="org.modelix.mps.webaspect.genplan" />
        </node>
      </node>
      <node concept="1E1JtA" id="5DFJIKtieLT" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.react.ide" />
        <property role="3LESm3" value="0f284337-eee6-4d6a-9ca4-9d4085f10b3a" />
        <node concept="55IIr" id="5DFJIKtieLO" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLP" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieLQ" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.react.ide" />
              <node concept="2Ry0Ak" id="5DFJIKtieLR" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.react.ide.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieO8" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieO9" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:mXGwHwhVPj" resolve="JDK" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieOa" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieOb" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:71aLKqdKvPp" resolve="jetbrains.mps.ide.make" />
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieOg" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtinrG" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinrz" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinr$" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinr_" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinrA" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.react.ide" />
                    <node concept="2Ry0Ak" id="5DFJIKtinrB" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtinrH" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieSl" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieSm" role="1SiIV1">
            <ref role="3bR37D" node="5DFJIKtieQy" resolve="org.modelix.mps.react.ssr.stubs" />
          </node>
        </node>
      </node>
      <node concept="1E1JtA" id="5DFJIKtieLZ" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.react.componentslib" />
        <property role="3LESm3" value="4d58c3d6-784a-4f67-9888-864ee2a714cc" />
        <node concept="55IIr" id="5DFJIKtieLU" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieLV" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieLW" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.react.componentslib" />
              <node concept="2Ry0Ak" id="5DFJIKtieLX" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.react.componentslib.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieOj" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieOk" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6KXW" resolve="jetbrains.mps.lang.core" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieOl" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieOm" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:1TaHNgiIbIQ" resolve="MPS.Core" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieOn" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieOo" role="1SiIV1">
            <ref role="3bR37D" to="ffeo:7Kfy9QB6LaO" resolve="jetbrains.mps.lang.structure" />
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieOt" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtinrR" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinrI" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinrJ" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinrK" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinrL" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.react.componentslib" />
                    <node concept="2Ry0Ak" id="5DFJIKtinrM" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtinrS" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtieSr" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtieSs" role="1SiIV1">
            <ref role="3bR37D" node="5DFJIKtieQy" resolve="org.modelix.mps.react.ssr.stubs" />
          </node>
        </node>
        <node concept="1SiIV0" id="5DFJIKtj905" role="3bR37C">
          <node concept="3bR9La" id="5DFJIKtj906" role="1SiIV1">
            <ref role="3bR37D" node="5DFJIKtiZA1" resolve="org.modelix.model.repositoryconcepts" />
          </node>
        </node>
      </node>
      <node concept="1E1JtA" id="5DFJIKtieM5" role="2G$12L">
        <property role="BnDLt" value="true" />
        <property role="TrG5h" value="org.modelix.mps.webaspect.genplan" />
        <property role="3LESm3" value="02ad200e-1634-449d-8b0b-db88f7ea0f2d" />
        <node concept="55IIr" id="5DFJIKtieM0" role="3LF7KH">
          <node concept="2Ry0Ak" id="5DFJIKtieM1" role="iGT6I">
            <property role="2Ry0Am" value="modules" />
            <node concept="2Ry0Ak" id="5DFJIKtieM2" role="2Ry0An">
              <property role="2Ry0Am" value="org.modelix.mps.webaspect.genplan" />
              <node concept="2Ry0Ak" id="5DFJIKtieM3" role="2Ry0An">
                <property role="2Ry0Am" value="org.modelix.mps.webaspect.genplan.msd" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1BupzO" id="5DFJIKtieO$" role="3bR31x">
          <property role="3ZfqAx" value="models" />
          <property role="1Hdu6h" value="true" />
          <property role="1HemKv" value="true" />
          <node concept="3LXTmp" id="5DFJIKtins2" role="1HemKq">
            <node concept="398BVA" id="5DFJIKtinrT" role="3LXTmr">
              <ref role="398BVh" node="5DFJIKtijNt" resolve="modelix.editor" />
              <node concept="2Ry0Ak" id="5DFJIKtinrU" role="iGT6I">
                <property role="2Ry0Am" value="mps" />
                <node concept="2Ry0Ak" id="5DFJIKtinrV" role="2Ry0An">
                  <property role="2Ry0Am" value="modules" />
                  <node concept="2Ry0Ak" id="5DFJIKtinrW" role="2Ry0An">
                    <property role="2Ry0Am" value="org.modelix.mps.webaspect.genplan" />
                    <node concept="2Ry0Ak" id="5DFJIKtinrX" role="2Ry0An">
                      <property role="2Ry0Am" value="models" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3qWCbU" id="5DFJIKtins3" role="3LXTna">
              <property role="3qWCbO" value="**/*.mps, **/*.mpsr, **/.model" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

