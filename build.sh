#!/bin/bash

docker build $1 -t hubporter/naive --no-cache --build-arg https_proxy=socks5://192.168.2.22:8077 .
