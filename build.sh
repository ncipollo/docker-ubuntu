#!/usr/bin/env bash

docker build --build-arg ssh_key="$(cat ~/.ssh/id_rsa)"  -t ubuntu .