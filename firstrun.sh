#!/bin/bash

#Get docker env timezone and set system timezone
echo "setting the correct local time"
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata
  
cp /amazon-echo-bridge-0.1.3.jar /config/
mkdir -p /config/static
cp /configurator.html /config/static/
cd /config
sed -i "s/localhost/$SERVERIP/g" static/configurator.html
sed -i "s/8080/$SERVERPORT/g" static/configurator.html
jar -uf amazon-echo-bridge-0.1.3.jar static/configurator.html
java -jar -Djava.net.preferIPv4Stack=true amazon-echo-bridge-0.1.3.jar --upnp.config.address=$SERVERIP --server.port=$SERVERPORT
