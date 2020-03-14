#!/bin/bash
# docker pull huginn/huginn
docker stop huginn
docker rm huginn
docker run --detach --name huginn --network=host -m 100m \
		-e MYSQL_PORT_3306_TCP_ADDR=127.0.0.1 \
		-e HUGINN_DATABASE_NAME=huginn \
		-e HUGINN_DATABASE_USERNAME=root \
		-e HUGINN_DATABASE_PASSWORD=94adg2011 \
		huginn/huginn
