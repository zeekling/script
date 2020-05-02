#!/bin/bash

#docker pull harryhan1989/mindoc
docker stop mindoc
docker rm mindoc
docker run -d -p 8181:8181 --name mindoc \
	--link mysql:mysql \
	-e DB_ADAPTER=mysql \
	-e MYSQL_PORT_3306_TCP_ADDR=mysql \
	-e MYSQL_PORT_3306_TCP_PORT=3306 \
	-e MYSQL_INSTANCE_NAME=mindoc \
	-e MYSQL_USERNAME=root  \
	-e MYSQL_PASSWORD=94adg2011 \
	-e httpport=8181 \
    harryhan1989/mindoc
