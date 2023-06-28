---
identifier: gen3-features
title: Gen3 Features
linktitle: /resources/gen3-features
layout: withtoc
menuname: featuresMenu
date: 2023-06-280T15:20:00-6:00
---

# A list of Gen3 features

Gen3 is an open-source platform that enables the standing-up of data commons for managing, analyzing, and sharing research data. Below you can find an exhaustive list of Gen3 features.

## Dictionary

* Explore the graph in the [dictionary page](../user/dictionary/) of [Windmill](https://github.com/uc-cdis/data-portal):
    * Search keywords
    * Visualize possible paths between nodes
    * Download JSON or TSV format for node templates
* Explore [project graphs and nodes](../user/dictionary/#understanding-the-gen3-data-dictionary-and-model) in [Windmill](https://github.com/uc-cdis/data-portal):
    * Visualize graph model
    * Browse/download data for each node

## Metadata

* Structured [data submission](../user/submit-data/) (create, update, delete records) in JSON, TSV or CSV:
    * Submission page of Windmill
    * Gen3 SDK (Python, R)
* [Export structured data](../user/access-data/#access-data-using-the-api) as a JSON, TSV or CSV file
* Structured data is stored in Postgres databases
* [Flattened data](../developer/flat-model-api/):
    * Structured data can be flattened and stored in Elasticsearch by using our ETL tool
    * [Explore](../user/access-data/) the Elasticsearch structured data using [Guppy](https://github.com/uc-cdis/guppy)
* [Generate fake data](https://github.com/uc-cdis/data-simulator) specific to a dictionary for testing
* Import and export using the Portable Format for Biomedical Data (PFB): *(Work in progress)*
    * Import and export a dictionary
    * Import and export structured data
* Setup [Metadata Services (MDS)](https://github.com/uc-cdis/metadata-service#metadata-service) and programmatically access semi-structured metadata using the [endpoint](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/uc-cdis/metadata-service/master/docs/openapi.yaml)
* Use [Aggregated Metadata Services (AggMDS)](https://github.com/uc-cdis/metadata-service/blob/master/docs/config_agg_mds.md) in the ETL process to pull, cleanup and normalize metadata across multiple commons.
* [Cross-Commons Subject Linking feature (also known as a Crosswalk)](https://github.com/uc-cdis/gen3sdk-python/blob/master/docs/howto/crosswalk.md)

## Data files

* Data upload through the [Gen3 Client](../user/gen3-client/)
* [Indexing](https://github.com/uc-cdis/indexd) data files:
    * Create data file records and mint GUIDs
    * Index a new version of the same file
    * Get the most recent version of a file
    * Index data files that are stored outside of the Commons
* [GUID resolver](https://dataguids.org/)
* Data download:
    * [Gen3 Client](../user/gen3-client/)
    * [Files page of Windmill](../user/access-data/#access-data-from-the-data-commons-website)
* Core metadata endpoint to get information about a data file


## Data exploration and analysis

* GraphQL endpoint and UI to [explore structured data](../developer/flat-model-api/) via [Peregrine](https://github.com/uc-cdis/peregrine) (graph data)
* GraphQL endpoint and UI to explore [flattened data](../developer/flat-model-api/) via [Guppy](https://github.com/uc-cdis/guppy) (in ElasticSearch)
* [Explorer page](../user/access-data//#access-data-from-the-data-commons-website) of [Windmill](https://github.com/uc-cdis/data-portal)
    * Filters to select a cohort
    * Charts and visualizations: count, pie charts, bar charts, stacked bar charts, heatmaps
    * Download clinical data for the selected cohort
    * Download a manifest for the selected cohort
    * Export the selected cohort to Workspace/PFB/Terra
* [Workspaces](../user/analyze-data/) using [Hatchery](https://github.com/uc-cdis/hatchery), [Workspace Token Service](https://github.com/uc-cdis/workspace-token-service), and [Manifest Service](https://github.com/uc-cdis/manifestservice)
    * Jupyter notebooks (Python, R)
    * RStudio
    * Publish Notebooks as .html version on the [Resource Browser](https://github.com/uc-cdis/data-portal/blob/master/docs/resource_browser.md). See [here](https://chicagoland.pandemicresponsecommons.org/resource-browser) for an example.
* Discover Datasets at a high-level on the [Discovery Page](https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md). See [here](https://gen3.datacommons.io/discovery) for an example.
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

* An open source collection of tools to [simplify and automate the creation and management](../operator/#2-cloud-automation) of a Gen3 Data Commons
* Use [Compose Services](../operator/#1-compose-services) to create a Gen3 Data Commons sandbox
* Kubernetes [job dispatcher](https://github.com/uc-cdis/ssjdispatcher)
    * Automatically index new files in a bucket
