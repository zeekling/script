#!/bin/bash
# docker pull gogs/gogs
docker stop gogs
docker rm gogs
#docker run -d --name gogs -m 500m -p 2222:22 -p 3000:3000 \
#	-v /dockerData/gogs/conf:/data/gogs/conf \
#	-v /dockerData/gogs/gogs-repositories:/home/git/gogs/gogs-repositories \
#	-v /dockerData/gogs/upload:/home/git/gogs/upload \
#	-v /dockerData/gogs/log:/home/git/gogs/log \
#	gogs/gogs
#
