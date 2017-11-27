#!/bin/bash

# sudo docker run -d -p 2222:22 --name tfssh uberthought/tensorflowcpussh
#sudo docker run -d -p 80:80 -p 2222:22 --name tfssh uberthought/tensorflowcpussh
docker run -d -p 8008:80 -p 2222:22 -p 6006:6006 --name tfssh2 tfssh2
