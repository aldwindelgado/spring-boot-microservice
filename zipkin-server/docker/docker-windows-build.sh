#!/bin/bash

cd ..

mvn clean package docker:build -DskipTests=true

docker rm -f adgs-zipkin-server

docker run \
    --restart=always \
    --name adgs-zipkin-server \
    --net spring-microservice-network \
    -p 13050:13050 \
    -v C:\\temp\\docker\\spring\\microservices\\logs:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-zipkin-server