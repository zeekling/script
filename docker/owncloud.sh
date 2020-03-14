#!/bin/bash

docker stop owncloud
docker start owncloud
#docker rm owncloud
#docker run -d --name owncloud -m 400m \
#	-v /dockerData/owncloud:/var/www/html/data \
#	--link mysql:mysql \
#	-p 8000:80 owncloud
#
