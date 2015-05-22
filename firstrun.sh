#!/bin/bash

cp /amazon-echo-bridge-0.1.2.jar /config/
cd /config
java -jar -Djava.net.preferIPv4Stack=true amazon-echo-bridge-0.1.2.jar --upnp.config.address=$SERVERIP
