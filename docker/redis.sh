#!/bin/bash
# docker pull redis
docker stop redis
docker rm redis
docker run -itd --name redis -m 400m -p 6379:6379 redis
