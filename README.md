# azure-azdoc

This project is used to identify and download useful PDF documentation,
particularly Azure-related, from the public Microsoft download site in the
following Azure Storage container:

```
opbuildstorageprod.blob.core.windows.net
```

## Four Ways to Do It

There are four ways to execute the downloads.  It's up to you which you choose.

1. Simply Execute the Pre-Generated Linux/Mac bash script(s).
2. Simply Execute the Pre-Generated Windows PowerShell script(s).
3. Execute Python3 to regenerate the download scripts, then execute them manually.
4. Like option 3, but execute it as a Docker container.

## Initial Setup

First, use the **git** program to clone this repository to your workstation.

```
cd [your-directory-of-choice]
git clone git@github.com:cjoakim/azure-azdoc.git
```

## Option 1: Execute the Pre-Generated Linux/Mac bash scripts

I strive to regenerate the curl scripts weekly, so they should be
reasonable current for you to download and execute.

From your Linux or Mac Terminal program, to download the Azure PDFs,
execute the following from the root directory of this repository:

```
git pull
./azdoc_azure_curl_pdfs.sh
```

To download all of the Documentation, execute the following.  
**WARNING: this will download over 6000 files.**

```
./azdoc_complete_curl_pdfs.sh
```

## Option 2: Execute the Pre-Generated Windows PowerShell script(s)

Essentially the same as the above option.  Just execute **git pull**
to download the latest PowerShell scripts, and execute them in a
PowerShell window:

```
git pull
.\azdoc_azure_curl_pdfs.ps1
```

## Option 3: Execute Python3 to regenerate the download scripts

## Option 4: Execute a Docker Container



## Execute the Pre-Generated Scripts

To simply execue the scripts that have already been generated and put into this
repository, execute your choice of the following in a PowerShell/Linux/Mac Terminal.

```
azdoc_azure_curl_pdfs.ps1
azdoc_azure_curl_pdfs.sh
azdoc_complete_curl_pdfs.ps1
azdoc_complete_curl_pdfs.sh
```

These bash or PowerShell scripts will invoke the curl program to download PDF
files to the pdf/azure or pdf/all directories within the root of the repository.
Currently, there are 150 Azure PDF documents and 6435 in the complete set of PDFs.

I strive to keep this repository updated and generate the above four scripts
on a weekly basis.

## Execute the "spidering" process

"Advanced users" may want to execute the "spidering" logic to identify the available
PDF files and generate the above four scripts.  Python 3.6.x is required.

Execute the following steps from the root of the repository.

```
git reset --hard
git pull                      # get the latest code from this repository
./venv.sh                     # create the python virtualenv per the requirements.in file
source bin/activate           # activate the python virtualenv
./azdoc.sh                    # execute the process
```

Then, execute the above script(s) in the "Execute the Pre-Generated Scripts" section.

The **azdoc.sh** will execute the following logic:

- Use HTTP to query, including pagination, the list of blobs in the 'opbuildstorageprod' container
- Aggregate the list of all Blobs in this container in the several HTTP response files
- Generate the bash and PowerShell scripts to download the Azure PDF files with curl
- Generate a HTML report listing the Azure PDF files

Note: the previous web-scraping version of this logic has been deleted in favor of
directly HTTP querying of the underlying **opbuildstorageprod** storage container.

## List of 150 Azure PDF files available as of 2017/09/11:

```
Academic-Knowledge.pdf
Bing-Autosuggest.pdf
Bing-Custom-Search.pdf
Bing-Entities-Search.pdf
Bing-Image-Search.pdf
Bing-News-Search.pdf
Bing-Spell-Check.pdf
Bing-Video-Search.pdf
Bing-Web-Search.pdf
Computer-vision.pdf
Content-Moderator.pdf
Custom-Speech-Service.pdf
Custom-Vision-Service.pdf
Emotion.pdf
EntityLinking.pdf
Face.pdf
KES.pdf
LUIS.pdf
LinguisticAnalysisAPI.pdf
QnAMaker.pdf
Recommendations.pdf
Speaker-recognition.pdf
Speech.pdf
Text-Analytics.pdf
Translator.pdf
Video.pdf
Web-Language-Model.pdf
active-directory-b2c.pdf
active-directory-domain-services.pdf
active-directory.pdf
advisor.pdf
analysis-services.pdf
api-management.pdf
app-service-api.pdf
app-service-mobile.pdf
app-service-web.pdf
app-service.pdf
application-gateway.pdf
application-insights.pdf
aspnet.pdf
automation.pdf
azure-functions.pdf
azure-government.pdf
azure-portal.pdf
azure-resource-manager.pdf
azure-stack.pdf
backup.pdf
batch.pdf
billing.pdf
biztalk-services.pdf
blobs.pdf
bread.pdf
cdn.pdf
chef.pdf
classic.pdf
classic.pdf
cloud-partner-portal.pdf
cloud-partner-portal.pdf
cloud-services.pdf
cloud-shell.pdf
cloudfoundry.pdf
cognitive-services.pdf
connect-health.pdf
connect.pdf
container-instances.pdf
container-registry.pdf
container-service.pdf
containers.pdf
cosmos-db.pdf
custom-decision-service.pdf
data-catalog.pdf
data-factory.pdf
data-lake-analytics.pdf
data-lake-store.pdf
dcos-swarm.pdf
develop.pdf
developer.pdf
devtest-lab.pdf
dns.pdf
docker.pdf
documentdb.pdf
dotnet.pdf
end-user.pdf
event-grid.pdf
event-hubs.pdf
expressroute.pdf
files.pdf
germany.pdf
guidance.pdf
hdinsight.pdf
iot-dps.pdf
iot-hub.pdf
iot-suite.pdf
jenkins.pdf
key-vault.pdf
kubernetes.pdf
linux.pdf
load-balancer.pdf
log-analytics.pdf
logic-apps.pdf
machine-learning.pdf
marketplace.pdf
media-services.pdf
mobile-engagement.pdf
monitoring-and-diagnostics.pdf
multi-factor-authentication.pdf
mysql.pdf
network-watcher.pdf
networking.pdf
notification-hubs.pdf
openshift.pdf
operations-management-suite.pdf
operations.pdf
oracle.pdf
php.pdf
postgresql.pdf
power-bi-embedded.pdf
privileged-identity-management.pdf
queues.pdf
redis-cache.pdf
remoteapp.pdf
resource-health.pdf
sap.pdf
scheduler.pdf
search.pdf
security-center.pdf
security.pdf
service-bus-messaging.pdf
service-bus-relay.pdf
service-bus.pdf
service-fabric.pdf
service-health.pdf
site-recovery.pdf
sql-data-warehouse.pdf
sql-database.pdf
sql-server-stretch-database.pdf
sql.pdf
sqlclassic.pdf
storage.pdf
storsimple.pdf
stream-analytics.pdf
time-series-insights.pdf
traffic-manager.pdf
video-indexer.pdf
video-indexer.pdf
virtual-machine-scale-sets.pdf
virtual-machines.pdf
virtual-network.pdf
vpn-gateway.pdf
windows.pdf
```
