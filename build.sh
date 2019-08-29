#!/bin/bash
$(aws ecr get-login --no-include-email)
docker build -t ubuntu .
#docker tag elasticsearch-init:latest 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch-init:latest
#docker push 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch-init:latest
docker tag ubuntu:latest khteh/ubuntu:latest
docker push khteh/ubuntu:latest
