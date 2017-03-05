#!/bin/bash

# Bash script to Web Spider and generate curl scripts.
# Chris Joakim, Microsoft, 2017/03/05

source bin/activate

python azdoc.py scrape

echo 'done'
