#!/bin/bash

docker pull google/cadvisor
docker stop cadvisor
docker rm cadvisor
docker run -m 80m \
	--volume=/:/rootfs:ro \
	--volume=/var/run:/var/run:rw \
	--volume=/sys:/sys:ro \
	--volume=/var/lib/docker/:/var/lib/docker:ro \
	--volume=/dev/disk/:/dev/disk:ro \
	--publish=8088:8080 \
	--detach=true \
	--name=cadvisor \
	google/cadvisor
