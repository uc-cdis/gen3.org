---
title: "Gen3 - Types of Data"
date: 2019-01-14T15:09:06-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
* * *
## 1. Understanding Data Representation in Gen3

* * *
In a Gen3 data commons, a semantic distinction is made between two types of data: "data files" and "metadata".

* A "data file" would be information like tabulated data values in spreadsheet or a fastq/bam file containing DNA sequences. The contents of the file are not exposed to the API as queryable properties, so the file must be downloaded to view its content.

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


## 2. Understanding the Gen3 Data Dictionary and Model
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

![Data Dictionary](data-model.png)

### Why Do Gen3 Commons Use a Data Model?

* Having all participating members use the same data model:
    * Allows for standardized metadata elements across a commons.
    * Permits flexible and scaleable API generation based on data commons software that reads the data model schema.   
    * Lets users query the commons API so that an ecosystem of applications can be built.
    * Helps automate the validation of submitted data.   

Once access has been granted to the Windmill data submission portal, we recommend reviewing the commons' specific data dictionary by clicking "Dictionary" in the top navigation bar. This tool helps users understand the variable types, requirements, and node dependencies or links required for submission.

![Dictionary](Gen3_Toolbar_Dictionary.png)

If a desired submission element is not currently described in the model, users will need to work with the commons to extend the data model. Provide the commons with a description of the requested data elements, and they will work with the sponsor or data modeling working group to review the request and find an appropriate home for the data elements.

In the case of developing a personal data dictionary, such as for use with Docker Compose, please note that due to the graph nature of the data model, some nodes are dependent on others. In addition, the Windmill service specifies nodes that are required for it run properly through preset parameters. For example, if Windmill is set to use the default data dictionary, it will require the `Case`, `Experiment`, and `Aliquot` nodes.
