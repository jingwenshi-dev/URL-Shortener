#!/bin/bash
USAGE="Usage: $0 IP1 IP2 IP3 ..."

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi

./cassandra/startCluster.sh $@


docker service rm $(docker service ls -q)
docker stack deploy -c fast-url-handler.yml url
