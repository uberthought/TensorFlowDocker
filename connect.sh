#!/bin/bash

PORT=`docker port tf | grep "22/tcp" | cut -f 2 -d ':'`

ssh root@localhost -p $PORT
