---
title: "Access Data"
date: 2018-09-12T23:08:34-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
* * *
# Exploring metadata and downloading data files
* * *
In a Gen3 data commons, a distinction is made between two types of data: "data files" and "metadata".

* A "data file" would be, for example, tabulated data values in spreadsheet, or a fastq/bam file containing DNA sequences. The contents of the file are not exposed to the API as queryable properties. So, the file must be downloaded to view its content.

* "Metadata" are key/value pairs (aka "properties") that can be queried via the Gen3 data commons' API or viewed in the Gen3 data commons' data exploration tool, which is accessed by clicking on "Exploration" in the top navigation bar of the data commons submission portal. Metadata can be properties of a data file (like the file size, filename, or file format) or values derived from a data file and exposed for queries (like a particular genotype derived from a sequencing file, or a brain region volume derived from an image file). This way, analysts can search for files of interest using the metadata by querying, for example, "Give me all the DNA sequence files for subjects with the ancestral allele of my-favorite-gene". Other metadata properties include experimental details (like the kit used for an immunoassay or the type of blood collection tube used to collect a biospecimen) or demographic and clinical information about study subjects (like race and gender, or military and medical history). These properties facilitate queries like "Create a synthetic cohort across different studies that consists of African American men with more than 2 military deployments", and then data files like DNA sequences or brain images can be downloaded and analyzed for the synthetic cohort.

## Exploration Tool
* * *
One method of accessing metadata in a Gen3 data commons is using the data exploration tool in your web browser, which is reached by clicking "Exploration" in the top navigation bar or by navigating to the url: https://data.mycommons.org/explorer.
The data exploration tool has a certain set of metadata properties that can be used as filters for selecting subsets of study subjects and data files.
* Note: The properties used for filtering data are configurable and are chosen in collaboration with data commons sponsors, contributors and analysts. If you have a suggestion for a property to be added as a filter, contact the data commons support team with your request.
<!--
Custom filters can also be added by clicking on the "add a custom filter" button. Begin typing the property you'd like to add as a custom filter and then select it. You can then enter the values of that property to filter data on.
-->
A spreadsheet containing available clinical, demographic, or experimental metadata can be downloaded by clicking on the corresponding button once a cohort or group of files has been selected.

## Querying metadata using the graphiQL interface
* * *
The metadata in a Gen3 commons can also be queried via the [graphQL query language](https://graphql.org/) using the graphiQL interface, which can be accessed by clicking "Query" in the top navigation bar or by navigating to the url: https://data.mycommons.org/query.
The "Docs" button can be pressed to see documentation of the queryable nodes and properties. For example, if you type the name of a node, e.g., "sample", into the "Search Schema" search-box, and 'root.sample' is clicked, it will display all the properties that can be queried for that node.

Example:
```
The following query returns the case ids for which there are blood samples in the data commons:
{
	{
	  sample(composition: "Peripheral Whole Blood") {
	    submitter_id
	    biospecimens {
	      cases {
	        id
	      }
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
* When more security is required, users may be required to download and analyze data files in a protected environment, such as a virtual machine (VM) in a virtual private cloud (VPC) or in the Gen3 Workspace, which is accessed by clicking on "Workspace" in the top navigation bar of the data commons website. More information on how to access and use the Gen3 Workspace is documented [here](/resources/user/analyze-data).

## Downloading a data file using the Exploration tool
Files can be browsed using the data exploration tool in a Gen3 data commons. Individual files can be downloaded by simply clicking on the filename and then clicking the download button.

## Using a data file download manifest with the gen3-client
From within the Exploration tool, after applying your chosen filters to the list of study subjects or data files, they can be selected by checking the checkbox next to each case or file. Then, when the "Manifest" button is clicked, a file will be downloaded that contains all the GUIDs associated with the chosen cases or files. This manifest can then be used to [download the files using the gen3-client](/resources/user/gen3-client).
