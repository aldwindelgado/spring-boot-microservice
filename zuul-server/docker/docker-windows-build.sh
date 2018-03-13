#!/bin/bash

cd ..

mvn clean package docker:build -DskipTests=true

docker rm -f adgs-zuul-server

docker run \
    --restart=always \
    --name adgs-zuul-server \
    --net spring-microservice-network \
    -p 19000:19000 \
    -v C:\\temp\\docker\\spring\\microservices\\logs:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-zuul-server