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

The following guide details the steps a data contributor must take to submit a project to a Gen3 data commons. Feel free to take a look at our webinars about data submission to our Gen3 data commons on our [YouTube channel](https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/videos).

Data in a Gen3 data commons are either stored in variables that are exposed to the API for query (what we refer to as 'metadata') or are stored in files that must be downloaded prior to knowing their content (or 'data files'). For more information on the difference between data files and metadata exposed to the API, see the documentation on the [data dictionary in a Gen3 data commons](/resources/user/dictionary).

The process of uploading a data project to a Gen3 data commons is simple:

1. [Prepare Project in Submission Portal](#1-prepare-project-in-submission-portal)
2. [Upload Data Files to Object Storage](#2-upload-data-files-to-object-storage)
3. [Map Uploaded Files to a Data File Node](#3-map-uploaded-files-to-a-data-file-node)
4. [Submit Additional Project Metadata](#4-submit-additional-project-metadata)
5. [Link Data File Records to their Metadata Records](#5-link-files-to-their-metadata)

* * *

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
4. Click 'Use Form Submission' and choose `core_metadata_collection` from the dropdown list (or [edit and upload this TSV](gen3_core_metadata_collection_template.tsv) by clicking 'Upload File' then 'Submit')
5. Fill in the required information (see Note below)
6. Click 'Upload submission json from form' and then 'Submit'
7. Make note of the `submitter_id` of your `core_metadata_collection` record for step 3 below

>__Note:__ Minimally, `submitter_id` and `projects.code` are required properties. The project `code` is the name of your project without the "program-" prefix. For example, if your project URL is https://gen3.datacommons.io/example-training, your project's `code` would be 'training', the `program` would be 'example', and your `project_id` would be the combination: 'example-training'.

You should have received the message:

```
succeeded: 200
Successfully created entities: 1 of core_metadata_collection
```

If you received any other message, then check the 'Details' to help determine the error.

To view the records in the `core_metadata_collection` node in your project, you can go to:
https://gen3.datacommons.io/example-training/search?node_type=core_metadata_collection
(replacing the first part of that URL with the URL of your actual project).

## 2. Upload Data Files to Object Storage
* * *

Data files such as spreadsheets, sequencing data (BAM, FASTQ), assay results, images, PDFs, etc., are uploaded to object storage with the [gen3-client command-line tool](/resources/user/gen3-client).

1. Download the latest [compiled binary](https://github.com/uc-cdis/cdis-data-client/releases/latest) for your operating system.
2. Configure a profile with credentials downloaded from your Profile:

	```
	./gen3-client configure --profile=<profile_name> --cred=<credentials.json> --apiendpoint=<api_endpoint_url>

	```
3. Upload Files: single data file, a directory of files, or matching files:

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

    ![map_my_files.png](map-my-files.png)

4. Select the files to map using the checkboxes and click 'Map Files' button.

    ![select-files.png](select-files.png)

5. Select the project and node that the files belong to.

    ![map-to-node.png](map-to-node.png)

6. Fill in the values of any required properties and click 'Submit' button.

    ![fill-required-properties.png](fill-required-properties.png)


> __Note:__ The required property 'Type' in step 6 is the node's name (the 'type' of node) and should be the same as the value selected from the node dropdown list in step 5.

You should receive the message "# files mapped successfully!" upon success.

## 4. Submit Additional Project Metadata
* * *

Once data files have been mapped to the appropriate data file node, the rest of the project's metadata (e.g., patient clinical information, sample processing methods, pipeline/workflow parameters, etc.) should be submitted to the appropriate nodes. These metadata are submitted in [tab-separated value (TSV)](https://gen3.org/resources/user/template-tsvs/) files for each node in the project, which can be downloaded from the "Dictionary" page of the data commons website.

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

At least one link is required for every record in a TSV, and sometimes multiple links could be specified. The links are specified in a TSV with the variable header `<nodes>.submitter_id`, where <nodes\> the back-reference of the upstream node record is linking to. The value of this link variable is the specific `submitter_id` of the parent record. TSV or JSON templates that list all the possible link headers can be downloaded from the Data Dictionary Viewer on the data commons' website.

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

In the above example, if "case_2" was enrolled in both "study-01" and "study-02", then there would be two columns to specify these links in the case.tsv file: "studies.submitter_id#1" and "studies.submitter_id#2". The values would be "study-01" for one of them and "study-02" for the other.


| case | submitter_id | studies.submitter_id#1 | studies.submitter_id#2 |
| --- | --- | --- | --- |
| 1 | case_1 | study-01 | |
| 2 | case_2 | study-01 | study-02 |
| 3 | case_3 | study-01 | |
| 4 | case_4 | study-01 | |


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

5. Navigate to the TSV and click "open". The contents of the TSV should appear in the grey box
below.

6. Click "Submit".

A message should appear that indicates either success (green, "succeeded: 200") or failure (grey, "failed: 400"). Further details can be reviewed by clicking on "DETAILS", which displays the API response in JSON form. Each record/entity that was submitted, gets a true/false value for "valid" and lists "errors" if it was not valid.

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

To confirm that a data file is properly registered, enter the GUID of a data file record in the index API endpoint of the data commons: usually "https://gen3.datacommons.io/index/index/GUID", where "https://gen3.datacommons.io" is the URL of the Windmill data portal and GUID is the specific GUID of a registered data file. This should display a JSON response that contains the URL that was registered. If the record was not registered successfully, it is likely an error message will occur. An error that says "access denied" might also occur if the user is not logged in or the session has timed out.

> __NOTE:__ For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL from other data commons powered by Gen3.

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



## Linking Data from external Data Clouds to Gen3 Data Commons
It is possible to link data on Gen3 that is stored on other cloud services (Amazon Web Services AWS, Google Cloud Storage GCS) by a process called DIIRM (Data Ingestion, Integration, and Release Management). If you have a bucket of files and want to link the data to Gen3 you can find below a step-by-step guide to do so. Before going forward, you need to 1) know the signed URL from the bucket and 2) make sure you have access to the external bucket.

- Create a manifest as a TSV file that contains all files that exist in the respective bucket. This manifest *has* to contain the following properties at the minimum: md5sum hash, file size in bytes, and the full bucket url.

| size | md5 | acl | urls | guid | authz |
|------|-----|-----|------|------|-------|
|      |     |     |      |      |       |
|      |     |     |      |      |       |

In the manifest, providing the GUID is not mandatory as IndexD will index the files automatically.
If you want to authorize the access to the files, you need to add consent groups in `authz` and `acl`.
`authz` and `acl` are an Arborist resource or a Gen3 path following the Gen3 structure of programs and projects. In other words, you can index all the files with the project's `authz`, if you want a bucket to be tied to a project. The Gen3 resource path in the `authz` field must be able to map to user-permissions provided during an authorization sync (e.g. from dbGaP or a `user.yaml`). `acl` is only advised if you want to customize access to individual objects within a bucket, since IAM permissions will generally apply to all objects within a bucket. Please contact us if more information are required.
If the bucket contains too many files to download locally, [CTDIS-owned scripts](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md) can generate an object manifest of an s3 bucket in cloud-automation.

- The manifest needs to be indexed, which is done by uploading the TSV file using the [Gen3 python SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md#indexing-manifest) (not the gen3-client) or in the [user interface (UI)](https://gen3.datacommons.io/indexing). If the UI does not appear on your commons (after replacing the core url), please get in contact with us to set up the environment.

- After indexing, download the manifest that includes now the GUIDs from either the UI or using the [Gen3 python SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md#download-manifest). Note that the GUID represents now the `object_id` property in the Gen3 data dictionary for the category `data_files`.

(If you are using cloud-automation, bullets 2 and 3 are done by a [Sower job](https://github.com/uc-cdis/sower-jobs/blob/master/README.md#manifest-indexing).)

- Once these files are indexed, you can create a submission file for the Gen3 graph model. You can now choose between two options.
For the first option, you can link the new data by creating a `core_metadata_collection` entity, linking it to the data_file node, and submitting your data files directly to the data_file node. For the second option, you can create a structured chain of metadata according to the Gen3 graph model to obtain the link to the data_file node. Then, you can submit the files to the data_file node. Submission can be done either in Windmill or using the [Gen3 python SDK](https://uc-cdis.github.io/gen3sdk-python/_build/html/submission.html).

### Linking Data from external Data Clouds to Gen3 Data Commons - Example 1000 Genomes
In this guide, we show the process described above by running an example using the publicly accessible data files in the 1000 Genomes Project bucket hosted by AWS.
Example bucket: http://s3.amazonaws.com/1000genomes

Login into AWS with your host institution or [create your own account](aws.amazon.com/ec2). Create your [keypair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html#create-a-key-pair) and save it under `~/.ssh`. Make sure to edit the resource in user credential policies under Identity and Access Management (IAM) in your EC2 instance. Insert the Amazon Resource Name (ARN) into the policies JSON, even if it's a public bucket. For this example, the ARNs are `arn:aws:s3:::1000genomes` and `arn:aws:s3:::1000genomes/*`.

Then, you need to launch your AWS instance in the browser. In the tab "Choose AMI", find `ami-fad40b93` under community AMIs, as described [here](https://www.internationalgenome.org/using-1000-genomes-data-amazon-web-service-cloud), select `t1.micro` (free tier), make sure you are at us-east-1 (N. Virginia, top right corner in drop-down menu), and select the storage as paid for. Choose your keypair, and launch your instance.

Then, find and install the client [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html). After successful installation, AWS needs to be [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) in the terminal
```
aws configure
```
Where you need to insert the information from your keypair:
```
10:47:36  /usr/local/bin: aws configure
AWS Access Key ID [*******************2]:
AWS Secret Access Key [*******************H]:
Default region name [None]: us-east-1
Default output format [None]:
```

To access the bucket structure and find files, run
```
aws s3 ls s3//:bucketname
```

To copy files to your local environment run
```
aws s3 cp s3://1000genomes/[path-to-file] [local-path]
aws s3 cp s3://1000genomes/sequence_indices/20091216_20100311.stats.csv /usr/local/bin/sower_test/
```
More documentation about AWS CLI terminal commands can be found [here](https://aws.amazon.com/cli/#file_commands_anchor).

After finding the path to file in the bucket, calculating size and md5sum, the manifest can be created. In our example, the access is open, so an asterisk can be inserted into the `acl` column. No specific access is given in `authz`.

| size | md5                              | acl | urls                                                          | guid | authz |
|------|----------------------------------|-----|---------------------------------------------------------------|------|-------|
| 745  | 613ccfbc68287db60c663519dab6a4ff | *   | s3://1000genomes/sequence_indices/20091216_20100311.stats.csv |      |       |
|      |                                  |     |                                                               |      |       |
|      |                                  |     |                                                               |      |       |


The outcome of the indexed manifest will be then uploaded to the CMD node.







[//]: # ssh -i ~/.ssh/my_key_pair_here.pem onekgenomes@ec2-23-20-189-94.compute-1.amazonaws.com
