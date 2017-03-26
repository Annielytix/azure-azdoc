#!/bin/bash

# Bash script to Web Spider and generate curl scripts.
# Chris Joakim, Microsoft, 2017/03/26

source bin/activate

python azdoc_v2.py scrape

echo 'done'
