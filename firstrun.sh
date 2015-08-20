#!/bin/bash

#Get docker env timezone and set system timezone
echo "setting the correct local time"
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata
cd /config

if [ ! -f /config/amazon-echo-bridge-"$VERSION".jar ]; then
  echo "Installing version '$VERSION'"
  wget https://github.com/armzilla/amazon-echo-ha-bridge/releases/download/v"$VERSION"/amazon-echo-bridge-"$VERSION".jar
else
  echo "Using existing version '$VERSION'"
fi
echo "Setting correct permissions"
chown -R nobody:users /config

#check to see if SERVERPORT variable is set, if not, set it to default
if [ -z "$SERVERPORT" ]; then
  echo "SERVERPORT environment not passed, using default port 8080"
  SERVERPORT=8080
fi

/sbin/setuser nobody java -Xmx312M -jar -Djava.net.preferIPv4Stack=true amazon-echo-bridge-"$VERSION".jar --upnp.config.address=$SERVERIP --server.port=$SERVERPORT
