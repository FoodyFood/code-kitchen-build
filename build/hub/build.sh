#!/bin/bash

# Build variables
BUILD_NUMBER="$1"


printf "\nRead base hub version to build images from\n"
base_hub_version=$(jq -r ".baseHubVersion.version" ./build/base-versions.json)
printf "Base hub version $base_hub_version (see ./build/base-versions.json)\n\n"


docker build -f build/hub/dockerfile \
  -t ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}-${BUILD_NUMBER} \
  --build-arg base_hub_version=${base_hub_version} \
  ./build
