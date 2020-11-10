#!/bin/bash

logger "$0"
VMOD=10
HMOD=70

whiptail --title "Update Docker containers on $(lsb_release -ds || cat /etc/*release || uname -om)" \
	--yesno "This script drive you into updating docker containers on your system. Do you proceed?" $VMOD $HMOD

if [[ "$?" -eq 0 ]]; then

	echo 'STEP 1: Stopping containers'
	docker-compose down

	echo 'STEP 2: Downloading latest images from Docker-Hub ... This can take a long time'
	docker-compose pull

	echo 'STEP 3: Building images if needed'
	docker-compose build

	echo 'STEP 4: Starting stack up again'
	docker-compose up -d

fi
