#!/bin/bash

# This bash script is intended to be executed from your workstation
# bash terminal, and NOT from within a Docker container.
#
# It will generate the various bash and PowerShell curl scripts,
# but will NOT execute them; you can execute these manually.
#
# Chris Joakim, Microsoft, 2017/09/28

rm data/response*.xml
rm data/responses.json
rm doc/azure-azdoc-pdf-files-list.html

mkdir -p pdf/azure/
mkdir -p pdf/all/

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
