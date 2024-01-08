---
title: "Gen3 - Data Contribution - From Bucket to Gen3"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user/submit-data
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Linking Data from External Data Clouds to Gen3 Data Commons
***

Data files stored on cloud services, such as Amazon Web Services (AWS) or Google Cloud Storage (GCS), can be linked to a Gen3 data commons via normal submission and indexing. Below are listed guidelines and considerations regarding the specific processes of submission and indexing.

1. Consider required authorization controls for the data and how/where Gen3 will synchronize user authorization information. This information is important to communicate with CTDS/commons operators. Depending on your data access and authorization requirements, there are some requirements and caveats to data organization in the buckets.

2. In order for Gen3 to make file objects available to researchers, globally unique identifiers (GUIDs) are minted per object and stored in Gen3. The process of minting GUIDs associated with specific file objects in buckets is achieved with a bucket manifest which contains minimum file-level metadata. A bucket manifest is a tab seperated variable (TSV) file containing the following properties:

| md5_checksum | file_size | bucket_urls | acl | authz |
| --- | --- | --- | --- | --- |
| samplemd5checksum | 123456 | multiple_bucket_urls separated_by_a_space | phsid.consent# | program_project_consent |

The authorization columns "authz" and "acl" will be populated to enable individual user access.

    > __Note:__ Gen3's automation and deployment code contains scripts for [GCS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/gcp-bucket-manifest.md) and [AWS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md) that can generate an object manifest of a bucket. Keep in mind that using these scripts requires using Gen3's full deployment code and, depending on the amount of data, calculating checksums for files can be costly and take time.

3. Once a complete bucket manifest (with or without requested GUIDs) is available. Use the steps in either the [GUI Submission](/resources/user/gui-submission) or [DIIRM documentation](/resources/user/diirm-submission) to index the bucket manifest into the system (this "indexing" process generates GUIDs if not yet existent).

4. If applicable, submission files can be prepared for the Gen3 graph model as described on the [data submission page](https://gen3.org/resources/user/submit-data/#4-submit-additional-project-metadata) or briefly described here. You can choose between two options: a) create a `core_metadata_collection` entity, link it to the `data_file` node, and submit your data files directly to the `data_file` node. b) Create a structured chain of metadata according to the Gen3 graph model to obtain the link to the `data_file` node. Then, you can submit the files to the `data_file` node.

{{% /markdownwrapper %}}
