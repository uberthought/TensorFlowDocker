#!/bin/bash

docker build -t local . --file Dockerfile
docker rm -f local
docker run -d -p 2222:22 -p 8050:8050 --name local local
sleep 2
docker exec -it local passwd tf
