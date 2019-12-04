# A list of Gen3 features

Gen3 is an open-source platform that enables the standing-up of data commons for managing, analyzing, and sharing research data. Below you can find an exhaustive list of Gen3 features.

## Dictionary and metadata

* Explore the graph in the dictionary page of Windmill:
    * Search keywords
    * Visualize possible paths between nodes
    * Download JSON or TSV format for node templates 
* Explorer project graph and nodes in Windmill:
    * Visulize graph model
    * Browse/download data for each node
* Metadata submission (create, update, delete records) in JSON, TSV or CSV:
    * Submission page of Windmill
    * Gen3 SDK (Python, R)
* Export metadata as a JSON, TSV or CSV file
* The metadata is stored in Postgres databases
* ElasticSearch:
    * The metadata can be stored in ElasticSearch by using our ETL tool
    * Explore the ElasticSearch metadata using Guppy
* Generate fake data specific to a dictionary for testing
* Import and export using the Portable Format for Biomedical Data (PFB): *(Work in progress)*
    * Import and export a dictionary
    * Import and export metadata

## Data files

* Data upload through the Gen3 Client
* Indexing data files:
    * Create data file records and mint GUIDs
    * Index a new version of the same file
    * Get the most recent version of a file
    * Index data files that are stored outside of the Commons
* GUID resolver
* Data download:
    * Gen3 Client
    * Files page of Windmill
* Core metadata endpoint to get information about a data file

## Data exploration and analysis

* GraphQL endpoint and UI to explore the metadata via Peregrine (graph data)
* GraphQL endpoint and UI to explore the metadata via Guppy (flat ElasticSearch data)
* Explorer page of Windmill
    * Filters to select a cohort
    * Charts and visualizations: count, pie charts, bar charts, stacked bar charts, heatmaps
    * Download clinical data for the selected cohort
    * Download a manifest for the selected cohort
    * Export the selected cohort to Workspace/PFB/Terra
* Workspaces
    * Jupyter notebooks (Python, R)
    * RStudio
* Run complex CWL analysis workflows *(Work in progress)*

## Access management and security

* Gen3 follows the OpenID Connect (OIDC) specifications
    * Use OAuth clients
* Gen3 supports logging in through Google, NIH, ORCID, Microsoft and Synapse
* Create precise roles, policies and groups of users to limit access to resources
* Assign policies to users:
    * Individual users
    * Groups of users
    * All logged in users
    * All anonymous users

## Automation

* An open source collection of tools to simplify and automate the creation and management of a Gen3 Commons
* Use docker-compose to create a Gen3 Commons sandbox
* Kubernetes job dispatcher
    * Automatically index new files in a bucket
