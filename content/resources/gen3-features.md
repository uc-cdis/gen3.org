---
identifier: gen3-features
title: Gen3 Features
linktitle: /resources/gen3-features
layout: withtoc
menuname: featuresMenu
date: 2019-12-04T10:57:21-05:00
---


# A list of Gen3 features

Gen3 is an open-source platform that enables the standing-up of data commons for managing, analyzing, and sharing research data. Below you can find an exhaustive list of Gen3 features.

## Dictionary and structured data

* Explore the graph in the [dictionary page](../user/dictionary/) of [Windmill](https://github.com/uc-cdis/data-portal):
    * Search keywords
    * Visualize possible paths between nodes
    * Download JSON or TSV format for node templates
* Explore [project graphs and nodes](../user/dictionary/#understanding-the-gen3-data-dictionary-and-model) in [Windmill](https://github.com/uc-cdis/data-portal):
    * Visualize graph model
    * Browse/download data for each node
* Structured [data submission](../user/submit-data/) (create, update, delete records) in JSON, TSV or CSV:
    * Submission page of Windmill
    * Gen3 SDK (Python, R)
* [Export structured data](../user/access-data/#exploration-tool) as a JSON, TSV or CSV file
* Structured data is stored in Postgres databases
* [Flattened data](../developer/flat-model-api/):
    * Structured data can be flattened and stored in Elasticsearch by using our ETL tool
    * [Explore](../user/access-data/) the Elasticsearch structured data using [Guppy](https://github.com/uc-cdis/guppy)
* [Generate fake data](https://github.com/uc-cdis/data-simulator) specific to a dictionary for testing
* Import and export using the Portable Format for Biomedical Data (PFB): *(Work in progress)*
    * Import and export a dictionary
    * Import and export structured data

## Data files

* Data upload through the [Gen3 Client](../user/gen3-client/)
* [Indexing](https://github.com/uc-cdis/indexd) data files:
    * Create data file records and mint GUIDs
    * Index a new version of the same file
    * Get the most recent version of a file
    * Index data files that are stored outside of the Commons
* [GUID resolver](https://dataguids.org/)
* [Data download](../user/access-data/#downloading-data-files):
    * [Gen3 Client](../user/gen3-client/)
    * Files page of Windmill
* Core metadata endpoint to get information about a data file

## Data exploration and analysis

* GraphQL endpoint and UI to [explore structured data](../user/access-data/#querying-metadata-using-the-graphiql-interface) via [Peregrine](https://github.com/uc-cdis/peregrine) (graph data)
* GraphQL endpoint and UI to explore [flattened data](../user/access-data/#querying-metadata-using-the-graphiql-interface) via [Guppy](https://github.com/uc-cdis/guppy) (in ElasticSearch)
* [Explorer page](../user/access-data/#exploration-tool) of [Windmill](https://github.com/uc-cdis/data-portal)
    * Filters to select a cohort
    * Charts and visualizations: count, pie charts, bar charts, stacked bar charts, heatmaps
    * Download clinical data for the selected cohort
    * Download a manifest for the selected cohort
    * Export the selected cohort to Workspace/PFB/Terra
* [Workspaces](../user/analyze-data/)
    * Jupyter notebooks (Python, R)
    * RStudio
* Run complex CWL analysis workflows *(Work in progress)*

## Access management and security

* Gen3 follows the OpenID Connect (OIDC) specifications
    * [Use OAuth clients](https://github.com/uc-cdis/fence/#oidc--oauth2)
* Gen3 supports [logging in](https://github.com/uc-cdis/fence/) through Google, NIH, ORCID, Microsoft and Synapse
* [Create precise roles, policies and groups of users](https://github.com/uc-cdis/arborist) to limit access to resources
* Assign policies to users:
    * Individual users
    * Groups of users
    * All logged in users
    * All anonymous users

## Automation

* An open source collection of tools to [simplify and automate the creation and management](../operator/#2-cloud-automation-cloud-automation-img-cloud-automation-svg) of a Gen3 Commons
* Use [docker-compose](../operator/#1-compose-services-compose-services-img-compose-services-svg) to create a Gen3 Commons sandbox
* Kubernetes [job dispatcher](https://github.com/uc-cdis/ssjdispatcher)
    * Automatically index new files in a bucket
