---
title: "Gen3 - Data Contribution"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Submitting Data Files and Linking Metadata in a Gen3 Data Commons
* * *

The following guide details two methods a data contributor can take to submit a project and data to a Gen3 data commons.

Data in a Gen3 data commons are either stored in variables that are exposed to the API for query (what we refer to as 'metadata') or are stored in files that must be downloaded prior to knowing their content (or 'data files'). For more information on the difference between data files and metadata exposed to the API, see the documentation on the [data dictionary in a Gen3 data commons](/resources/user/dictionary).

The process of uploading a data project to a Gen3 data commons is flexible and simple. A combination of either of the following two methods can be combined as they follow the same basic workflow:

1. [Data Upload, Index, Ingest Methods](#1-data-upload-methods)
	1. [Graphical User Interface to upload files to Object Storage](/resources/user/gui-submission)
		1. [Prepare Project in Submission Portal](/resources/user/gui-submission#1-prepare-project-in-submission-portal)
		2. [Upload files to Object Storage with Gen3 GUI](/resources/user/gui-submission#2-upload-data-files-to-object-storage)
		3. [Map Uploaded Files to a Data File Node](/resources/user/gui-submission#3-map-uploaded-files-to-a-data-file-node)
	2. [Data Ingestion, Indexing Release Management (DIIRM) Workflow](/resources/user/diirm-submission)
		1. [Prepare Project with Gen3 sdk tools](/resources/user/diirm-submission#1-prepare-project-sdk)
		2. [Upload files to Object Storage with Cloud Resource Command Line Interface](/resources/user/diirm-submission#2-upload-data-files-to-object-storage-CLI-tools)
		3. [Create Bucket Mapping and Manifest files](/resources/user/Gen3-DIIRM-submission#3-Gen3-Indexd-sdk-creation-tools)
		4. [Create Indexing Manifest file](/resources/user/Gen3-DIIRM-submission#4-Gen3-indexing-manifest-file)
		5. [Submit file Indexing Manifest to Indexd](/resources/user/Gen3-DIIRM-submission#5-Gen3-Indexd-sdk-submission-tools)
		6. [Map Files to a Data File Node](/resources/user/Gen3-DIIRM-submission#6-Gen3-sheepdog-sdk-submission-tools)
2. [Submit Additional Project Metadata](#2-submit-additional-project-metadata)
3. [Link Data File Records to their Metadata Records](#3-link-files-to-their-metadata)

Data submission webinars are available at the official [Gen3 YouTube channel](https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/videos).

* * *

The following sections provide step-by-step instructions for this process:

## 1. Data Upload, Index and Ingest Methods

Contribution of data files can be performed with either the [Gen3 GUI](/resources/user/gui-submission) or [Gen3 DIIRM workflow](/resources/user/diirm-submission).  There are several reasons a data contributor may choose to utilize steps from either method and users might benefit from a cursory knowledge of both before submitting data.

A significant consideration is where data is to be located when being accessed by the end user.

Use of the GUI ingestion is simplified and is considered the better choice for single submissions.
Users with several submissions may prefer the DIIRM Workflow as scripting can be leveraged to produce relevant submission objects.

Once data files have been uploaded and mapped according to either of these two processes, the following steps can be initiated.

## 2. Submit Additional Project Metadata
* * *

Once data files have been mapped to the appropriate data file node, the rest of the project's metadata (e.g., patient clinical information, sample processing methods, pipeline/workflow parameters, etc.) should be submitted to the appropriate nodes. These metadata are submitted in [tab-separated value (TSV)](/resources/user/template-tsvs/) files for each node in the project, which can be downloaded from the "Dictionary" page of the data commons website.

It may be helpful to think of each TSV as a node in the graph of the data model. Column headers in the TSV are the properties stored in that node, and each row represents a "record" or "entity" in that node. When a TSV is successfully submitted, each row in that TSV becomes a single record in the node.

Properties in a node are either required or not, and this can be determined by referencing the data dictionary's viewer's "Required" column for a specific node.

There are a number of properties that deserve special mention:

* `submitter_id`: Each record in every node will have a `submitter_id`, which is a unique alphanumeric identifier (any combination of ASCII characters) for that record across the whole project and is specified by the data submitter. It is entirely up to the data contributor what the submitter_id will be for each record in a project, but the string chosen must be unique within that project.

* `type`: Every node has a `type` property, which is simply the name of the node. By providing the node name in the "type" property, the submission portal knows which node to put the data in.

* `id`: Every record in every node in a data commons has the unique property `id`, which is not submitted by the data contributor but rather generated on the backend. The value of the property `id` is a 128-bit UUID (a unique 32 character identifier).

* `project_id` and `code`: Every project record in a data commons is linked to a parent `program` node and has the properties `project_id` and a `code`. The property `project_id` is the dash-separated combination of `program` and the project's `code`. For example, if your project was named 'Experiment1', and this project was part of the 'Pilot' program, the project's `project_id` would be 'Pilot-Experiment1', and the project's `code` would be 'Experiment1'. Finally, just like every record in the data commons, the project has the unique property `id`, which is not to be confused with the project's `project_id`.

Template TSVs are provided in each node's page in the data dictionary.

![Template](Gen3_Dictionary_Subject_template_2020.png)

### Determine Submission Order via Node Links
* * *

The prepared TSV files must be submitted in a specific order due to node links. Referring back to the graphical data model, a record cannot be submitted without first submitting the record(s) to which it is linked upstream (its "parent"). If metadata are submitted out of order, such as submitting a TSV with links to parent records that don't yet exist, the validator will reject the submission on the basis that the dependency is not present with the error message, "INVALID_LINK".

The `program` and `project` nodes are the most upstream nodes and are created by a commons administrator. The first node submitted by data contributors after `core_metadata_collection` depends on the specific data dictionary employed by the data commons but is usually the `study` or `experiment` node, which points directly upstream to the `project` node.

Often the study participants are recorded in the `case` or `subject` node, and subsequently any clinical information (demographics, diagnoses, etc.), biospecimen data (biopsy samples, extracted analytes), or other experimental methods/details are linked to each case.

### More about Specifying Required Links
* * *

At least one link is required for every record in a TSV, and sometimes multiple links could be specified. The links are specified in a TSV with the variable header `<nodes>.submitter_id`, where <nodes\> the back-reference of the upstream node record is linking to. The value of this link variable is the specific `submitter_id` of the parent record. TSV or JSON templates that list all the possible link headers can be downloaded from the Data Dictionary Viewer on the data commons' website. Properties that represent these links such as “subjects.submitter_id” or “studies.submitter_id” are array variables and can take either a single submitter_id or a comma-separated list of `submitter_id`s in the case that a single record links to multiple records in its parent node.

For example, there are four cases in two studies in one `project`. The `study` node was made with two study `submitter_id`s: "study-01" and "study-02". The "case.tsv" file uploaded to describe the study participants enrolled will have a corresponding study.

#### case.tsv


| case | submitter_id | studies.submitter_id |
| --- | --- | --- |
| 1 | case_1 | study-01 |
| 2 | case_2 | study-02 |
| 3 | case_3 | study-01 |
| 4 | case_4 | study-01 |


In this example cases 1, 2, and 4 all belong to "study-01", but case 2 belongs to "study-02". All the cases have different `submitter_id`s and these will be used in the subtending node that refers to a specific case.

> __NOTE:__ The `submitter_id` needs to be unique not only within one node, but across all nodes in a project. The combination of `submitter_id` and `project_id` must be unique.

### Specifying Multiple Links
* * *

Links can be one-to-one, many-to-one, one-to-many, and many-to-many. Since a single study participant can be enrolled in multiple studies, and a single study will have multiple cases enrolled in it, this link is "many-to-many". On the other hand, since a single study cannot be linked to multiple projects, but a single project can have many studies linked to it, the study -> project link is "many-to-one".
Properties that represent links, like “subjects.submitter_id” or “studies.submitter_id” are array variables and can take either a single submitter_id or a comma-separated list of submitter_ids in the case that a single record links to multiple records in its parent node. Using the example above, the entry in the `studies.submitter_id` can be "study-01, study-02".


#### Deprecated version:

In the above example, if "case_2" was enrolled in both "study-01" and "study-02", then there would be two columns to specify these links in the case.tsv file: "studies.submitter_id#1" and "studies.submitter_id#2". The values would be "study-01" for one of them and "study-02" for the other.

| case | submitter_id | studies.submitter_id#1 | studies.submitter_id#2 |
| --- | --- | --- | --- |
| 1 | case_1 | study-01 | |
| 2 | case_2 | study-01 | study-02 |
| 3 | case_3 | study-01 | |
| 4 | case_4 | study-01 | |


### Begin Metadata TSV Submissions

To submit a TSV in the Windmill data portal:

1. Login to the Windmill data portal for the commons.

2. Click on "Submit Data" in the top navigation bar.

    ![Data Submission](Gen3_Toolbar_data_submission.png)

3. Click on "Submit Data" beside the project of interest to submit metadata.

    ![Submit Data](Gen3_Data_Submission_submit_data.png)

4. Click on "Upload File".

    ![Upload and Submit](Gen3_Data_Submission_Use_Form.png)

5. Navigate to the TSV and click "open". The contents of the TSV should appear in the grey box
below.

6. Click "Submit".

A message should appear that indicates either success (green, "succeeded: 200") or failure (grey, "failed: 400"). Further details can be reviewed by clicking on "DETAILS", which displays the API response in JSON form. Each record/entity that was submitted, gets a true/false value for "valid" and lists "errors" if it was not valid.

For anything other than success, check the other fields for any information on the error with the submission. The most descriptive information will be found in the individual entity transaction logs. Each line in the TSV will have its own output with the following attributes:

```
JSON
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

To confirm that a data file is properly registered, enter the GUID of a data file record in the index API endpoint of the data commons: usually "https://gen3.datacommons.io/index/index/GUID", where "https://gen3.datacommons.io" is the URL of the Windmill data portal and GUID is the specific GUID of a registered data file. This should display a JSON response that contains the URL that was registered. If the record was not registered successfully, it is likely an error message will occur. An error that says "access denied" might also occur if the user is not logged in or the session has timed out. Note, that for these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL from other data commons powered by Gen3.

> __Note:__ Gen3 users can also submit metadata using the Gen3 SDK, which is a Python library containing functions for sending standard requests to the Gen3 APIs. For example, the function `submit_file` from the **Gen3Submission** class will submit data in a spreadsheet file containing multiple records in rows to a Gen3 Commons. The code is open-source and available on [GitHub](https://github.com/uc-cdis/gen3sdk-python) along with [documentation for using it](https://uc-cdis.github.io/gen3sdk-python/_build/html/index.html). Furthermore, [this section](/resources/user/analyze-data/#4-using-the-gen3-sdk) describes steps on how to get started.

### Troubleshooting and Finishing the Submission
* * *

If the submission throws errors or claims the submission to be invalid, it will be the submitter's task to fix the submission. The best first step is to go through the outputs from the individual entities, as seen in the previous section. The errors fields will give a rough description of what failed the validation check. The most common problems are simple issues such as spelling errors, mislabeled properties, or missing required fields.


### Learning More About the Existing Submission
* * *

When viewing a project, clicking on a node name will allow the user to view the records in that node. From here a user can download, view, or completely delete records associated with any project they have delete access to.

![Node Click](Gen3_Model_Click_highlight.png)

![Node Information](Gen3_Model_node_view.png)

## 3. Link Files to their Metadata

Finally, once project metadata have been submitted, data file records are linked to the corresponding records in the parent node to allow filtering or querying of submitted data files based on these experimental/clinical metadata.

The easiest way to create the link between your data files' records and the records in their parent node is as follows:

1. Download a TSV or JSON of the data file records (see Note below).
2. Add the link to the appropriate parent record for each data file record by adding the parent record's `submitter_id`.
3. Go to the Data Submission page for your project and re-submit the data file records to update them with the new link.
4. Confirm in the graphical model that files are linked as expected.

> __Note:__ All records in a node can be downloaded in a single TSV file by hitting the data commons' data export API:

```
<commons-url>/api/v0/submission/<program>/<project>/export/?node_label=<node>&format=tsv
```

For example, the following link would download a single TSV containing all the `core_metadata_collection` records in the project "example-training" from the commons "https://gen3.datacommons.io":

https://gen3.datacommons.io/api/v0/submission/example/training/export/?node_label=core_metadata_collection&format=tsv

The links in the downloaded TSV can be updated by filling in the submitter_ids of the corresponding parent records, saving, and re-submitting the file to the data portal website using 'Upload File' as done in [step 4](#more-about-specifying-required-links).
