#!/bin/bash

# This bash script is intended to be executed from a Docker container.
# Chris Joakim, Microsoft, 2017/09/28

mkdir -p data/
mkdir -p pdf/azure/

rm data/*.*

echo 'get_blob_list ...'
python azdoc.py get_blob_list

echo 'aggregate_responses ...'
python azdoc.py aggregate_responses

echo 'generate_azure_curl_pdfs_bash_script ...'
python azdoc.py generate_azure_curl_pdfs_bash_script

chmod 744 azdoc_azure_curl_pdfs.sh

echo 'cat azdoc_azure_curl_pdfs.sh ...'
cat azdoc_azure_curl_pdfs.sh

echo 'execute azdoc_azure_curl_pdfs.sh ...'
./azdoc_azure_curl_pdfs.sh

echo 'recursively listing the filesystem:'
ls -alR 

echo 'done'
