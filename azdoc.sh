#!/bin/bash

# see https://docs.microsoft.com/en-us/rest/api/storageservices/list-blobs

rm data/response*.xml
rm data/responses.json

mkdir pdf/
mkdir pdf_all/

source bin/activate
python --version

python azdoc.py get_blob_list

python azdoc.py aggregate_responses

python azdoc.py generate_azure_curl_pdfs_bash_script
python azdoc.py generate_azure_curl_pdfs_powershell_script

python azdoc.py generate_sharepoint_html

echo 'done'
