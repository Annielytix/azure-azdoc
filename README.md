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
easily located them in your tablet/iPad/reader device.

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

## List of 55 Downloaded PDF files, as of 3/3/2017

```
   2535035 Mar  3 07:47 azdoc-active-directory-b2c.pdf
  39390058 Mar  3 07:47 azdoc-active-directory.pdf
    620291 Mar  3 07:47 azdoc-analysis-services.pdf
   9775973 Mar  3 07:47 azdoc-api-management.pdf
   3749400 Mar  3 07:47 azdoc-application-gateway.pdf
  21747722 Mar  3 07:47 azdoc-application-insights.pdf
  10596706 Mar  3 07:47 azdoc-automation.pdf
   4571427 Mar  3 07:47 azdoc-azure-functions.pdf
  22612694 Mar  3 07:47 azdoc-backup.pdf
   2977987 Mar  3 07:47 azdoc-batch.pdf
    599655 Mar  3 07:47 azdoc-biztalk-services.pdf
   3635411 Mar  3 07:47 azdoc-cdn.pdf
  10734106 Mar  3 07:47 azdoc-cloud-services.pdf
    744204 Mar  3 07:47 azdoc-cognitive-services.pdf
    525671 Mar  3 07:47 azdoc-container-registry.pdf
   9029970 Mar  3 07:47 azdoc-container-service.pdf
   2936605 Mar  3 07:47 azdoc-data-catalog.pdf
  17789793 Mar  3 07:47 azdoc-data-factory.pdf
   4187995 Mar  3 07:47 azdoc-data-lake-analytics.pdf
   4725976 Mar  3 07:47 azdoc-data-lake-store.pdf
   1553202 Mar  3 07:47 azdoc-devtest-lab.pdf
   1175059 Mar  3 07:47 azdoc-dns.pdf
  16775094 Mar  3 07:47 azdoc-documentdb.pdf
   2286871 Mar  3 07:47 azdoc-event-hubs.pdf
   5767672 Mar  3 07:47 azdoc-expressroute.pdf
  26691321 Mar  3 07:48 azdoc-hdinsight.pdf
  47846234 Mar  3 07:48 azdoc-iot-hub.pdf
   1051056 Mar  3 07:48 azdoc-key-vault.pdf
   2163720 Mar  3 07:48 azdoc-load-balancer.pdf
  21483047 Mar  3 07:48 azdoc-log-analytics.pdf
   8490506 Mar  3 07:48 azdoc-logic-apps.pdf
  31819592 Mar  3 07:49 azdoc-machine-learning.pdf
  14521552 Mar  3 07:49 azdoc-media-services.pdf
  20548763 Mar  3 07:49 azdoc-mobile-engagement.pdf
   4922543 Mar  3 07:49 azdoc-multi-factor-authentication.pdf
  14915070 Mar  3 07:49 azdoc-notification-hubs.pdf
   2740826 Mar  3 07:49 azdoc-power-bi-embedded.pdf
   7627730 Mar  3 07:49 azdoc-redis-cache.pdf
    599758 Mar  3 07:49 azdoc-scheduler.pdf
   3787821 Mar  3 07:49 azdoc-search.pdf
  10802287 Mar  3 07:49 azdoc-security-center.pdf
     15356 Mar  3 07:49 azdoc-service-bus.pdf
  16150279 Mar  3 07:49 azdoc-service-fabric.pdf
  13045697 Mar  3 07:49 azdoc-site-recovery.pdf
   7987174 Mar  3 07:50 azdoc-sql-data-warehouse.pdf
  22208088 Mar  3 07:50 azdoc-sql-database.pdf
    986602 Mar  3 07:50 azdoc-sql-server-stretch-database.pdf
   9201920 Mar  3 07:50 azdoc-storage.pdf
  47337174 Mar  3 07:50 azdoc-storsimple.pdf
   4921752 Mar  3 07:50 azdoc-stream-analytics.pdf
   1702664 Mar  3 07:50 azdoc-traffic-manager.pdf
   1766815 Mar  3 07:50 azdoc-virtual-machine-scale-sets.pdf
    159168 Mar  3 07:50 azdoc-virtual-machines.pdf
   9020848 Mar  3 07:50 azdoc-virtual-network.pdf
   4592291 Mar  3 07:50 azdoc-vpn-gateway.pdf
```