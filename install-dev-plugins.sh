#!/usr/bin/env sh

rm -rf react-ssr-client/dist
rm -rf react-ssr-client/node_modules/@modelix
./gradlew :projectional-editor-ssr-client-lib:packJsPackage
(
  cd react-ssr-client
  pnpm install
  tsc -b && vite build
)
./gradlew installMpsDevPlugins
