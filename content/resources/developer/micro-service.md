---
title: "Gen3 - Micro Service"
date: 2018-09-14T16:58:29-05:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
description: An introduction to Gen3 microservices
teaser: /img/figs/architecture.png
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

![Gen3's Micro Services](/figs/architecture.png).
