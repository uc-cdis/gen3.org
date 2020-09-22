---
title: "Gen3 - Data Contribution - From Bucket to Gen3"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user/submit-data
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Linking Data from external Data Clouds to Gen3 Data Commons
***

Data files that are stored on other cloud services, such as Amazon Web Services (AWS) or Google Cloud Storage (GCS), can be made available in a Gen3 data commons without moving the files. There are several technical details for individual cases, and thus, you will need to get in contact with CTDS/commons operator for further inquiries. Below we list some guidelines that should prepare for specific processes such as indexing and submission.

1. Consider required authorization controls for the data and how/where Gen3 will synchronize user authorization information. This information is important to communicate with CTDS/commons operators. Depending on your data access and authorization needs, there are some requirements and caveats to data organization in the buckets.

2. In order for Gen3 to make file objects available to researchers, globally unique identifiers (GUIDs) are minted per object and stored in Gen3. That process of minting GUIDs associated with specific file objects in buckets is generally achieved by providing Gen3 with a bucket manifest which contains the minimal file-level metadata required to mint a GUID. A bucket manifest as a TSV file **has** to contain the following properties at the minimum: <ins>md5</ins> checksum, file <ins>size</ins> in bytes, and the full bucket <ins>urls</ins>. There are authorization columns "authz" and "acl" that can also be populated, though knowing what to populate these with will require communications with Gen3/commons operators.

    > __Note:__ Gen3's automation and deployment code contains scripts for [GCS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/gcp-bucket-manifest.md) and [AWS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md) that can generate an object manifest of a bucket. Keep in mind that using these scripts requires using Gen3's full deployment code and, depending on the amount of data, calculating checksums for files can be costly and take time.

3. Once Gen3 is provided a complete bucket manifest (with or without requested GUIDs), there is tooling available to index the bucket manifest into the system (this "indexing" process generates GUIDs if not yet existent). The [Gen3 SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md) contains tooling that can be used for this.

    > __Note:__ Users in the Gen3-Community have published [repos](https://github.com/jacquayj/gen3-s3indexer-extramural) that index large pre-existing s3 buckets (disclaimer: CTDS is not responsible for the content and opinions on the third-party repos).

4. If applicable, submission files can be prepared for the Gen3 graph model as described on the [data submission page](https://gen3.org/resources/user/submit-data/#4-submit-additional-project-metadata) or briefly described here. You can choose between two options: a) create a `core_metadata_collection` entity, link it to the `data_file` node, and submit your data files directly to the `data_file` node. b) Create a structured chain of metadata according to the Gen3 graph model to obtain the link to the `data_file` node. Then, you can submit the files to the `data_file` node.
