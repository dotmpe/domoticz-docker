#!/bin/sh
set -e
domain=$(hostname -s)
./build.sh
docker rm -f $domain-domoticz 2>/dev/null 1>/dev/null \
  && echo "Removed current container $domain-domoticz" \
  || echo "No existing container, OK"
./run.sh
