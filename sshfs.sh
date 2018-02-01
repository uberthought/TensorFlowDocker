#!/bin/bash

source data

sshfs tf@${ADDRESS}:. -p 2222 ~/foo
