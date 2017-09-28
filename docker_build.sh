#!/bin/bash

# This script is executed from a workstation to create the Docker container.
# Chris Joakim, Microsoft, 2017/09/28

# Recreate the smallest possible build context, away from the GitHub project
# root directory, and build from there.
rm -rf build
mkdir build

cp Dockerfile       build/
cp requirements.txt build/
cp azdoc.py         build/
cp azdoc_docker.sh  build/

cd build/

docker build -t cjoakim/azdoc .

cd ..

echo 'done'
