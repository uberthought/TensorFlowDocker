#!/bin/bash

source data

sshfs root@${ADDRESS}:. -p 2222 ~/foo
