---
title: "Gen3 - Data Dictionary"
date: 2018-09-18T15:12:05-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
# The Data Dictionary in Gen3
* * *

Once access has been granted to the Windmill data submission portal, we recommend reviewing the commons' specific data dictionary by clicking "Dictionary" in the top navigation bar. This tool helps to understand the variable types, requirements, and node dependencies or links required for submission.

![Gen3_Toolbar_Dictionary.png](Gen3_Toolbar_Dictionary.png)

The following sections describe:

* [Understanding Data Representation in Gen3](#understanding-data-representation-in-gen3)
* [Understanding the Gen3 Data Dictionary and Model](#understanding-the-gen3-data-dictionary-and-model)
  * [What is a Data Dictionary and Data Model?](#what-is-a-data-dictionary-and-data-model)
  * [Why Do Gen3 Commons Use a Data Model?](#why-do-gen3-commons-use-a-data-model)
* [Data Dictionary Viewer](#data-dictionary-viewer)
  * [Viewing Data Dictionary as a Graph](#viewing-data-dictionary-as-a-graph)
  * [Viewing Data Dictionary as Tables](#viewing-data-dictionary-as-tables)
  * [Toggling Between Different Views](#toggling-between-different-views)
  * [Viewing Properties of a Single Node](#viewing-properties-of-a-single-node)
  * [Opening Properties View](#opening-properties-view)
  * [Search for Node, Property, or Description](#search-for-node-property-or-description)
  * [Download Submission Templates](#download-submission-templates)

## Understanding Data Representation in Gen3
* * *
In a Gen3 data commons, a semantic distinction is made between two types of data: "data files" and "metadata".

* A "data file" could be information like tabulated data values in a spreadsheet or a fastq/bam file containing DNA sequences. The contents of the file are not exposed to the API as queryable properties, so the file must be downloaded to view its content.

* "Metadata" are variables that help to organize or convey additional information about corresponding data files so that they can be queried via the Gen3 data commons' API or viewed in the Gen3 data commons' data exploration tool. In a Gen3 data dictionary, variable names are termed "properties", and data contributors provide the values for these pre-defined properties in their data submissions.

Examples of Metadata are:

* Demographic information:
	* Race
	* Gender
	* Age
* Clinical information:
	* Military history
	* Medical history
* Metadata of a data file:
	* File size
	* File name
	* File format
* Values derived from a data file:
	* Individual genotypes derived from a raw sequencing file
	* Individual brain region volumes derived from image files
* Experimental details:
	* The kit used for an immunoassay
	* The type of blood collection tube used for sample collection

This format allows analysts to search for files of interest using the metadata for querying or filtering.

Metadata can be browsed or queried by clicking on the "Exploration" or "Query" link in the top navigation bar of the data commons submission portal, respectively. For more information on accessing data in the submission portal, see [the documentation on accessing data.](/resources/user/access-data)

Metadata queries can also be sent to the API programmatically, using, for example, the python requests package. For more information on sending requests to the API, see [the API documentation.](/resources/user/using-api)

If you would like to review how to upload these different types of data to the gen3 commons, see [the documentation on data submission.](/resources/user/submit-data)


## Understanding the Gen3 Data Dictionary and Model
* * *

### What is a Data Dictionary and Data Model?

Every Gen3 data commons employs a data model, which serves to describe, organize, and harmonize data sets submitted by different users. Data harmonization facilitates cross-project analyses and is thus one of the pillars of the data commons paradigm.

The data model organizes experimental metadata variables, "properties", into linked categories, "nodes", through the use of a data dictionary. The data dictionary lists and describes all nodes in the data model, as well as defines and describes the properties in each node.

For example:

* Clinical variables like a "primary cancer diagnosis" or a subject's "gender" might go into the "diagnosis" or "demographic" nodes, respectively.
* Sample-related variables like "how a tumor sample was collected" and "what analyte was extracted from it" might go into the "biospecimen" or "analyte" nodes, respectively.
* Data files also have associated metadata variables like file size, format, and filename. These properties are grouped into nodes that describe various types of data files, like "mri_image", for an MRI image data file.

Each node in the data dictionary is linked in a logical manner to other nodes, which facilitates generating a visual overview, or graphical model, of a project.

The following image displays the data dictionary viewer, the 'biospecimen' node entry in the dictionary, and an example graphical model of a project:

![data-model.png](data-model.png)

### Why Do Gen3 Commons Use a Data Model?

* Having all participating members use the same data model:
    * Allows for standardized metadata elements across a commons.
    * Permits flexible and scaleable API generation based on data commons software that reads the data model schema.
    * Lets users query the commons API so that an ecosystem of applications can be built.
    * Helps automate the validation of submitted data.

If a desired submission element is not currently described in the model, users will need to work with the commons to extend the data model. Provide the commons with a description of the requested data elements, and they will work with the sponsor or data modeling working group to review the request and find an appropriate home for the data elements.

In the case of developing a personal data dictionary, such as for use with Docker Compose, please note that due to the graph nature of the data model, some nodes are dependent on others. In addition, the Windmill service specifies nodes that are required for it run properly through preset parameters. For example, if Windmill is set to use the default data dictionary, it will require the `Case`, `Experiment`, and `Aliquot` nodes.


## Data Dictionary Viewer
* * *

* The Data Dictionary Viewer is designed to make it easier to understand the data model, the field types associated with each node, and the potential values associated with each field. It displays available fields in a node and the dependencies a given node has to the existence of a prior node. This is an invaluable tool for both the submission of data and later analysis of the entire commons.

* The Data Dictionary Viewer allows toggling views and browsing the nodes as a graph and as tables.

* Gen3 members can use it through the 'Dictionary' icon at https://gen3.datacommons.io/dd.

> __NOTE:__ For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL of other data commons powered by Gen3.

### Viewing Data Dictionary as a Graph
* View the Data Dictionary as a graph to see each node, its properties, and its relationships.
* Relationships between nodes are represented by arrows from one node to another.
![Dictionary Graph](graph.png)

### Viewing Data Dictionary as Tables
* View the Data Dictionary as a table to see the name and a brief description of each node, organized by node category.
* Click on the name of a node to display more information about its properties.
* Click on a button in the Download Template column to a download a template for uploading a file of that particular node type. The file can be downloaded as a JSON or TSV file.
![Dictionary Table](table.png)

### Toggling Between Different Views
* Click on "Graph View" or "Table View" in the top left of the Dictionary Viewer to switch between these two views.
![Data Dictionary Viewer](switch-to-table.gif)

### Viewing Properties of a Single Node
* The Properties View of a node lists each property, the property's type, whether or not the property is required, and a brief description of the property.
![Properties of a Node](properties.png)

### Opening Properties View
* Click on a node to see its parent nodes and information about its properties.
![Opening Properties View](properties-view.gif)

### Search for Node, Property, or Description
* Enter a search a term in the search box.
* Search terms can be node names, node descriptions, property names, and property descriptions.
* While typing, a list of suggestions appears below the search bar. Click on a suggestion to search for it.
* A search will display all nodes that contain the search term in either its name or description, or its properties' names or descriptions.
* A history of your searches appears below the search bar. Click on an item here to display the results again.
![Search](search.gif)

### Download Submission Templates
* In the Graph View, you can download submission templates to help you with submitting your project's data.
* Click a node in the graph that you'd like to submit, and all parent nodes will be highlighted.
* Click the "Download templates" button to the left of the highlighted graph. Submission templates can be either JSON or TSV files.
* Your download will be a ZIP file containing multiple files: One is a submission template for the selected node, and the others are submission templates for each parent node.
* See the README contained in the download for more information on how to use the templates.
![Download Templates](download-templates.gif)
