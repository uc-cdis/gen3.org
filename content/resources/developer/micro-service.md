---
title: "Gen3 - Micro Service"
date: 2018-09-14T16:58:29-05:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
description: An introduction to Gen3 microservices
teaser: img/figs/architecture.png
---

## Gen3’s Micro Services
Building off the 1st and 2nd generation commons, we have reimagined what a Data Commons can be by utilizing cloud native thinking. Each microservice now lives in its own container providing isolation from the environment around it. Container orchestration is conducted dynamically to scale to the commons workload. Clouds are approached agnostically so that Gen3 can operate on any cloud, public or private.

### SHEEPDOG
The Sheepdog service is responsible for herding user submissions of metadata into the graph database. The submissions are quality controlled against the data dictionary to ensure all required fields are present and have appropriate data values. The Sheepdog service is also responsible for supporting bulk export of the metadata into TSV or JSON formats.

### PEREGRINE
Peregrine is the high speed metadata seeking service which responds to GraphQL search queries. The GraphQL service allows Commons operators and users to precisely query only the information they are most interested in from the metadata collections. The service translates the GraphQL search into the appropriate statements which are run against the PostgreSQL backend before being returned as friendly JSON.

### FENCE
The Fence service controls access to the metadata, submission, indexing, and data itself. Fence is an authentication (AuthN) and authorization (AuthZ) service which utilizes OpenID Connect flow (an extension of OAuth2) to generate tokens for clients. It can also provide tokens directly to a user. Clients and users may then use those tokens (JWT) with other Gen3 Data Commons services to access protected endpoints that require specific permissions. Fence can be configured to support different Identity Providers (IDPs) for AuthN. At the moment, supported IDPs include Google, and Shibboleth supporting providers such as NIH iTrust.


### INDEXD
The Indexd service provides permanent digital IDs for data objects. These IDs can be used to retrieve the data, or query the metadata associated with the object. The Indexd service tracks the locations and hash of every asset (file) in the data commons object store. It exports RESTful APIs for registering a new asset, and retrieving data for an existing asset.

### WINDMILL
The Windmill service is an interactive website that allows users to explore, submit, and download data. The Windmill service utilizes the APIs offered by the data commons just as any other externally built app could.

### Micro Service NGINX Route Table

This table is helpful for debugging errors in front-end applications like [Windmill: data portal](https://github.com/uc-cdis/data-portal) or other Gen3 clients. You can easily identify the running service that is returning an error, based on its absolute HTTP request path.

| Micro Service                 | URL Path Prefix (NGINX Location) | GitHub Repository                                                                          |
|------------------------------|----------------------------------|--------------------------------------------------------------------------------------------|
| ambassador-service           | /lw-workspace/proxy/             | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/ambassador           |
| arborist-service             | /gen3-authz                      | https://github.com/uc-cdis/arborist                                                        |
| arborist-service             | ~ /authz/?                       | https://github.com/uc-cdis/arborist                                                        |
| arborist-service             | /authz/resources                 | https://github.com/uc-cdis/arborist                                                        |
| arborist-service             | /gen3-authz-test                 | https://github.com/uc-cdis/arborist                                                        |
| arranger-service             | /api/v0/flat-search/             | https://github.com/uc-cdis/arborist                                                        |
| fence-service                | /authn-proxy                     | https://github.com/uc-cdis/fence                                                           |
| fence-service                | /user/                           | https://github.com/uc-cdis/fence                                                           |
| fenceshib-service            | /                                | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/fenceshib            |
| google-sa-validation-service | /google-sa-validation-status/    | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/google-sa-validation |
| grafana                      | /grafana/                        |                                                                                            |
| guppy-service                | /guppy/                          | https://github.com/uc-cdis/guppy                                                           |
| hatchery-service             | /lw-workspace/                   | https://github.com/uc-cdis/hatchery                                                        |
| indexd-service               | /ga4gh/                          | https://github.com/uc-cdis/indexd                                                          |
| indexd-service               | /index/                          | https://github.com/uc-cdis/indexd                                                          |
| jupyterhub-service           | /lw-workspace/                   | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/jupyterhub           |
| jupyterhub-service           | /lw-workspace/hub/logout         | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/jupyterhub           |
| manifestservice-service      | /manifests/                      | https://github.com/uc-cdis/manifestservice                                                 |
| peregrine-service            | /peregrine/_status               | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /peregrine/_version              | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /api/search                      | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /api/v0/submission/graphql       | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /api/v0/submission/getschema     | https://github.com/uc-cdis/peregrine                                                       |
| pidgin-service               | /coremetadata/                   | https://github.com/uc-cdis/pidgin                                                          |
| portal-service               | /                                | https://github.com/uc-cdis/data-portal                                                     |
| prometheus-server            | /prometheus/                     | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/monitoring           |
| sheepdog-service             | /api/                            | https://github.com/uc-cdis/sheepdog                                                        |
| shiny-nb2-service            | ~ ^/(shiny\|explore)/             | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/shiny                |
| shiny-service                | ~ ^/(shiny\|explore)/             | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/shiny                |
| sower-service                | /job/                            | https://github.com/uc-cdis/sower                                                           |
| workspace-token-service      | /wts/                            | https://github.com/uc-cdis/workspace-token-service                                         |

![Gen3's Micro Services](/figs/architecture.png).
