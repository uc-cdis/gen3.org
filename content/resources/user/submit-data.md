---
title: "Gen3 - Data Contribution"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Submitting Metadata and Data
* * *

## 1. Review the Data Model
* * *

### What is the Data Model?

Every Gen3 data commons employs a data model, which serves to describe, organize, and harmonize data sets submited by different users. Data harmonization facilitates cross-project analyses and is thus one of the pillars of the data commons paradigm.

The data model organizes experimental metadata variables, "properties", into linked categories, "nodes", through the use of a data dictionary. The data dictionary lists and describes all nodes in the data model, as well as defines and describes the properties in each node.

For example:

* Clinical variables like a primary cancer diagnosis or a subject's gender might go into the "diagnosis" or "demographic" nodes, respectively. 
* Sample-related variables like how a tumor sample was collected and what analyte was extracted from it might go into the "biospecimen" or "analyte" nodes, respectively. 
* Data files also have associated metadata variables like file size, format, and the file's location in object storage. These properties are grouped into nodes that describe various types of data files, like "mri_image", for an MRI image data file.

Finally, each node in the data dictionary is linked in a logical manner to other nodes, which facilitates generating a visual overview, or graphical model, of a project.

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


## 2. Prepare Metadata TSVs for Each Node in the Project
* * *

Data contributors will need to prepare metadata for their submission in tab-separated value (TSV) files for each node in their project.

It may be helpful to think of each TSV as a node in the graph of the data model. Column headers in the TSV are the properties, metadata variables, stored in that node.  Each row is a "record" or "entity" in that node. Each record in every node will have a `submitter_id`, which is a unique alphanumeric identifier for that record across the whole project and is specified by the data submitter, and a `type`, which is simply the node name.

Besides the `submitter_id` and `type`, which are required for every record, other properties are either required or not, and this can be determined in the data dictionary's "Required" column for a specific node.

Template TSVs are provided in each node's page in the data dictionary.

![Template](Gen3_Dictionary_Subject_template.png)

### Determine Submission Order via Node Links
* * *

The prepared TSV files must be submitted in a specific order due to node links. Referring back to the graphical data model, a node cannot be submitted without first submitting the nodes to which it is linked upstream. If metadata is submitted out of order, such as a link to an upstream node that does not yet exist, the validator will reject the submission on the basis that the dependency is not present with the error message, "INVALID_LINK".

The `program` and `project` nodes are the most upstream nodes and are created by a commons administrator. The first node submitted by data contributor is usually the `study` or `experiment` node, which points directly upstream to the `project` node. Next, the study participants are recorded in the `case` node, and subsequently any clinical information (demographics, diagnoses, etc.), biospecimen data (biopsy samples, extracted analytes), are linked to each case. Finally, metadata describing the actual raw data files to be uploaded to object storage are the last nodes submitted.


### Specifying Required Links
* * *

At least one link is required for every record in a TSV, and sometimes multiple links could be specified. The links are specified in a TSV with the variable header `<nodes>.submitter_id`, where <nodes\> is the upstream node the record is linking to. The value of this variable is the specific submitter_id of the link.

For example, there are four cases in two studies in one `project`. The `study` node was made with two study `submitter_id`s: "study-01" and "study-02". The "case.tsv" file uploaded to describe the study participants enrolled will have a corresponding study. 

#### case.tsv

|case|	submitter_id|	studies.submitter_id|
|--|--|--|
|1|case_1|study-01|	
|2|case_2|study-02|
|3|case_3|study-01|
|4|case_4|study-01|

In this example cases 1, 2, and 4 all belong to "study-01", but case 2 belongs to "study-02". All the cases have different `submitter_id`s and these will be used in the subtending node that refers to a specific case.

> __NOTE:__ The `submitter_id` needs to be unique not only within one node, but across all nodes.

### Specifying Multiple Links
* * *

Links can be one-to-one, many-to-one, one-to-many, and many-to-many. Since a single study participant can be enrolled in multiple studies, and a single study will have multiple cases enrolled in it, this link is "many-to-many". On the other hand, since a single study cannot be linked to multiple projects, but a single project can have many studies linked to it, the study -> project link is "many-to-one".

In the above example, if "case_2" was enrolled in both "study-01" and "study-02", then there would be two columns to specify these links in the case.tsv file: "studies.submitter_id#1" and "studies.submitter_id#2". The values would be "study-01" for one of them and "study-02" for the other.

|case|submitter_id|studies.submitter_id#1|studies.submitter_id#2|
|--|--|--|--|
|1|case_1|study-01||	
|2|case_2|study-01|study-02|
|3|case_3|study-01||
|4|case_4|study-01||

## 3. Register Data Files with the Windmill Data Portal
* * *

Special attention must be given to "data file" nodes as they contain variables that describe actual, raw data files, which will be uploaded to object storage by the data contributor and later downloaded by data analysts. Specifically, data files must be "registered" in order to be downloadable using the Windmill data portal or the [cdis-data-client](https://github.com/uc-cdis/cdis-data-client/releases).

Registration of data files means adding a column in the data file node's TSV named "urls", and entering the URL/address of each file in object storage. This is usually a location in a project folder of a data commons bucket in s3 object storage: "s3://commons-bucket/project-name/filename".

For example, say the following local files need to be registered and then uploaded:

```
commandline-prompt$ ls -l
-rw-r--r--@  1 username  staff     6B May 30 15:18 file-1.dcm
-rw-r--r--@  1 username  staff     7B May 30 15:18 file-2.dcm
-rw-r--r--@  1 username  staff     8B May 30 15:18 file-3.dcm
```

Add a column 'urls' to the TSV and entering the full s3 path for each file in that column:

| type | submitter_id | filename | file_size | md5sum|etc.... | urls |
| :------------- | :------------- | :------------- | :------------- |:------------- | :------------- | :------------- |
| mri_image | file-id-1 | file-1.dcm | 6365 |(md5sum value)| ... | s3://commons-bucket/project-name/file1.txt |
| mri_image | file-id-2 | file-2.dcm | 72346 |(md5sum value)| ... | s3://commons-bucket/project-name/file2.txt |
| mri_image | file-id-3 | file-3.dcm | 23468 |(md5sum value)| ... | s3://commons-bucket/project-name/file3.txt |


Please make sure to check with the commons operator that the correct commons bucket name is used prior to submitting a data file node TSV. Once the data files are registered, their metadata cannot be easily changed and the metadata record must be deleted and re-created.

Also be aware that metadata describing data files that will be uploaded to s3 object storage need to include the file size and md5sum in addition to the address of the file in s3 object storage. Therefore, before submitting data file metadata TSVs, make sure all of that information is included and correct. This information is used by data downloaders to confirm completeness of the download file via the md5sum and file size.

## 4. Submit TSVs and Validate Metadata
* * *

### Begin Metadata TSV Submissions

To start submitting metadata TSVs, the first node, `project`, needs to be created by a commons administrator. Remembering that TSVs must be submitted for each node in a specific order, begin with the first node downstream of project based on the dictionary, often `study` or `experiment`, and continue to submit TSVs until all data file nodes are submitted and properly registered.

From the Windmill data portal, click on "Data Submission" and then click "Submit Data" beside the project for which the metadata TSVs are being submitted.

To submit a TSV:

1) Login to the Windmill data portal for the commons.

2) Click on "Data Submission" in the top navigation bar.

![Data Submission](Gen3_Toolbar_data_submission.png)

3) Click on "Submit Data" by the project to submit metadata.

![Submit Data](Gen3_Data_Submission_submit_data.png)

4) Click on "Upload File".

![Upload and Submit](Gen3_Data_Submission_Use_Form.png)

5) Navigate to the TSV and click "open", the contents of the TSV should appear in the grey box below.

6) Click "Submit".

A message should appear that indicates either success (green, "succeeded: 200") or failure (grey, "failed: 400"). Further details can be reviewed by clicking on "DETAILS", which displays the API response in JSON form. Each record/entity that was submitted, it gets a true/false value for "valid" and lists "errors" if it was not valid.

For anything other than success, check the other fields for any information on the error with the submission. The most descriptive information will be found in the individual entity transaction logs. Each line in the TSV will have its own output with the following attributes:

```JSON
{
	"action": "update/create",
	"errors": [
		{
			"keys": [
				"species (the property name)"
			],
			"message": "'Homo sapien' is not one of ['Drosophila melanogaster', 'Homo sapiens', 'Mus musculus', 'Mustela putorius furo', 'Rattus rattus', 'Sus scrofa']",
			"type": "ERROR"
		}
	],
	"id": "1d4e9bb0-515d-4158-b14b-770ab5077d8b (the GUID created for this record)",
	"related_cases": [],
	"type": "case (the node name)",
	"unique_keys": [
		{
			"project_id": "training (the project name)",
			"submitter_id": "training-case-02 (the record/entity submitter_id)"
		}
	],
	"valid": false,
	"warnings": []
}
```

The "action" above can be used to identify if the node was newly created or updated. Updating a node is submitting to a node with the same `submitter_id` and overwriting the existing node entries. Other useful information includes the "id" for the record. This is the GUID for the record and is unique throughout the entirety of the data commons. The other "unique_key" provided is the tuple "project_id" and "submitter_id", which is to say the "submitter_id" combined with the "project_id" is a universal identifier for this record.

To confirm that a data file is properly registered, enter the GUID of a data file record in the index API endpoint of the data commons: usually "https://data.mycommons.org/index/index/GUID", where "https://data.mycommons.org" is the URL of the Windmill data portal and GUID is the specific GUID of a registered data file. This should display a JSON response that contains the url that was registered. If the record was not registered successfully, it is likely an error message will occur. An error that says "access denied" might also occur if the user is not logged in or the session has timed out.

> __NOTE:__ For these user guides, https://data.mycommons.org is an example URL and will not be the actual URL of the data commons.

### Troubleshooting and Finishing the Submission
* * *

If the submission throws errors or claims the submission to be invalid, it will be the submitter's task to fix the submission. The best first step is to go through the outputs from the individual entities, as seen in the previous section. The errors fields will give a rough description of what failed the validation check. The most common problems are simple issues such as spelling errors, mislabeled properties, or missing required fields.


### Learning More About the Existing Submission
* * *

When viewing a project, clicking on a node name will allow the user to view the records in that node. From here a user can download, view, or completely delete records associated with any project they have delete access to.

![Node Click](Gen3_Model_Click_highlight.png)

![Node Information](Gen3_Model_node_view.png)

## 5. Upload Data Files to Object Storage
* * *

<h3> Preparing Data </h3>

Data files such as sequencing data (BAM, FASTQ), assay results, images, and PDFs should be uploaded with the Gen3 client.

For detailed instructions, visit the [Gen3 client documentation](gen3-client.md). The metadata TSVs do not need to be submitted to the object store, as they have already been submitted via the API.

* Downloaded the [compiled binary](https://github.com/uc-cdis/cdis-data-client/releases) for your operating system.
* Configure a profile with credentials:
`./gen3-client configure --profile <profile> --cred <credentials.json>`
* Upload a data file using its GUID:
`./gen3-client upload --profile <profile> --guid <GUID> --file=<filename>`
