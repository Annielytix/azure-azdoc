#!/bin/bash

# see https://docs.microsoft.com/en-us/rest/api/storageservices/list-blobs

rm tmp/response*.xml
rm tmp/responses.json

mkdir pdf/
mkdir pdf_all/

source bin/activate
python --version

python azdoc_v3.py get_blob_list

python azdoc_v3.py aggregate_responses

python azdoc_v3.py generate_azure_curl_pdfs_bash_script
python azdoc_v3.py generate_azure_curl_pdfs_powershell_script

python azdoc_v3.py generate_sharepoint_html

echo 'done'
