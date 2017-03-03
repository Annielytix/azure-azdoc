#!/bin/bash

# Bash script to invoke python to Scrape/Spider for Azure PDF documentation.
# Chris Joakim, Microsoft, 2017/03/03

mkdir -p azdoc/pdf/

rm azdoc/*.txt

source bin/activate

python azdoc.py scrape

echo 'done'
