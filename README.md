# Amazon Echo HA Bridge

Use Amazon Echo to voice control your home automation devices (uses http commands between the echo and your home automation controller)

## Install On unRaid:

On unRaid, install from the Community Repositories and enter the app folder location and the port for the webUI.


## Install On Other Platforms (like Ubuntu or Synology 5.2 DSM, etc.):

On other platforms, you can run this docker with the following command:

```docker run -d --name="AmazonEcho-HA-Bridge" --net="host" -e SERVERIP="192.168.X.X" -e SERVERPORT="XXXX" -v /path/to/config/:/config:rw -v /etc/localtime:/etc/localtime:ro aptalca/docker-amazon-echo-ha-bridge```

- Replace the SERVERIP variable (192.168.X.X) with your server's IP
- Replace the SERVERPORT variable (XXXX) with whichever port you choose.
- By default, this will install the latest version as of the latest update to this container, but if you want to run a different version (to go back to the previous version perhaps), include the following environment variable in your docker run command `-e VERSION="0.X.X"`

See the linked thread for setup instructions: [http://forum.micasaverde.com/index.php/topic,31920.msg231970.html#msg231970](http://forum.micasaverde.com/index.php/topic,31920.msg231970.html#msg231970)

**NEW:**  
You can now access the WebUI at http://SERVERIP:SERVERPORT/configurator.html  
It is much much easier to manage connected devices that way

## Changelog:  
2015-08-20 - Set max memory for java so it doesn't hog unnecessary resources on multipurpose servers - Allow for custom version install by passing environment variable in docker run as `-e VERSION="0.X.X"`

2015-08-17 - Updated jar to latest version 0.2.1 - The bridge now runs as user nobody instead of root - Updated to phusion 0.9.17 baseimage  
  
2015-07-17 - Updated jar to latest version 0.2.0
