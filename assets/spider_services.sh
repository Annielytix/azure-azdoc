#!/bin/bash

echo 'fetching azure-services html with curl...'
curl -v "https://docs.microsoft.com/en-us/azure/#pivot=services&panel=all" > azure-services-all.html 

echo 'done'



