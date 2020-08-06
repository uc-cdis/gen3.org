---
title: "Access Data"
date: 2018-09-12T23:08:34-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Exploring Metadata and Downloading Data Files

* * *

The [data in a Gen3 data commons](/resources/user/dictionary) can be browsed and downloaded using tools either in the submission portal website or from the command-line. Feel free to take a look at our webinars about data acces on our Gen3 Data Commons [YouTube channel](https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/videos).

After finding the metadata/structured data or data files of interest, they can be accessed, that is queried or downloaded, in multiple ways. How data is accessed in a Gen3 data commons is determined by the commons' sponsor(s), data contributor(s), and/or  operator(s).

* [Finding your File by Browsing the List of Projects](#finding-your-file-by-browsing-the-list-of-projects)
* [Query](#query)
  * [Querying Metadata Using the GraphiQL Interface](#querying-metadata-using-the-graphiql-interface)
  * [Querying Metadata Using Gen3 SDK](#querying-metadata-using-gen3-sdk)
  * [Querying Metadata Using the API](#querying-metadata-using-the-api)
* [Downloading Data Files](#downloading-data-files)
  * [Downloading a Data File Using the Exploration Tool](#downloading-a-data-file-using-the-exploration-tool)
  * [Using a Data File Download Manifest with the Gen3-Client](#using-a-data-file-download-manifest-with-the-gen3-client)
  * [Downloading Files Using the Gen3 SDK](#downloading-files-using-the-gen3-sdk)
  * [Downloading Metadata Using the API](#downloading-metadata-using-the-api)

* * *


## Finding your File by Browsing the List of Projects
The metadata submission portal https://gen3.datacommons.io/submission can be used to browse and find an individual project by node. Select a project by clicking 'Submit Data' on the right side and then either explore the nodes in the "Toggle view" by clicking on individual nodes, or, by clicking the "browse nodes" button to the left. From this screen queries can be made by node in the dropdown at the left.

<h4> Example: Find Projects and browse Nodes</h4>
![Browse by node](projects-nodes-view.png)

This feature can also download the tsv associated with the node, or if a user has "write" access to the this project, delete existing nodes.

A user can review a graph of an individual project, by toggling between views of the completed nodes and the full graph. The number you see underneath the node name, for example 'subject', reflects the number of records in each node.

<h4> Example:  Graphing a Project </h4>
![Graphing a project](graph-a-project.gif)


## Query
* * *

### Querying Metadata Using the GraphiQL Interface
The easiest way to query metadata in a Gen3 commons is done by using the [graphQL query language](https://graphql.org/) with the graphiQL interface, which can be accessed by clicking "Query" in the top navigation bar or by navigating to the URL: https://gen3.datacommons.io/query.

![Query](Gen3_Toolbar_query.png)

You can switch between Graph Model or Flat Model --each using different databases (Postgres and Elastisearch). The "Docs" button can be pressed to see documentation of the queryable nodes and properties.

![GraphQL Docs](Gen3_GraphiQL_docs2020.png)

For example, typing the name of a node, "sample", into the "Search Schema" search-box in the Graph Model, and clicking the "root.sample" option will display all the properties that can be queried for that node.

![GraphQL Docs Example](Gen3_GraphiQL_docs_sample.png)![GraphQL Docs Example 2](Gen3_GraphiQL_docs_sample_root.png)

The following example query returns the subject and submitter ids in the subject node in the data commons:
```
	{
		subject {
			subject_id
			submitter_id
		}
	}

```
More detailed information on how to query specific data can be found [here](/resources/user/query-the-data/).



### Querying Metadata Using Gen3 SDK
With this software development kit (SDK), it is possible to dynamically retrieve a GUID for a row in the manifest file provided. However, this is limited by indexd's ability to scale to the queries you want to run. More information [here](https://github.com/uc-cdis/gen3sdk-python) or [here](https://uc-cdis.github.io/gen3sdk-python/_build/html/index.html).


### Querying Metadata Using the API
With the API in place, users can submit queries to find metadata information across the Gen3 commons. The API can be queried programmatically using, for example, the python 'requests' package, or through provided tools, like the submission portal. Further details on how to send queries to the API are documented [here](/resources/user/using-api/#querying-and-downloading-metadata-using-the-api).




## Downloading Data Files
* * *
The sponsor of a Gen3 data commons typically decides how users will access data files in object storage.

* In some cases, approved users may be allowed to download files directly to their local computer from within an internet browser using the Gen3 data commons Exploration tool or with the [Gen3-Client](/resources/user/gen3-client), which is a command-line tool.

* When more security is required, users may be required to download and analyze data files in a protected environment. Such environments include virtual machines (VM) in a virtual private cloud (VPC) or in the Gen3 Workspace, which is accessed by clicking on "Workspace" in the top navigation bar of the data commons website. For more information on the Workspace, see the [documentation on how to access and use the Gen3 Workspace](/resources/user/analyze-data).



### Downloading a Data File Using the Exploration Tool
One method of accessing, exploring, and downloading metadata in a Gen3 data commons is using the data exploration tool in a web browser. This page can be reached by clicking "Exploration" in the top navigation bar or by navigating to the URL: https://gen3.datacommons.io/explorer. Here you can search for different facets and, depending on your access rights and the Gen3 commons, download individual files.

> __Note:__ The part of the URL above https://gen3.datacommons.io can be replaced with the URL of other data commons powered by Gen3.

![Exploration](Gen3_Toolbar_exploration.png)

The data exploration tool has a certain set of metadata properties that can be used as filters for selecting subsets of study subjects and data files.

![Facets](Gen3_facets.png)

> __NOTE:__ The properties used for filtering data are configurable and are chosen in collaboration with data commons sponsors, contributors, and analysts. Contact the data commons support team with suggestions for a new property to be added as a filter.

<!--
Custom filters can also be added by clicking on the "add a custom filter" button. Begin typing the property you would like to add as a custom filter and then select it. You can then enter the values of that property to filter data on.
-->

A spreadsheet containing available clinical, demographic, or experimental metadata can be downloaded by clicking on the corresponding button once a cohort or group of files has been selected.

![Selection and Download](Gen3_selection_and_download_highlight.png)

If you downloaded a manifest for bulk download see how to proceed with the [Gen3-Client](/resources/user/gen3-client/#5-provide-a-manifest-file-for-bulk-download). If you downloaded a .JSON file, you can access the data using for example the `json package` in Python. More information on how to proceed from here can be found in our [webinars](https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/videos) or coming soon also [here](https://gen3.org/resources/user/analyze-data/).

Individual files can be downloaded by simply clicking on the filename and then clicking the download button, or by finding the GUID of the file of interest and entering the URL https://gen3.datacommons.io/files/GUID.

> __Note:__ If a commons restricts data download access to within a virtual private cloud (VPC), then an "Access Denied" error will be displayed by the website. Some commons may choose to allow analysis only in the Gen3-provided Workspace, which is documented [here](/resources/user/analyze-data/).





### Using a Data File Download Manifest with the Gen3-Client
The Gen3-Client provides an easy-to-use, command-line interface for uploading and downloading data files to and from a Gen3 data commons from the terminal or command prompt, respectively.

From within the Exploration tool, after applying the chosen filters to the list of study subjects or data files, they can be selected by checking the checkbox next to each case or file. Then, when the "Manifest" button is clicked, a file will be downloaded that contains all the GUIDs associated with the chosen cases or files. This manifest can then be used to [download the files using the Gen3-Client](/resources/user/gen3-client/#5-provide-a-manifest-file-for-bulk-download).







### Downloading Files Using the Gen3 SDK
The bioinformatics team at the Center for Translational Data Science (CTDS) at University of Chicago has put together a basic software development kit (SDK) to help users interact with the Gen3 API, which can be found on [Github](https://github.com/uc-cdis/gen3sdk-python). The Gen3 community is encouraged to help improve the gen3sdk by adding functions to the library or developing Jupyter Notebooks that use it.

> __NOTE:__ As the Gen3 community updates repositories, keep them up to date using `git pull origin master`.

To [install the Gen3 SDK](https://gen3sdk-python.readthedocs.io/en/latest/install.html), use the python installer 'pip'.

Example:
```
# Install Gen3 SDK:
pip install gen3

# To clone and develop the source:
git clone https://github.com/uc-cdis/gen3sdk-python.git
```



### Downloading Metadata Using the API
Users with read access to a project can download individual metadata records in the project or all records in a specified node of the project using the API. For more information, see [this section](/resources/user/using-api/#querying-and-downloading-metadata-using-the-api).
