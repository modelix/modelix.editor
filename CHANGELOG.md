# Changelog

## [1.21.0](https://github.com/modelix/modelix.editor/compare/1.20.0...1.21.0) (2026-08-28)


### Features

* **projectional-editor:** derive notations for the baseLanguage companion languages ([50510a5](https://github.com/modelix/modelix.editor/commit/50510a55585921b9e56553544322a4e59f9a982c))
* **projectional-editor:** drop MPS 2023.3 and restore the derived notations ([f5fc700](https://github.com/modelix/modelix.editor/commit/f5fc700bca498789e470392e60335efefb442e8b))
* **projectional-editor:** express MPS's conditional cells as choices and optional groups ([7c451bc](https://github.com/modelix/modelix.editor/commit/7c451bc3d56730e77ba2d02cbce489b11ca58c60))
* **projectional-editor:** express MPS's conditional cells as choices and optional groups ([f9bceda](https://github.com/modelix/modelix.editor/commit/f9bcedaf4c12aba3354cc4b4fbec5225ec1988e8))
* **projectional-editor:** give the baseLanguage notations the placeholders MPS uses ([7b02436](https://github.com/modelix/modelix.editor/commit/7b02436381ab12d4375d8f2181dabb6ff2d55ccd))
* **projectional-editor:** inherit notations from the super concept ([6aef4c3](https://github.com/modelix/modelix.editor/commit/6aef4c3f14d76ad5582785a4ea4bb4a9578168f4))
* **projectional-editor:** let a notation set the placeholder of an empty child link ([eff22b9](https://github.com/modelix/modelix.editor/commit/eff22b9dc6539e5f358f65dfbc2e7bd8e35ae584))
* **projectional-editor:** let a notation set the placeholder of an empty child link ([0c83577](https://github.com/modelix/modelix.editor/commit/0c8357764f3d029a123949794a8a5aa99016e312))
* **projectional-editor:** map the alias editor component to ConceptAliasCell ([d6f5b55](https://github.com/modelix/modelix.editor/commit/d6f5b55da3b09434479072829c26a1696547022b))
* **projectional-editor:** navigate to reference targets with Cmd/Ctrl+click ([becac3d](https://github.com/modelix/modelix.editor/commit/becac3d9a0c77466189dd8e1a80c076cb5271dec))
* **projectional-editor:** notations for the languages used with baseLanguage ([6d4414c](https://github.com/modelix/modelix.editor/commit/6d4414c232c5c70be3940e9dbaeb8862fe373fce))
* **projectional-editor:** open a reference target of another root node in a new browser tab ([71b2e94](https://github.com/modelix/modelix.editor/commit/71b2e940833c58ce81c39dfbd5a8729353117b7d))
* **projectional-editor:** translate block layout, flags and optional cells ([47c45e3](https://github.com/modelix/modelix.editor/commit/47c45e3352f00319d8aefc071cd5a8290f4de5e2))


### Bug Fixes

* **deps:** update dependency com.microsoft.playwright:playwright to v1.62.0 ([#558](https://github.com/modelix/modelix.editor/issues/558)) ([8b269f6](https://github.com/modelix/modelix.editor/commit/8b269f62e74ad29edefd611778a7a94c71f2655d))
* **mps-plugin:** declare the image editor's dependency on the shared libraries plugin ([c56cba6](https://github.com/modelix/modelix.editor/commit/c56cba6e2fbced3b379883a98ac29bb5c739cfa7))
* **mps-plugin:** make the equality of the model wrapper symmetric ([e24c148](https://github.com/modelix/modelix.editor/commit/e24c1487a33f3edcef5406ad48fb855bf81f7510))
* **mps-plugin:** release the registered listeners and servers on dispose ([b7fc058](https://github.com/modelix/modelix.editor/commit/b7fc0582ba3ecdecfdae981a6fbf1b4eaa71524f))
* **projectional-editor:** drop the indent cells that may not sit where they did ([e25482f](https://github.com/modelix/modelix.editor/commit/e25482f5927fd31922707603f39b2db578a54c00))
* **projectional-editor:** drop the notation of a concept MPS 2023.3 does not have ([7a6ae16](https://github.com/modelix/modelix.editor/commit/7a6ae1628dbf80dc5101734c99ec611342a0978d))
* **projectional-editor:** keep the concepts that are not typed out of the menu ([3677c3f](https://github.com/modelix/modelix.editor/commit/3677c3fd1f4abce8487c25567682f0215b847025))
* **projectional-editor:** park the derived notations until the grammar can hold them ([e1bbfc9](https://github.com/modelix/modelix.editor/commit/e1bbfc9fe046e890986c1c523cdc7a2480091919))
* **projectional-editor:** register the RPC serialization of the HttpClient ([38aa727](https://github.com/modelix/modelix.editor/commit/38aa727c7bad70d621837a755357ca2af5d59bb0))
* **projectional-editor:** remove the HexLongLiteral notation again ([8ca5cdd](https://github.com/modelix/modelix.editor/commit/8ca5cdd8604247c685aa64978c3d9996e2fdbb3b))
* **projectional-editor:** render changes that were made in MPS ([da0a472](https://github.com/modelix/modelix.editor/commit/da0a472f8e5bcaf71dd64b5052d2bf109e7b02c3))
* **projectional-editor:** restore the standalone editor page ([f189409](https://github.com/modelix/modelix.editor/commit/f189409eeb043f3ef2bc36f1eb796a1eb9b46917))
* **projectional-editor:** stop generating notations that only add grammar ambiguity ([5b8b24e](https://github.com/modelix/modelix.editor/commit/5b8b24e104da16ff8aa518f76ba1e6e2b40776be))
* show model changes made in MPS in the web editor ([23fff66](https://github.com/modelix/modelix.editor/commit/23fff669b2a45eb9d8f13514dfac4183c8c0ba6a))

## [1.20.0](https://github.com/modelix/modelix.editor/compare/1.19.0...1.20.0) (2026-08-21)


### Features

* **mps-plugin:** computed colors in the notation language ([1319cb8](https://github.com/modelix/modelix.editor/commit/1319cb84628597542cd511968085495daef2a28a))
* **mps-plugin:** font styles in the notation language ([27be0d6](https://github.com/modelix/modelix.editor/commit/27be0d6f7a9b70ab2bd5e29ab89eaf5a6a1f46a1))
* **mps-plugin:** label cells in the notation language ([fdf74b1](https://github.com/modelix/modelix.editor/commit/fdf74b1cad73b52ed99183ec9e0ff9f98e31a6df))
* **mps-plugin:** syntax coloring for the baseLanguage notation ([f1d491e](https://github.com/modelix/modelix.editor/commit/f1d491eaf89c5b0df6633e06906fb827aa9fad14))
* **mps-plugin:** syntax coloring for the remaining baseLanguage concepts ([4ddcf7e](https://github.com/modelix/modelix.editor/commit/4ddcf7e113eb161d89bb2a33160bfe9a8ede421f))
* **mps-plugin:** text and background color styles in the notation language ([6e0ec78](https://github.com/modelix/modelix.editor/commit/6e0ec78cb83658423ef3c7e56ffe248bbfaf3ba4))
* **projectional-editor:** font styles for text cells ([03fc783](https://github.com/modelix/modelix.editor/commit/03fc783f6767e83b856b96b8973b58e67232423a))
* **projectional-editor:** style labels as inline hints ([ef24194](https://github.com/modelix/modelix.editor/commit/ef241947c8fab04924ee864263f02f3c5531008b))
* show all model checker messages, including on nodes without a visible cell ([44fa9c0](https://github.com/modelix/modelix.editor/commit/44fa9c09c54be97f26107e1ce60dececf07cfab1))
* show model checker errors in the projectional editor ([82a53e0](https://github.com/modelix/modelix.editor/commit/82a53e0aa220486d8daa9c73e938cfe959fbc741))
* underline the whole cell range of a node-level check message ([8ef4663](https://github.com/modelix/modelix.editor/commit/8ef466392bdd43f02ffcbb7b9f210ca6c30dffb9))


### Bug Fixes

* **deps:** update commitlint monorepo to v20.5.3 ([#542](https://github.com/modelix/modelix.editor/issues/542)) ([f8bd041](https://github.com/modelix/modelix.editor/commit/f8bd041eba4111671f573c6d70521a3a4b4b1528))
* **deps:** update dependency org.jetbrains.kotlinx:kotlinx-collections-immutable to v0.5.1 ([#544](https://github.com/modelix/modelix.editor/issues/544)) ([04adf6b](https://github.com/modelix/modelix.editor/commit/04adf6b274669381f1d26af315d9668ad1cfae40))
* **deps:** update plugin com.dorongold.task-tree to v4.0.2 ([#553](https://github.com/modelix/modelix.editor/issues/553)) ([2b7dfe7](https://github.com/modelix/modelix.editor/commit/2b7dfe70191809915c4a39cecb24dc8d05c107fb))
* don't shift line text when the gutter marks an error or warning ([3dbcc22](https://github.com/modelix/modelix.editor/commit/3dbcc227f6a9ad4215dd1a3e24f6b428630c0a50))
* don't underline indentation inside a message's cell range ([1926f0a](https://github.com/modelix/modelix.editor/commit/1926f0ad2888974fbf3ac979a22d42198dac61a5))
* eliminate false model checker errors from wrapper node identity ([3af3e93](https://github.com/modelix/modelix.editor/commit/3af3e935244e195a849795c12c0b280c54271893))
* implement FlagCellTemplate.getInstantiationActions ([b2d2066](https://github.com/modelix/modelix.editor/commit/b2d206629afb0c0f95980dea18b474b3d694d52c))
* make ModelixNodeAsMPSNode a real jetbrains.mps.smodel.SNode ([8882f03](https://github.com/modelix/modelix.editor/commit/8882f03d7d7fba1ed57e634c5de56b032aa16f57))
* model checker failed on nodes wrapped as MPS nodes ([dd14925](https://github.com/modelix/modelix.editor/commit/dd149258b09576039d3ee4f055e71aa56899fcd9))
* **projectional-editor:** read inheriting cell properties from the closest ancestor ([4efe05e](https://github.com/modelix/modelix.editor/commit/4efe05e74bddfc15425968dd8ab4b034b2151aaf))
* **projectional-editor:** render modelAccess cells instead of a placeholder ([de7d70e](https://github.com/modelix/modelix.editor/commit/de7d70edc2b8fe2397d2b7fea13303431ada6f77))
* **projectional-editor:** run withNode blocks before the template is read ([ed3cf17](https://github.com/modelix/modelix.editor/commit/ed3cf176a3a3b2b931c90d872c8a520b6fcabcbc))


### Performance Improvements

* more fine-grained caching in IncrementalModelChecker ([945cf5c](https://github.com/modelix/modelix.editor/commit/945cf5c937794d64d71f7858a67b77134715cadb))
* **mps-plugin:** generate lambdas instead of closures in the notation generator ([7b4d414](https://github.com/modelix/modelix.editor/commit/7b4d4148e7f90df5ec4a27ab20c112129283c26d))


### Code Refactoring

* attach each check message to a single cell; underline the range while rendering ([bacfc87](https://github.com/modelix/modelix.editor/commit/bacfc87a96633e40351f9af798bb288d1f59799a))
* remove unused helpers from IncrementalModelChecker ([2844109](https://github.com/modelix/modelix.editor/commit/28441098222fe4f4093e0207a08ce7df1196e580))
