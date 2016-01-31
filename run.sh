#!/bin/sh
set -e

# Set default args
test -n "$tag" || tag=latest
test -n "$hostname" || hostname=domoticz
test -n "$domainname" || domainname=$(hostname)
test -n "$domain" || domain=$hostname.$domainname
test -n "$cname" || cname=$domainname-$hostname

test -n "$DCKR_VOL" -a -d "$DCKR_VOL/" || {
  echo "No Docker Volume dir: $DCKR_VOL (\$DCKR_VOL)"
  exit 1
}

mkdir -vp $DCKR_VOL/domoticz-$tag/backups

echo "Running new container based on dotmpe/domoticz:$tag: $cname ($domain)"
docker run -td -P \
  -h $domain \
  --name=$cname \
  -v $DCKR_VOL/domoticz-$tag/backups:/root/domoticz/backups \
  --mac-address=02:42:ac:11:00:02 \
  -p 8084:8080 \
  dotmpe/domoticz:$tag \
  bash

