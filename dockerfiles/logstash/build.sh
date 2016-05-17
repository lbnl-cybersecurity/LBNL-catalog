#!/bin/bash

TAG="0.1"
#REGISTRY_IP="172.17.0.3"
#REGISTRY_IP="candace.lbl.gov"
REGISTRY_IP="10.42.141.112"

docker build -t lbnl/amqp2elastic:$TAG .
docker tag  lbnl/amqp2elastic:$TAG  $REGISTRY_IP:5000/lbnl/amqp2elastic:$TAG
docker push $REGISTRY_IP:5000/lbnl/amqp2elastic:$TAG
