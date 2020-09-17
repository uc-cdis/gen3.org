---
title: "Gen3 - Data Contribution"
date: 2018-09-12T20:53:20-05:00
linktitle: /resources/user/submit-data
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Linking Data from external Data Clouds to Gen3 Data Commons
***

Data files that are stored on other cloud services, such as Amazon Web Services (AWS) or Google Cloud Storage (GCS), can be made available in a Gen3 data commons without moving it. There are several technical details for individual cases, and thus, you will need to get in contact with us for further inquiries. Below we list some guidelines that should prepare for specific processes such as indexing and submission.

1. Evaluate the bucket structure, consent groups and authorization to individual projects. Consent groups and authorization are *key* parameters that need to be communicated with us and data/bucket owners. Moreover, a flat bucket structure is preferred, but nested structure is also acceptable if needed.

2. A bucket manifest as a TSV file has to be populated and **has** to contain the following properties at the minimum: <ins>md5</ins> checksum, file <ins>size</ins> in bytes, and the full bucket <ins>urls</ins>. If applicable, "authz" and "acl" columns can be filled according to the consent and authorization groups.

    > __Note:__ If the bucket contains too many files whose md5 and size are to be locally calculated, *CTDIS-owned* and *pay model-specific* scripts for [GCS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/gcp-bucket-manifest.md) and [AWS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md) can generate an object manifest of an s3 bucket in cloud-automation.

3. We then follow these next three steps, depending on the individual case: 1) uploading the bucket manifest (this "indexing" process generates GUIDs if not yet existent), 2) downloading the indexed manifest, 3) uploading the manifest to make it available on the Gen3 commons. The [Gen3 SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md) can be used for most of these steps.

    > __Note:__ Users in the Gen3-Community have published [repos](https://github.com/jacquayj/gen3-s3indexer-extramural) that index large pre-existing s3 buckets (disclaimer: CTDS is not responsible for the content and opinions on the third-party repos).

4. If applicable, submission files can be prepared for the Gen3 graph model as described on the [data submission page](https://gen3.org/resources/user/submit-data/#4-submit-additional-project-metadata) or briefly described here. You can choose between two options: 1) create a `core_metadata_collection` entity, link it to the `data_file` node, and submit your data files directly to the `data_file` node. 2) Create a structured chain of metadata according to the Gen3 graph model to obtain the link to the `data_file` node. Then, you can submit the files to the `data_file` node.
