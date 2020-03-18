#!/usr/bin/env bash

docker pull ruiny/frps
docker stop frps
docker rm frps

docker run --name frps -d \
	-v /dockerData/frps/conf:/var/frp/conf \
	-p 7000:7000 \
	-p 7500:7500 \
	-p 7400:7400 \
	-p 7001:7001 \
	-p 8089:80 \
	-p 8443:443 \
	ruiny/frps


