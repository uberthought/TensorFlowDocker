#!/bin/bash

docker start tfssh
sleep 2
sshfs root@localhost:. ~/foo -p 2222
ssh root@localhost -p 2222
