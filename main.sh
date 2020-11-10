#!/bin/bash

install_sofware(){
	echo 'STEP 1: Update your system'
	sudo apt update
	sudo apt upgrade -y

	echo 'STEP 2: Install all software'
	sudo apt install -y curl

	install_nvm

	npm install -g node-red
}

install_nvm() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
	nvm install node
	nvm use node
}



CURRENT_DIR=~/raspberrypi-IoT-configuration
CURRENT_BRANCH=${1:-$(git name-rev --name-only HEAD)}
TMP_DOCKER_COMPOSE_YML=./.tmp/docker-compose.tmp.yml
DOCKER_COMPOSE_YML=./docker-compose.yml
DOCKER_COMPOSE_OVERRIDE_YML=./compose-override.yml


pushd $CURRENT_DIR

