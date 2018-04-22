#!/bin/bash

docker run -d -p 2222:22 -p 8050:8050 --name local local
sshfs -p 2222 tf@localhost:. ~/foo
ssh -p 2222 -X tf@localhost
