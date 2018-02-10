#!/bin/bash

docker rm -f adgs-config-server

cd ..

mvn clean package docker:build -DskipTests=true

docker run \
    --restart=always \
    --name adgs-config-server \
    --net docker-network \
    -p 15000:5000 \
    -v C:\\temp\\docker\\spring\\microservices\\logs:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-config-server