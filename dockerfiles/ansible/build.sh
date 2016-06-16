#!/bin/bash

TAG="0.2"
#REGISTRY_IP="172.17.0.3"
#REGISTRY_IP="candace.lbl.gov"
REGISTRY_IP="10.42.141.112"
IMAGE_NAME="ansible-master"

cp ~/.ssh/ansible_id_rsa master/ && chmod +r master/ansible_id_rsa && docker build -t lbnl/${IMAGE_NAME}:$TAG . 
rm -f master/ansible_id_rsa

#docker tag  lbnl/${IMAGE_NAME}:$TAG  $REGISTRY_IP:5000/lbnl/${IMAGE_NAME}:$TAG
#docker push $REGISTRY_IP:5000/lbnl/${IMAGE_NAME}:$TAG
