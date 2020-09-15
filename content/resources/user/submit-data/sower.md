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

It is possible to link data on Gen3 that is stored on other cloud services (Amazon Web Services AWS, Google Cloud Storage GCS) by a process called DIIRM (*Data Ingestion, Integration, and Release Management*). If you have a bucket of files and want to link the data to Gen3 you can find below a step-by-step guide to do so. Before going forward, you need to a) know the signed URL from the bucket and b) make sure you have access to the external bucket.

- Create a manifest as a TSV file that contains all files that exist in the respective bucket. This manifest **has** to contain the following properties at the minimum: <ins>md5</ins> checksum, file <ins>size</ins> in bytes, and the full bucket <ins>urls</ins>. The column heads in the example manifest below should be taken as a reference as the indexing process is case- and word-sensitive.

    ![manifest](http://alpha.gen3.org/resources/user/submit-data/manifest_example.png)

>__NOTE:__ If you want to authorize the access to the files, you need to add consent groups in `authz` and `acl`. In other words, if you want a bucket to be tied to a project, you can index all the files with the project's `authz`.
`authz` and `acl` are an Arborist resource or a Gen3 path following the Gen3 structure of programs and projects. The Gen3 resource path in the `authz` field must be able to map to user-permissions provided during an authorization sync (e.g. from dbGaP or a `user.yaml`). `acl` is only advised if you want to customize access to individual objects within a bucket, since IAM permissions will generally apply to all objects within a bucket. Please contact us if more information are required.
If the bucket contains too many files to download locally, [CTDIS-owned scripts](https://github.com/uc-cdis/cloud-automation/blob/master/doc/bucket-manifest.md) can generate an object manifest of an s3 bucket in cloud-automation.

- The manifest needs to be indexed, which is done by uploading the TSV file using the [Gen3 python SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md#indexing-manifest) (not the gen3-client) or in the [user interface (UI)](https://gen3.datacommons.io/indexing). If the UI does not appear on your commons (after replacing the core url), please get in contact with us to set up the environment.

    ![index_upload](http://alpha.gen3.org/resources/user/submit-data/index_upload.png)

- After indexing, download the manifest that includes now the GUIDs from either the UI or using the [Gen3 python SDK](https://github.com/uc-cdis/gen3sdk-python/blob/master/README.md#download-manifest). Note that the GUID represents now the `object_id` property in the Gen3 data dictionary for the category `data_files`.

    ![index_download](http://alpha.gen3.org/resources/user/submit-data/index_download.png)

<!---(If you are using cloud-automation, bullets 2 and 3 are done by a [Sower job](https://github.com/uc-cdis/sower-jobs/blob/master/README.md#manifest-indexing).)-->

- Once these files are indexed, you can create a submission file for the Gen3 graph model. You can now choose between two options.
For the first option, you can link the new data by creating a `core_metadata_collection` entity, linking it to the data_file node, and submitting your data files directly to the data_file node. For the second option, you can create a structured chain of metadata according to the Gen3 graph model to obtain the link to the data_file node. Then, you can submit the files to the data_file node. Submission can be done either in Windmill or using the [Gen3 python SDK](https://uc-cdis.github.io/gen3sdk-python/_build/html/submission.html).

### Practical example - 1000 Genomes
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

- After finding the path to files of interest in the bucket, calculating their size and md5sum, the manifest can be created. In our example, the access is open, so an asterisk can be inserted into the `acl` column. No specific access is given in `authz`.

    ![manifest2](http://alpha.gen3.org/resources/user/submit-data/manifest_example_2.png)

    The resulting manifest can be downloaded and submission files for the `core_metadata_collection` node can be prepared.
