#!/bin/bash

#gitea_version="1.10.6"
gitea_version="latest"
docker pull gitea/gitea:${gitea_version}
docker stop gitea
docker rm gitea
docker run -d --name=gitea  \
	-p 222:22 -p 3003:3000 \
	--link mysql:mysql \
	--link redis:redis \
	-v /dockerData/gitea:/data \
	gitea/gitea:${gitea_version}
	#-v /dockerData/gitea-ssh/sshd_config:/etc/ssh/sshd_config \
	#01ba755800a2
