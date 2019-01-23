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

The following guide details the steps a data contributor must take to submit a project to a Gen3 data commons.

Data in a Gen3 data commons is either stored in variables that are exposed to the API for query (what we refer to as 'metadata') or it is stored in files that must be downloaded prior to knowing their content (or 'data files'). For more information on the difference between data files and metadata exposed to the API, see the documentation on [data types in a Gen3 data commons](/resources/user/data-types).

The process of uploading a data project to a Gen3 data commons is simple:

	1. Prepare Project in Submission Portal
	2. Upload Data Files to Object Storage
	3. Map Uploaded Files to a Data File Node
	4. Submit Additional Project Metadata
	5. Link Files to their Metadata

The following sections provide step-by-step instructions for this process:

## 1. Prepare Project in Submission Portal
* * *
<!--
This section could be removed if we (semi)automate CMC creation for users
-->

In order to upload data files, at least one record in the `core_metadata_collection` node must exist. If your project already has at least one record in this node, you can skip to step 2 below.

Do the following to create your first `core_metadata_collection` record:

	1. Go to your data commons' submission portal website
	2. Click on 'Submit Data'
	3. Find your project in the List of Projects and click 'Submit Data'
	4. Click 'Use Form Submission' and choose `core_metadata_collection` from the dropdown list
	5. Fill in the required information: minimally, the `submitter_id` and the `projects.code` (the name of your project without the "program-" prefix). If your project url is https://data.mycommons.org/example-training, your project's `code` would be just 'training', the `program` would be 'example', and your `project_id` would be the combination: 'example-training'.
	6. Click 'Upload submission json from form' and then 'Submit'
	7. Make note of the `submitter_id` of your `core_metadata_collection` record for step 3 below

You should have received the message:
succeeded: 200
Successfully created entities: 1 of core_metadata_collection

If you received any other message, then check the 'Details' to help determine the error.

To view the records in the `core_metadata_collection` node in your project, you can go to:
https://data.mycommons.org/example-training/search?node_type=core_metadata_collection

## 2. Upload Data Files to Object Storage
* * *

Data files such as spreadsheets, sequencing data (BAM, FASTQ), assay results, images, PDFs, etc., are uploaded to object storage with the command-line tool gen3-client.

	1. Download the latest [compiled binary](https://github.com/uc-cdis/cdis-data-client/releases/latest) for your operating system.
	2. Configure a profile with credentials downloaded from your Profile:  

	```
	./gen3-client configure --profile=<profile_name> --cred=<credentials.json> --apiendpoint=<api_endpoint_url>

	```
	3. Upload Files: single data file, a directory of files, or matching files

	```
	./gen3-client upload --profile=<profile_name> --upload-path=~/files/example.txt

	./gen3-client upload --profile=<profile_name> --upload-path=~/files/

	./gen3-client upload --profile=<profile_name> --upload-path=~/files/*.txt

	```

For detailed instructions on configuring and using the gen3-client, visit the [Gen3 client documentation](/resources/user/gen3-client).

## 3. Map Uploaded Files to a Data File Node
* * *

Once data files are successfully uploaded, the files must be mapped to the appropriate node in the data model before they're accessible to authorized users.

	1. Go to your data commons submission portal website.
	2. Click 'Submit Data'.
	![submit-data.png](submit-data.png)
	3. Click 'Map My Files' button.
	![map_my_files.png](map_my_files.png)
	4. Select the files to map using the checkboxes and click 'Map Files' button.
	![select-files.png](select-files.png)
	5. Select the project and node that the files belong to.
	![map-to-node.png](map-to-node.png)
	6. Fill out the values of any required properties and click 'Submit' button.
	![fill-required-properties.png](fill-required-properties.png)

> __Note:__ The required property 'Type' in step 6 is the node's name (the 'type' of node) and should be the same as the value selected from the node dropdown list in step 5.

You should receive the message "# files mapped successfully!" upon success.

## 4. Submit Additional Project Metadata
* * *

Once data files have been mapped to the appropriate data file node, the rest of the project's metadata (e.g., patient clinical information, sample processing methods, pipeline/workflow parameters, etc.) should be submitted to the appropriate nodes. These metadata are submitted in tab-separated value (TSV) files for each node in the project, which can be downloaded from the "Dictionary" page of the data commons website.

It may be helpful to think of each TSV as a node in the graph of the data model. Column headers in the TSV are the properties stored in that node, and each row represents a "record" or "entity" in that node. When a TSV is successfully submitted, each row in that TSV becomes a single record in the node.

Properties in a node are either required or not, and this can be determined by referencing the data dictionary's viewer's "Required" column for a specific node.

There are a number of properties that deserve special mention:

	* `submitter_id`: Each record in every node will have a `submitter_id`, which is a unique alphanumeric identifier (any combination of ASCII characters) for that record across the whole project and is specified by the data submitter. It is entirely up to the data contributor what the submitter_id will be for each record in a project, but the string chosen must be unique within that project.

	* `type`: Every node has a `type` property, which is simply the name of the node. By providing the node name in the "type" property, the submission portal knows which node to put the data in.

	* `id`: Every record in every node in a data commons has the unique property `id`, which is not submitted by the data contributor but rather generated on the backend. The value of the property `id` is a 128-bit UUID (a unique 32 character identifier).

	* `project_id` and `code`: Every project record in a data commons is linked to a parent `program` node and has the properties `project_id` and a `code`. The property `project_id` is the dash-separated combination of `program` and `code`. For example, if your project was named 'Experiment1', and this project was part of the 'Pilot' program, the project's `project_id` would be 'Pilot-Experiment1', and the project's `code` would be 'Experiment1'. Finally, just like every record in the data commons, the project has the unique property `id`, which is not to be confused with the project's `project_id`.

Template TSVs are provided in each node's page in the data dictionary.

![Template](Gen3_Dictionary_Subject_template.png)

### Determine Submission Order via Node Links
* * *

The prepared TSV files must be submitted in a specific order due to node links. Referring back to the graphical data model, a record cannot be submitted without first submitting the record(s) to which it is linked upstream (its "parent"). If metadata are submitted out of order, such as submitting a TSV with links to parent records that don't yet exist, the validator will reject the submission on the basis that the dependency is not present with the error message, "INVALID_LINK".

The `program` and `project` nodes are the most upstream nodes and are created by a commons administrator. The first node submitted by data contributors after `core_metadata_collection` depends on the specific data dictionary employed by the data commons but is usually the `study` or `experiment` node, which points directly upstream to the `project` node.

Often next the study participants are recorded in the `case` or `subject` node, and subsequently any clinical information (demographics, diagnoses, etc.), biospecimen data (biopsy samples, extracted analytes), or other experimental methods/details are linked to each case.

### More about Specifying Required Links
* * *

At least one link is required for every record in a TSV, and sometimes multiple links could be specified. The links are specified in a TSV with the variable header `<nodes>.submitter_id`, where <nodes\> is the back-reference of the upstream node the record is linking to. The value of this link variable is the specific `submitter_id` of the parent record. TSV or JSON templates that list all the possible link headers can be downloaded from the Data Dictionary Viewer on the data commons' website.

For example, there are four cases in two studies in one `project`. The `study` node was made with two study `submitter_id`s: "study-01" and "study-02". The "case.tsv" file uploaded to describe the study participants enrolled will have a corresponding study.

#### case.tsv

|case|	submitter_id|	studies.submitter_id|
|--|--|--|
|1|case_1|study-01|
|2|case_2|study-02|
|3|case_3|study-01|
|4|case_4|study-01|

In this example cases 1, 2, and 4 all belong to "study-01", but case 2 belongs to "study-02". All the cases have different `submitter_id`s and these will be used in the subtending node that refers to a specific case.

> __NOTE:__ The `submitter_id` needs to be unique not only within one node, but across all nodes in a project. The combination of `submitter_id` and `project_id` must be unique.

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

### Begin Metadata TSV Submissions

From the Windmill data portal, click on "Data Submission" and then click "Submit Data" beside the project for which the metadata TSVs are being submitted.

To submit a TSV:

	1. Login to the Windmill data portal for the commons.
	2. Click on "Data Submission" in the top navigation bar.
	![Data Submission](Gen3_Toolbar_data_submission.png)
	3. Click on "Submit Data" by the project to submit metadata.
	![Submit Data](Gen3_Data_Submission_submit_data.png)
	4. Click on "Upload File".
	![Upload and Submit](Gen3_Data_Submission_Use_Form.png)
	5. Navigate to the TSV and click "open", the contents of the TSV should appear in the grey box below.
	6. Click "Submit".

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

## 5. Link Files to their Metadata

Finally, once project metadata have been submitted, data file records are linked to the corresponding records in the parent node to allow filtering or querying of submitted data files based on these experimental/clinical metadata.

The easiest way to create the link between your data files' records and the records in their parent node is as follows:

	1. Download a TSV or JSON of the data file records.
	2. Add the link to the appropriate parent record for each data file record by adding the parent record's `submitter_id`
	3. Go to the Data Submission page for your project and re-submit the data file records to update them with the new link.
	4. Confirm in the graphical model that files are linked as expected.
