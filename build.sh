#!/usr/bin/env bash

docker build --platform linux/amd64 --build-arg ssh_key="$(cat ~/.ssh/id_rsa)"  -t ubuntu .