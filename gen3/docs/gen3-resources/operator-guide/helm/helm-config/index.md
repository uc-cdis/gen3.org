# Configuring Gen3 Microservices for Helm Deployment

## Gen3 is Modular

Gen3 is a modular system that offers many microservices that allow you to customize your Gen3 instance. Many services are not required for a functional Gen3 instance; the services you need depend on how you plan to use your Gen3 instance.

**Regardless of use case, all Gen3 instances must have these "framework services":**

* Service to **authorize users** to see data in the instance (Fence and Arborist)
* Service to **index data files** in the instance (Indexd)
* Service to **manage metadata** for finding data files (Sheepdog and/or Metadata Service, or other external services you may choose to use to extend Gen3)

The typical use case is that a Gen3 operator wants to set up a Gen3 data commons to share their data. However, there are many other use cases possible because Gen3 is modular and highly configurable (e.g., Gen3 can be used as a data mesh connecting to external data commons).

## How to Approach Configuration in Helm

A big advantage of deploying Gen3 with Helm is that it comes preconfigured with many reasonable default settings. That means that you can deploy a minimally-configured "fully default" Gen3 instance locally and ensure that all the foundational steps for deployment are working properly, or minimize the places you need to troubleshoot if there are any problems.

However, once you have the "default Gen3" deployment working, you will want to add your data and configure it so that it reflects the features and appearance you envision.

We recommend approaching configuration in a step-by-step approach to minimize the places you may need to troubleshoot if there are problems. Below, we have described such an approach to configuring your Gen3 instance.

## First, deploy the minimally-configured "fully default" Gen3

For instructions to do this, see our [example Helm deployment](../helm-deploy-example.md). Once you deploy this, you will have a basic default Gen3 portal that will help make sure that your foundational Helm installation and Kubernetes tools are working as expected. Having a functional portal will also help you see what your configurations are working as you continue to configure other services.

## Global block in Gen3 values.yaml

The global block of the Gen3 values.yaml is not for a specific service. Instead, this is a place to declare variables that are relevant for many different services. This saves you from needing to repeatedly define these variables for each service where they are required.

Some variables that are often configured in the global block are:

* `hostname`
* `revproxyArn`
* `dictionaryUrl`
* `externalSecrets`
* `aws`

You can see the [default values for the global block here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/gen3/values.yaml#L5).

## Configure first: AuthN/AuthZ

**Fence is the authentication (AuthN)** service. It authenticates on the `/login` endpoint, and also creates presigned URLs in the presigned-url-fence pods. You can find information about [configuring Fence here](./helm-config-auth.md#fence-authz).

**Fence depends on having a functional user.yaml**. A [default user.yaml is provided in the values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/helm/fence/values.yaml#L517-L726) for the Fence chart. However, it is configured with stand-in information to demonstrate where to add your real email/login and project name values. Therefore, the base user.yaml cannot work as a user.yaml without further configuration in Fence block of your Gen3 values.yaml because some default information is fake. The base user.yaml has blocks that will allow you to grant yourself admin privileges for you to properly use various Gen3 services.

If the `.Values.usersync.userYamlS3Path` string is set to "none" (which is what it should be if your user.yaml is not in an S3 bucket), the user.yaml file specified in the Fence values.yaml [HERE](https://github.com/uc-cdis/gen3-helm/blob/078c7ae094efa5c56f8fd732c75e5e939fbcfc24/helm/fence/values.yaml#L516) will be used. Anything you add to the `USER_YAML: |` section in the Fence block in the Gen3 umbrella values.yaml will override the `USER_YAML: |` in the Fence values.yaml

We have a [guide to more extensive configuration of the user.yaml](https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/user.yaml_guide.md).

**Arborist is the authorization (AuthZ) service**. It works with Fence to assign authorizations to a user based on their authentication information. Information around user authorizations are set within a user.yaml, or telemetry file for dbGaP-authorized users, and put into the Arborist database during [the usersync job](../../tutorial_fence_usersync_job.md). You can find information about [configuring Arborist here](./helm-config-auth.md#arborist-authn)

Arborist depends on Fence, so a problem with Fence will cause problems for Arborist.

## Data-related services

### Configure Indexd

Indexd will index files in the commons to be used by Fence to download data. Indexd will assign a GUID (Globally Unique IDentifier) to each file so it can be managed in the data commons. Many data-relevant services depend on Indexd, so it should be functioning before you proceed. The default configuration may be functional for a local deployment for development. You can find information about [configuring Indexd here](./helm-config-data-svcs.md#indexd).

### Data Dictionary and Data

Before proceeding with other service configurations, you will need to have a data dictionary and data to upload.

* See our [documentation for guidance creating your data dictionary](../../create-data-dictionary.md).
* If you do not yet have data that correlates to the data dictionary you are using, you can create synthetic data based on your data dictionary using our [data-simulator tool](https://github.com/uc-cdis/data-simulator?tab=readme-ov-file#data-simulator).

In the Gen3 values.yaml, the path or link to the dictionary file should be the value for the `dictionaryUrl` field in the `global` block ([see here for an example of the dictionaryUrl field](https://github.com/uc-cdis/gen3-helm/blob/master/helm/gen3/values.yaml#L54) in the default Gen3 values.yaml).

*Note: if you are creating a data lake for your Gen3 instance, you are not required to have a data dictionary.*

### Query page: Graph Model tab

On the Graph Model tab of the Query page, data that has been ingested with Sheepdog can be queried with Peregrine, as long as Guppy is enabled (although Guppy does not need to be configured yet).

#### Sheepdog (data submission)

Sheepdog handles data submission. When data files are submitted to a Gen3 Data Commons using Sheepdog, it uses the data dictionary as a schema, and the files are automatically indexed into Indexd. You can find information about [configuring Sheepdog here](./helm-config-data-svcs.md#sheepdog).

Sheepdog depends on:

* Indexd
* Fence
* Sower and ssjdispatcher
* poetry and Postgres
* data and a data dictionary

#### Peregrine (query Postgres)

Peregrine directly queries data in Postgres. You can find information about [configuring Peregrine here](./helm-config-data-svcs.md#peregrine).

Peregrine depends on:

* Sheepdog
* Fence
* data in Postgres

#### Enable Guppy

In the Gen3 values.yaml, by default, Guppy is not enabled. For the Graph Model tab of the Query page to work, Guppy must be enabled (although it does not need to be configured beyond the default values yet).

To enable Guppy, you can set `enabled: true` in the [guppy block of the Gen3 values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/helm/gen3/values.yaml#L152).

#### Portal configuration

The portal gitops.json should also be configured for things to render properly on the Query page. You can see more about [generally configuring the portal here](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md), and you can see the relevant [`gitops: | json` block in the Portal values.yaml here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/portal/values.yaml#L211)

### Query page: Flat Model tab

The Flat Model tab of the Query page enables faster search of the data based on pre-selected search fields (these become indices). To get the flattened data, you must identify what fields you want your users to be able to query on (these will also be the fields available on the Explorer page). Along with the data dictionary, these field selections will guide development of the etlMapping.yaml file to describe which which tables and fields to "ETL" to ElasticSearch. Tube, the Gen3 ETL service, will use the etlMapping.yaml to run an Extract, Transform, Load (ETL) process on the data in Postgres. Tube will populate ElasticSearch indices to create flattened tables in ElasticSearch (ES). Then, the Guppy makes available the ElasticSearch indices created by Tube to quickly traverse the flat data model and find data in ES.

#### etlMapping.yaml

The etlMapping.yaml file describes which tables and fields to ETL to ElasticSearch. These are the fields you want to be searchable on the Explorer page or the Flat Model tab of the Query page. You must create an etlMapping.yaml to be able to use Tube or Guppy.

Configuring the etlMapping.yaml depends on what users want to search by on the Query page and/or display on the Explorer page. You can read more about [configuring an etlMapping.yaml here](https://github.com/uc-cdis/tube/blob/master/docs/configuration_file.md).

The etlMapping.yaml must match the Data Dictionary. It can be [validated against the Data Dictionary as described here](https://github.com/uc-cdis/gen3utils#etlmappingyaml-validation).

You can see the [default etlMapping block in the ETL values.yaml here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/etl/values.yaml#L47).

The etlMapping.yaml depends on the data dictionary.

#### Tube (ETL, ElasticSearch)

The Gen3 Tube ETL is designed to translate data from a graph data model, stored in a PostgreSQL database, to indexed documents in ElasticSearch (ES), which supports efficient ways to query data from the front-end. The purpose of the Gen3 Tube ETL is to create indexed documents to reduce the response time of requests to query data. It is configured through an etlMapping.yaml configuration file, which describes which tables and fields to ETL to ElasticSearch. You can find information about [configuring Tube/ETL here](./helm-config-data-svcs.md#etl-tube).

Tube depends on:

* Indexd
* etlMapping.yaml and data dictionary
* data ingested into Postgres database using the data dictionary as a schema

#### Guppy

Guppy is used to render the Explorer page and to permit function of the Flat Model tab of the Query page. Guppy makes available the ElasticSearch indices created by Tube to quickly traverse the flat data model and find data in ES. So, after running the ETL, copy the indices into the `indices` block, as seen [here in the guppy values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/helm/guppy/values.yaml#L186). You can find information about [configuring Guppy here](./helm-config-data-svcs.md#guppy).

Guppy depends on:

* Tube/ETL - Guppy relies on indices being created by Tube to run. If there are no indices created, Guppy will fail to start up.
* aws-es-proxy (if deploying Gen3 on AWS) ([see configuration info here](./helm-config-data-svcs.md#aws-es-proxy))

#### Portal configuration

The portal gitops.json should also be configured for things to render properly on the Query page. You can see more about [generally configuring the portal here](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md). You must define the guppyConfig; see the [example default guppyConfig values here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/portal/values.yaml#L401).

### Explorer page

The Explorer page is powered by Guppy, so it is already mostly configured once you have finished configuring the [Flat Model tab of the Query page](#query-page-flat-model-tab). However, there is still some Portal configuration required for it to render properly.

#### Portal configuration

The portal gitops.json must have the `dataExplorerConfig` field configured for the Explorer page to render properly. You can see more about [generally configuring the portal here](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md). See the [example default dataExplorerConfig values here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/portal/values.yaml#L364).

### Discovery page

The Discovery page is powered by the Metadata Service. By default, the Discovery page feature is turned off in the portal gitops.json block. To configure the Discovery page, it must be enabled in the portal values.yaml, and the Metadata Service (also called MDS) must be configured and populated.

#### Portal: Enable the Discovery page and add the `discoveryConfig`

In the `portal` block of the Gen3 values.yaml, [the field gitops.json.featureFlags.discovery](https://github.com/uc-cdis/gen3-helm/blob/master/helm/portal/values.yaml#L364) should have the value `true` to enable the Discovery page.

To configure the Discovery page, you need to add a `discoveryConfig` to the gitops.json. Here is an [example of `discoveryConfig` config](https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L175-L297) from a non-Helm deployment. This config is how to edit the table items, advanced search fields, tags, and study page fields (i.e., page that opens up upon clicking on a row). You can see more about [generally configuring the portal, including the `discoveryConfig`, here](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md).

#### Configure Metadata Service

The Metadata Service (also called MDS) provides an API for retrieving JSON metadata of GUIDs. It is a flexible option for "semi-structured" data (key:value mappings). You can find information about [configuring Metadata Service here](./helm-config-data-svcs.md#metadata).

[Discovery page for Gen3 Data Hub](https://gen3.datacommons.io/discovery)
[Example MDS powering Gen3 Data Hub Discovery page](https://gen3.datacommons.io/mds/metadata?data=True)

## Workspaces

Gen3 workspaces use the Ambassador, Hatchery, and Manifestservice services to create and run the workspace in a Gen3 data commons. You can find information about [configuring all of these Workspace services here](./helm-config-workspaces.md).

Workspace services depend on:

* Fence
* Arborist
* user.yaml (give user who should have access the `workspace` policy to give them access)

#### Ambassador

Ambassador is an envoy proxy. We use this service to proxy traffic toward our workspaces, Hatchery and Jupyter containers.

#### Hatchery

Hatchery is used to create workspaces. It contains information about workspaces images and resources set around those images to run.

#### Workspace Token Service

The Gen3 workspace token service acts as an OIDC client which acts on behalf of users to request refresh tokens from Fence. This happens when a user logs into a workspace from the browser. WTS then stores the refresh token for that user, and manages access tokens and refresh tokens for workers that belong to specific users in the workspace.

#### Manifestservice

The manifestservice is used by the workspaces to mount files to a workspace. Workspace pods get setup with a sidecar container which will mount files to the data directory. This is used so that users can access files directly on the workspace container. The files pulled are defined by manifests, created through the export to workspace button in the explorer page. These manifests live in an s3 bucket which the manifestservice can query.

## Data Commons Notebook Browser

This is an option if you want to make HTML versions of Jupyter notebooks viewable by commons users. Customize the [Notebook Browser page](https://chicagoland.pandemicresponsecommons.org/resource-browser) to preview Jupyter Notebooks by adding images, titles, descriptions, and links to the Jupyter Notebook.

* [Review the code to edit the title (top; notebooks), description (top; notebooks), link, and imageURL (preview image)](https://github.com/uc-cdis/cdis-manifest/blob/0e5a08eed8b417a721a6324f820abe8ea4ef4e17/chicagoland.pandemicresponsecommons.org/portal/gitops.json#L1097-L1175)

## Front End (Portal) Configuration examples

There are different code examples for various aspects of the portal in the document [Customize the Front End](../../customize-frontend.md) in the Post-Deployment section. You can see more about [generally configuring the portal here](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md).
