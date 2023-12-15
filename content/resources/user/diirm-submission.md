---
title: "Gen3 - DIIRM Submission"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# DIIRM Submission of Data Files
* * *

The following guide details the steps a data contributor must take to submit project data to a Gen3 data commons with the Data, Ingest, Index, Resource Management (DIIRM) system.
The goal of DIIRM is to expedite the ingestion and hosting of data in cloud buckets through a series of streamlined, automated and systematic steps that adhere to strict QA tests. In order to support the many advantages of using Gen3’s standard tooling for DIIRM, data needs to first be organized and copied to cloud buckets following the guidelines detailed below.

* * *

## 1. Prepare Project with the Gen3 sdk tools
* * *
In order to submit data files, a Gen3 project must be present to associate the files to. The [Gen3 Submission sdk](https://uc-cdis.github.io/gen3sdk-python/_build/html/_modules/gen3/submission.html) has a comprehesive set of tools to enable users to script submission of projects.

Sample Code for submission of a Project to a data commons:
```
sample code
```

* * *
## 2. Upload files to Object Storage with Cloud Resource Command Line Interface
* * *

Data can be submitted to a separate cloud resource as long as requirements for access and authorization are met.  In order to support the many advantages of using Gen3’s standard tooling for DIIRM, data needs to first be organized and copied to cloud buckets following the guidelines detailed below.

### Data and Access Considerations

The recommended (and simplest) way for Gen3 to provide controlled access to data is via Signed URLs. Signed URLs are the only fully cloud-agnostic method supported by Gen3 and additionally are supported by all major cloud resource providers. They also allow for short-lived, temporary access to the data for reduced risk.  Lastly, utilizing signed URLs place very few restrictionso nthe organization of data within could bucket(s).

### Allocating Data in Buckets Based on User Access

Gen3 has the capability to grant access granularity at the project level designation only.  In this way data in a particular bucket should only associated with a particular user access.

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

With a setup similar to this, Gen3 is able to support signed URLs and fully configured end-user access.


### Bucket Population

Once a data allocation scheme is determined, data can be uploaded accordingly to cloud buckets.  It should be noted that while Amazon AWS and Google are the most supported cloud providers, Gen3 is cloud agnostic.  Any method and hierarchy structure can be used for upload as long as a the same parent directory is maintained with end user access.

* * *
## 3. Create Bucket Mapping File
* * *

At a minimum Gen3 requires a bucket to acl or authz mapping file.  Both acl or authz can be used interchangably. This file is needed to provide end user access to whole buckets based on their RAS provided credientials.

Example of a bucket mapping file
| bucket | authz |
| --- | --- |
| s3://nih-nhlbi-topmed-released-phs001416-c1 | phs001416.c1 |
| gs://nih-nhlbi-topmed-released-phs001416-c1 | phs001416.c1 |
| s3://nih-nhlbi-topmed-released-phs001416-c2 | phs001416.c2 |
| gs://nih-nhlbi-topmed-released-phs001416-c2 | phs001416.c2 |
| s3://nih-nhlbi-topmed-released-phs000974-c1 | phs000974.c1 |
| gs://nih-nhlbi-topmed-released-phs000974-c1 | phs000974.c1 |
| s3://nih-nhlbi-topmed-released-phs000974-c2 | phs000974.c2 |
| gs://nih-nhlbi-topmed-released-phs000974-c2 | phs000974.c2 |

\
The preferred option for this file is a file level mapping file that contains additional columns (up to 6).
| File_name | File_size | md5sum | bucket_urls | acl | authz |
| --- | --- | --- | --- | --- | --- |
| examplefile.txt | 123456 | sample_md5 | s3://nih-nhlbi-topmed-released-phs001416-c1/example-bucket/examplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c1/example-bucket/examplefile.txt | [phs001416,c1] | [phs001416.c1] |
| otherexamplefile.txt | 123456 | different_md5 | s3://nih-nhlbi-topmed-released-phs001416-c1/example-bucket/otherexamplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c1/example-bucket/otherexamplefile.txt | [phs001416,c1] | [phs001416.c1] |
| examplefile.txt | 123456 | sample_md5 | s3://nih-nhlbi-topmed-released-phs001416-c2/example-bucket/examplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c2/example-bucket/examplefile.txt | [phs001416,c2] | [phs001416.c2] |
| otherexamplefile.txt | 123456 | different_md5 | s3://nih-nhlbi-topmed-released-phs001416-c2/example-bucket/otherexamplefile.txt gs://nih-nhlbi-topmed-released-phs001416-c2/example-bucket/otherexamplefile.txt | [phs001416,c2] | [phs001416.c2] |

\
Gen3 expects a bucket mapping file, which (at a minimum) must include the names of all the buckets and an indication as to which cloud they’re in.   In the situation where Gen3 must support cloud-specific data access methods, Gen3 also requires the authz column (which should contain the granular access control which would represent access to the entire bucket).



Creation of a file Indexing Manifest
```
Sample code from sdk
```

* * *
## 4. Submit file Indexing Manifest to Indexd
* * *



Gen3 offers an [Indexing sdk toolkit](https://uc-cdis.github.io/gen3sdk-python/_build/html/tools/indexing.html#module-gen3.tools.indexing.index_manifest) to build, validate and map all files into a Gen3 datacommons.

This file should offer meta data as well as bucket mapping.

| File_name | File_size | md5sum | bucket_urls | acl |
| --- | --- | --- | --- | --- |
| examplefile.txt | 123456 | sample_md5 | s3://example-bucket/examplefile.txt gs://example-bucket/examplefile.txt | [phs000001,c1] |

* * *
To continue your data submission return to the main [Gen3 - Data Contribution](/resources/user/submit-data/#4-submit-additional-project-metadata) page.
