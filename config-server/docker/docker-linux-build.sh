#!/bin/bash

docker rm -f adgs-config-server

cd ..

mvn clean package docker:build -DskipTests=true

docker run \
    --restart=always \
    --name adgs-config-server \
    --net docker-network \
    -p 127.0.0.1:15000:5000 \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v /var/log/spring/microservices:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-config-server