#!/bin/sh

set -x
set -e

(
  cd ..
  ./gradlew :projectional-editor-ssr-client-lib:packageWithoutVersion
)

rm -rf node_modules/@modelix/projectional-editor-ssr-client-lib
pnpm install
