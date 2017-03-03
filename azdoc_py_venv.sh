#!/bin/bash

# Recreate the virtual environment and reinstall libs.
# Requires Python 3; version 3.6 recommended.
# Chris Joakim, Microsoft, 2017/03/03

echo 'deleting previous venv...'
rm -rf bin/
rm -rf lib/
rm -rf include/
rm -rf man/

echo 'creating new venv...'
python3 -m venv .
source bin/activate
python --version

echo 'installing/upgrading libs...'
pip install --upgrade pip-tools
pip install --upgrade arrow
pip install --upgrade beautifulsoup4
pip install --upgrade requests

echo 'done'
