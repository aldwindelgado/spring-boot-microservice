#!/bin/bash

docker rm -f adgs-eureka-server

cd ..

mvn clean package docker:build -DskipTests=true

docker run \
    --restart=always \
    --name adgs-eureka-server \
    --net docker-network \
    -p 127.0.0.1:18070:8070 \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v /var/log/spring/microservices:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-eureka-server