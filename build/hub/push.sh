#!/bin/bash

# Build variables
BUILD_NUMBER="$1"


printf "\nRead base hub version to build images from\n"
base_hub_version=$(jq -r ".baseHubVersion.version" ./build/base-versions.json)
printf "Base hub version $base_coder_version (see ./build/base-versions.json)\n\n"


echo "Begin pushing docker image wth tag ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}-${BUILD_NUMBER}"
docker push ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}-${BUILD_NUMBER} 
echo "Pushed image with tag ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}-${BUILD_NUMBER}"

