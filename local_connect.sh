#!/bin/bash

sshfs -p 2222 tf@localhost:. ~/foo
ssh -p 2222 -X tf@localhost
