#!/bin/bash

docker ps
echo "- - - "
echo -n "Enter name of container (CID) e.g. jenkins001: "
read CID

COMMAND="docker stop ${CID}"
echo $COMMAND
echo $($COMMAND)
