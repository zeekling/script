#!/bin/bash
docker pull b3log/lute-http
docker stop lute-http
docker run --detach --rm --network=host --name lute-http -m 80M b3log/lute-http
