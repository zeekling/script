#!/bin/bash
docker stop drone
docker rm drone

docker run \
	--env=DRONE_GITEA_SERVER=https://git.zeekling.cn \
	--env=DRONE_GITEA_CLIENT_ID=99dcedef-3762-4da7-b40e-9aac7e650b44 \
	--env=DRONE_GITEA_CLIENT_SECRET=-R5IPf4bHJlr5GB8OvL02-u4YBguaiegPFlP0O587Wk= \
	--env=DRONE_RPC_SECRET=7ded78f2c77ef17d930b8f49f6a40dc4 \
	--env=DRONE_SERVER_HOST=monitor.zeekling.cn \
	--env=DRONE_SERVER_PROTO=https \
	--publish=8888:80 \
	--publish=8443:443 \
	--restart=always \
	--detach=true \
	--name=drone \
	drone/drone
