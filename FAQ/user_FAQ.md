---
identifier: faq
title: Frequently Asked Questions
linktitle: /resources/faq
date: 2019-08-07T10:57:21-05:00
layout: withtoc
menuname: faqMenu
---

# Frequently Asked Questions

## Getting Started


<h4>I deployed Gen3, how do I create a program and a project?</h4>

Please refer to corresponding
[Gen3 Documentation](https://docs.gen3.org/gen3-resources/operator-guide/submit-structured-data/#order-of-node-submission)
to create your first program and project.


<h4>I created a program, but I see a `NotFound` error when I try to create a
project within my program.</h4>

Please make sure you inserted program `name` in the URL, not
`dbgap_accession_number`.


<h4>I cannot submit data to the project I just created.</h4>

Please ensure you granted created the resource for your project and granted yourself permissions in the `user.yaml` file. You
can find more information about setting up the user.yaml in the 
[Fence repo](https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/user.yaml_guide.md)
documentation or in the [Controlling Data Authorization section](https://docs.gen3.org/gen3-resources/operator-guide/authorization/) of the Gen3 Docs operator guide.

<h4>I'm trying to upload files with gen3-client, but received an error
`x509: certificate signed by unknown authority`.</h4>

You can add self-signed certificate to your trusted certificates. Steps may
vary depending on Operating System you use.


## Cloud Automation


<h4>I'm setting up a CSOC-free instance, what should I set for the
`config_folder`?</h4>

The `config_folder` variable sets the location of your `user.yaml` file. If you
are using a local file, you can put any value - it won't be used. If you are
using any of our `user.yaml` files, then you may need to know which one. If you
are neither using ours nor local, you can also put a random value, and then
later when deploying kubernetes, you will be able to point the location of your
permissions file.


<h4>I modified the `user.yaml` file. How do I update Arborist?</h4>

If you run `gen3 job run usersync` changes should be picked up automatically.
If you don't want to run that command every time you make changes to your
`user.yaml`, you can deploy the cronjob `gen3 job run usersync-cronjob` and
kubernetes will check for changes every hour and update services accordingly.


<h4>How do I change the title of my webpage from the default "Generic Data Commons"?
Automation?</h4>

You can override the default configuration in your commons by using
`gitops.json` file. Set your `portal_app` to `gitops` in your file
`cdis-manifest/your-commons-name/manifest.json`. Then create
`cdis-manifest/your-commons-name/portal/gitops.json` file. You can use [this
file](https://github.com/uc-cdis/data-portal/blob/master/data/config/default.json)
as a template for your own `gitops.json` file. Set navigation title and login
title at your choice. Then reroll portal with `gen3 kube-setup-portal`.


<h4>I updated the Fence configuration. Why haven't the changes taken effect?</h4>

After updating the Fence configuration, run `kubectl delete secret
fence-config`, `gen3 kube-setup-fence` and roll Fence for configuration changes
to take effect with `gen3 roll fence`.


<h4>I receive errors when running queries on the GraphiQL "Query" page, e.g., Cannot query field "field" on type "Root".</h4>

You may need to hit the `Switch to Graph Model` button in the upper right
corner.


<h4>How do I run SNS services?</h4>

Please refer to [Cloud
Automation](https://github.com/uc-cdis/cloud-automation/tree/master/tf_files/aws/modules/data-bucket-queue)
documentation.


<h4>Arborist and Sheepdog don't work as expected, what should I check?</h4>

`kubectl logs <name of pod>` can show you corresponding errors in the logs.


<h4>I've updated the data dictionary, what services should I restart for the change to take effect?</h4>

First, restart Peregrine `gen3 roll peregrine` and Sheepdog `gen3 roll
sheepdog`.  After these two services restarted, please portal with `gen3 roll
portal`.  Please note, if you are making significant changes to the dictionary,
you will also need to update `portal_app` in the manifest.


<h4>I branched out the Windmill portal, should I update manifest with a new
version of portal?</h4>

Yes, you can update the manifest to use your version of the portal and use `gen3
kube-setup-portal` or `gen3 roll portal` to changes to take effect.


<h4>How can I update the APP for the portal?</h4>

You can set the `global.portal_app` setting in your manifest to the name of your
windmill configuration file and run `gen3 kube-setup-portal`.


<h4>What do I need to restart if I updated Fence configuration with OAuth
credentials?</h4>

Please run `kubectl delete secret fence-config` and `gen3 kube-setup-fence`.  If
you also updated the `user.yaml` in the folder `apis_configs`, you need to run
`gen3 job run useryaml-job`.


<h4>I'm storing `user.yaml` in S3 (not locally) and updated it, how do I ensure
changes take effect?</h4>

After you change `user.yaml`, run `gen3 kube-setup-secrets` and `gen3 job run
usersync`.


<h4>I see my data on a Query page, but not in the Exploration page. What other
services do I need to deploy/configure to have it running?</h4>

The Exploration page needs to be set up with Elastic Search using Guppy. Please
refer to the relevant
[Guppy](https://github.com/uc-cdis/guppy/blob/master/README.md) and [Cloud
Automation](https://github.com/uc-cdis/cloud-automation/blob/master/kube/services/guppy/README.md)
documentation, and see an [Sample
Configuration](https://github.com/uc-cdis/data-portal/pull/505) for the Guppy.


## Data Dictionary

<h4>I'm customizing the data schema, where I can find information about the data
dictionary customization, variables' definition, and files formatting?</h4>

Please refer documentation about [Creating New
Dictionary](https://docs.gen3.org/gen3-resources/operator-guide/create-data-dictionary/) and
[Submitting Structured Data](https://docs.gen3.org/gen3-resources/operator-guide/submit-structured-data/)


<h4>I have a dictionary in my local schemas folder, how can I generate the
`schema.json`?</h4>

You can use our [dictionaryutils](https://github.com/uc-cdis/dictionaryutils)
tool.  You can find an example on how to generate JSON in the
[README](https://github.com/uc-cdis/dictionaryutils#use-dictionaryutils-to-dump-a-dictionary)




# Frequently Asked Questions from Gen3 Users



The following information is copied from an old google doc:
https://docs.google.com/document/d/1cG799plASjCXjAsCscA2u7I4FEpXF7tAGMW6H31fOPk/edit?usp=sharing

FAQ

Added to gen3.org
In progress
Not added to the gen3.org
Data File Upload

Compose Services

How to create program and project
Please refer to [Gen3 Documentation](https://docs.gen3.org/gen3-resources/operator-guide/submit-structured-data/#order-of-node-submission)

I created a program, but I see NotFound error when I try to create a project within the program
Please make sure you use program name in the URL, not dbgap_accession_number

I can not submit data to the project I just created
Please ensure you granted yourself permissions in the `user.yaml` file 


Cloud Automation

We’re setting up a csoc-free, what should we set for the Config_folder

The config_folder variable sets the location of your user.yaml file. If you are using a local file then put any value, it won't be used. If you are using any of our user.yaml files, then you may need to know which one.
If you are neither using ours nor local, then you can also put a random value, and then later when deploying kubernetes you will be able to point the location of your permissions file.

How to update arborist as we modify user.yaml?

If you run gen3 job run usersync changes should be picked up automatically. If you don't want to run that command every time you make changes to your user.yaml, you can deploy the cronjob gen3 job run usersync-cronjob and kubernetes will check for changes every hour and update services accordingly.


How to change string “Generic Data Commons” in our pages?

Override the default configuration in your commons by using a gitops.json file (cdis-manifest/commons-url/portal/gitops.json).

You can set your portal_app to gitops in your file cdis-manifest/commons-url/manifest.json and then create cdis-manifest/commons-url/portal/gitops.json

Or you can copy this file https://github.com/uc-cdis/data-portal/blob/master/data/config/default.json   into cdis-manifest/gen3-vqt.bioteam.net/portal/gitops.json and alter this line https://github.com/uc-cdis/data-portal/blob/affc677ac02beebf3ffe3f0e82a37350529ebc09/data/config/default.json#L77
and https://github.com/uc-cdis/data-portal/blob/master/data/config/default.json#L131

Then you'll have to reroll portal with gen3 kube-setup-portal

I updated fence configuration but changes don’t appear?

After updating the fence config, you need to run
kubectl delete secret fence-config
gen3 kube-setup-fence
And roll Fence for config changes to take effect. gen3 roll fence

GraphiQL on Query page from throwing errors
You may need to hit the switch to graph model button in the upper right

How to run SNS service

Please refer Cloud Automation Documentation https://github.com/uc-cdis/cloud-automation/tree/master/tf_files/aws/modules/data-bucket-queue


What should I check if arborist and sheepdog keep restarting?

kubectl logs <name of pod> can show you corresponding errors in the logs.


After I uploaded the new dictionary what service should I restart? All of them?

Restart peregrine and sheepdog and when these 2 are done rolling, also roll portal

I branched out windmill portal, should I just update manifest with new version of portal?

You can update the manifest to use your version of the portal and use gen3 kube-setup-portal or gen3 roll portal

What I need to restart if I updated fence configuration with OAuth credentials

Run kubectl delete secret fence-config; gen3 kube-setup-fence and if you update the user.yaml in folder apis_configs you need to run gen3 job run useryaml-job

How can I update the APP for the portal

You should set the global.portal_app setting in your manifest to the name of your windmill config file and run gen3 kube-setup-portal.


I have a dictionary in my local schemas folder, how can I generate the "schema.json"

Use our dictionaryutils tool. You can find an example on how to generate JSON in the README: https://github.com/uc-cdis/dictionaryutils#use-dictionaryutils-to-dump-a-dictionary


I’m storing user.yaml in S3 (not locally) and updated it, how to ensure system picks up changes?

After you made the change to it, run gen3 kube-setup-secrets and gen3 job run usersyc.


I loaded all the data and the query page works perfectly, but when I go to the "exploration" tab I get a 403. What other services do I need to deploy/configure to have it running?

The explorer page needs to be set up with elastic search using guppy, Here are some links about how to set it up:
- setting up guppy: https://github.com/uc-cdis/guppy/blob/master/README.md, https://github.com/uc-cdis/cloud-automation/blob/master/kube/services/guppy/README.md
- configure the portal to use guppy: there is some info in the first comment here: https://github.com/uc-cdis/data-portal/pull/505 and you can have a look at the setup for this commons: https://github.com/uc-cdis/cdis-manifest/tree/master/staging.datastage.io


How to enable workspaces in Cloud Automation?
Here are recommended steps
deploy wts, hatchery, and ambassador - https://github.com/uc-cdis/cdis-manifest/blob/master/staging.datastage.io/manifest.json#L24
configure hatchery - https://github.com/uc-cdis/cdis-manifest/blob/master/staging.datastage.io/manifest.json#L98
set up workspace permissions in the user.yaml - https://github.com/uc-cdis/compose-services/blob/master/templates/user.yaml#L15https://github.com/uc-cdis/compose-services/blob/master/templates/user.yaml#L40https://github.com/uc-cdis/compose-services/blob/master/templates/user.yaml#L51https://github.com/uc-cdis/compose-services/blob/master/templates/user.yaml#L66
one important piece is that you need a block like this in your manifest https://github.com/uc-cdis/cdis-manifest/blob/f79f858b44ce40d4356934e7e435b73dffda526d/niaid.bionimbus.org/manifest.json#L90
i think you can then try running gen3 kube-setup-jupyterhub






Structured data upload

How to upload TSV from the command-line.

You can do most things via the command-line using our open APIs.

You can create structured data records using the Sheepdog API from the command-line using the gen3sdk:
https://github.com/uc-cdis/gen3sdk-python/blob/8e89d4ab2d840351413d710dc0710013fda7a5fe/gen3/submission.py#L136
Also there is a script that will submit an entire TSV, CSV, or Excel spreadsheet from the command-line:
https://github.com/cgmeyer/gen3sdk-python/blob/08ca2f2c212fd5d2604750b0552e91fb7305d1a5/expansion/expansion.py#L962

Additionally you can submit from the command line using this sheepdog endpoint and feeding it json or tsv data: http://petstore.swagger.io/?url=https://raw.githubusercontent.com/uc-cdis/sheepdog/master/openapi/swagger.yml#/entity/post__program___project_



gen3-client
I’m getting  `could not get new access key due to error code 401`error

This could happen if gen3-client is configured with profile that is deleted. Please make sure your gen3-client is configured with existing profile. Follow this section: https://docs.gen3.org/gen3-resources/tools/data-client/#configure-a-profile-with-credentials
Also please make sure your user has the data_upload policy in the user.yaml:
rbac:
 policies:
 - id: 'data_upload'
   description: 'upload raw data files to S3 (for new data upload flow)'
   resource_paths: ['/data_file']
   role_ids: ['file_uploader']
 roles:
 - id: 'file_uploader'
   permissions:
   - id: 'file_upload'
     action:
       service: 'fence'
       method: 'file_upload'
 resources:
   - name: 'data_file'
     description: 'data files, stored in S3'

users:
 userA:
   policies: ['data_upload']

Data Dictionary
We're interested in customized data schema, where we can find information about data dictionary customization, particularly regarding the process of defining variables and variable relationships, how the files need to be formatted and related, etc.

Here is a link to documentation about creating a new Dictionary: https://docs.gen3.org/gen3-resources/operator-guide/create-data-dictionary/


-------------------------------------------------------------------------------------------------------------------

Chris’s Section:
