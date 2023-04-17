#!/bin/bash
#$(aws ecr get-login --no-include-email)
docker build -t ubuntu .
docker tag ubuntu:latest khteh/ubuntu:latest
docker push khteh/ubuntu:latest
