#!/bin/bash

clear
sudo docker pull jmenker/project4:latest
docker stop upbeat_hermann
docker rm upbeat_hermann
docker run --name upbeat_hermann  -d -p 80:80 jmenker/project4:latest
