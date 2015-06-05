# docker-amazon-echo-ha-bridge

Run with environment variable SERVERIP="192.168.X.X" which is the local IP of the server this docker is running on

```docker run -d --name="AmazonEcho-HA-Bridge" --net="host" -e SERVERIP="192.168.X.X" -v /path/to/config/:/config:rw -v /etc/localtime:/etc/localtime:ro aptalca/docker-amazon-echo-ha-bridge```

See the linked thread for setup instructions: [http://forum.micasaverde.com/index.php/topic,31920.msg231970.html#msg231970](http://forum.micasaverde.com/index.php/topic,31920.msg231970.html#msg231970)

**NEW**
You can now access the WebUI at SERVERIP:8080/configurator.html
It is much much easier to manage device that way
