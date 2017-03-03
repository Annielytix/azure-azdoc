# PowerShell shell script to invoke python to Scrape/Spider for Azure PDF documentation.
# Chris Joakim, Microsoft, 2017/03/03

New-Item azdoc/pdf/ -type directory -force

rm azdoc/*.txt

python azdoc.py scrape

echo 'done'
