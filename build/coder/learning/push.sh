#!/bin/bash

# Build variables
BUILD_NUMBER="$1"


printf "\nRead base coder version to build images from\n"
base_coder_version=$(jq -r ".baseCoderVersion.version" ./build/base-versions.json)
printf "Base coder version $base_coder_version (see ./build/base-versions.json)\n\n"


echo "Begin pushing docker image wth tag ghcr.io/foodyfood/code-kitchen-coder:learning-${base_coder_version}-${BUILD_NUMBER}"
docker push ghcr.io/foodyfood/code-kitchen-coder:learning-${base_coder_version}-${BUILD_NUMBER}
echo "Pushed image with tag ghcr.io/foodyfood/code-kitchen-coder:learning-${base_coder_version}-${BUILD_NUMBER}"
