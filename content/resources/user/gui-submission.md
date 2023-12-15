---
title: "Gen3 - GUI Submission"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# GUI Submission of Data Files
* * *

The following guide details the steps a data contributor must take to submit a project to a Gen3 data commons with the Graphical User Interface (GUI).

* * *

## 1. Prepare Project in Submission Portal
* * *
<!--
This section could be removed if we (semi)automate CMC creation for users
-->

In order to upload data files, at least one record in the `core_metadata_collection` node must exist. If your project already has at least one record in this node, you can skip to step 2 below.

Do the following to create your first `core_metadata_collection` record:

1. Go to your data commons' submission portal website
2. Click on 'Submit Data'
3. Find your project in the list of Projects and click 'Submit Data'
4. Click 'Use Form Submission' and choose `core_metadata_collection` from the dropdown list (or [edit and upload this TSV](gen3_core_metadata_collection_template.tsv) by clicking 'Upload File' then 'Submit')

    ![node_dropdown.png](node_dropdown.png)

    ![cmc_form.png](cmc_form.png)


5. Fill in the required information (see note below)
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

 >__Note:__ if your data files are already located in cloud storage, such as an AWS or GCS bucket, please see [this page](/resources/user/submit-data/sower) on how to make these files available in a Gen3 data commons.

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

* * *

To continue your data submission return to the main [Gen3 - Data Contribution](/resources/user/submit-data/#4-submit-additional-project-metadata) page.
