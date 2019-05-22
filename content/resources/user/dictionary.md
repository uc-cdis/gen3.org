---
title: "Gen3 - Data Dictionary"
date: 2018-09-18T15:12:05-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---


# Data Dictionary Viewer
* * *

* The Data Dictionary Viewer is designed to make it easier to understand the data model, the field types associated with each node, and the potential values associated with each field. It displays available fields in a node and the dependencies a given node has to the existence of a prior node.  This is an invaluable tool for both the submission of data and later analysis of the entire commons.   

* The Data Dictionary Viewer will also let the user toggle views and browse the nodes as a graph and as tables.  

* Gen3 members can use it through the 'Dictionary' icon at https://data.mycommons.org/dd.

> __NOTE:__ For these user guides, https://data.mycommons.org is an example URL and will not be the actual URL of the data commons.

![Dictionary Button](Gen3_Toolbar_Dictionary.png)

* * *

### Viewing Data Dictionary as a Graph:
* View the Data Dictionary as a graph to see each node, its properties, and its relationships.
* Relationships between nodes are represented by arrows from one node to another.
![Dictionary Graph](graph.png)

### Viewing Data Dictionary as Tables:
* View the Data Dictionary as a table to see the name and a brief description of each node, organized by node category.
* Click on the name of a node to display more information about its properties.
* Click on a button in the Download Template column to a download a template for uploading a file of that particular node type. The file can be downloaded as a JSON or TSV file.
![Dictionary Table](table.png)

### Toggling Between Different Views
* Click on "Graph View" or "Table View" in the top left of the Dictionary Viewer to switch between these two views.
![Data Dictionary Viewer](switch-to-table.gif)

### Viewing Properties of a Single Node:
* The Properties View of a node lists each property, the property's type, whether or not the property is required, and a brief description of the property.
![Properties of a Node](properties.png)

### Opening Properties View:
* Click on a node to see its parent nodes and information about its properties.
![Opening Properties View](properties-view.gif)

### Search for Node, Property, or Description:
* Enter a search a term in the search box.
* Search terms can be node names, node descriptions, property names, and property descriptions.
* While typing, a list of suggestions appears below the search bar. Click on a suggestion to search for it.
* A search will display all nodes that contain the search term in either its name or description, or its properties' names or descriptions.
* A history of your searches appears below the search bar. Click on an item here to display the results again.
![Search](search.gif)

### Download Submission Templates:
* In the Graph View, you can download submission templates to help you with submitting your project's data.
* Click a node in the graph that you'd like to submit, and all parent nodes will be highlighted.
* Click the "Download templates" button to the left of the highlighted graph. Submission templates can be either JSON or TSV files.
* Your download will be a ZIP file containing containing multiple files: One is a submission template for the selected node, and the others are submission templates for each parent node.
* See the README contained in the download for more information on how to use the templates.
![Download Templates](download-templates.gif)

* * *
