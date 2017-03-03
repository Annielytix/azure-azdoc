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
1) Web Spider and generate curl scripts.
2) Execute the curl scripts to download the PDF docs.


## Downloading the Azure PDF Docs with the current scripts

The above generated curl scripts are already present in this GitHub repository.
I'll try to keep them updated, so that you don't have to execute the Web Spidering
process.

### Windows

In PowerShell, setup:
```
cd <your directory of choice>
git clone https://github.com/cjoakim/azure-azdoc.git
```

Execute the script, the downloaded PDF files are put in the pdf\ directory.
```
azdoc_curl_pdfs.ps1
```

### macOS or Linix

In Terminal:
```
cd <your directory of choice>
git clone https://github.com/cjoakim/azure-azdoc.git
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
azdoc_py_libs.ps1
```

### macOS or Linix

In Terminal; create a virtual environment and install the necessary python libraries:
```
./azdoc_py_venv.sh
```

Execute the Web Spider with curl script generation:
```
./azdoc.sh
```

## List of Downloaded PDF files, as of 3/3/2017

```

```