#!/bin/bash


printf "\nRead base hub version to build images from\n"
base_hub_version=$(jq -r ".baseHubVersion.version" ./build/base-versions.json)
printf "Base hub version ${base_hub_version} (see ./build/base-versions.json)\n\n"

printf "Pulling coder\n"
docker pull jupyterhub/k8s-hub:${base_hub_version}
printf "Pull finished\n\n"

printf "Tag hub base image as ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}\n"
docker tag jupyterhub/k8s-hub:${base_hub_version} ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}

printf "Push to ECR\n"
docker push ghcr.io/foodyfood/code-kitchen-hub:${base_hub_version}
printf "\n\n"



printf "\nRead base coder version to build images from\n"
base_coder_version=$(jq -r ".baseCoderVersion.version" ./build/base-versions.json)
printf "Base coder version ${base_coder_version} (see ./build/base-versions.json)\n\n"

printf "Pulling coder\n"
docker pull codercom/code-server:${base_coder_version}
printf "Pull finished\n\n"

printf "Tag coder base image as ghcr.io/foodyfood/code-kitchen-coder:${base_coder_version}\n"
docker tag codercom/code-server:${base_coder_version} ghcr.io/foodyfood/code-kitchen-coder:${base_coder_version}

printf "Push to ECR\n"
docker push ghcr.io/foodyfood/code-kitchen-coder:${base_coder_version}
printf "\n\n"



