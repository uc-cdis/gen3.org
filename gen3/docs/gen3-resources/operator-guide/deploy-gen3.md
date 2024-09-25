# Overview of Gen3 configuration and deployment with Helm

*Note: We recommend deploying Gen3 using Helm, and that is what is described below. If you are looking for resources describing [legacy deployment options, they are described here][legacy deployment].*

## Prerequisites

There are a number of software and resource prerequisites for production deployment of a new Gen3 instance.

[Review the comprehensive list of prerequisites here.][prerequisites]

---


In order, here are the steps involved with standing up a new Gen3 instance:

(also integrate information from Walkthrough of details for production setup: https://docs.gen3.org/docs/tutorials/production-setup)

## Pre-deployment tasks

* Set up infrastructure (Networking, databases, etc) - If you do use AWS and use our terraform this is done for you. You may do this yourself if you wish, but you gotta know what you’re doing.
* Set up and configure Kubernetes cluster. - If you do use AWS and use our gen3-terraform this is done for you. You may do this yourself if you wish, but you gotta know what you’re doing.
* Prepare SSL cert.

      * We can lay out a few options here.
      * If you do use AWS, you can rely on AWS certificate manager.
      * We can document a few different approaches of managing SSL certs for your deployment here, for Google cloud, Azure, or a “cloud agnostic” approach as well.

* If you are doing a “production” deployment, it’s highly recommended to use a secrets manager. We use a tool called “External Secrets Operator”

      * https://docs.gen3.org/docs/tutorials/external-secrets/
      * https://external-secrets.io/latest/

* If you are doing a “production” deployment, it’s highly recommended to use managed services for databases:

      * Postgres
      * Elasticsearch 7
      * If you do use AWS and use our gen3-terraform this is done for you. You may do this yourself if you wish, but you gotta know what you’re doing.
      * There’s a possibility of hosting database services yourself, but you gotta know what you’re doing.

## Helm Configuration and Deployment

* Prepare a helm deployment configuration.

      * Note: There’s some sensible defaults that ship with helm, and if you don’t provide overrides it will fall back to the defaults.
      * This is something we need to document more as Gen3 is HIGHLY configurable. Probably need a whole section, or a small book about this
      * This includes fence configuration, user yaml, data dictionary url, workspaces, etc etc. There’s some sensible defaults that ship with helm, and if you don’t provide overrides it will fall back to the defaults.

* Deploy the helm charts
* Configure ingress with the SSL cert from earlier

      * Can document how it’s done in AWS
      * Can document how it’s done on your laptop
      * Can document or link to documentation about how this is done in other clouds.

## Post-Deployment setup

### Data

* create DD and Data Model (if you have not already): https://gen3.org/resources/operator/#2-creating-a-new-data-dictionary
* create program and project: https://gen3.org/resources/operator/#4-programs-and-projects
* submit data: https://gen3.org/resources/operator/#5-how-to-upload-and-control-file-access-via-authz
* control access to data with AuthZ: https://gen3.org/resources/operator/#5-how-to-upload-and-control-file-access-via-authz

### Prepare for Search

**Query page:**

* must have Sheepdog, Peregrine, and Guppy installed and configured for Query page to load
* Graph Model depends on Sheepdog and Peregrine
* Flat Model depends on ETL mapping, Tube, Guppy and ElasticSearch
* https://gen3.org/resources/user/access-data/#querying-structured-data

**Exploration page:**

* must have ETL mapping, Tube, Guppy, and ElasticSearch
* https://gen3.org/resources/user/access-data/#exploration-page
* The exploration page has one or several tabs at the top, which each represent a flattened ElasticSearch document of structured metadata records across all the projects in the data commons, which is displayed as a table towards the bottom center of the page.
* The main tabs in the Exploration Page, the available filters, and the properties listed in the data table are entirely customizable

**Discovery page:**

* Depends on data in Metadata Service: https://github.com/uc-cdis/metadata-service
* Customize and enable the Discovery Page by editing the table items, advanced search fields, tags, and study page fields (i.e. page that opens up upon clicking on a study). The Discovery Page is powered by the Metadata Service on the backend. Tools such as the Python SDK can be used to upload and edit metadata.
* Review the code to enable the Discovery Page: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L173
* Review the code to edit the Discovery Page: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L175-L297

* customize Gen3 search interface

      * ETL:

          * https://github.com/uc-cdis/tube
          * https://gen3.org/resources/operator/#6-etl-and-data-explorer-configurations

      * data explorer

          * https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md

### Customize appearance

* customize the front end
* https://gen3.org/resources/operator/#7-gen3-portal-configurations-examples




<!-- Links -->
[Gen3 User Guide]: /gen3-resources/user-guide/
[Gen3 Developer Guide]: /gen3-resources/developer-guide/
[legacy deployment]: index.md/#gen3-deployment-options
[prerequisites]: prerequisites.md
