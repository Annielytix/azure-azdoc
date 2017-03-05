# azure-azdoc

Web spidering to identify Azure PDF documentation, and download it with curl

## Overview

This utility Web Spiders starting at a base Azure URL, and follows the links to
pages that contain PDF 'Documentation' links.  The Documentation link URLs are
captured, and are used to generate the following two scripts which utilize **curl**
to download the PDF files to your computer.
```
azdoc_curl_pdfs.ps1  <- Windows PowerShell
azdoc_curl_pdfs.sh   <- Linux, macOS Bash
```

This current base URL is: 
http://azureplatform.azurewebsites.net/en-us/

This utility is thus a two-step process:
- Web Spider and generate curl scripts.
- Execute the curl scripts to download the PDF docs.


## Downloading the Azure PDF Docs with the current scripts

The above two generated curl scripts are already present in this GitHub repository.
I'll try to keep them updated, so that you don't have to execute the Web Spidering
process.

The downloaded PDF file names all begin with the prefix **azdoc-** so that you can
easily locate them in your tablet/iPad/reader device.

### Windows

In PowerShell, setup:
```
cd <your directory of choice>
git clone https://github.com/cjoakim/azure-azdoc.git
cd .\azure-azdoc\
```

Execute the script, the downloaded PDF files are put in the pdf\ directory.
```
.\azdoc_curl_pdfs.ps1
```

### macOS or Linix

In Terminal, setup:
```
cd <your directory of choice>
git clone https://github.com/cjoakim/azure-azdoc.git
cd azure-azdoc/
```

Execute the script, the downloaded PDF files are put in the pdf/ directory.
```
./azdoc_curl_pdfs.sh
```

## Web Spidering to generate the above curl scripts

Requires Python 3+ to be installed on your computer.

### Windows

In PowerShell; install the necessary python libraries:
```
.\azdoc_py_libs.ps1
```

Execute the Web Spider with curl script generation:
```
.\azdoc.ps1
```

### macOS or Linix

In Terminal; create a python virtual environment and install the necessary python libraries:
```
./azdoc_py_venv.sh
```

Execute the Web Spider with curl script generation:
```
./azdoc.sh
```

## Latest list of PDF files

55 files downloaded on 2017/03/05
```
azdoc-active-directory-b2c.pdf
azdoc-active-directory.pdf
azdoc-analysis-services.pdf
azdoc-api-management.pdf
azdoc-application-gateway.pdf
azdoc-application-insights.pdf
azdoc-automation.pdf
azdoc-azure-functions.pdf
azdoc-backup.pdf
azdoc-batch.pdf
azdoc-biztalk-services.pdf
azdoc-cdn.pdf
azdoc-cloud-services.pdf
azdoc-cognitive-services.pdf
azdoc-container-registry.pdf
azdoc-container-service.pdf
azdoc-data-catalog.pdf
azdoc-data-factory.pdf
azdoc-data-lake-analytics.pdf
azdoc-data-lake-store.pdf
azdoc-devtest-lab.pdf
azdoc-dns.pdf
azdoc-documentdb.pdf
azdoc-event-hubs.pdf
azdoc-expressroute.pdf
azdoc-hdinsight.pdf
azdoc-iot-hub.pdf
azdoc-key-vault.pdf
azdoc-load-balancer.pdf
azdoc-log-analytics.pdf
azdoc-logic-apps.pdf
azdoc-machine-learning.pdf
azdoc-media-services.pdf
azdoc-mobile-engagement.pdf
azdoc-multi-factor-authentication.pdf
azdoc-notification-hubs.pdf
azdoc-power-bi-embedded.pdf
azdoc-redis-cache.pdf
azdoc-scheduler.pdf
azdoc-search.pdf
azdoc-security-center.pdf
azdoc-service-bus.pdf
azdoc-service-fabric.pdf
azdoc-site-recovery.pdf
azdoc-sql-data-warehouse.pdf
azdoc-sql-database.pdf
azdoc-sql-server-stretch-database.pdf
azdoc-storage.pdf
azdoc-storsimple.pdf
azdoc-stream-analytics.pdf
azdoc-traffic-manager.pdf
azdoc-virtual-machine-scale-sets.pdf
azdoc-virtual-machines.pdf
azdoc-virtual-network.pdf
azdoc-vpn-gateway.pdf
```

[Latest Inventory with file sizes](data/inventory-cjoakim-20170305-0825.json)

## Inventory and Diffs

### Capturing the current list files

Format: python azdoc.py inventory <username>

Example:
```
$ python azdoc.py inventory <username>
$ python azdoc.py inventory cjoakim

AzdocUtil.inventory for user: cjoakim
file written: data/inventory-cjoakim-20170305-0825.json
```

### Diffs - comparing two inventory files to see what changed

Provide a filesize tolerance, and two previously captured inventory filenames.

Format: python azdoc.py diff <tolerance> <inventory filename 1> <inventory filename 2>

Example:
```
$ python azdoc.py diff 100 data/inventory-cjoakim-20170305-0825.json data/inventory-cjoakim-20170305-0843-test.json
```
