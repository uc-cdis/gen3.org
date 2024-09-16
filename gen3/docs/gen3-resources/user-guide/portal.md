# Accessing and Exploring Metadata from the Gen3 Data Portal
The data in a Gen3 data commons can be browsed and downloaded using several different methods. The following general documentation will cover some standard methods of data access in a Gen3 data commons. Ultimately, however, the methods of data access offered in a Gen3 data commons is determined by agreements made between the data commons’ sponsors and data contributors.

Various levels of data access can be configured in a Gen3 data commons using the Fence and Arborist services. If open access data is hosted, a data commons can be configured to allow anonymous access to data, which means users can explore data without logging in. This is the case for the [Gen3 Data Hub][Gen3 Data Hub].

In cases where data is controlled access, typically external users will receive instructions on how to access data and may be required to sign a DUA (Data Use Agreement) legal document.

The following sections provide details on how to explore and access data from within the data commons website and from the command-line by sending requests to the Gen3 open APIs.

## Access Data from the Data Commons Website
The Gen3 software stack offers a data portal service that creates a website with graphical tools for performing the basic functionality of a data commons, like browsing data in projects, building patient cohorts across projects, downloading metadata or data files for cohorts, and building database queries.

### Exploration Page
The primary tool for exploring data within a Gen3 data commons is the Exploration Page, which offers faceted search of data across projects, for example, [Gen3 Data Hub Exploration Page][Gen3 Data Hub Exploration]. This page can be accessed from the /explorer endpoint or the top navigation bar, by clicking on the “Exploration” icon.

![Screenshot of the Gen3 toolbar, boxing the exploration icon][img Gen3 Toolbar Exploration]

The exploration page has one or several tabs at the top, which each represent a flattened ElasticSearch document of structured metadata records across all the projects in the data commons, which is displayed as a table towards the bottom center of the page. For example, there may be a “Subjects” tab for building patient cohorts, which displays a table of all the records and associated metadata in the subject node, like medical history and demographics. Most commons also have one or more “File” tabs for filtering all the files in a data commons based on things like the file format, data type, or other linked contextual variables, like linked patient demographics or medical history.

Each of these main tabs will have filters on the left-hand side, which can be used to filter the data displayed in the table. There may be an optional button on each tab to download the flattened metadata table as a JSON file. This button should download the table in its filtered state. To remove a filter, click “clear” on individual facets, and you can remove all filters by reloading the page.

> Note: The main tabs in the Exploration Page, the available filters, and the properties listed in the data table are entirely customizable and will be different for various Gen3 data commons.

If the table is a list of files, there should be a button for downloading a JSON file that serves as a manifest to use with the [gen3-client][Gen3 client] for [downloading multiple files][Gen3 bulk download]. Otherwise, to download single a file listed in the table, simply click on the GUID (globally unique identifier, or object_id), which should open a page with a download button.

![GIF showing how to use the Gen3 Explorer][img Explorer GIF]

>Note: Some data commons have security measures in place that limit what environments users can access data files. For example, users may be required to download and analyze data files in a protected environment, such as a virtual machines (VM) in a virtual private cloud (VPC) or in the built-in Gen3 Workspace, which is accessed by clicking on “Workspace” in the top navigation bar of the data commons website. For more information on the Workspace, see the [documentation on how to access and use the Gen3 Workspace][Gen3 Workspace].

### Query Page
The structured data in a Gen3 data commons can be queried by using the [graphQL query language][GraphQL language] within the GraphiQL interface for building queries, which can be accessed by clicking the “Query” button in the top navigation bar or by navigating to the /query endpoint, for example, [the Gen3 Data Hub Query Page][Gen3 Query pg].

![Image showing the Query icon on the Gen3 toolbar][img Gen3 Toolbar Query]

The button on the Query page to switch between the “Graph Model” or “Flat Model”, will direct the queries to different databases, namely Postgres and ElasticSearch, respectively. Pressing the “Docs” button will reveal documentation of the data commons graphQL schema, which will list the queryable nodes and properties.

![Image showing options on the GraphiQL Query page to toggle between graph or flat models, or examining documentation of the data commons graphQL schema.][img GraphiQL Query pg]

For example, typing the name of a node, “sample”, into the “Search Schema” search-box in the Graph Model, and clicking the “root.sample” option will display all the properties that can be queried for that node.

![Image showing typing the name of a node, “sample”, into the “Search Schema” search-box in the Graph Model][img GraphiQL sample node]
![Image showing how clicking the “root.sample” option will display all the properties that can be queried for that node][img GraphiQL root sample node]

The following example query returns the subject and submitter ids in the subject node in the data commons:

```
	{
		subject {
			subject_id
			submitter_id
		}
	}
```

More detailed information on how to query specific data can be found [here][Query Data].

### Data Dictionary Viewer

* The Data Dictionary Viewer is designed to make it easier to understand the data model, the field types associated with each node, and the potential values associated with each field. It displays available fields in a node and the dependencies a given node has to the existence of a prior node. This is an invaluable tool for both the submission of data and later analysis of the entire commons.

* The Data Dictionary Viewer allows toggling views and browsing the nodes as a graph and as tables.

* Gen3 members can use it through the ‘Dictionary’ icon in [the Gen3 Data Hub][Gen3 DD].

NOTE: For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL of other data commons powered by Gen3.

#### Viewing Data Dictionary as a Graph
* View the Data Dictionary as a graph to see each node, its properties, and its relationships.
* Relationships between nodes are represented by arrows from one node to another.

![Screenshot of a graphical rendering of a data model][img Graph data model]

#### Viewing Data Dictionary as Tables

* View the Data Dictionary as a table to see the name and a brief description of each node, organized by node category.
* Click on the name of a node to display more information about its properties.
* Click on a button in the Download Template column to a download a template for uploading a file of that particular node type. The file can be downloaded as a JSON or TSV file.

![Screenshot of a table rendering of a data model][img table data model]

#### Toggling Between Different Views

* Click on “Graph View” or “Table View” in the top left of the Dictionary Viewer to switch between these two views.

![An animation showing how to toggle between graph and table views of Data Model][gif toggle]

#### Viewing Properties of a Single Node

* The Properties View of a node lists each property, the property’s type, whether or not the property is required, and a brief description of the property.

![Screenshot of the properties view of a node in the data model][img properties]

#### Opening Properties View

* Click on a node to see its parent nodes and information about its properties.

![Animation showing how you can click on a node and view parent nodes and properties for the node][gif properties]

#### Search for Node, Property, or Description
* Enter a search a term in the search box.
* Search terms can be node names, node descriptions, property names, and property descriptions.
* While typing, a list of suggestions appears below the search bar. Click on a suggestion to search for it.
* A search will display all nodes that contain the search term in either its name or description, or its properties’ names or descriptions.
* A history of your searches appears below the search bar. Click on an item here to display the results again.

![Animation illustrating how you can search your data model for node, property, or description][gif Dict Search]


### Discovery Page

The Gen3 Discovery Page allows the visualization of metadata from within the metadata service (MDS).  This typically includes public metadata about a project to make it discoverable.  It can be used by both data commons and meshes although it can play a more central role in a data mesh.  Users should be able to search based on free text or filter based on tags.

![Animation showing how to navigate around the Discovery page][Discovery Page]



### Access Data using the API
The beauty of a Gen3 data commons is that all the functionality of the data commons website is available by sending requests to the open APIs of the data commons. Detailed API specifications of the Gen3 services can be browsed in [the API documentation][API documentation].




<!-- Intro -->
[Gen3 Data Hub]: https://gen3.datacommons.io/

<!-- Exploration section. -->
[Gen3 Data Hub Exploration]: https://gen3.datacommons.io/explorer
[img Gen3 Toolbar Exploration]: /gen3-resources/user-guide/img/Gen3_Toolbar_exploration.png
[Gen3 client]: /gen3-resources/user-guide/access-data/#download-files-using-the-gen3-client
[Gen3 bulk download]: /gen3-resources/user-guide/access-data/#multiple-file-download-with-manifest
[img Explorer GIF]: /gen3-resources/user-guide/img/explorer_gif_2020.gif


<!-- Query Page -->

[GraphQL language]: https://graphql.org/
[Gen3 Query pg]: https://gen3.datacommons.io/query
[img Gen3 Toolbar Query]: /gen3-resources/user-guide/img/Gen3_Toolbar_query.png
[img GraphiQL Query pg]: /gen3-resources/user-guide/img/Gen3_GraphiQL_docs2020.png
[img GraphiQL sample node]: /gen3-resources/user-guide/img/Gen3_GraphiQL_docs_sample.png
[img GraphiQL root sample node]: /gen3-resources/user-guide/img/Gen3_GraphiQL_docs_sample_root.png
[Query Data]: /gen3-resources/user-guide/search/#graph-model

<!-- Dictionary Viewer -->

[Gen3 DD]: https://gen3.datacommons.io/dd
[img Graph data model]: /gen3-resources/user-guide/img/graph.png
[img table data model]: /gen3-resources/user-guide/img/table.png
[gif toggle]: /gen3-resources/user-guide/img/switch-to-table.gif
[img properties]: /gen3-resources/user-guide/img/properties.png
[gif properties]: /gen3-resources/user-guide/img/properties-view.gif
[gif Dict Search]: /gen3-resources/user-guide/img/search.gif


<!-- Discovery Page -->
[Discovery Page]: /gen3-resources/user-guide/img/discovery_page3.gif

<!-- API Section -->
[API documentation]: /gen3-resources/user-guide/using-api/
