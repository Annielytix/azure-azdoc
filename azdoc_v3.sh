#!/bin/bash

# see https://docs.microsoft.com/en-us/rest/api/storageservices/list-blobs

rm tmp/response*.xml
rm tmp/responses.json

source bin/activate
python --version

python azdoc_v3.py get_blob_list

echo 'done'
