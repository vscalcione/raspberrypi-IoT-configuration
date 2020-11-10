#!/bin/bash

update_system() {
	echo 'STEP 1: Update your system'
	sudo apt update	sudo apt upgrade -y
}

install_software() {
	echo 'STEP 2: Install software'
	sudo apt-get install cmatrix -y
	sudo apt-get install curl -y
	sudo apt-get install htop -y
	sudo apt-get install git -y
	sudo apt-get install nethogs -y

	echo 'STEP 3: Install LAMPP Stack'
	sudo apt-get install apache2 -y
	sudo apt-get install php -y
	sudo apt-get install mariadb-server -y
	sudo apt-get install php-mysql -y
	sudo service apache2 restart

	echo 'STEP 4: Install Wordpress'
	cd /var/www/html
	sudo wget https://it.wordpress.org/latest-it_IT.tar.gz
	sudo tar -xzvf latest-it_IT.tar.gz

	echo 'STEP 4: Install software with snap'
	sudo snap install bashtop

	echo 'STEP 5: Install NVM (Node Version Manager)'
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
	nvm install noe
	nvm use node
}


CURRENT_DIR=~/raspberrypi-IoT-configuration
CURRENT_BRANCH=${1:-$(git name-rev --name-only HEAD)}
TMP_DOCKER_COMPOSE_YML=./.tmp/docker-compose.tmp.yml
DOCKER_COMPOSE_YML=./docker-compose.yml
DOCKER_COMPOSE_OVERRIDE_YML=./compose-override.yml


pushd $CURRENT_DIR

