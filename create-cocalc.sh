#!/bin/bash
docker create --runtime=nvidia -p 172.17.0.1:9001:80 -p 172.17.0.1:9002:443 -v /home/logchan/Research/projects:/projects --name cocalc cocalc-torch

