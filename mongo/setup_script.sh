#!/bin/bash
echo "Downloading and loading mongodb"
mkdir /home/setitech/mongo
echo "Created: /home/setitech/mongo"
cd /home/setitech/mongo/
mkdir db
echo "Created /db"
echo "Download..."
wget https://github.com/themattman/mongodb-raspberrypi-docker/releases/download/r7.0.4-mongodb-raspberrypi-docker-unofficial/mongodb.ce.pi4.r7.0.4-mongodb-raspberrypi-docker-unofficial.tar.gz
echo "Downloaded..."
echo "Loading into docker"
docker load --input mongodb.ce.pi4.r7.0.4-mongodb-raspberrypi-docker-unofficial.tar.gz
echo "Loaded image: mongodb-raspberrypi4-unofficial-r7.0.4:latest"
