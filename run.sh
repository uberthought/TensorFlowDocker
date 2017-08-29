#!/bin/bash

docker run -d -P --name tf --mount type=bind,source="$HOME/Documents/Personal",target=/root/Personal tensor
docker port tf
