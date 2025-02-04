
# Frequently Asked Questions



## Data Dictionary

### I'm customizing the data schema, where I can find information about the data dictionary customization, variables' definition, and files formatting?

Please refer documentation about [Creating New Dictionary](operator-guide/create-data-dictionary.md) and [Data Types](operator-guide/submit-structured-data.md).


### I have a dictionary in my local schemas folder, how can I generate the `schema.json`?

You can use our [dictionaryutils](https://github.com/uc-cdis/dictionaryutils) tool.  You can find an example on how to generate JSON in the [README](https://github.com/uc-cdis/dictionaryutils#use-dictionaryutils-to-dump-a-dictionary)

## Cloud Automation (**Legacy**)


### I'm setting up a CSOC-free instance, what should I set for the `config_folder`?

The `config_folder` variable sets the location of your `user.yaml` file. If you are using a local file, you can put any value - it won't be used. If you are using any of our `user.yaml` files, then you may need to know which one. If you are neither using ours nor local, you can also put a random value, and then later when deploying kubernetes, you will be able to point the location of your permissions file.


### I modified the `user.yaml` file. How do I update Arborist?

If you run `gen3 job run usersync` changes should be picked up automatically. If you don't want to run that command every time you make changes to your `user.yaml`, you can deploy the cronjob `gen3 job run usersync-cronjob` and kubernetes will check for changes every hour and update services accordingly.


### How do I change the title of my webpage from the default "Generic Data Commons"? Automation?

You can override the default configuration in your commons by using `gitops.json` file. Set your `portal_app` to `gitops` in your file `cdis-manifest/your-commons-name/manifest.json`. Then create `cdis-manifest/your-commons-name/portal/gitops.json` file. You can use [this file](https://github.com/uc-cdis/data-portal/blob/master/data/config/default.json) as a template for your own `gitops.json` file. Set navigation title and login title at your choice. Then reroll portal with `gen3 kube-setup-portal`.


### I updated the Fence configuration. Why haven't the changes taken effect?

After updating the Fence configuration, run `kubectl delete secret fence-config`, `gen3 kube-setup-fence` and roll Fence for configuration changes to take effect with `gen3 roll fence`.


### I receive errors when running queries on the GraphiQL "Query" page, e.g., Cannot query field "field" on type "Root".

You may need to hit the `Switch to Graph Model` button in the upper right corner.


### How do I run SNS services?

Please refer to [Cloud Automation](https://github.com/uc-cdis/cloud-automation/tree/master/tf_files/aws/modules/data-bucket-queue) documentation.


### Arborist and Sheepdog don't work as expected, what should I check?

`kubectl logs <name of pod>` can show you corresponding errors in the logs.


### I've updated the data dictionary, what services should I restart for the change to take effect?

First, restart Peregrine `gen3 roll peregrine` and Sheepdog `gen3 roll sheepdog`.  After these two services restarted, please portal with `gen3 roll portal`.  Please note, if you are making significant changes to the dictionary, you will also need to update `portal_app` in the manifest.


### I branched out the Windmill portal, should I update manifest with a new version of portal?

Yes, you can update the manifest to use your version of the portal and use `gen3\ kube-setup-portal` or `gen3 roll portal` to changes to take effect.


### How can I update the APP for the portal?

You can set the `global.portal_app` setting in your manifest to the name of your windmill configuration file and run `gen3 kube-setup-portal`.


### What do I need to restart if I updated Fence configuration with OAuth credentials?

Please run `kubectl delete secret fence-config` and `gen3 kube-setup-fence`.  If you also updated the `user.yaml` in the folder `apis_configs`, you need to run `gen3 job run useryaml-job`.


### I'm storing `user.yaml` in S3 (not locally) and updated it, how do I ensure changes take effect?

After you change `user.yaml`, run `gen3 kube-setup-secrets` and `gen3 job run usersync`.


### I see my data on a Query page, but not in the Exploration page. What other services do I need to deploy/configure to have it running?

The Exploration page needs to be set up with Elastic Search using Guppy. Please refer to the relevant [Guppy](https://github.com/uc-cdis/guppy/blob/master/README.md) and [Cloud Automation](https://github.com/uc-cdis/cloud-automation/blob/master/kube/services/guppy/README.md) documentation, and see an [Sample Configuration](https://github.com/uc-cdis/data-portal/pull/505) for the Guppy.



## Compose Services (**Deprecated**)


### I installed Compose Services, how do I create a program and a project?

Please refer to corresponding [Gen3 Documentation](operator-guide/submit-structured-data.md#order-of-node-submission) to create your first program and project.


### I created a program, but I see a `NotFound` error when I try to create a project within my program.

Please make sure you inserted program `name` in the URL, not `dbgap_accession_number`.


### I can not submit data to the project I just created.

Please ensure you granted yourself permissions in the `user.yaml` file. You can find this file in the `Secrets` folder within your Compose Services folder. Follow provided in the file example to grant yourself relevant permissions. You can find more information in the [Setting Up Users](https://github.com/uc-cdis/compose-services#setting-up-users) documentation.


### User.yaml contains information about program/project, but I still cannot access it.

Please ensure you are using `dbgap_accession_number` value as an identifier for the `auth_id` field, not program's `name` or project's `code`.


### I see a warning about my connection not being private.

Don't worry. The warning about connection not being private appears because `creds_setup.sh` script generated self-signed SSL certificate to allow microservices to communicate with each other without bypassing SSL verification. Your browser can not verify this certificate. Once you install a trusted SSL certificate instead of generated by our script, this warning will go away.


### I want to run Compose Services on the server, how do I configure it?

To configure Compose Services with your domain, please change the `BASE_URL` field in the `fence_config.yaml` file, and the `hostname` field in the `peregrine.json` and `sheepdog.json` files.


### I'm trying to upload files with gen3-client, but received an error `x509: certificate signed by unknown authority`.

You can add self-signed certificate to your trusted certificates. Steps may vary depending on Operating System you use.
