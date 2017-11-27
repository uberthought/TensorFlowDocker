#!/bin/bash

docker start f882b8e13fcf
sleep 2
sshfs root@localhost:. ~/foo -p 2222
ssh root@localhost -p 2222