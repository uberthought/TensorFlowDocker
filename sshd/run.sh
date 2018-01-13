#!/bin/bash

docker run -d -p 2222:22 -p 80:80 -p 9000:9000 -p 6006:6006 --name tfssh --restart unless-stopped tfssh
