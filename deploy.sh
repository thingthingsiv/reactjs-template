#!/bin/bash

SERVICE_NAME="react-template"
SERVICE_PORT=3030

docker rm -f $SERVICE_NAME || true
docker build -t $SERVICE_NAME .
docker run -d --name $SERVICE_NAME -p $SERVICE_PORT:80 $SERVICE_NAME

./configure-nginx.sh $SERVICE_NAME $SERVICE_PORT
