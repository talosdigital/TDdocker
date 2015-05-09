#!/bin/bash

docker ps -a
echo "- - -"
echo -n "Enter name of container (CID) e.g. jenkins001 :"
read CID
echo -n "Enter ports param. e.g. -p 8082:8080 -p 4022:22 :"
read PORTS
echo -n "Enter docker image. e.g. jdubois/jhipster-docker :"
read IMAGE
echo -n "Enter docker shared folder. e.g. /var/jenkins_home :"
read FOLDER_DOCKER

mkdir -p /docker/$CID
chmod 777 -R /docker/$CID
chown 1000 /docker/$CID

COMMAND="docker create --restart=\"always\" --privileged=true --name $CID -v /docker/$CID:$FOLDER_DOCKER $PORTS -t $IMAGE"
echo $COMMAND
echo $($COMMAND)