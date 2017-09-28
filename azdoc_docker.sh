#!/bin/bash

# This bash script is intended to be executed from a Docker container.
# Chris Joakim, Microsoft, 2017/09/28

mkdir data/
mkdir -p pdf/azure/
mkdir -p pdf/all/

python --version

python azdoc.py get_blob_list

echo 'done'
