#!/bin/bash

echo 'docker ps before run...'
docker ps

docker run -it -p 3000:80 cjoakim/azdoc:latest

echo 'done'
