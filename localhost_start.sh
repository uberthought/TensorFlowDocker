#!/bin/bash

docker start tf
sleep 2
sshfs tf@localhost:. ~/foo -p 2222
ssh -Y tf@localhost -p 2222
