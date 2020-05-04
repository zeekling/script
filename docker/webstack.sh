#!/bin/bash
docker stop webstack
docker rm webstack
docker run -d --name=webstack -m 500m \
	-p 8000:8000 \
	--link mysql:mysql \
	--link redis:redis \
	--env MYSQL_HOST=mysql \
	--env MYSQL_PORT=3306 \
	--env MYSQL_USER=root \
	--env MYSQL_PASSWD=94adg2011 \
	-v /dockerData/webstack/img/logo2x.png:/opt/webStack/static/img/logo2x.png \
    zeek/webstack
