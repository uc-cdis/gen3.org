---
title: "Access Data"
date: 2018-09-12T23:08:34-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
* * *
# Exploring Metadata and Downloading Data Files

* * *
In a Gen3 data commons, a distinction is made between two types of data: "data files" and "metadata".

* A "data file" would be information like tabulated data values in spreadsheet, or a fastq/bam file containing DNA sequences. The contents of the file are not exposed to the API as queryable properties, so the file must be downloaded to view its content.

* "Metadata" are key/value pairs, "properties", that can be queried via the Gen3 data commons' API or viewed in the Gen3 data commons' data exploration tool. 

Examples of Metadata are:

* Properties of a data file:
	* File size
	*	Filename
	* File format
* Values derived from a data file:
	* Genotypes derived from a sequencing file.
	* Brain region volume derived from an image file.
* Experimental details:
	* Kit used for an immunoassay.
	* Type of blood collection tube used for biospecimen collection.
* Demographic information.
	* Race
	* Gender
	* Age
* Clinical information
	* Military history.
	* Medical history.


This format allows analysts to search for files of interest using the metadata for querying. This metadata can be accessed by clicking on "Exploration" link in the top navigation bar of the data commons submission portal.

## Exploration Tool
* * *
One method of accessing metadata in a Gen3 data commons is using the data exploration tool in a web browser. This is page can be reached by clicking "Exploration" in the top navigation bar or by navigating to the url: https://data.mycommons.org/explorer.

> __NOTE:__ For these user guides, https://data.mycommons.org is an example URL and will not be the actual URL of the data commons.

![Exploration](Gen3_Toolbar_exploration.png)

The data exploration tool has a certain set of metadata properties that can be used as filters for selecting subsets of study subjects and data files.

![Facets](Gen3_facets.png)

> __NOTE:__ The properties used for filtering data are configurable and are chosen in collaboration with data commons sponsors, contributors and analysts. Contact the data commons support team with suggestions for a new property to be added as a filter.

<!--
Custom filters can also be added by clicking on the "add a custom filter" button. Begin typing the property you would like to add as a custom filter and then select it. You can then enter the values of that property to filter data on.
-->

A spreadsheet containing available clinical, demographic, or experimental metadata can be downloaded by clicking on the corresponding button once a cohort or group of files has been selected.

![Selection and Download](Gen3_selection_and_download_highlight.png)

## Querying Metadata Using the GraphiQL Interface
* * *

The metadata in a Gen3 commons can also be queried via the [graphQL query language](https://graphql.org/) using the graphiQL interface, which can be accessed by clicking "Query" in the top navigation bar or by navigating to the url: https://data.mycommons.org/query.

![Query](Gen3_Toolbar_query.png)

The "Docs" button can be pressed to see documentation of the queryable nodes and properties. 

![GraphQL Docs](Gen3_GraphiQL_docs.png)

For example, typing the name of a node, "sample", into the "Search Schema" search-box, and clicking the "root.sample" option will display all the properties that can be queried for that node.

![GraphQL Docs Example](Gen3_GraphiQL_docs_sample.png)![GraphQL Docs Example 2](Gen3_GraphiQL_docs_sample_root.png)

The following example query returns the case ids for which there are blood samples in the data commons:
```
	{
	  sample(composition: "Peripheral Whole Blood") {
	    submitter_id
	    biospecimens {
	      cases {
	        id
	      }
	    }
	  }
```

Queries can also be sent to the API programmatically using, for example, the python 'requests' package. Further details on how to send queries to the API are documented [here](/resources/user/using-api).

* * *
# Downloading Data Files
* * *
The sponsor of a Gen3 data commons typically decides how users will access data files in object storage.

* In some cases, approved users may be allowed to download files directly to their local computer from within an internet browser using the Gen3 data commons Exploration tool or with the [gen3-client](/resources/user/gen3-client), which is a command-line tool.

* When more security is required, users may be required to download and analyze data files in a protected environment. Such environments include virtual machines (VM) in a virtual private cloud (VPC) or in the Gen3 Workspace, which is accessed by clicking on "Workspace" in the top navigation bar of the data commons website. More information on how to access and use the Gen3 Workspace is documented [here](/resources/user/analyze-data).

## Downloading a Data File Using the Exploration Tool

Files can be browsed using the data exploration tool in a Gen3 data commons. Individual files can be downloaded by simply clicking on the filename and then clicking the download button.

## Using a Data File Download Manifest with the Gen3-Client

From within the Exploration tool, after applying the chosen filters to the list of study subjects or data files, they can be selected by checking the checkbox next to each case or file. Then, when the "Manifest" button is clicked, a file will be downloaded that contains all the GUIDs associated with the chosen cases or files. This manifest can then be used to [download the files using the gen3-client](/resources/user/gen3-client).