#!/bin/sh
set -e
test -n "$tag" || tag=latest
echo "Building new dotmpe/domoticz:$tag ($(pwd))"
docker build -t dotmpe/domoticz:$tag .
