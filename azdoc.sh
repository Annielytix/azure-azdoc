#!/bin/bash

# Bash script to Web Spider and generate curl scripts.
# Chris Joakim, Microsoft, 2017/03/31

rm out/*.log
rm out/*.txt

source bin/activate

python azdoc_v2.py scrape > out/scrape.log

echo 'done'
