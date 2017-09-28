#!/bin/bash

# This script executes the previously-built "cjoakim/azdoc:latest" container;
# see script docker_build.sh.  You may wish to edit the -v filesystem mounts.
# Chris Joakim, Microsoft, 2017/09/28

echo 'docker ps before run ...'
docker ps

echo 'executing container ...'
docker run -v ~/azdoc/data:/app/data -v ~/azdoc/pdf/azure:/app/pdf/azure cjoakim/azdoc:latest

echo 'done'
