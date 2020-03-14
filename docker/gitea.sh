#!/bin/bash

#gitea_version="1.10.5"
gitea_version="latest"
#docker pull gitea/gitea:${gitea_version}
docker stop gitea
docker rm gitea
docker run -d --name=gitea -m 500m \
	-p 222:22 -p 3003:3000 \
	--link mysql:mysql \
	--link redis:redis \
	-v /dockerData/gitea:/data \
	-v /dockerData/gitea-ssh/sshd_config:/etc/ssh/sshd_config \
	gitea/gitea:${gitea_version}