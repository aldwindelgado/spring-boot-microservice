#!/bin/bash

docker rm -f adgs-eureka-server

cd ..

mvn clean package docker:build -DskipTests=true

docker run \
    --restart=always \
    --name adgs-eureka-server \
    --net docker-network \
    -p 18070:8070 \
    -v C:\\temp\\docker\\spring\\microservices\\logs:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-eureka-server