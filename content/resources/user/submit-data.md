---
title: "Submit Data"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user
---

{{% markdownwrapper %}}
# Submitting metadata and data
* * *

## 1. Review the data model
* * *

### What is the data model?

Every Gen3 data commons employs a data model, which serves to describe and harmonize data sets, or organize data submitted by different contributors in a similar manner. Data harmonization facilitates cross-project analyses and is thus one of the pillars of the data commons paradigm.

The data model organizes experimental metadata variables, or "properties", into linked categories, or "nodes", through the use of a data dictionary. The data dictionary lists and describes all nodes in the data model, and it also defines and describes the properties (metadata variables) in each node.

For example, clinical variables like a primary cancer diagnosis or a subject's gender or race might go into the "diagnosis" or "demographic" nodes, respectively, while sample-related variables like how a tumor sample was collected and what analyte was extracted from it might go into the "biospecimen" or "analyte" nodes, respectively. Data files also have associated metadata variables like file size, format, and the file's location in object storage, and these properties are grouped into nodes that describe various types of data files, for example, "mri_image" for an MRI image data file.

Finally, each node in the data dictionary is linked in a logical manner to other nodes, which facilitates generating a visual overview, or graphical model, of a project.

The following image displays the data dictionary viewer, the 'biospecimen' node entry in the dictionary, and an example graphical model of a project:

![image of dd](/figs/data-model.png)

### Why Do Gen3 Commons Use a Data Model?

* Having all participating members use the same data model:
    * Allows for standardized metadata elements across a commons.
    * Permits flexible and scaleable API generation based on data commons software that reads the data model schema.   
    * Lets users query the commons API so that an ecosystem of applications can be built.
    * Helps automate the validation of submitted data.   

Once you have access to the Windmill data submission portal, we recommend reviewing the commons' specific data dictionary by clicking "Dictionary" in the top navigation bar. Here you can determine which properties best describe your submission. This tool will help you understand the variable types, requirements, and node dependencies or links for your submission.

If you have an submission element that you believe isn't currently described in the model, you will need to work with the commons to extend the data model. We suggest providing them with a description of the data elements that you'd like to add, and they will make sure the sponsor or data modeling working group reviews your request and finds an appropriate home for your data elements.

If you are developing your own data dictionary, such as for use with Docker Compose, please note that due to the graph nature of the data model, some nodes are dependent on others. In addition, the windmill service specifies nodes that are required for it run properly through preset parameters. For example, if windmill is set to use the default data dictionary, it will require the Case, Experiment, and Aliquot nodes. 


## 2. Prepare metadata TSVs for each node in your project
* * *
Data contributors will need to prepare metadata for their submission in tab-separated value (TSV) files for each node in their project.

It may be helpful to think of each TSV as a node in the graph of the data model. Column headers in the TSV are the properties (or metadata variables) stored in that node.  Each row is a "record" or "entity" in that node. Each record in every node will have a "submitter_id", which is a unique alphanumeric identifier for that record and is specified by the data submitter, and a "type", which is simply the node name.

Besides the "submitter_id" and "type", which are required for every record, other properties are either required or not, and this can be determined in the data dictionary's "Required" column for a specific node.

Example, template TSVs for your commons are provided in each node's page in the data dictionary.


### Determine Submission Order via Node Links
* * *
The prepared TSV files must be submitted in a specific order due to node links. Referring back to the graphical data model, you cannot submit a node without first submitting the nodes to which it is linked upstream. If you submit a metadata record out of order, that is, if you submit a record with a link to an upstream node that doesn't yet exist, the validator will reject the submission on the basis that the dependency you point to is not present with the error message "INVALID_LINK".


The "program" and "project" nodes are the most upstream nodes and are created by a commons administrator. So, the first node submitted by data contributor is usually the "study" or "experiment" node, which points directly upstream to the "project" node. Next, the study participants are recorded in the "case" node, and subsequently any clinical information (demographics, diagnoses, etc.), biospecimen data (biopsy samples, extracted analytes), etc., is linked to each case. Finally, metadata describing the actual raw data files to be uploaded to object storage are the last nodes submitted.


### Specifying Required Links
* * *
At least one link is required for every record in a TSV, and sometimes multiple links should be specified. The links are specified in a TSV with the variable header "<node>s.submitter_id", where <node> is the upstream node a record is linking to. The value of this variable is the specific submitter_id of the link (the record in that upstream node which the current record is linked to).

For example, if there are two studies in a project, "study-01" and "study-02", the "case.tsv" TSV file will be uploaded to describe the study participants enrolled in each study. Each row in the "case.tsv" file would describe a single study participant, and the first case has the submitter_id "case-01".  There would be at least one link in that TSV specified with the column header "studies.submitter_id", and each row would have either "study-01" or "study-02" as the value for this column.


### Specifying Multiple Links
* * *
Links can be one-to-one, many-to-one, one-to-many, and many-to-many. Since a single study participant can be enrolled in multiple studies, and a single study will have multiple cases enrolled in it, this link is "many-to-many". On the other hand, since a single study cannot be linked to multiple projects, but a single project can have many studies linked to it, the study -> project link is "many-to-one".

In the above example, if "case-01" was enrolled in both "study-01" and "study-02", then there would be two columns to specify these links in the case.tsv file: "studies.submitter_id#1" and "studies.submitter_id#2". The values would be "study-01" for one of them and "study-02" for the other.

Once the "case.tsv" file is uploaded and creates the record "case-01" in the "case" node, if "case-01" had a diagnosis record linked to it, then in the "diagnosis.tsv" file to be uploaded next, there would be a column header "cases.submitter_id" and the value would be "case-01" (the case's "submitter_id") to link this diagnosis record to that case.

## 3. Register data files with the Windmill data portal
* * *

Special attention must be given to "data file" nodes, which house variables that describe actual, raw data files that are to up be uploaded to object storage by the data contributor and later downloaded by data analysts. Specifically, data files must be "registered" in order to be downloadable using the Windmill data portal or the [cdis-data-client](https://github.com/uc-cdis/cdis-data-client/releases).

Registration of data files simply means adding a column in the data file node's TSV named "urls" and entering the URL/address of each file in object storage (row in the TSV) in that column. This is usually a location in a project folder of a data commons bucket in s3 object storage, e.g.: "s3://commons-bucket/project-name/filename".

For example, say the following local files need to be registered and then uploaded:


```
commandline-prompt$ ls -l
-rw-r--r--@  1 username  staff     6B May 30 15:18 file-1.dcm
-rw-r--r--@  1 username  staff     7B May 30 15:18 file-2.dcm
-rw-r--r--@  1 username  staff     8B May 30 15:18 file-3.dcm
```


Add a column 'urls' to the TSV and entering the full s3 path for each file in that column, e.g.,:


| type | submitter_id | filename | file_size | etc... | urls |
| :------------- | :------------- | :------------- | :------------- | :------------- | :------------- |
| mri_image | file-id-1 | file-1.dcm | 6 | ... | s3://commons-bucket/project-name/file1.txt |
| mri_image | file-id-2 | file-2.dcm | 7 | ... | s3://commons-bucket/project-name/file2.txt |
| mri_image | file-id-3 | file-3.dcm | 8 | ... | s3://commons-bucket/project-name/file3.txt |


Please make sure you check with the commons operator to make sure you have the correct commons bucket name prior to submitting a data file node TSV. Once the data files are registered, their metadata cannot be easily changed: the metadata record must be deleted and re-created.

Also be aware that metadata describing data files that will be uploaded to s3 object storage need to include the file size and md5sum in addition to the address of the file in s3 object storage. Therefore, before submitting data file metadata TSVs, make sure all of that information is included and correct so that data downloaders can confirm completeness of their download via the md5sum and file size.

## 4. Submit TSVs and validate metadata
* * *

### Begin your metadata TSV submissions

To get you started submitting metadata TSVs, the first node, "project", has already been created for you by a commons administrator. Now, remembering that TSVs must be submitted for each node in a specific order, begin with the first node downstream of project, often "study" or "experiment" and continue to submit TSVs until all data file nodes are submitted and properly registered.

From the Windmill data portal, click on "Data Submission" and then click "Submit Data" beside the project for which you wish to submit metadata TSVS.

To submit a TSV:
1) Login to the Windmill data portal for your commons
2) Click on "Data Submission" in the top navigation bar
3) Click on "Submit Data" by the project for which you wish to submit metadata
4) Click on "Upload File"
5) Navigate to your TSV and click "open", the contents of the TSV should appear in the grey box below
6) Click "Submit"

Now you should see a message that indicates either success (green "succeeded: 200") or failure (grey "failed: 400"). Further details can be reviewed by clicking on "DETAILS", which displays the API response in JSON form. Each record/entity that was submitted (each row in the TSV) gets a true/false value for "valid" and lists "errors" if it was not valid.

If you see anything other than success, check the other fields for any information on what went wrong with the submission. The most descriptive information will be found in the individual entity transaction logs. Each line in the TSV will have its own output with the following attributes:

{{< highlight json "linenos=table">}}
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
  "id": "1d4e9bb0-515d-4158-b14b-770ab5077d8b (the UUID created for this record)",
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
{{< /highlight >}}

The "action" above can be used to identify if the node was created new or just updated; when you resubmit, that is, submit to a node with the same submitter id, you will update the existing node. Other useful information includes the "id" for the record. This is the UUID for the record and is unique throughout the entirety of the data commons. The other "unique_key" provided is the tuple "project_id" and "submitter_id", which is to say the "submitter_id" combined with the "project_id" is a universal identifier for this record.

To confirm that a data file is properly registered, enter the UUID of a data file record in the index API endpoint of your data commons: usually "data.commons-name.org/index/index/UUID", where "data.commons-name.org" is the URL of the Windmill data portal and UUID is the specific UUID of a registered data file. You should see a JSON response that contains the url that was registered. If the record was not registered successfully, you will likely see an error message (you must be logged in or you will get an "access denied" type error).


### Troubleshooting and finishing your submission
* * *

If, against all odds, your TSV submission is perfect on the first try, you are finished with submission of that node, and you can move on to the next node. However, if the submission throws errors or claims your submission to be invalid, you will need to fix your submission.

The best first step is to go through the outputs from the individual entities. In the errors field will be a rough description of what failed the validation check. The most common problems are simple issues such as spelling errors, mislabeled properties, or missing required fields.


### How can I learn more about my existing submission?
* * *
When you are viewing a project, you can click on a node name to view the records in that node. From here you can download, view, or completely delete records associated with any project you have delete access to.


## 5. Upload data files to object storage
* * *

<h3> Preparing your data </h3>
Data files such as sequencing data (BAM, FASTQ), assay results, images, PDFs, etc., should be uploaded with the CDIS data client.
For detailed instructions, visit [the cdis-data client documentation](/appendices/cdis-data-client/). The metadata TSVs you prepared do not need to be submitted to the object store, as they have already been submitted via the API.

* Downloaded the [compiled binary](https://github.com/uc-cdis/cdis-data-client/releases) for your operating system.
* Configure a profile with credentials:
`./cdis-data-client configure --profile <profile> --cred <credentials.json>`
* Upload a data file using its UUID:
`./cdis-data-client upload --profile <profile> --uuid <UUID> --file=<filename>`

{{% /markdownwrapper %}}