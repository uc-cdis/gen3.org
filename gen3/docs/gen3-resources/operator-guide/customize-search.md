# Customize Gen3 Search

The ability to search and parse through data (structured, unstructured, and semi-structured) in a data commons or mesh is a core feature of Gen3.  In the sections below we describe what services must be running and actions taken to enable search via the different front end pages.


## Exploration Page

The primary tool for exploring data within a Gen3 data commons is the Exploration Page, which offers faceted search of data across projects, for example, [https://gen3.datacommons.io/explorer](https://gen3.datacommons.io/explorer). This page can be accessed from the /explorer endpoint or the top navigation bar, by clicking on the “Exploration” icon.  See the user guide [Exploration Page section][Exploration Page overview] for details on how to interact with the Gen3 Exploration Page.

In order to have a functioning exploration page you must must have have Tube and Guppy microservices running as well as an ETL mapping.

![Exploration Page][explorer screenshot]





### ETL

Three microservices Peregrine, Guppy, and Tube were developed to support both “graph” and “flat” abstracted data models. Peregrine transforms GraphQL queries into Structured Query Language (SQL) statements into the data commons backend. Tube flattens the graph data into an ElasticSearch format, which is then able to be queried by Guppy. Execution of GraphQL queries are possible through both Gen3-developed APIs as well as browser-based GUIs.

Construction of the “flat” model starts with the [Tube microservice][tube github], which extracts, transforms, and loads (ETL) the underlying relational database into the flattened ElasticSearch format.  ElasticSearch is used due to its enhanced performance with the type of metadata queries run by users.  The ETL process is run when changes are made to the graph so subsequent queries match between “graph” and “flat” abstractions. Once transformed, like Peregrine, the Guppy microservice transforms GraphQL statements into Elastic Search Query DSL.

Newly ingested data to the [Sheepdog Service][sheepdog github] can be queried immediately via [Peregrine][peregrine github], but not on the Data Explorer, which is powered by [Guppy][guppy github] on the backend.  During the ETL process, Tube will populate ElasticSearch indices and Guppy makes the ElasticSearch indices available for queries for the Data Explorer.

In practice, Guppy/Tube need to be configured with the ElasticSearch indices in the manifest.json (versions in the [versions block][manifest.json guppy version] and indices in the [guppy block][guppy configuration]) and the [etlMapping.yaml file][tube instructions] has to be configured to list those indices. Additionally, `aws-es-proxy` needs to be included in the versions block of the [manifest.json][manifest.json aws-es-proxy version], unless a customized endpoint to access ElasticSearch can be provided.
Note that configuring the etlMapping.yaml is dependent on what users want to display on the Explorer page and needs to match to the Data Dictionary. The etlMapping.yaml can be validated against the Data Dictionary as described [here][etlmapping-validation].
After configuring etlMapping.yaml, indices need to be created, cleaned, or/and re-populated using the `gen3 gitops configmaps` command to read the new etlMapping.yaml, and the `gen3 job run etl` command to run the ETL. Note, that new indices need to be added to both files etlMapping.yaml and manifest.json.


### Configure Exploration Page

In the next step, the [gitops.json][portal config instructions] needs to be configured to display and populate the indices of interest in the Data Explorer. The exploration page has one or several tabs at the top, which each represent a flattened ElasticSearch document of structured metadata records across all the projects in the data commons, which is displayed as a table towards the bottom center of the page.

Remember that only the properties occurring in the etlMapping.yaml can be brought into the gitops.json. The gitops.json can be [tested locally][testing portal locally] and [validated against the Data Dictionary and etlMapping.yaml file][gitops.json validation]. Finally, after new indices are introduced, Guppy needs to be rolled using the command `gen3 roll guppy`. A comprehensive list of commands in cloud automation is given [here][cloud automation readme](https://github.com/uc-cdis/cloud-automation/blob/master/doc/README.md).







## Query Page

The query page in the data portal provides users with an interactive interface for querying the structured data in a Gen3 system via GraphQL API requests.  See the user guide [Query Page section][user guide query page] for details on how to interact with the Gen3 structured data API.

In order for the page to be functional and the data ready for query you must have Sheepdog, Peregrine, and Guppy installed and configured.

The graph model depends on Sheepdog and Peregrine. The Flat Model depends on ETL mapping, Tube, Guppy, and Elasticsearch.

For details on the ETL mapping please see the [ETL section](#etl).

![Query Page][query page image]






## Discovery Page
The Gen3 Discovery Page allows the visualization of metadata from within the metadata service (MDS) for data commons or the aggregated metadata services (AggMDS) for data meshes. This typically includes public metadata about a project to make it discoverable. Users should be able to search based on free text or filter based on tags.

For more information on using the Discovery Page please see the User Guide [Discovery Page section][discovery page overview].

![Discovery Page][discovery page screenshot]

### Metadata Service
To view data in the discovery page you must have a populated [metadata service][mds github] or alternatively an [Aggregated metadata service (aggMDS)][aggmds github], which caches the metadata from two or more metadata source to provide a unified view of the commons on the discovery page.

Instructions for the creation and modification of an MDS record can be found here as part of the [Gen3 SDK][sdk for discovery page].  Every data commons is different as there is no standardization of MDS and therefore any example we provide may not apply to your particular system.

To view the MDS for the Gen3 Data Hub you can go [here][gen3 data hub mds]. You can see in the snippet below some summary metadata for the 1000 Genomes project with is part of the Gen3 Data Hub:

```
{
  "1000_Genomes_Project": {
    "_guid_type": "discovery_metadata",
    "gen3_discovery": {
      "link": "https://www.genome.gov/27528684/1000-genomes-project",
      "tags": [
        {
          "name": "Aligned Reads",
          "category": "Condition"
        }
      ],
      "authz": "/programs/OpenAccess/projects/1000_Genomes_Project",
      "source": "1000 Genomes Project",
      "commons": "Open Access Data Commons",
      "funding": "",
      "summary": "The 1000 Genomes Project is a collaboration among research groups in the US, UK, and China and Germany to produce an extensive catalog of human genetic variation that will support future medical research studies. It will extend the data from the International HapMap Project, which created a resource that has been used to find more than 100 regions of the genome that are associated with common human diseases such as coronary artery disease and diabetes. The goal of the 1000 Genomes Project is to provide a resource of almost all variants, including SNPs and structural variants, and their haplotype contexts. This resource will allow genome-wide association studies to focus on almost all variants that exist in regions found to be associated with disease. The genomes of over 1000 unidentified individuals from around the world will be sequenced using next generation sequencing technologies. The results of the study will be publicly accessible to researchers worldwide.",
      "study_id": "1000_Genomes_Project",
      "full_name": "1000 Genomes Project",
      "study_url": "https://www.genome.gov/27528684/1000-genomes-project",
      "__manifest": [
        {
          "md5sum": "e1e56e29efad64c002e5e9749f85350f",
          "file_name": "ALL.chrY.phase3_integrated_v2b.20130502.genotypes.vcf.gz",
          "file_size": 5656911,
          "object_id": "dg.OADC/60afa140-d2ab-4e32-bf73-40bf48787655",
          "commons_url": "gen3.datacommons.io/"
        },
```

Instructions for working with the API are found [here][mds api].



### Aggregated Metadata Service
An [Aggregated metadata service (aggMDS)][aggmds github] caches the metadata from two or more metadata sources to provide a unified view of the commons on the discovery page.

This is performed via [AggMDS sync job][aggmds sync], which copies metadata from multiple data commons into a single data store.

The AggMDS sync job depends on JSON based configuration file, which defines information about:

* Data source and data adaptor information
* Normalizing data fields
* adding optional individual overrides

An example json config file from the [Biomedical Research Hub][BRH] can be found [here][BRH aggregated_config.json].  A snippet of the adapter section for the Gen3 Data Hub (formerly known as the Open Access Data Commons) is shown below.  For more information on constructing the json config file please review the instructions [here][aggregated_config.json instructions].

```
"Open Access Data Commons": {
			"mds_url": "https://gen3.datacommons.io/",
			"commons_url" : "gen3.datacommons.io",
			"adapter": "gen3",
			"config" : {
				"guid_type": "discovery_metadata",
				"study_field": "gen3_discovery"
			},
			"keep_original_fields": false,
			"field_mappings" : {
				"authz": "path:authz",
				"tags": "path:tags",
				"_unique_id": "path:study_id",
				"study_id": "path:study_id",
				"study_description": "path:study_description",
				"full_name": "path:full_name",
				"short_name": "path:short_name",
				"commons": "Open Access Data Commons",
				"study_url": "path:study_url",
				"_subjects_count" : {"path":"_subjects_count", "default" : 0 },
				"__manifest": "path:__manifest",
				"commons_url" : "gen3.datacommons.io"
			}
```

The aggregated metadata service for the [Biomedical Research Hub][BrH] can be seen [here][brh aggmds].

### Configure Discover Page

Customize and enable the Discovery Page by editing the table items, advanced search fields, tags, and study page fields (i.e. page that opens up upon clicking on a study).

To enable your Discovery Page you must modify your [gitops.json file][gitops enable discovery].

Configure your Discovery page by further modifying your [gitops.json file][gitops modify discovery].

### Workspace token service

Setting up a functioning mesh where you can access files from individual commons also requires the [workspace token service][wts github].  You can see a demo of what is needed to link a commons to a mesh in the [Data Mesh Webinar][data mesh forum].






<!-- Exploration Page -->
[Exploration Page overview]: ../user-guide/search.md#exploration-page
[explorer screenshot]: img/explorer_screenshot.png
[tube github]: https://github.com/uc-cdis/tube
[sheepdog github]: https://github.com/uc-cdis/sheepdog
[peregrine github]: https://github.com/uc-cdis/peregrine
[guppy github]: https://github.com/uc-cdis/guppy
[manifest.json guppy version]: https://github.com/uc-cdis/cdis-manifest/blob/6bc0dc84bec2af7d7971d2a4342319b225728969/gen3.datacommons.io/manifest.json#L23
[guppy configuration]: https://github.com/uc-cdis/guppy#configurations
[tube instructions]: https://github.com/uc-cdis/tube/blob/master/docs/configuration_file.md
[manifest.json aws-es-proxy version]: https://github.com/uc-cdis/cdis-manifest/blob/ad85ef9a74d07fadf28c7d176c8aaa5efae4ecab/gen3.datacommons.io/manifest.json#L11
[etlmapping-validation]: https://github.com/uc-cdis/gen3utils#etlmappingyaml-validation
[portal config instructions]: https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md
[testing portal locally]: https://github.com/uc-cdis/data-portal#local-development-and-devhtml
[gitops.json validation]: https://github.com/uc-cdis/gen3utils#portal-configuration-gitopsjson-validation
[cloud automation readme]: https://github.com/uc-cdis/cloud-automation/blob/master/doc/README.md

<!-- Query Page -->
[user guide query page]: ../user-guide/search.md#query-page
[query page image]: img/query_screenshot.png

<!-- Discovery Page -->
[discovery page overview]: ../user-guide/portal.md#discovery-page
[discovery page screenshot]: img/discovery_screenshot.png
[mds github]: https://github.com/uc-cdis/metadata-service
[aggmds github]: https://github.com/uc-cdis/metadata-service/blob/master/docs/config_agg_mds.md
[sdk for discovery page]: https://github.com/uc-cdis/gen3sdk-python/blob/master/gen3/cli/discovery.py
[gen3 data hub mds]: https://gen3.datacommons.io/mds/metadata?data=True&_guid_type=discovery_metadata
[mds api]: https://petstore.swagger.io/?url=https://raw.githubusercontent.com/uc-cdis/metadata-service/master/docs/openapi.yaml
[aggmds sync]: https://github.com/uc-cdis/cloud-automation/blob/master/kube/services/jobs/metadata-aggregate-sync-job.yaml
[BRH]: https://brh.data-commons.org/
[BRH aggregated_config.json]: https://github.com/uc-cdis/cdis-manifest/blob/master/brh.data-commons.org/metadata/aggregate_config.json
[aggregated_config.json instructions]: https://github.com/uc-cdis/metadata-service/blob/master/docs/config_agg_mds.md
[brh aggmds]: https://brh.data-commons.org/mds/aggregate/metadata?data=True&limit=2000&offset=0
[gitops enable discovery]: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L173
[gitops modify discovery]: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L175-L297
[wts github]: https://github.com/uc-cdis/workspace-token-service
[data mesh forum]: https://www.youtube.com/watch?v=K5ld3V5AslE&t=1s
