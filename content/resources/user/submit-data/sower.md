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

It is possible to link data on Gen3 that is stored on other cloud services (Amazon Web Services AWS, Google Cloud Storage GCS) by a process called DIIRM (*Data Ingestion, Integration, and Release Management*). In other words, if you have a bucket of files and want to link the data to Gen3 you can find below a step-by-step guide and a practical example. Before going forward, you need to make sure you have access to the external bucket.

1. [Step-by-step guide](#1-step-by-step-guide)
2. [Practical example with 1000 Genomes](#2-practical-example-with-1000-genomes)


## 1. Step-by-step guide
* * *
- Create a manifest as a TSV file that contains all files that exist in the respective bucket. This manifest **has** to contain the following properties at the minimum: <ins>md5</ins> checksum, file <ins>size</ins> in bytes, and the full bucket <ins>urls</ins>. The column heads in the example manifest below should be taken as a reference as the indexing process is case- and word-sensitive.

    ```
    GUID	url	size	md5	acl
     	s3://test/test.csv	745	613ccfbc68287db60c663519dab6a4ff	['*']
    ```

>__NOTE:__ If you want to authorize the access to the files and want a bucket to be tied to a project, you need to change `acl` and/or insert a column with `authz` as column head to add consent groups and index all the files with the project's `authz`.
`authz` and `acl` are an Arborist resource or a Gen3 path following the Gen3 structure of programs and projects. The Gen3 resource path in the `authz` field must be able to map to user-permissions provided during an authorization sync (e.g. from dbGaP or a `user.yaml`). `acl` is only advised if you want to customize access to individual objects within a bucket, since Identity and Access Management (IAM; [getting started](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html) and [best IAM practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)) permissions will generally apply to all objects within a bucket. Please contact us if more information are required.
For calculating the md5 and file_size, they need to be accessible locally. If the bucket contains too many files to download locally, *CTDIS-owned* and *pay model-specific* scripts for [GCS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/gcp-bucket-manifest.md) and [AWS](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md) can generate an object manifest of an s3 bucket in cloud-automation.

- The manifest needs to be indexed, which is done by uploading the TSV file using the [Gen3 python SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md#indexing-manifest) or in the [user interface (UI)](https://gen3.datacommons.io/indexing). If the UI does not appear on the commons of your interest (after replacing the core url of the commons in the link), please get in contact with us to set up the environment. In the UI, you can select and index the manifest by clicking "Index Files":

    ![index_upload](http://alpha.gen3.org/resources/user/submit-data/index_upload.png)

    Please do not navigate away from this page until the indexing operation is complete.
    Users in the Gen3-Community provided [repos](https://github.com/jacquayj/gen3-s3indexer-extramural) for indexing large pre-existing s3 buckets (disclaimer: CTDS is not responsible for the content and opinions on the third-party repos).

- After indexing, download the manifest that includes now the GUIDs from either the UI or using the [Gen3 python SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md#download-manifest). Select 'Download Manifest' after the indexing operation has finished:

    ![index_download](http://alpha.gen3.org/resources/user/submit-data/manifest_download.png)

    Note that the GUID represents now the `object_id` property in the Gen3 data dictionary for the category `data_files`.


<!---(If you are using cloud-automation, bullets 2 and 3 are done by a [Sower job](https://github.com/uc-cdis/sower-jobs/blob/master/README.md#manifest-indexing).)-->

- Once these files are indexed, you can create a submission file for the Gen3 graph model. You can now choose between two options.
For the first option, you can link the new data by creating a `core_metadata_collection` entity, linking it to the `data_file` node, and submitting your data files directly to the `data_file` node. For the second option, you can create a structured chain of metadata according to the Gen3 graph model to obtain the link to the `data_file` node. Then, you can submit the files to the `data_file` node. Submission can be done either in Windmill or using the [Gen3 python SDK](https://uc-cdis.github.io/gen3sdk-python/_build/html/submission.html). Submission can also be done with just file_size and md5s and Windmill should be able to look through the indexd records and link the entity to the indexd record. If you want the files also to be stored in the Gen3 commons bucket, you will need the [gen3 client](https://gen3.org/resources/user/gen3-client/#3-upload-data-files) to upload the files.


## 2. Practical example with 1000 Genomes
* * *
Here we present an example for the DIIRM process described above. The goal is to link data files from the publicly accessible [1000 Genomes Project bucket](http://s3.amazonaws.com/1000genomes) hosted by AWS.

- Login into AWS with your host institution ([UChicago](http://awslogin.uchicago.edu/)) or [create your own account](aws.amazon.com/ec2). Create your [keypair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html#create-a-key-pair) and save it under `~/.ssh`. Make sure to edit the resource in user credential policies under Identity and Access Management (IAM) in your EC2 instance. Insert the Amazon Resource Name (ARN) into the policies JSON, even if it's a public bucket. For this example, the ARNs are `arn:aws:s3:::1000genomes` and `arn:aws:s3:::1000genomes/*`.

- If you want to use an AWS instance that contains all necessary software to run the tutorial created by 1000 Genomes, you need to launch your AWS instance in the browser. In the tab "Choose AMI", find `ami-fad40b93` under community AMIs, as described [here](https://www.internationalgenome.org/using-1000-genomes-data-amazon-web-service-cloud), select `t1.micro` (free tier), make sure your location is set to `N. Virginia, us-east-1` (top right corner in drop-down menu), and select the storage as paid for. Choose your keypair, and launch your instance. Find your public DNS in the description of the instance (begins with `ec`) and run:
```
ssh -i ~/.ssh/my_key_pair_here.pem onekgenomes@ec2-23-20-189-94.compute-1.amazonaws.com
```

- To look through the bucket and find the data files of interest, you first need to install the client [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html). After successful installation, AWS CLI needs to be [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html). Insert the location and information from your keypair:
    ```
    $/usr/local/bin: aws configure
    AWS Access Key ID [*******************2]:
    AWS Secret Access Key [*******************H]:
    Default region name [None]: us-east-1
    Default output format [None]:
    ```

- To access the bucket structure and find files, run:
    ```
    aws s3 ls s3//:bucketname
    ```

- To copy files to your local environment run `aws s3 cp s3://1000genomes/[path-to-file] [local-path]`:
    ```
    aws s3 cp s3://1000genomes/sequence_indices/20091216_20100311.stats.csv /usr/local/bin/sower_test/
    ```
    More documentation about AWS CLI terminal commands can be found [here](https://aws.amazon.com/cli/#file_commands_anchor).

- After finding the path to files of interest in the bucket, calculating their size and md5, the manifest can be created. In our example, the access is open, so an asterisk can be inserted into the `acl` column:

    ```
    GUID	url	size	md5	acl
     	s3://1000genomes/sequence_indices/20091216_20100311.stats.csv	745	613ccfbc68287db60c663519dab6a4ff	['*']
    ```

    This file will be now indexed by clicking "Index Files" in the [UI](https://gen3.datacommons.io/indexing).

- The resulting manifest including the GUID can be downloaded as `.log` after clicking "Download Manifest":
    ```
    guid	urls	size	md5	acl
    c146a966-7617-4f2f-b628-57a5f11de879	s3://1000genomes/sequence_indices/20091216_20100311.stats.csv	745	613ccfbc68287db60c663519dab6a4ff	['*']
    ```

- The submission files for the metadata can be now prepared following the instructions described in the [data submission](https://gen3.org/resources/user/submit-data/#4-submit-additional-project-metadata) or briefly described below. For this example we will use Windmill for the submission and show the steps as described as option 1 above, since it demonstrates the ability to link to a file node that is deep within the graph model.

- For the quick metadata file upload that links to the core_metadata_collection, download the template.tsv for the `core_metadata_collection` node in the [data dictionary](https://gen3.datacommons.io/DD). Fill in the required (*) columns, according to the data dictionary. The core_metadata_collection.tsv should contain `type`, `submitter_id`, and `projects.code`:

    ```
    type	submitter_id	projects.code
    core_metadata_collection	xritterdemo1testsower	test
    ```
    Submit and upload this file. A green message should appear after successful upload:
    `Succeeded: 200
    Submitted chunk 1 of 1`

    >__NOTE:__  the `id` is created on the backend. To find it, download the core_metadata_collection.tsv under Submit Data --> Submit Data to your project --> Core Metadata Collection --> Download All as TSV.

- Next, download the template.tsv for the `data_file` node of your choice in the [data dictionary](https://gen3.datacommons.io/DD), colored in green. In this example, we use the `Variant Cell File (VDF)` data_file node.
Fill in the required (*) columns, according to the data dictionary. The following 3 entries have to be correct for a successful upload: the `project_id` is the dash-separated combination of program and the project’s code; the `object_id` is the GUID from the indexing operation; the `core_metadata_collections.submitter_id` is the `submitter_id` from above and will create the link to the `core_metadata_collection` node. In our example, the `data_file` node vcf.tsv shows:

    ```
    *type	project_id	*submitter_id	core_metadata_collections.submitter_id	*data_category	*data_format	*data_type	*file_name	*file_size	*md5sum	object_id
    variant_call_file	DEV-test	xritterdemo1testsower_vcf	xritterdemo1testsower	Combined Nucleotide Variation	VCF	Annotated Somatic Mutation	20091216_20100311.stats	745	613ccfbc68287db60c663519dab6a4ff	c146a966-7617-4f2f-b628-57a5f11de879
    ```
    Submit and upload this file. A green message should appear after successful upload:
    `Succeeded: 200 Submitted chunk 1 of 1`
