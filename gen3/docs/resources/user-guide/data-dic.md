# The Data Dictionary in Gen3

We recommend data contributors and analysts familiarize themselves with the Gen3 data dictionary of their data commons by clicking “Dictionary” in the top navigation bar or by entering the URL [https://gen3.datacommons.io/dd][Gen3 DD]. Here one can find a graphical model that illustrates how a particular data commons organizes and describes its data.

![Screenshot of the data commons toolbar, highlighting the data dictionary button][img Toolbar DD]
The following sections describe:

* Understanding Data Representation in Gen3
* Understanding the Gen3 Data Dictionary and Model
   * What is a Data Dictionary and Data Model?
   * Why Do Gen3 Commons Use a Data Model?
* Data Dictionary Viewer
Viewing Data Dictionary as a Graph
   * Viewing Data Dictionary as Tables
   * Toggling Between Different Views
   * Viewing Properties of a Single Node
   * Opening Properties View
   * Search for Node, Property, or Description
   * Download Submission Templates

## Understanding Data Representation in Gen3

In a Gen3 data commons, a semantic distinction is made between two types of data: “data files” and “metadata”.

* A “data file” could be information like tabulated data values in a spreadsheet or a fastq/bam file containing DNA sequences. The contents of the file are not exposed to the API as queryable properties, so the file must be downloaded to view its content.

* “Metadata” are variables that help to organize or convey additional information about corresponding data files so that they can be queried via the Gen3 data commons’ API or viewed in the Gen3 data commons’ data exploration tool. In a Gen3 data dictionary, variable names are termed “properties”, and data contributors provide the values for these pre-defined properties in their data submissions.

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

Metadata can be browsed or queried by clicking on the “Exploration” or “Query” link in the top navigation bar of the data commons submission portal, respectively. For more information on accessing data in the submission portal, see [the documentation on accessing data][Gen3 access data].

Metadata queries can also be sent to the API programmatically, using, for example, the python requests package. For more information on sending requests to the API, see [the API documentation][API].

If you would like to review how to upload these different types of data to the gen3 commons, see [the documentation on data submission][Gen3 Submit Data].

## Understanding the Gen3 Data Dictionary and Model

### What is a Data Dictionary and Data Model?

Every Gen3 data commons employs a data model, which serves to describe, organize, and harmonize data sets submitted by different users. Data harmonization facilitates cross-project analyses and is thus one of the pillars of the data commons paradigm.

The data model organizes experimental metadata variables, “properties”, into linked categories, “nodes”, through the use of a data dictionary. The data dictionary lists and describes all nodes in the data model, as well as defines and describes the properties in each node.

For example:

* Clinical variables like a “primary cancer diagnosis” or a subject’s “gender” might go into the “diagnosis” or “demographic” nodes, respectively.
* Sample-related variables like “how a tumor sample was collected” and “what analyte was extracted from it” might go into the “biospecimen” or “analyte” nodes, respectively.
* Data files also have associated metadata variables like file size, format, and filename. These properties are grouped into nodes that describe various types of data files, like “mri_image”, for an MRI image data file.

Each node in the data dictionary is linked in a logical manner to other nodes, which facilitates generating a visual overview, or graphical model, of a project.

Properties can be assigned different types, depending on the value of the data that will be submitted to them. The following types are available: string, boolean, number, integer, enum, null, array, and regex patterns. More information on the property value types can be found here.

The following image displays the data dictionary in Table View, the ‘Medical History’ node entry in the dictionary with the list of properties, and an example graphical model of a project:

![Screenshot of table view of the data model page][img data model]

### Why Do Gen3 Commons Use a Data Model?

Having all participating members use the same data model:

* Allows for standardized metadata elements across a commons.
* Permits flexible and scaleable API generation based on data commons software that reads the data model schema.
* Lets users query the commons API so that an ecosystem of applications can be built.
* Helps automate the validation of submitted data.

If a desired submission element is not currently described in the model, users will need to work with the commons to extend the data model. Provide the commons with a description of the requested data elements, and they will work with the sponsor or data modeling working group to review the request and find an appropriate home for the data elements.

In the case of developing a personal data dictionary, such as for use with Docker Compose, please note that due to the graph nature of the data model, some nodes are dependent on others. In addition, the Windmill service specifies nodes that are required for it run properly through preset parameters. For example, if Windmill is set to use the default data dictionary, it will require the `Case`, `Experiment`, and `Aliquot` nodes.

## Data Dictionary Viewer

* The Data Dictionary Viewer is designed to make it easier to understand the data model, the field types associated with each node, and the potential values associated with each field. It displays available fields in a node and the dependencies a given node has to the existence of a prior node. This is an invaluable tool for both the submission of data and later analysis of the entire commons.

* The Data Dictionary Viewer allows toggling views and browsing the nodes as a graph and as tables.

* Gen3 members can use it through the ‘Dictionary’ icon at [https://gen3.datacommons.io/dd][Gen3 DD].

NOTE: For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL of other data commons powered by Gen3.

### Viewing Data Dictionary as a Graph
* View the Data Dictionary as a graph to see each node, its properties, and its relationships.
* Relationships between nodes are represented by arrows from one node to another.

![Screenshot of a graphical rendering of a data model][img Graph data model]

### Viewing Data Dictionary as Tables

* View the Data Dictionary as a table to see the name and a brief description of each node, organized by node category.
* Click on the name of a node to display more information about its properties.
* Click on a button in the Download Template column to a download a template for uploading a file of that particular node type. The file can be downloaded as a JSON or TSV file.

![Screenshot of a table rendering of a data model][img table data model]

### Toggling Between Different Views

* Click on “Graph View” or “Table View” in the top left of the Dictionary Viewer to switch between these two views.

![An animation showing how to toggle between graph and table views of Data Model][gif toggle]

### Viewing Properties of a Single Node

* The Properties View of a node lists each property, the property’s type, whether or not the property is required, and a brief description of the property.

![Screenshot of the properties view of a node in the data model][img properties]

### Opening Properties View

* Click on a node to see its parent nodes and information about its properties.

![Animation showing how you can click on a node and view parent nodes and properties for the node][gif properties]

### Search for Node, Property, or Description
* Enter a search a term in the search box.
* Search terms can be node names, node descriptions, property names, and property descriptions.
* While typing, a list of suggestions appears below the search bar. Click on a suggestion to search for it.
* A search will display all nodes that contain the search term in either its name or description, or its properties’ names or descriptions.
* A history of your searches appears below the search bar. Click on an item here to display the results again.

![Animation illustrating how you can search your data model for node, property, or description][gif Dict Search]

### Download Submission Templates

* In the Graph View, you can download submission templates to help you with submitting your project’s data.
* Click a node in the graph that you’d like to submit, and all parent nodes will be highlighted.
* Click the “Download templates” button to the left of the highlighted graph. Submission templates can be either JSON or TSV files.
* Your download will be a ZIP file containing multiple files: One is a submission template for the selected node, and the others are submission templates for each parent node.
* See the README contained in the download for more information on how to use the templates.

![Animation showing you can download a submission template to help you submit your project's data][gif Submission Template]



<!-- intro -->
[Gen3 DD]: https://gen3.datacommons.io/dd
[img Toolbar DD]: https://gen3.org/resources/user/dictionary/Gen3_Toolbar_Dictionary.png

<!-- Understanding Data Representation -->
[Gen3 access data]: https://gen3.org/resources/user/access-data
[API]: https://gen3.org/resources/user/using-api
[Gen3 Submit Data]: https://gen3.org/resources/user/submit-data

<!-- What is a Data Dictionary -->
[img data model]: https://gen3.org/resources/user/dictionary/data-model.png

<!-- Data Dictionary Viewer -->
[img Graph data model]: https://gen3.org/resources/user/dictionary/graph.png
[img table data model]: https://gen3.org/resources/user/dictionary/table.png
[gif toggle]: https://gen3.org/resources/user/dictionary/switch-to-table.gif
[img properties]: https://gen3.org/resources/user/dictionary/properties.png
[gif properties]: https://gen3.org/resources/user/dictionary/properties-view.gif
[gif Dict Search]: https://gen3.org/resources/user/dictionary/search.gif
[gif Submission Template]: https://gen3.org/resources/user/dictionary/download-templates.gif
