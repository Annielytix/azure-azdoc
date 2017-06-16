#!/bin/bash

# Chris Joakim, Microsoft
# Generated on Fri 2017-06-16

rm assets/png/*.png 

source bin/activate

echo 'converting activedirectory image ...' 
cairosvg assets/svg/activedirectory.svg -o assets/png/activedirectory.png 
convert -thumbnail  50 assets/png/activedirectory.png assets/png/activedirectory-50.png 
convert -thumbnail 100 assets/png/activedirectory.png assets/png/activedirectory-100.png 

echo 'converting advisor image ...' 
cairosvg assets/svg/advisor.svg -o assets/png/advisor.png 
convert -thumbnail  50 assets/png/advisor.png assets/png/advisor-50.png 
convert -thumbnail 100 assets/png/advisor.png assets/png/advisor-100.png 

echo 'converting analysisservices image ...' 
cairosvg assets/svg/analysisservices.svg -o assets/png/analysisservices.png 
convert -thumbnail  50 assets/png/analysisservices.png assets/png/analysisservices-50.png 
convert -thumbnail 100 assets/png/analysisservices.png assets/png/analysisservices-100.png 

echo 'converting api_know_academic image ...' 
cairosvg assets/svg/api_know_academic.svg -o assets/png/api_know_academic.png 
convert -thumbnail  50 assets/png/api_know_academic.png assets/png/api_know_academic-50.png 
convert -thumbnail 100 assets/png/api_know_academic.png assets/png/api_know_academic-100.png 

echo 'converting api_know_entitylink image ...' 
cairosvg assets/svg/api_know_entitylink.svg -o assets/png/api_know_entitylink.png 
convert -thumbnail  50 assets/png/api_know_entitylink.png assets/png/api_know_entitylink-50.png 
convert -thumbnail 100 assets/png/api_know_entitylink.png assets/png/api_know_entitylink-100.png 

echo 'converting api_know_exploration image ...' 
cairosvg assets/svg/api_know_exploration.svg -o assets/png/api_know_exploration.png 
convert -thumbnail  50 assets/png/api_know_exploration.png assets/png/api_know_exploration-50.png 
convert -thumbnail 100 assets/png/api_know_exploration.png assets/png/api_know_exploration-100.png 

echo 'converting api_know_qanda_maker image ...' 
cairosvg assets/svg/api_know_qanda_maker.svg -o assets/png/api_know_qanda_maker.png 
convert -thumbnail  50 assets/png/api_know_qanda_maker.png assets/png/api_know_qanda_maker-50.png 
convert -thumbnail 100 assets/png/api_know_qanda_maker.png assets/png/api_know_qanda_maker-100.png 

echo 'converting api_know_recommendations image ...' 
cairosvg assets/svg/api_know_recommendations.svg -o assets/png/api_know_recommendations.png 
convert -thumbnail  50 assets/png/api_know_recommendations.png assets/png/api_know_recommendations-50.png 
convert -thumbnail 100 assets/png/api_know_recommendations.png assets/png/api_know_recommendations-100.png 

echo 'converting api_lang_bingspellcheck image ...' 
cairosvg assets/svg/api_lang_bingspellcheck.svg -o assets/png/api_lang_bingspellcheck.png 
convert -thumbnail  50 assets/png/api_lang_bingspellcheck.png assets/png/api_lang_bingspellcheck-50.png 
convert -thumbnail 100 assets/png/api_lang_bingspellcheck.png assets/png/api_lang_bingspellcheck-100.png 

echo 'converting api_lang_languageunderstanding image ...' 
cairosvg assets/svg/api_lang_languageunderstanding.svg -o assets/png/api_lang_languageunderstanding.png 
convert -thumbnail  50 assets/png/api_lang_languageunderstanding.png assets/png/api_lang_languageunderstanding-50.png 
convert -thumbnail 100 assets/png/api_lang_languageunderstanding.png assets/png/api_lang_languageunderstanding-100.png 

echo 'converting api_lang_linguisticanalysis image ...' 
cairosvg assets/svg/api_lang_linguisticanalysis.svg -o assets/png/api_lang_linguisticanalysis.png 
convert -thumbnail  50 assets/png/api_lang_linguisticanalysis.png assets/png/api_lang_linguisticanalysis-50.png 
convert -thumbnail 100 assets/png/api_lang_linguisticanalysis.png assets/png/api_lang_linguisticanalysis-100.png 

echo 'converting api_lang_textanalytics image ...' 
cairosvg assets/svg/api_lang_textanalytics.svg -o assets/png/api_lang_textanalytics.png 
convert -thumbnail  50 assets/png/api_lang_textanalytics.png assets/png/api_lang_textanalytics-50.png 
convert -thumbnail 100 assets/png/api_lang_textanalytics.png assets/png/api_lang_textanalytics-100.png 

echo 'converting api_lang_weblm image ...' 
cairosvg assets/svg/api_lang_weblm.svg -o assets/png/api_lang_weblm.png 
convert -thumbnail  50 assets/png/api_lang_weblm.png assets/png/api_lang_weblm-50.png 
convert -thumbnail 100 assets/png/api_lang_weblm.png assets/png/api_lang_weblm-100.png 

echo 'converting api_sear_bingautosuggest image ...' 
cairosvg assets/svg/api_sear_bingautosuggest.svg -o assets/png/api_sear_bingautosuggest.png 
convert -thumbnail  50 assets/png/api_sear_bingautosuggest.png assets/png/api_sear_bingautosuggest-50.png 
convert -thumbnail 100 assets/png/api_sear_bingautosuggest.png assets/png/api_sear_bingautosuggest-100.png 

echo 'converting api_sear_bingimagesearch image ...' 
cairosvg assets/svg/api_sear_bingimagesearch.svg -o assets/png/api_sear_bingimagesearch.png 
convert -thumbnail  50 assets/png/api_sear_bingimagesearch.png assets/png/api_sear_bingimagesearch-50.png 
convert -thumbnail 100 assets/png/api_sear_bingimagesearch.png assets/png/api_sear_bingimagesearch-100.png 

echo 'converting api_sear_bingnewssearch image ...' 
cairosvg assets/svg/api_sear_bingnewssearch.svg -o assets/png/api_sear_bingnewssearch.png 
convert -thumbnail  50 assets/png/api_sear_bingnewssearch.png assets/png/api_sear_bingnewssearch-50.png 
convert -thumbnail 100 assets/png/api_sear_bingnewssearch.png assets/png/api_sear_bingnewssearch-100.png 

echo 'converting api_sear_bingsearch image ...' 
cairosvg assets/svg/api_sear_bingsearch.svg -o assets/png/api_sear_bingsearch.png 
convert -thumbnail  50 assets/png/api_sear_bingsearch.png assets/png/api_sear_bingsearch-50.png 
convert -thumbnail 100 assets/png/api_sear_bingsearch.png assets/png/api_sear_bingsearch-100.png 

echo 'converting api_sear_bingvideosearch image ...' 
cairosvg assets/svg/api_sear_bingvideosearch.svg -o assets/png/api_sear_bingvideosearch.png 
convert -thumbnail  50 assets/png/api_sear_bingvideosearch.png assets/png/api_sear_bingvideosearch-50.png 
convert -thumbnail 100 assets/png/api_sear_bingvideosearch.png assets/png/api_sear_bingvideosearch-100.png 

echo 'converting api_spc_customspeechservice image ...' 
cairosvg assets/svg/api_spc_customspeechservice.svg -o assets/png/api_spc_customspeechservice.png 
convert -thumbnail  50 assets/png/api_spc_customspeechservice.png assets/png/api_spc_customspeechservice-50.png 
convert -thumbnail 100 assets/png/api_spc_customspeechservice.png assets/png/api_spc_customspeechservice-100.png 

echo 'converting api_spc_speakerrecognition image ...' 
cairosvg assets/svg/api_spc_speakerrecognition.svg -o assets/png/api_spc_speakerrecognition.png 
convert -thumbnail  50 assets/png/api_spc_speakerrecognition.png assets/png/api_spc_speakerrecognition-50.png 
convert -thumbnail 100 assets/png/api_spc_speakerrecognition.png assets/png/api_spc_speakerrecognition-100.png 

echo 'converting api_vis_computervision image ...' 
cairosvg assets/svg/api_vis_computervision.svg -o assets/png/api_vis_computervision.png 
convert -thumbnail  50 assets/png/api_vis_computervision.png assets/png/api_vis_computervision-50.png 
convert -thumbnail 100 assets/png/api_vis_computervision.png assets/png/api_vis_computervision-100.png 

echo 'converting api_vis_emotion image ...' 
cairosvg assets/svg/api_vis_emotion.svg -o assets/png/api_vis_emotion.png 
convert -thumbnail  50 assets/png/api_vis_emotion.png assets/png/api_vis_emotion-50.png 
convert -thumbnail 100 assets/png/api_vis_emotion.png assets/png/api_vis_emotion-100.png 

echo 'converting api_vis_face image ...' 
cairosvg assets/svg/api_vis_face.svg -o assets/png/api_vis_face.png 
convert -thumbnail  50 assets/png/api_vis_face.png assets/png/api_vis_face-50.png 
convert -thumbnail 100 assets/png/api_vis_face.png assets/png/api_vis_face-100.png 

echo 'converting apimanagement image ...' 
cairosvg assets/svg/apimanagement.svg -o assets/png/apimanagement.png 
convert -thumbnail  50 assets/png/apimanagement.png assets/png/apimanagement-50.png 
convert -thumbnail 100 assets/png/apimanagement.png assets/png/apimanagement-100.png 

echo 'converting app-service-api image ...' 
cairosvg assets/svg/app-service-api.svg -o assets/png/app-service-api.png 
convert -thumbnail  50 assets/png/app-service-api.png assets/png/app-service-api-50.png 
convert -thumbnail 100 assets/png/app-service-api.png assets/png/app-service-api-100.png 

echo 'converting app-service-mobile image ...' 
cairosvg assets/svg/app-service-mobile.svg -o assets/png/app-service-mobile.png 
convert -thumbnail  50 assets/png/app-service-mobile.png assets/png/app-service-mobile-50.png 
convert -thumbnail 100 assets/png/app-service-mobile.png assets/png/app-service-mobile-100.png 

echo 'converting app-service-web image ...' 
cairosvg assets/svg/app-service-web.svg -o assets/png/app-service-web.png 
convert -thumbnail  50 assets/png/app-service-web.png assets/png/app-service-web-50.png 
convert -thumbnail 100 assets/png/app-service-web.png assets/png/app-service-web-100.png 

echo 'converting applicationgateway image ...' 
cairosvg assets/svg/applicationgateway.svg -o assets/png/applicationgateway.png 
convert -thumbnail  50 assets/png/applicationgateway.png assets/png/applicationgateway-50.png 
convert -thumbnail 100 assets/png/applicationgateway.png assets/png/applicationgateway-100.png 

echo 'converting applicationinsights image ...' 
cairosvg assets/svg/applicationinsights.svg -o assets/png/applicationinsights.png 
convert -thumbnail  50 assets/png/applicationinsights.png assets/png/applicationinsights-50.png 
convert -thumbnail 100 assets/png/applicationinsights.png assets/png/applicationinsights-100.png 

echo 'converting appservice image ...' 
cairosvg assets/svg/appservice.svg -o assets/png/appservice.png 
convert -thumbnail  50 assets/png/appservice.png assets/png/appservice-50.png 
convert -thumbnail 100 assets/png/appservice.png assets/png/appservice-100.png 

echo 'converting automation image ...' 
cairosvg assets/svg/automation.svg -o assets/png/automation.png 
convert -thumbnail  50 assets/png/automation.png assets/png/automation-50.png 
convert -thumbnail 100 assets/png/automation.png assets/png/automation-100.png 

echo 'converting availabilitysetold image ...' 
cairosvg assets/svg/availabilitysetold.svg -o assets/png/availabilitysetold.png 
convert -thumbnail  50 assets/png/availabilitysetold.png assets/png/availabilitysetold-50.png 
convert -thumbnail 100 assets/png/availabilitysetold.png assets/png/availabilitysetold-100.png 

echo 'converting azure-germany image ...' 
cairosvg assets/svg/azure-germany.svg -o assets/png/azure-germany.png 
convert -thumbnail  50 assets/png/azure-germany.png assets/png/azure-germany-50.png 
convert -thumbnail 100 assets/png/azure-germany.png assets/png/azure-germany-100.png 

echo 'converting azure-government image ...' 
cairosvg assets/svg/azure-government.svg -o assets/png/azure-government.png 
convert -thumbnail  50 assets/png/azure-government.png assets/png/azure-government-50.png 
convert -thumbnail 100 assets/png/azure-government.png assets/png/azure-government-100.png 

echo 'converting azure-stack image ...' 
cairosvg assets/svg/azure-stack.svg -o assets/png/azure-stack.png 
convert -thumbnail  50 assets/png/azure-stack.png assets/png/azure-stack-50.png 
convert -thumbnail 100 assets/png/azure-stack.png assets/png/azure-stack-100.png 

echo 'converting azure_best-practices image ...' 
cairosvg assets/svg/azure_best-practices.svg -o assets/png/azure_best-practices.png 
convert -thumbnail  50 assets/png/azure_best-practices.png assets/png/azure_best-practices-50.png 
convert -thumbnail 100 assets/png/azure_best-practices.png assets/png/azure_best-practices-100.png 

echo 'converting azure_dev-1 image ...' 
cairosvg assets/svg/azure_dev-1.svg -o assets/png/azure_dev-1.png 
convert -thumbnail  50 assets/png/azure_dev-1.png assets/png/azure_dev-1-50.png 
convert -thumbnail 100 assets/png/azure_dev-1.png assets/png/azure_dev-1-100.png 

echo 'converting azure_dev-10 image ...' 
cairosvg assets/svg/azure_dev-10.svg -o assets/png/azure_dev-10.png 
convert -thumbnail  50 assets/png/azure_dev-10.png assets/png/azure_dev-10-50.png 
convert -thumbnail 100 assets/png/azure_dev-10.png assets/png/azure_dev-10-100.png 

echo 'converting azure_dev-11 image ...' 
cairosvg assets/svg/azure_dev-11.svg -o assets/png/azure_dev-11.png 
convert -thumbnail  50 assets/png/azure_dev-11.png assets/png/azure_dev-11-50.png 
convert -thumbnail 100 assets/png/azure_dev-11.png assets/png/azure_dev-11-100.png 

echo 'converting azure_dev-2 image ...' 
cairosvg assets/svg/azure_dev-2.svg -o assets/png/azure_dev-2.png 
convert -thumbnail  50 assets/png/azure_dev-2.png assets/png/azure_dev-2-50.png 
convert -thumbnail 100 assets/png/azure_dev-2.png assets/png/azure_dev-2-100.png 

echo 'converting azure_dev-3 image ...' 
cairosvg assets/svg/azure_dev-3.svg -o assets/png/azure_dev-3.png 
convert -thumbnail  50 assets/png/azure_dev-3.png assets/png/azure_dev-3-50.png 
convert -thumbnail 100 assets/png/azure_dev-3.png assets/png/azure_dev-3-100.png 

echo 'converting azure_dev-4 image ...' 
cairosvg assets/svg/azure_dev-4.svg -o assets/png/azure_dev-4.png 
convert -thumbnail  50 assets/png/azure_dev-4.png assets/png/azure_dev-4-50.png 
convert -thumbnail 100 assets/png/azure_dev-4.png assets/png/azure_dev-4-100.png 

echo 'converting azure_dev-5 image ...' 
cairosvg assets/svg/azure_dev-5.svg -o assets/png/azure_dev-5.png 
convert -thumbnail  50 assets/png/azure_dev-5.png assets/png/azure_dev-5-50.png 
convert -thumbnail 100 assets/png/azure_dev-5.png assets/png/azure_dev-5-100.png 

echo 'converting azure_dev-6 image ...' 
cairosvg assets/svg/azure_dev-6.svg -o assets/png/azure_dev-6.png 
convert -thumbnail  50 assets/png/azure_dev-6.png assets/png/azure_dev-6-50.png 
convert -thumbnail 100 assets/png/azure_dev-6.png assets/png/azure_dev-6-100.png 

echo 'converting azure_dev-7 image ...' 
cairosvg assets/svg/azure_dev-7.svg -o assets/png/azure_dev-7.png 
convert -thumbnail  50 assets/png/azure_dev-7.png assets/png/azure_dev-7-50.png 
convert -thumbnail 100 assets/png/azure_dev-7.png assets/png/azure_dev-7-100.png 

echo 'converting azure_dev-8 image ...' 
cairosvg assets/svg/azure_dev-8.svg -o assets/png/azure_dev-8.png 
convert -thumbnail  50 assets/png/azure_dev-8.png assets/png/azure_dev-8-50.png 
convert -thumbnail 100 assets/png/azure_dev-8.png assets/png/azure_dev-8-100.png 

echo 'converting azure_dev-9 image ...' 
cairosvg assets/svg/azure_dev-9.svg -o assets/png/azure_dev-9.png 
convert -thumbnail  50 assets/png/azure_dev-9.png assets/png/azure_dev-9-50.png 
convert -thumbnail 100 assets/png/azure_dev-9.png assets/png/azure_dev-9-100.png 

echo 'converting azure_fundamentals image ...' 
cairosvg assets/svg/azure_fundamentals.svg -o assets/png/azure_fundamentals.png 
convert -thumbnail  50 assets/png/azure_fundamentals.png assets/png/azure_fundamentals-50.png 
convert -thumbnail 100 assets/png/azure_fundamentals.png assets/png/azure_fundamentals-100.png 

echo 'converting azure_patterns image ...' 
cairosvg assets/svg/azure_patterns.svg -o assets/png/azure_patterns.png 
convert -thumbnail  50 assets/png/azure_patterns.png assets/png/azure_patterns-50.png 
convert -thumbnail 100 assets/png/azure_patterns.png assets/png/azure_patterns-100.png 

echo 'converting azure_reference-archictectures image ...' 
cairosvg assets/svg/azure_reference-archictectures.svg -o assets/png/azure_reference-archictectures.png 
convert -thumbnail  50 assets/png/azure_reference-archictectures.png assets/png/azure_reference-archictectures-50.png 
convert -thumbnail 100 assets/png/azure_reference-archictectures.png assets/png/azure_reference-archictectures-100.png 

echo 'converting azuredefaultblack image ...' 
cairosvg assets/svg/azuredefaultblack.svg -o assets/png/azuredefaultblack.png 
convert -thumbnail  50 assets/png/azuredefaultblack.png assets/png/azuredefaultblack-50.png 
convert -thumbnail 100 assets/png/azuredefaultblack.png assets/png/azuredefaultblack-100.png 

echo 'converting azurefunctions image ...' 
cairosvg assets/svg/azurefunctions.svg -o assets/png/azurefunctions.png 
convert -thumbnail  50 assets/png/azurefunctions.png assets/png/azurefunctions-50.png 
convert -thumbnail 100 assets/png/azurefunctions.png assets/png/azurefunctions-100.png 

echo 'converting azuremonitoring image ...' 
cairosvg assets/svg/azuremonitoring.svg -o assets/png/azuremonitoring.png 
convert -thumbnail  50 assets/png/azuremonitoring.png assets/png/azuremonitoring-50.png 
convert -thumbnail 100 assets/png/azuremonitoring.png assets/png/azuremonitoring-100.png 

echo 'converting backup image ...' 
cairosvg assets/svg/backup.svg -o assets/png/backup.png 
convert -thumbnail  50 assets/png/backup.png assets/png/backup-50.png 
convert -thumbnail 100 assets/png/backup.png assets/png/backup-100.png 

echo 'converting batch image ...' 
cairosvg assets/svg/batch.svg -o assets/png/batch.png 
convert -thumbnail  50 assets/png/batch.png assets/png/batch-50.png 
convert -thumbnail 100 assets/png/batch.png assets/png/batch-100.png 

echo 'converting billing image ...' 
cairosvg assets/svg/billing.svg -o assets/png/billing.png 
convert -thumbnail  50 assets/png/billing.png assets/png/billing-50.png 
convert -thumbnail 100 assets/png/billing.png assets/png/billing-100.png 

echo 'converting biztalkservices image ...' 
cairosvg assets/svg/biztalkservices.svg -o assets/png/biztalkservices.png 
convert -thumbnail  50 assets/png/biztalkservices.png assets/png/biztalkservices-50.png 
convert -thumbnail 100 assets/png/biztalkservices.png assets/png/biztalkservices-100.png 

echo 'converting bot-service image ...' 
cairosvg assets/svg/bot-service.svg -o assets/png/bot-service.png 
convert -thumbnail  50 assets/png/bot-service.png assets/png/bot-service-50.png 
convert -thumbnail 100 assets/png/bot-service.png assets/png/bot-service-100.png 

echo 'converting cloudservice image ...' 
cairosvg assets/svg/cloudservice.svg -o assets/png/cloudservice.png 
convert -thumbnail  50 assets/png/cloudservice.png assets/png/cloudservice-50.png 
convert -thumbnail 100 assets/png/cloudservice.png assets/png/cloudservice-100.png 

echo 'converting cognitive-services-translator image ...' 
cairosvg assets/svg/cognitive-services-translator.svg -o assets/png/cognitive-services-translator.png 
convert -thumbnail  50 assets/png/cognitive-services-translator.png assets/png/cognitive-services-translator-50.png 
convert -thumbnail 100 assets/png/cognitive-services-translator.png assets/png/cognitive-services-translator-100.png 

echo 'converting container-registry image ...' 
cairosvg assets/svg/container-registry.svg -o assets/png/container-registry.png 
convert -thumbnail  50 assets/png/container-registry.png assets/png/container-registry-50.png 
convert -thumbnail 100 assets/png/container-registry.png assets/png/container-registry-100.png 

echo 'converting containerservice image ...' 
cairosvg assets/svg/containerservice.svg -o assets/png/containerservice.png 
convert -thumbnail  50 assets/png/containerservice.png assets/png/containerservice-50.png 
convert -thumbnail 100 assets/png/containerservice.png assets/png/containerservice-100.png 

echo 'converting contentdeliverynetwork image ...' 
cairosvg assets/svg/contentdeliverynetwork.svg -o assets/png/contentdeliverynetwork.png 
convert -thumbnail  50 assets/png/contentdeliverynetwork.png assets/png/contentdeliverynetwork-50.png 
convert -thumbnail 100 assets/png/contentdeliverynetwork.png assets/png/contentdeliverynetwork-100.png 

echo 'converting cosmosdb image ...' 
cairosvg assets/svg/cosmosdb.svg -o assets/png/cosmosdb.png 
convert -thumbnail  50 assets/png/cosmosdb.png assets/png/cosmosdb-50.png 
convert -thumbnail 100 assets/png/cosmosdb.png assets/png/cosmosdb-100.png 

echo 'converting cs-content-moderator image ...' 
cairosvg assets/svg/cs-content-moderator.svg -o assets/png/cs-content-moderator.png 
convert -thumbnail  50 assets/png/cs-content-moderator.png assets/png/cs-content-moderator-50.png 
convert -thumbnail 100 assets/png/cs-content-moderator.png assets/png/cs-content-moderator-100.png 

echo 'converting cs-custom-vision image ...' 
cairosvg assets/svg/cs-custom-vision.svg -o assets/png/cs-custom-vision.png 
convert -thumbnail  50 assets/png/cs-custom-vision.png assets/png/cs-custom-vision-50.png 
convert -thumbnail 100 assets/png/cs-custom-vision.png assets/png/cs-custom-vision-100.png 

echo 'converting cs-decision-maker image ...' 
cairosvg assets/svg/cs-decision-maker.svg -o assets/png/cs-decision-maker.png 
convert -thumbnail  50 assets/png/cs-decision-maker.png assets/png/cs-decision-maker-50.png 
convert -thumbnail 100 assets/png/cs-decision-maker.png assets/png/cs-decision-maker-100.png 

echo 'converting cs-video-indexer image ...' 
cairosvg assets/svg/cs-video-indexer.svg -o assets/png/cs-video-indexer.png 
convert -thumbnail  50 assets/png/cs-video-indexer.png assets/png/cs-video-indexer-50.png 
convert -thumbnail 100 assets/png/cs-video-indexer.png assets/png/cs-video-indexer-100.png 

echo 'converting cs-video image ...' 
cairosvg assets/svg/cs-video.svg -o assets/png/cs-video.png 
convert -thumbnail  50 assets/png/cs-video.png assets/png/cs-video-50.png 
convert -thumbnail 100 assets/png/cs-video.png assets/png/cs-video-100.png 

echo 'converting data-catalog image ...' 
cairosvg assets/svg/data-catalog.svg -o assets/png/data-catalog.png 
convert -thumbnail  50 assets/png/data-catalog.png assets/png/data-catalog-50.png 
convert -thumbnail 100 assets/png/data-catalog.png assets/png/data-catalog-100.png 

echo 'converting datafactory image ...' 
cairosvg assets/svg/datafactory.svg -o assets/png/datafactory.png 
convert -thumbnail  50 assets/png/datafactory.png assets/png/datafactory-50.png 
convert -thumbnail 100 assets/png/datafactory.png assets/png/datafactory-100.png 

echo 'converting datalakestore image ...' 
cairosvg assets/svg/datalakestore.svg -o assets/png/datalakestore.png 
convert -thumbnail  50 assets/png/datalakestore.png assets/png/datalakestore-50.png 
convert -thumbnail 100 assets/png/datalakestore.png assets/png/datalakestore-100.png 

echo 'converting devtestlabs image ...' 
cairosvg assets/svg/devtestlabs.svg -o assets/png/devtestlabs.png 
convert -thumbnail  50 assets/png/devtestlabs.png assets/png/devtestlabs-50.png 
convert -thumbnail 100 assets/png/devtestlabs.png assets/png/devtestlabs-100.png 

echo 'converting dns image ...' 
cairosvg assets/svg/dns.svg -o assets/png/dns.png 
convert -thumbnail  50 assets/png/dns.png assets/png/dns-50.png 
convert -thumbnail 100 assets/png/dns.png assets/png/dns-100.png 

echo 'converting eventhubs image ...' 
cairosvg assets/svg/eventhubs.svg -o assets/png/eventhubs.png 
convert -thumbnail  50 assets/png/eventhubs.png assets/png/eventhubs-50.png 
convert -thumbnail 100 assets/png/eventhubs.png assets/png/eventhubs-100.png 

echo 'converting expressroute image ...' 
cairosvg assets/svg/expressroute.svg -o assets/png/expressroute.png 
convert -thumbnail  50 assets/png/expressroute.png assets/png/expressroute-50.png 
convert -thumbnail 100 assets/png/expressroute.png assets/png/expressroute-100.png 

echo 'converting fabric image ...' 
cairosvg assets/svg/fabric.svg -o assets/png/fabric.png 
convert -thumbnail  50 assets/png/fabric.png assets/png/fabric-50.png 
convert -thumbnail 100 assets/png/fabric.png assets/png/fabric-100.png 

echo 'converting hdinsight image ...' 
cairosvg assets/svg/hdinsight.svg -o assets/png/hdinsight.png 
convert -thumbnail  50 assets/png/hdinsight.png assets/png/hdinsight-50.png 
convert -thumbnail 100 assets/png/hdinsight.png assets/png/hdinsight-100.png 

echo 'converting hockeyapp image ...' 
cairosvg assets/svg/hockeyapp.svg -o assets/png/hockeyapp.png 
convert -thumbnail  50 assets/png/hockeyapp.png assets/png/hockeyapp-50.png 
convert -thumbnail 100 assets/png/hockeyapp.png assets/png/hockeyapp-100.png 

echo 'converting iot-suite image ...' 
cairosvg assets/svg/iot-suite.svg -o assets/png/iot-suite.png 
convert -thumbnail  50 assets/png/iot-suite.png assets/png/iot-suite-50.png 
convert -thumbnail 100 assets/png/iot-suite.png assets/png/iot-suite-100.png 

echo 'converting iothub image ...' 
cairosvg assets/svg/iothub.svg -o assets/png/iothub.png 
convert -thumbnail  50 assets/png/iothub.png assets/png/iothub-50.png 
convert -thumbnail 100 assets/png/iothub.png assets/png/iothub-100.png 

echo 'converting keyvault image ...' 
cairosvg assets/svg/keyvault.svg -o assets/png/keyvault.png 
convert -thumbnail  50 assets/png/keyvault.png assets/png/keyvault-50.png 
convert -thumbnail 100 assets/png/keyvault.png assets/png/keyvault-100.png 

echo 'converting loadbalancer image ...' 
cairosvg assets/svg/loadbalancer.svg -o assets/png/loadbalancer.png 
convert -thumbnail  50 assets/png/loadbalancer.png assets/png/loadbalancer-50.png 
convert -thumbnail 100 assets/png/loadbalancer.png assets/png/loadbalancer-100.png 

echo 'converting logicapp image ...' 
cairosvg assets/svg/logicapp.svg -o assets/png/logicapp.png 
convert -thumbnail  50 assets/png/logicapp.png assets/png/logicapp-50.png 
convert -thumbnail 100 assets/png/logicapp.png assets/png/logicapp-100.png 

echo 'converting logo_java image ...' 
cairosvg assets/svg/logo_java.svg -o assets/png/logo_java.png 
convert -thumbnail  50 assets/png/logo_java.png assets/png/logo_java-50.png 
convert -thumbnail 100 assets/png/logo_java.png assets/png/logo_java-100.png 

echo 'converting logo_net image ...' 
cairosvg assets/svg/logo_net.svg -o assets/png/logo_net.png 
convert -thumbnail  50 assets/png/logo_net.png assets/png/logo_net-50.png 
convert -thumbnail 100 assets/png/logo_net.png assets/png/logo_net-100.png 

echo 'converting logo_nodejs image ...' 
cairosvg assets/svg/logo_nodejs.svg -o assets/png/logo_nodejs.png 
convert -thumbnail  50 assets/png/logo_nodejs.png assets/png/logo_nodejs-50.png 
convert -thumbnail 100 assets/png/logo_nodejs.png assets/png/logo_nodejs-100.png 

echo 'converting logo_php image ...' 
cairosvg assets/svg/logo_php.svg -o assets/png/logo_php.png 
convert -thumbnail  50 assets/png/logo_php.png assets/png/logo_php-50.png 
convert -thumbnail 100 assets/png/logo_php.png assets/png/logo_php-100.png 

echo 'converting logo_python image ...' 
cairosvg assets/svg/logo_python.svg -o assets/png/logo_python.png 
convert -thumbnail  50 assets/png/logo_python.png assets/png/logo_python-50.png 
convert -thumbnail 100 assets/png/logo_python.png assets/png/logo_python-100.png 

echo 'converting machinelearning image ...' 
cairosvg assets/svg/machinelearning.svg -o assets/png/machinelearning.png 
convert -thumbnail  50 assets/png/machinelearning.png assets/png/machinelearning-50.png 
convert -thumbnail 100 assets/png/machinelearning.png assets/png/machinelearning-100.png 

echo 'converting mediaservices image ...' 
cairosvg assets/svg/mediaservices.svg -o assets/png/mediaservices.png 
convert -thumbnail  50 assets/png/mediaservices.png assets/png/mediaservices-50.png 
convert -thumbnail 100 assets/png/mediaservices.png assets/png/mediaservices-100.png 

echo 'converting mobileengagement image ...' 
cairosvg assets/svg/mobileengagement.svg -o assets/png/mobileengagement.png 
convert -thumbnail  50 assets/png/mobileengagement.png assets/png/mobileengagement-50.png 
convert -thumbnail 100 assets/png/mobileengagement.png assets/png/mobileengagement-100.png 

echo 'converting multifactorauthentication image ...' 
cairosvg assets/svg/multifactorauthentication.svg -o assets/png/multifactorauthentication.png 
convert -thumbnail  50 assets/png/multifactorauthentication.png assets/png/multifactorauthentication-50.png 
convert -thumbnail 100 assets/png/multifactorauthentication.png assets/png/multifactorauthentication-100.png 

echo 'converting mysql image ...' 
cairosvg assets/svg/mysql.svg -o assets/png/mysql.png 
convert -thumbnail  50 assets/png/mysql.png assets/png/mysql-50.png 
convert -thumbnail 100 assets/png/mysql.png assets/png/mysql-100.png 

echo 'converting network-watcher image ...' 
cairosvg assets/svg/network-watcher.svg -o assets/png/network-watcher.png 
convert -thumbnail  50 assets/png/network-watcher.png assets/png/network-watcher-50.png 
convert -thumbnail 100 assets/png/network-watcher.png assets/png/network-watcher-100.png 

echo 'converting networking-overview image ...' 
cairosvg assets/svg/networking-overview.svg -o assets/png/networking-overview.png 
convert -thumbnail  50 assets/png/networking-overview.png assets/png/networking-overview-50.png 
convert -thumbnail 100 assets/png/networking-overview.png assets/png/networking-overview-100.png 

echo 'converting notificationhubs image ...' 
cairosvg assets/svg/notificationhubs.svg -o assets/png/notificationhubs.png 
convert -thumbnail  50 assets/png/notificationhubs.png assets/png/notificationhubs-50.png 
convert -thumbnail 100 assets/png/notificationhubs.png assets/png/notificationhubs-100.png 

echo 'converting operationsmanagementsuite image ...' 
cairosvg assets/svg/operationsmanagementsuite.svg -o assets/png/operationsmanagementsuite.png 
convert -thumbnail  50 assets/png/operationsmanagementsuite.png assets/png/operationsmanagementsuite-50.png 
convert -thumbnail 100 assets/png/operationsmanagementsuite.png assets/png/operationsmanagementsuite-100.png 

echo 'converting postgresql image ...' 
cairosvg assets/svg/postgresql.svg -o assets/png/postgresql.png 
convert -thumbnail  50 assets/png/postgresql.png assets/png/postgresql-50.png 
convert -thumbnail 100 assets/png/postgresql.png assets/png/postgresql-100.png 

echo 'converting powerbiembedded image ...' 
cairosvg assets/svg/powerbiembedded.svg -o assets/png/powerbiembedded.png 
convert -thumbnail  50 assets/png/powerbiembedded.png assets/png/powerbiembedded-50.png 
convert -thumbnail 100 assets/png/powerbiembedded.png assets/png/powerbiembedded-100.png 

echo 'converting rediscache image ...' 
cairosvg assets/svg/rediscache.svg -o assets/png/rediscache.png 
convert -thumbnail  50 assets/png/rediscache.png assets/png/rediscache-50.png 
convert -thumbnail 100 assets/png/rediscache.png assets/png/rediscache-100.png 

echo 'converting resource-health image ...' 
cairosvg assets/svg/resource-health.svg -o assets/png/resource-health.png 
convert -thumbnail  50 assets/png/resource-health.png assets/png/resource-health-50.png 
convert -thumbnail 100 assets/png/resource-health.png assets/png/resource-health-100.png 

echo 'converting scheduler image ...' 
cairosvg assets/svg/scheduler.svg -o assets/png/scheduler.png 
convert -thumbnail  50 assets/png/scheduler.png assets/png/scheduler-50.png 
convert -thumbnail 100 assets/png/scheduler.png assets/png/scheduler-100.png 

echo 'converting search image ...' 
cairosvg assets/svg/search.svg -o assets/png/search.png 
convert -thumbnail  50 assets/png/search.png assets/png/search-50.png 
convert -thumbnail 100 assets/png/search.png assets/png/search-100.png 

echo 'converting securitycenter image ...' 
cairosvg assets/svg/securitycenter.svg -o assets/png/securitycenter.png 
convert -thumbnail  50 assets/png/securitycenter.png assets/png/securitycenter-50.png 
convert -thumbnail 100 assets/png/securitycenter.png assets/png/securitycenter-100.png 

echo 'converting servicebus image ...' 
cairosvg assets/svg/servicebus.svg -o assets/png/servicebus.png 
convert -thumbnail  50 assets/png/servicebus.png assets/png/servicebus-50.png 
convert -thumbnail 100 assets/png/servicebus.png assets/png/servicebus-100.png 

echo 'converting siterecovery image ...' 
cairosvg assets/svg/siterecovery.svg -o assets/png/siterecovery.png 
convert -thumbnail  50 assets/png/siterecovery.png assets/png/siterecovery-50.png 
convert -thumbnail 100 assets/png/siterecovery.png assets/png/siterecovery-100.png 

echo 'converting sqldatabase image ...' 
cairosvg assets/svg/sqldatabase.svg -o assets/png/sqldatabase.png 
convert -thumbnail  50 assets/png/sqldatabase.png assets/png/sqldatabase-50.png 
convert -thumbnail 100 assets/png/sqldatabase.png assets/png/sqldatabase-100.png 

echo 'converting sqldatawarehouse image ...' 
cairosvg assets/svg/sqldatawarehouse.svg -o assets/png/sqldatawarehouse.png 
convert -thumbnail  50 assets/png/sqldatawarehouse.png assets/png/sqldatawarehouse-50.png 
convert -thumbnail 100 assets/png/sqldatawarehouse.png assets/png/sqldatawarehouse-100.png 

echo 'converting storage image ...' 
cairosvg assets/svg/storage.svg -o assets/png/storage.png 
convert -thumbnail  50 assets/png/storage.png assets/png/storage-50.png 
convert -thumbnail 100 assets/png/storage.png assets/png/storage-100.png 

echo 'converting storsimple image ...' 
cairosvg assets/svg/storsimple.svg -o assets/png/storsimple.png 
convert -thumbnail  50 assets/png/storsimple.png assets/png/storsimple-50.png 
convert -thumbnail 100 assets/png/storsimple.png assets/png/storsimple-100.png 

echo 'converting streamanalytics image ...' 
cairosvg assets/svg/streamanalytics.svg -o assets/png/streamanalytics.png 
convert -thumbnail  50 assets/png/streamanalytics.png assets/png/streamanalytics-50.png 
convert -thumbnail 100 assets/png/streamanalytics.png assets/png/streamanalytics-100.png 

echo 'converting time-series-insights image ...' 
cairosvg assets/svg/time-series-insights.svg -o assets/png/time-series-insights.png 
convert -thumbnail  50 assets/png/time-series-insights.png assets/png/time-series-insights-50.png 
convert -thumbnail 100 assets/png/time-series-insights.png assets/png/time-series-insights-100.png 

echo 'converting trafficmanager image ...' 
cairosvg assets/svg/trafficmanager.svg -o assets/png/trafficmanager.png 
convert -thumbnail  50 assets/png/trafficmanager.png assets/png/trafficmanager-50.png 
convert -thumbnail 100 assets/png/trafficmanager.png assets/png/trafficmanager-100.png 

echo 'converting virtualmachine image ...' 
cairosvg assets/svg/virtualmachine.svg -o assets/png/virtualmachine.png 
convert -thumbnail  50 assets/png/virtualmachine.png assets/png/virtualmachine-50.png 
convert -thumbnail 100 assets/png/virtualmachine.png assets/png/virtualmachine-100.png 

echo 'converting virtualnetwork image ...' 
cairosvg assets/svg/virtualnetwork.svg -o assets/png/virtualnetwork.png 
convert -thumbnail  50 assets/png/virtualnetwork.png assets/png/virtualnetwork-50.png 
convert -thumbnail 100 assets/png/virtualnetwork.png assets/png/virtualnetwork-100.png 

echo 'converting visualstudioteamservices image ...' 
cairosvg assets/svg/visualstudioteamservices.svg -o assets/png/visualstudioteamservices.png 
convert -thumbnail  50 assets/png/visualstudioteamservices.png assets/png/visualstudioteamservices-50.png 
convert -thumbnail 100 assets/png/visualstudioteamservices.png assets/png/visualstudioteamservices-100.png 

echo 'converting vpngateway image ...' 
cairosvg assets/svg/vpngateway.svg -o assets/png/vpngateway.png 
convert -thumbnail  50 assets/png/vpngateway.png assets/png/vpngateway-50.png 
convert -thumbnail 100 assets/png/vpngateway.png assets/png/vpngateway-100.png 

echo 'done'

