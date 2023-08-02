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
Please refer to Gen3 documentation https://gen3.org/resources/operator/#5-programs-and-projects

I created a program, but I see NotFound error when I try to create a project within the program
Please make sure you use program name in the URL, not dbgap_accession_number

I can not submit data to the project I just created
Please ensure you granted yourself permissions in the `user.yaml` file in the `Secrets` folder.

User.yaml contains information about program/project but I still can not access it
Please ensure you are using `dbgap_accession_number` for `auth_id`.

I’m seeing warning about my connection is not being private
Don’t worry. The warning about connection not being private appears because our script generated self-signed SSL certificate and it can not be verified by your browser. Once you install trusted SSL certificate instead of self-signed, this warning will go away.

How to set up compose services for the server, not localhost
Run `bash creds_setup.sh YOUR_DOMAIN` command. (not working now, change BASE_URL in fence_config.yaml, and hostname in peregrine.json, sheepdog.json)

I’m trying to upload file to compose service and gen3-client raises error x509: certificate signed by unknown authority
You can add self-signed certificate to your trusted certificates. Steps may vary depending on OS you use.



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

This could happen if gen3-client is configured with profile that is deleted. Please make sure your gen3-client is configured with existing profile. Follow this section: https://gen3.org/resources/user/gen3-client/#2-configure-a-profile-with-credentials
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

Here is a link to documentation about New Dictionary: https://gen3.org/resources/operator/#3-creating-a-new-data-dictionary

Documentation about data types and templates:
https://gen3.org/resources/user/template-tsvs/
https://gen3.org/resources/user/data-types/


-------------------------------------------------------------------------------------------------------------------

Chris’s Section:
