#!/bin/bash

docker run -it --name tf --mount type=bind,source="$HOME/Documents/Personal",target=/root/Personal tensor
