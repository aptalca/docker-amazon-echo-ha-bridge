#!/bin/bash

#Get docker env timezone and set system timezone
echo "setting the correct local time"
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata
  
if [ ! -f /config/amazon-echo-bridge-0.2.1.jar ]; then
  echo "Updating to new version 0.2.1"
  cp /amazon-echo-bridge-0.2.1.jar /config/
fi
chown -R nobody:users /config
cd /config

#check to see if SERVERPORT variable is set, if not, set it to default
if [ -z "$SERVERPORT" ]; then
  SERVERPORT=8080
fi

/sbin/setuser nobody java -jar -Djava.net.preferIPv4Stack=true amazon-echo-bridge-0.2.1.jar --upnp.config.address=$SERVERIP --server.port=$SERVERPORT
