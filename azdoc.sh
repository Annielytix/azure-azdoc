#!/bin/bash

# Chris Joakim, Microsoft, 2017/09/11

rm data/response*.xml
rm data/responses.json
rm doc/azure-azdoc-pdf-files-list.html

mkdir pdf/
mkdir pdf_all/

echo 'activating the virtual env; Python 3.6.x is expected'
source bin/activate
python --version

python azdoc.py get_blob_list

python azdoc.py aggregate_responses

python azdoc.py generate_azure_curl_pdfs_bash_script
python azdoc.py generate_azure_curl_pdfs_powershell_script

python azdoc.py generate_complete_curl_pdfs_bash_script
python azdoc.py generate_complete_curl_pdfs_powershell_script

python azdoc.py generate_sharepoint_html

python azdoc.py generate_azure_pdf_list

echo 'done'
