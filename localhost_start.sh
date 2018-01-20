#!/bin/bash

docker start tf
sleep 2
sshfs root@localhost:. ~/foo -p 2222
ssh -Y root@localhost -p 2222
