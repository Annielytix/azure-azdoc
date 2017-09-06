#!/bin/bash

# see https://docs.microsoft.com/en-us/rest/api/storageservices/list-blobs

curl 'https://opbuildstorageprod.blob.core.windows.net/output-pdf-files?restype=container&comp=list&maxresults=5000' > opbuildstorageprod_list1.xml

curl 'https://opbuildstorageprod.blob.core.windows.net/output-pdf-files?restype=container&comp=list&maxresults=5000&marker=2!164!MDAwMDc3IWVuLXVzL1ZTLmNvcmUtZG9jcy9saXZlL2FwaS9fc3BsaXR0ZWQvU3lzdGVtLldpbmRvd3MuTWVkaWEuVGV4dEZvcm1hdHRpbmcucGRmITAwMDAyOCE5OTk5LTEyLTMxVDIzOjU5OjU5Ljk5OTk5OTlaIQ--' > opbuildstorageprod_list2.xml


python azdoc_v3.py parse opbuildstorageprod_list1.xml
python azdoc_v3.py parse opbuildstorageprod_list2.xml

echo 'done'
