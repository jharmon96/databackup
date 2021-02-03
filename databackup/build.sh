#!/bin/bash

cd databackup
docker build -f ../docker/databackup/Dockerfile -t extendederp/extendederp:databackup-dev-amd64 .
