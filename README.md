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
4. Execute a Docker container.

## Initial Setup with Git

If you use one of the first three options, start by using the **git** program
to clone this repository to your workstation.

```
cd [your-directory-of-choice]
git clone git@github.com:cjoakim/azure-azdoc.git
```

## Option 1: Execute the Pre-Generated Linux/Mac bash scripts

I strive to regenerate the curl scripts weekly, so they should be
reasonable current for you to download and execute.

From your Linux or Mac Terminal program, to download the **Azure** PDFs,
execute the following from the root directory of this repository:

```
git pull
./azdoc_azure_curl_pdfs.sh
```

To download **ALL** of the PDF Documentation, execute the following.  
**WARNING: this will download over 6000 files.**

```
git pull
./azdoc_complete_curl_pdfs.sh
```

## Option 2: Execute the Pre-Generated Windows PowerShell script(s)

Essentially the same as the above option.  Just execute **git pull**
to download the latest PowerShell scripts, and execute them in a
PowerShell window:

For the **Azure** PDF files:
```
git pull
.\azdoc_azure_curl_pdfs.ps1
```

Or, for **ALL 6000+** PDF files:
```
git pull
.\azdoc_complete_curl_pdfs.ps1
```

## Option 3: Execute Python3 to regenerate the download scripts

For this option, it is assumed that you have Python3 installed on
your computer; version 3.6 is recommended.  The advantage of this
option is that it will query the current contents of the documentation
blob storage container.

Start by querying the underlying documentation blob container, and
regenerating the azdoc curl scripts, with the following:
```
git pull
./azdoc_nodocker.sh
```

Then, execute the freshly-regenerated curl script(s) as described in Options 1 and 2.

## Option 4: Execute a Docker Container

Lastly, you can execute the process with a pre-created public Docker image
from the **DockerHub** container registry.  This approach combines the functionality
of Option 3 (container querying and script generation) and Option 1 (curl script execution).

This option assumes that the workstation or server you're executing from has
Docker installed.

```
docker run -v ~/azdoc/data:/app/data -v ~/azdoc/pdf/azure:/app/pdf/azure cjoakim/azdoc:latest
```

The **-v** parameters make filesystem directories on your host computer available
to the Docker container.  You can modify these as necessary.

## What gets Downloaded?

As of 2017/09/28, the following **158 Azure PDF files** get downloaded.

```
azdoc-Academic-Knowledge.pdf
azdoc-Bing-Autosuggest.pdf
azdoc-Bing-Custom-Search.pdf
azdoc-Bing-Entities-Search.pdf
azdoc-Bing-Image-Search.pdf
azdoc-Bing-News-Search.pdf
azdoc-Bing-Spell-Check.pdf
azdoc-Bing-Video-Search.pdf
azdoc-Bing-Web-Search.pdf
azdoc-Computer-vision.pdf
azdoc-Content-Moderator.pdf
azdoc-Custom-Speech-Service.pdf
azdoc-Custom-Vision-Service.pdf
azdoc-Emotion.pdf
azdoc-EntityLinking.pdf
azdoc-Face.pdf
azdoc-KES.pdf
azdoc-LUIS.pdf
azdoc-LinguisticAnalysisAPI.pdf
azdoc-QnAMaker.pdf
azdoc-Recommendations.pdf
azdoc-Speaker-recognition.pdf
azdoc-Speech.pdf
azdoc-Text-Analytics.pdf
azdoc-Translator.pdf
azdoc-Video.pdf
azdoc-Web-Language-Model.pdf
azdoc-active-directory-b2c.pdf
azdoc-active-directory-domain-services.pdf
azdoc-active-directory.pdf
azdoc-advisor.pdf
azdoc-analysis-services.pdf
azdoc-api-management.pdf
azdoc-app-service-api.pdf
azdoc-app-service-mobile.pdf
azdoc-app-service-web.pdf
azdoc-app-service.pdf
azdoc-application-gateway.pdf
azdoc-application-insights.pdf
azdoc-aspnet.pdf
azdoc-automation.pdf
azdoc-availability-zones.pdf
azdoc-azure-functions.pdf
azdoc-azure-government.pdf
azdoc-azure-policy.pdf
azdoc-azure-portal.pdf
azdoc-azure-resource-manager.pdf
azdoc-azure-stack.pdf
azdoc-backup.pdf
azdoc-batch.pdf
azdoc-billing.pdf
azdoc-biztalk-services.pdf
azdoc-blobs.pdf
azdoc-bread.pdf
azdoc-cdn.pdf
azdoc-chef.pdf
azdoc-classic.pdf
azdoc-cloud-partner-portal.pdf
azdoc-cloud-services.pdf
azdoc-cloud-shell.pdf
azdoc-cloudfoundry.pdf
azdoc-cognitive-services.pdf
azdoc-connect-health.pdf
azdoc-connect.pdf
azdoc-container-instances.pdf
azdoc-container-registry.pdf
azdoc-container-service.pdf
azdoc-containers.pdf
azdoc-cosmos-db.pdf
azdoc-cost-management.pdf
azdoc-custom-decision-service.pdf
azdoc-data-catalog.pdf
azdoc-data-factory.pdf
azdoc-data-lake-analytics.pdf
azdoc-data-lake-store.pdf
azdoc-data-science-virtual-machine.pdf
azdoc-dcos-swarm.pdf
azdoc-develop.pdf
azdoc-developer.pdf
azdoc-devtest-lab.pdf
azdoc-dns.pdf
azdoc-docker.pdf
azdoc-documentdb.pdf
azdoc-dotnet.pdf
azdoc-end-user.pdf
azdoc-environment.pdf
azdoc-event-grid.pdf
azdoc-event-hubs.pdf
azdoc-expressroute.pdf
azdoc-files.pdf
azdoc-germany.pdf
azdoc-guidance.pdf
azdoc-hdinsight.pdf
azdoc-iot-dps.pdf
azdoc-iot-hub.pdf
azdoc-iot-suite.pdf
azdoc-jenkins.pdf
azdoc-key-vault.pdf
azdoc-kubernetes.pdf
azdoc-linux.pdf
azdoc-load-balancer.pdf
azdoc-log-analytics.pdf
azdoc-logic-apps.pdf
azdoc-machine-learning.pdf
azdoc-marketplace.pdf
azdoc-media-services.pdf
azdoc-mobile-engagement.pdf
azdoc-monitoring-and-diagnostics.pdf
azdoc-multi-factor-authentication.pdf
azdoc-mysql.pdf
azdoc-network-watcher.pdf
azdoc-networking.pdf
azdoc-notification-hubs.pdf
azdoc-openshift.pdf
azdoc-operations-management-suite.pdf
azdoc-operations.pdf
azdoc-oracle.pdf
azdoc-php.pdf
azdoc-postgresql.pdf
azdoc-power-bi-embedded.pdf
azdoc-preview.pdf
azdoc-privileged-identity-management.pdf
azdoc-queues.pdf
azdoc-redis-cache.pdf
azdoc-remoteapp.pdf
azdoc-resource-health.pdf
azdoc-sap.pdf
azdoc-scheduler.pdf
azdoc-search.pdf
azdoc-security-center.pdf
azdoc-security.pdf
azdoc-service-bus-messaging.pdf
azdoc-service-bus-relay.pdf
azdoc-service-bus.pdf
azdoc-service-fabric.pdf
azdoc-service-health.pdf
azdoc-site-recovery.pdf
azdoc-sql-data-warehouse.pdf
azdoc-sql-database.pdf
azdoc-sql-server-stretch-database.pdf
azdoc-sql.pdf
azdoc-sqlclassic.pdf
azdoc-storage.pdf
azdoc-storsimple.pdf
azdoc-stream-analytics.pdf
azdoc-studio.pdf
azdoc-team-data-science-process.pdf
azdoc-time-series-insights.pdf
azdoc-traffic-manager.pdf
azdoc-user.pdf
azdoc-v1.pdf
azdoc-video-indexer.pdf
azdoc-virtual-machine-scale-sets.pdf
azdoc-virtual-machines.pdf
azdoc-virtual-network.pdf
azdoc-vpn-gateway.pdf
azdoc-windows.pdf
```

See the generated curl scripts for more details.
