#!/bin/bash

docker run -d -p 2222:22 --name tf tensor
# docker run -it --name tf --mount type=bind,source="$HOME/Documents/Personal",target=/root/Personal tensor
