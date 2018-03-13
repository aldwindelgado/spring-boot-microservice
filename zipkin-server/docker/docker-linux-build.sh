#!/bin/bash

cd ..

mvn clean package docker:build -DskipTests=true

docker rm -f adgs-zipkin-server

docker run \
    --restart=always \
    --name adgs-zipkin-server \
    --net spring-microservice-network \
    -p 127.0.0.1:13050:13050 \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v /var/log/spring/microservices:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-zipkin-server