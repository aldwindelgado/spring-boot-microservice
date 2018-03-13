#!/bin/bash

cd ..

mvn clean package docker:build -DskipTests=true

docker rm -f adgs-config-server

docker run \
    --restart=always \
    --name adgs-config-server \
    --net spring-microservice-network \
    -p 15000:15000 \
    -v C:\\temp\\docker\\spring\\microservices\\logs:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-config-server