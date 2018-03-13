#!/bin/bash

cd ..

mvn clean package docker:build -DskipTests=true

docker rm -f adgs-zuul-server

docker run \
    --restart=always \
    --name adgs-zuul-server \
    --net spring-microservice-network \
    -p 127.0.0.1:19000:9000 \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v /var/log/spring/microservices:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-zuul-server