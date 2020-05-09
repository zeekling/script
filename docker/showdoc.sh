#!/bin/bash

# docker pull star7th/showdoc
docker stop showdoc
docker rm showdoc
docker run -d --name showdoc \
	--user=root --privileged=true \
	-p 8181:80 \
	-v /dockerData/showdoc:/var/www/html/ \
	star7th/showdoc
