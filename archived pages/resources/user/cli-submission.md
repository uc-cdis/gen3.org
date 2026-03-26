---
title: "Gen3 - CLI-Data File Submission"
date: 2024-01-11
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Command Line Interface for Data File Submission Workflow
* * *

The following guide details the steps a data contributor must take to submit project data to a Gen3 data commons with the Command Line Interface for Data File Submission (CLI-DFS) workflow.

The CLI-DFS expedites ingestion and hosting of data in cloud buckets through a series of streamlined and automated steps that adhere to strict QA tests. In order to support the many advantages of using Gen3’s standard tooling, data needs to first be organized and copied to cloud buckets following the [guidelines](#3-upload-files-to-object-storage-with-cloud-resource-command-line-interface) detailed below.

As CLI-DFS is recommended for working with batches of data for ingestion, two dataset consent codes will be used as an example throughout.
* * *

## 1. Prepare Project with the Gen3 sdk tools
* * *
Though not strictly required to be done as a first step, a Gen3 project must be present in the [Sheepdog microservice](resources/developer/microservice/) to associate data files to before file indexing can take place. To achieve this, the [Gen3 Submission sdk](https://uc-cdis.github.io/gen3sdk-python/_build/html/_modules/gen3/submission.html) has a comprehensive set of tools to enable users to script submission of programs and projects.  Alternatively, the [GUI submission platform](/resources/user/submit-data#1) can be used to create a project.

Sample Code for submission of a Program and Project to a data commons:
```
import gen3
from gen3.submission import Gen3Submission

Gen3Submission.create_program(program_json)
Gen3Submission.create_project('test_program', project_json)
```

* * *
## 2. Selection and Granting Gen3 Secure Access to Cloud Resources
* * *

As Gen3 is considered "cloud agnostic", any or even multiple cloud resources can be configured to contain data for controlled end-user access.  If your data is already located in the cloud, please see the following [section](#3-upload-files-to-object-storage-with-cloud-resource-command-line-interface) for considerations in the structure and permissions settings.

End-user access to cloud resources is enabled by signed-urls with authorization checks within Gen3 to ensure valid and secure access.  Policies within the respective cloud resources should be configured in the Gen3 Fence Microservice to allow the; [Gen3 Auth Service Bot - AWS](https://github.com/uc-cdis/fence/blob/master/fence/config-default.yaml#L656), [Gen3 Auth Service Bot - Azure](https://github.com/uc-cdis/fence/blob/master/docs/azure_architecture.md) or [Gen3 Auth Service Bot - Google](https://github.com/uc-cdis/fence/blob/master/docs/google_architecture.md) to have access for the end user.

##### AWS S3 example bucket policy for READ access:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowListLocation",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::895962626746:user/fence_bot"
                ]
            },
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:s3:::<YOURBUCKETHERE>"
        },
        {
            "Sid": "AllowGetObject",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::895962626746:user/fence_bot"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::<YOURBUCKETHERE>/*"
        }
    ]
}
```

The location for the example AWS configuration posted above is available [here](https://github.com/uc-cdis/fence/blob/master/fence/config-default.yaml#L656).

* * *
## 3. Upload files to Object Storage with Cloud Resource Command Line Interface
* * *

Data can be uploaded to a single or separate cloud resources as long as requirements for access and authorization are met.  In order to support the many advantages of using Gen3’s standard tooling for CLI-DFS, data needs to first be organized and copied to cloud buckets following the guidelines detailed below.

### Allocating Data in Buckets Based on User Access

Gen3 has the capability to grant access granularity at the bucket level designation only.  In this way data a particular bucket should only be associated with a single user access.

#### Bucket Allocation Example:
A user’s authorization may look something like:

A user has read access to phs001416.c1, phs001416.c2, phs000974.c2

The data in buckets could be separated by phsid+consent code combinations (as this is the smallest granularity of data access required).

The following bucket structure supports the ingestion of dbGaP’s MESA and FHS projects (from TOPMed). Each project has 2 distinct consent groups, and the data is mirrored on both AWS and Google buckets.

TOPMed-MESA (phs001416.c1 and .c2)
TOPMed-FHS (phs000974.c1 and .c2)

| Project | AWS buckets | Google buckets |
| --- | --- | --- |
| MESA (consent group 1) | s3://nih-nhlbi-topmed-released-phs001416-c1 | gs://nih-nhlbi-topmed-released-phs001416-c1 |
| MESA (consent group 2) | s3://nih-nhlbi-topmed-released-phs001416-c2 | gs://nih-nhlbi-topmed-released-phs001416-c2 |
| FHS (consent group 1) | s3://nih-nhlbi-topmed-released-phs000974-c1 | gs://nih-nhlbi-topmed-released-phs000974-c1 |
| FHS (consent group 2) | s3://nih-nhlbi-topmed-released-phs000974-c2 | gs://nih-nhlbi-topmed-released-phs000974-c2 |

<br />

With a setup similar to this, Gen3 is able to support signed URLs and fully configured end-user access.

### Bucket Population

Once a data allocation scheme is determined, data can be uploaded accordingly to cloud buckets.  It should be noted that while Amazon AWS and Google are the most supported cloud providers, Gen3 is cloud agnostic.  Any method and hierarchy structure can be used for upload as long as a the same parent directory is maintained with end user access.

Regardless of the cloud platform, the CLI-DFS workflow requires file data gathered from its cloud location.  Information such as file name, location, size, and md5sum are usually available from cloud platforms.  Documentation for [AWS](https://aws.amazon.com/cli/), [Google](https://cloud.google.com/storage/docs/gsutil) and [Microsoft Azure](https://learn.microsoft.com/en-us/cli/azure/) should provide guidance to acquiring this information.

  >Note: The recommended (detailed here) way for Gen3 to provide controlled access to data is via Signed URLs. Signed URLs are the only fully cloud-agnostic method supported by Gen3 and additionally are supported by all major cloud resource providers. They also allow for short-lived, temporary access to the data for reduced risk.  Lastly, utilizing signed URLs places very few restrictions on the organization of data within could bucket(s).

* * *
The files relevant to a Gen3 CLI-DFS Workflow submission:

- Bucket mapping file: File that maps authorization designations to parent level bucket locations.

- Bucket manifest file: Created for each submission and contains file level information (i.e. name, size, md5sum)

- Indexing manifest: Created for each submission and submits both authorization and file level information into the [Indexd microservice](https://github.com/uc-cdis/indexd).

The creation and submission of these files is covered below.

  >Note: The recommended (and simplest) way for Gen3 to provide controlled access to data is via Signed URLs. Signed URLs are the only fully cloud-agnostic method supported by Gen3 and additionally are supported by all major cloud resource providers. They also allow for short-lived, temporary access to the data for reduced risk.  Lastly, utilizing signed URLs places very few restrictions on the organization of data within could bucket(s).

* * *
## 4. Create Bucket Mapping and Manifest Files
* * *

The below is the Gen3 recommended indexing file schema. While possible to utilize other configurations, they likely require significantly more administrative effort to maintain correct permissions in the cloud platform(s).

### Bucket Mapping File
A Bucket mapping file is used maintain clear links between designated project authorization and parent level bucket locations. It should be maintained for the entire commons and appended when new datasets are ingested. The bucket mapping file should minimally contain the following fields and be presented in a tab delimited format.

The below example has 4 different authorizations for 8 bucket locations

#### Example Bucket Mapping File

| bucket | authz |
| --- | --- |
| s3://nih-nhlbi-topmed-phs001416-c1 | phs001416.c1 |
| gs://nih-nhlbi-topmed-phs001416-c1 | phs001416.c1 |
| s3://nih-nhlbi-topmed-phs001416-c2 | phs001416.c2 |
| gs://nih-nhlbi-topmed-phs001416-c2 | phs001416.c2 |
| s3://nih-nhlbi-topmed-phs000974-c1 | phs000974.c1 |
| gs://nih-nhlbi-topmed-phs000974-c1 | phs000974.c1 |
| s3://nih-nhlbi-topmed-phs000974-c2 | phs000974.c2 |
| gs://nih-nhlbi-topmed-phs000974-c2 | phs000974.c2 |

<br />
In the situation where Gen3 must support cloud-specific data access methods, Gen3 also requires the authz or acl column which contain the granular access control which would represent access to the entire bucket).

The authz column coordinates with the user permissions set in the Gen3 microservices [Fence](https://github.com/uc-cdis/fence) and [Arborist](https://github.com/uc-cdis/arborist).

### Bucket Manifest File
The bucket manifest file should contain individual file level metadata for a single batch of ingestion files. This means there will be several bucket manifest files per data commons. It is recommended that they are represented in a tab separated variable format and in each, a row should minimally contain the following information:

- File Name
- File Size
- File hash via md5sum
- Exact file url in the bucket location

If files are mirrored between cloud locations, bucket urls can be appended together with a whitespace delimiter.

In the below example of an Bucket manifest file, please note the mirrored file bucket locations in S3 and GCP:

#### Example Bucket Manifest File

| File_name | File_size | md5sum | bucket_urls |
| --- | --- | --- | --- |
| examplefile.txt | 123456 | sample_md5 | s3://nih-phs001416-c1/exfile.txt gs://nih-phs001416-c1/exfile.txt |
| otherexamplefile.txt | 123456 | different_md5 | s3://nih-nhlbi-topmed-released-phs001416-c1/otherexamplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c1/otherexamplefile.txt |
| examplefile.txt | 123456 | sample_md5 | s3://nih-nhlbi-topmed-released-phs001416-c2/examplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c2/examplefile.txt |
| otherexamplefile.txt | 123456 | different_md5 | s3://nih-nhlbi-topmed-released-phs001416-c2/otherexamplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c2/otherexamplefile.txt |

* * *
## 5. Create Indexing Manifest File
* * *

An Indexing Manifest File is submitted to the [Indexd microservice](https://github.com/uc-cdis/indexd) and is a combination of both the Bucket Mapping and Manifest file information.

While the two preceding files are not strictly necessary for maintenance and operation of a Gen3 data commons, they are recommended for ease of maintenance. For instance, if multiple authorization designations are required within a single bucket location, administrators will need to set them individually directly in the cloud platform as Gen3 has no capability to interact with cloud resource permissions in that manner.

### Indexd Microservice Overview

The [Indexd microservice](https://github.com/uc-cdis/indexd) is used by Gen3 to maintain an index of all files in a data commons and serves as the data source by several other microservices to build various features of Gen3 data commons. A central part of what enables Gen3's Indexd is the integration of a [Globally Unique Identifier (GUID)](https://dataguids.org/#) to each element added to the microservice.

### Globally Unique Identifier (GUID)
GUIDs are primarily used to track and provide the current location of data and is designed to persist even as data is moved or copied. Information regarding the concept of GUIDs, GUID generation and look up of particular GUIDs can be found at [dataguids.org](https://dataguids.org/#).

### Indexing Manifest Components and Structure
By default GUIDs will be added to rows that lack an entry for that field when an indexing manifest is submitted to Indexd. GUIDs that are minted in this way are both available by querying Indexd or by referencing the submission output file that is generated.

As the Indexing Manifest is the file that is submitted to the [Indexd microservice](https://github.com/uc-cdis/indexd), it must be submitted in a tab separated variable file (.tsv) and contain the following fields:

- Globally Unique Identifier (GUID) - Either generated by indexd microservice at the time of submission or provided by the user prior to submission
- File Name
- File Size
- File hash via md5sum
- Exact file url in the bucket location
- authz or acl authorization designation

Users may notice that with the exception of GUIDs, this file is a combination of the Bucket Mapping and Manifest files.  If either AWS or Google cloud resources are used, Gen3 offers tools to produce bucket manifest files available at the following links:

- [AWS S3 Bucket Manifest Generation](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md)
- [Google Bucket Manifest Generation](https://github.com/uc-cdis/cloud-automation/blob/master/doc/gcp-bucket-manifest.md)

    >Note: Bucket manifest generation scripts require using Gen3's full deployment code and, depending on the amount of data, calculating checksums for files can be costly and take time.

The below is an example of a Indexing Manifest File:

#### Example Indexing Manifest File

| guid | File_name | File_size | md5sum | bucket_urls | auth |
| --- | --- | --- | --- | --- | --- |
| dg.4503/02... ...7103bbe | examplefile.txt | 34141 | c79... ...dbd | s3://nih-phs001416-c1/exfile.txt gs://nih-phs001416-c1/exfile.txt | [phs001416.c1] |
| dg.4503/00... ...0211dfg | otherexamplefile.txt | 562256 | 65a... ...bca | s3://nih-nhlbi-topmed-released-phs001416-c1/otherexamplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c1/otherexamplefile.txt | [phs001416.c1] |
| dg.4503/00... ...7103bbe | examplefile.txt | 36564 | dca... ...774 | s3://nih-nhlbi-topmed-released-phs001416-c2/examplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c2/examplefile.txt | [phs001416.c2] |
| dg.4503/01... ...0410nnd | otherexamplefile.txt | 2675 | 742... ...f1b | s3://nih-nhlbi-topmed-released-phs001416-c2/otherexamplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c2/otherexamplefile.txt | [phs001416.c2] |

* * *
## 6. Submit file Indexing Manifest to Indexd
* * *

Once created, Gen3 offers an [Indexing sdk toolkit](https://uc-cdis.github.io/gen3sdk-python/_build/html/tools/indexing.html) to build, validate and map all files into a Gen3 datacommons. The sdk functions reconcile and add data to the indexd microservice.

Sample code for validation and submission of a constructed indexing manifest file to indexd.
```
import gen3
from gen3.tools.indexing import validate_manifest_format
from gen3.tools.indexing.index_manifest import index_object_manifest

file_path = <.tsv_indexd_file_addition>

gen3.tools.indexing.validate_manifest_format.is_valid_manifest_format(file_path)

gen3.tools.indexing.index_manifest.index_object_manifest(commons_url=commons_url,
                                                                       manifest_file=file_path,
                                                                       thread_num=8,
                                                                       auth=authentication_object,
                                                                       output_filename=index_manifest[:-4] + '_output.tsv')
```

*Please refer to the [authentication sdk](https://uc-cdis.github.io/gen3sdk-python/_build/html/auth.html) for set up of the authentication_object used above*

*Note: Users in the Gen3-Community have published [repos](https://github.com/jacquayj/gen3-s3indexer-extramural) that index large pre-existing s3 buckets (disclaimer: CTDS is not responsible for the content and opinions on the third-party repos).*

* * *
## 7. Map files to a Data Node with the Gen3 SDK
* * *

Once indexing is complete, Gen3 offers a [Submission sdk toolkit](https://uc-cdis.github.io/gen3sdk-python/_build/html/submission.html) to map indexed data files to nodes designated to contain data in the [data dictionary](/resources/user/dictionary/#what-is-a-data-dictionary-and-data-model) via the [Sheepdog microservice](https://github.com/uc-cdis/sheepdog).  Unless single data files are being ingested, the sdk submission toolkit generally requires a tab separated variable file, and specific nodes requirements for each data file type can be specified in the data dictionary. After mapping in Sheepdog is complete the file metadata will be mapped from the [program and project](/resources/user/cli-submission#1-prepare-project-sdk) administrative nodes (previously created) to its respective data containing nodes. The mapping in sheepdog is the basis for other search and query services either natively in sheepdog or after other extraction, tranformation and load [(ETL)](/resources/operator/#8-etl-and-data-explorer-configurations) services have been performed.

* * *

To continue your data submission return to the main [Gen3 - Data Contribution](/resources/user/submit-data/#4-submit-additional-project-metadata) page.

{{% /markdownwrapper %}}
