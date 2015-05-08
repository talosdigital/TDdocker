#!/bin/bash

docker ps -a
echo "- - - "
echo -n "Enter name of container (CID) e.g. jenkins001: "
read CID

COMMAND="docker start ${CID}"
echo $COMMAND
echo $($COMMAND)

for i in $( iptables -t nat --line-numbers -L | grep 'DNAT' | grep ^[0-9] | awk '{ print $1 }' | tac ); do iptables -t nat -D DOCKER $i; done

