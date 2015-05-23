#!/bin/bash

#Get docker env timezone and set system timezone
echo "setting the correct local time"
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata
  
cp /amazon-echo-bridge-0.1.2.jar /config/
cd /config
java -jar -Djava.net.preferIPv4Stack=true amazon-echo-bridge-0.1.2.jar --upnp.config.address=$SERVERIP
