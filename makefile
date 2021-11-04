#!/bin/bash


# These are spread out here, but in codebuild each gets its own number automatically
CODER_BUILD_NUMBER = 0 # Add a prefix here to denote a custom or bespoke build
LEARNING_BUILD_NUMBER = 0 # Add a prefix here to denote a custom or bespoke build
HUB_BUILD_NUMBER = 0 # Add a prefix here to denote a custom or bespoke build


# Grouped commands
all: build-hub build-coder build-learning
push-all: push-hub push-coder push-learning
hub: build-hub push-hub
coder: build-coder push-coder
learning: build-learning push-learning


# hub image
build-hub:
	./build/hub/build.sh ${HUB_BUILD_NUMBER}
push-hub:
	./build/hub/push.sh  ${HUB_BUILD_NUMBER}


# coder image
build-coder:
	./build/coder/cloud-dev/build.sh ${CODER_BUILD_NUMBER}
push-coder:
	./build/coder/cloud-dev/push.sh ${CODER_BUILD_NUMBER}


# web dev learning image
build-learning:
	./build/coder/learning/build.sh ${LEARNING_BUILD_NUMBER}
push-learning:
	./build/coder/learning/push.sh ${LEARNING_BUILD_NUMBER}

