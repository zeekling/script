#!/bin/bash
# docker pull mysql
docker stop mysql
docker rm mysql
docker run -d --name=mysql -m 300m\
	--env=MYSQL_ROOT_PASSWORD=94adg2011 \
	-p 3306:3306 \
	-v /dockerData/mysql:/var/lib/mysql \
	mysql --default-authentication-plugin=mysql_native_password
