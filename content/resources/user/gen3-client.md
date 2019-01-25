---
title: "Gen3 - Gen3 Client"
date: 2018-11-06T15:09:45-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}

* * *

# Download and Upload Files Using the Gen3-client

* * *

The gen3-client provides an easy-to-use, command-line interface for uploading and downloading data files to and from a Gen3 data commons from the terminal or command prompt.

This guide has the following sections:

1. [Installation Instructions](#1-installation-instructions)
2. [Configure a Profile](#2-configure-a-profile-with-credentials)
3. [Upload Data Files](#3-upload-data-files)
4. [Download Files](#4-download-a-single-data-file-using-a-guid)
5. [Multiple File Download with Manifest](#5-provide-a-manifest-file-for-bulk-download)
6. [Generate a Metadata Submission TSV](#6-generate-a-metadata-tsv)
7. [Upload Single File with GUID](#7-how-to-upload-a-single-data-file-using-a-guid)
8. [Upload Multiple Files with Manifest](#8-how-to-upload-multiple-data-files-using-a-manifest)

* * *

## 1) Installation Instructions

* * *

The gen3-client can be [downloaded from Github](https://github.com/uc-cdis/cdis-data-client/releases/latest) for Windows, Linux or Mac OS, or it can be installed from source using Google's [GO language](https://golang.org/dl/) (instructions in Github README).

To install, download the correct version for your operating system and unzip the archive. The program must be executed from the command-line by running the command `gen3-client <options>`. For more detailed instructions, see the section below for your operating system.

>__Note:__ Do not try to run the program by double-clicking on it. Instead, execute the program from within the shell / terminal / command prompt. The program does not provide a graphical user interface (GUI) at this time; so, commands are sent by typing them into the terminal.

### Mac OS X / Linux Installation Instructions

1. [Download the latest Mac OS X or Linux version of the gen3-client here](https://github.com/uc-cdis/cdis-data-client/releases/latest).
2. Unzip the archive
3. Add the unzipped executable to a directory, for example: `~/.gen3/gen3-client.exe`
4. Open a terminal window.
5. Add the directory containing the executable to your Path environment variable by entering this command in the terminal: `echo 'export PATH=$PATH:~/.gen3' >>~/.bash_profile`.

Now you can execute the program by opening a terminal window and entering the command `gen3-client`.

### Windows Installation Instructions

1. [Download the Windows version of the gen3-client here](https://github.com/uc-cdis/cdis-data-client/releases/latest).
2. Unzip the archive
3. Add the unzipped executable to a directory, for example: `C:\Program Files\gen3-client\gen3-client.exe`
4. Open the Start Menu and type "edit environment variables".
5. Open the option "Edit the system environment variables".
6. In the "System Properties" window that opens up, on the "Advanced" tab, click on the "Environment Variables" button.
7. In the box labeled "System Variables", find the "Path" variable and click "Edit".
8. In the window that pops up, click "New".
9. Type in the full directory path of the executable file (e.g., `C:\Program Files\gen3-client`).
10. Click "Ok" on all the open windows and restart the command prompt if it is already open by entering `cmd` into the start menu and hitting enter.

### View the Help Menu

The tool can now be run on the command-line in your terminal or command prompt by typing `gen3-client`. Typing this alone displays the help menu.

### Notes about Working in the Shell

#### File Paths

When you create or download a file on your computer, that file is located in a folder (or directory) in your computer's file system. For example, if you create the text file `example.txt` in the folder `My Documents`, the "full path" of that file is, for example, `C:\Users\Bob\My Documents\example.txt` in Windows or `/Users/Bob/Documents/example.txt` in Mac OS X.

#### Present Working Directory

After opening a shell, command prompt or terminal window, you are "in" a folder known as the "present working directory". You can change directories with the `cd <directory>` command in either shell. To view your present working directory, enter the command `echo $PWD` in a Mac terminal or `cd` alone in the Windows command prompt.

You can list the contents of your present working directory by entering the command `ls` in the Mac terminal or `dir` in the Windows command prompt. These files in the present working directory can be accessed by commands you type just by entering their filenames: for example, `cat example.txt` would print the contents of the file `example.txt` in the Mac terminal if your present working directory is `/Users/Bob/Documents`. However, if you're in a different directory, you must enter the "full path" of the file: for example, if your present working directory is the `My Downloads` folder instead of `My Documents`, then you would need to specify the full path of the file and enter the command `type "C:\Users\Bob\My Documents\example.txt"`, to print the file's contents in the Windows command prompt.

#### Updating the PATH Environment Variable

When working in your shell, you can define variables that help make work easier. One such variable is PATH, which is a list of directories where executable programs are located. By adding a folder to the PATH, programs in that folder can be executed from any other folder/directory regardless of the present working directory.

So, by adding the directory containing the gen3-client program to your PATH variable, you can run it from any working directory without specifying the "full path" of the program. Simply enter the command `gen3-client`, and you will run the program.

> __Note:__ In the case that you haven't properly added the client to your path, the program can still be executed from any directory with the following command: `/full/path/to/executable/gen3-client <options>`. If you are working in the directory containing the executable, then `/full/path/to/executable` is simply `./`. So the command from the executable's directory would be `./gen3-client`.

#### Sending Parameters to Programs on Command-line

Most programs require some sort of user input to run properly. Some programs will prompt you for input after execution, while other programs are sent this input during execution as "arguments" or "options". The gen3-client uses the latter method of sending user input as command arguments during program execution.

For example, when configuring a profile with the client (details are in the following section), the user must specify the `configure` option and also specify the profile name, API endpoint, and credentails file by adding the flags `--profile`, `--apiendpoint` and `--cred` to the end of the command (see next section for specific examples).

* * *

## 2) Configure a Profile with Credentials

* * *

Before using the gen3-client to upload or download data, the gen3-client needs to be configured with API credentials downloaded from the user's data commons Profile (via Windmill data portal):

1. To download the "credentials.json" from the data commons, user should starts from that common's Windmill data portal, followed by clicking on "Profile" in the top navigation bar and then creating an API key. In the popup window which informs user an API key has been successfully created, click the "Download json" button to save the API key to local machine.

    ![Get credentials.json](Gen3_Keys.png)

2. From the command-line, run the `gen3-client configure` command with the --cred and --apiendpoint arguments (see examples below).

Example Usage:

```
gen3-client configure --profile=<profile_name> --cred=<credentials.json> --apiendpoint=<api_endpoint_url>

Mac/Linux:
gen3-client configure --profile=bob --cred=/Users/Bob/Downloads/credentials.json --apiendpoint=https://data.mycommons.org

Windows:
gen3-client configure --profile=bob --cred=C:\Users\Bob\Downloads\credentials.json --apiendpoint=https://data.mycommons.org
```

> __NOTE:__ For these user guides, https://data.mycommons.org is an example URL and will not be the actual URL of the data commons.

When successfully executed, this will create a configuration file, which contains all the API keys and urls associated with each commons profile configured, located in the user folder:

```
Mac/Linux: /Users/Bob/.gen3/config
Windows: C:\Users\Bob\.gen3\config
```

> __NOTE:__ These keys must be treated like important passwords; never share the contents of the `credentials.json` or gen3-client `config` file!

* * *

## 3) Upload Data Files

* * *

When data files are uploaded to a Gen3 data common's object storage, they should be registered and assigned with a unique, 128-bit ID called a ['GUID'](https://dataguids.org/). GUIDs are generated on the back-end, not submitted by users, and they are stored in the property `object_id`.

When using the `gen3-client upload` command, a random GUID will be generated and assigned to each data file that has been submitted.

Example Usage:

```
* For uploading a single file:
gen3-client upload --profile=<profile_name> --upload-path=<path_to_files/data.bam>
* For uploading all files within an folder:
gen3-client upload --profile=<profile_name> --upload-path=<path_to_files/folder/>
* Can also support regex such as:
gen3-client upload --profile=<profile_name> --upload-path=<path_to_files/folder/*>
* Or:
gen3-client upload --profile=<profile_name> --upload-path=<path_to_files/*/folder/*.bam>

gen3-client upload --profile=bob --file=test.gif

Uploading data ...
test.gif  3.64 MiB / 3.64 MiB [==========================================================================================] 100.00%
Successfully uploaded file "test.gif" to GUID 65f5d77c-1b2a-4f41-a2c9-9daed5a59f14.
1 files uploaded.
```

### Options and User Input Flags

<table class="g3-markdown-wrapper">
  <tr>
    <th>Flag name</th>
    <th>Required?</th>
    <th>Default value</th>
    <th>Explanation</th>
    <th>Sample usage</th>
  </tr>
  <tr>
    <td>profile</td>
    <td>Yes</td>
    <td>N/A</td>
    <td>The profile name that user wishes to use from the config file.</td>
    <td>--profile=Bob</td>
  </tr>
  <tr>
    <td>upload-path</td>
    <td>Yes</td>
    <td>N/A</td>
    <td>The directory or file in which contains file(s) to be uploaded.</td>
    <td>--upload-path=../data_folder/</td>
  </tr>
  <tr>
    <td>batch</td>
    <td>No</td>
    <td>false</td>
    <td>If set to `true`, gen3-client will upload multiple files simultaneously. The maximum number of file can be uploaded at a same time is specified by the `numparallel` option</td>
    <td>--batch=true</td>
  </tr>
  <tr>
    <td>numparallel</td>
    <td>No</td>
    <td>3</td>
    <td>Number of uploads to run in parallel. Must be used in together with the `batch` option.</td>
    <td>--numparallel=5</td>
  </tr>
  <tr>
    <td>include-subdirname</td>
    <td>No</td>
    <td>false</td>
    <td>Include subdirectory names in file name.</td>
    <td>--include-subdirname=true</td>
  </tr>
</table>

### Local Submission History

In this mode, the application will keep track of which local files have already been submitted to avoid potential duplication in submissions. This information is kept in a JSON file under the same user folder as where the `config` file lives, for example:

```
Mac/Linux: /Users/Bob/.gen3/<your_config_name>_history.json
Windows: C:\Users\Bob\.gen3\<your_config_name>_history.json
```

Each object in the history JSON file is a key/value pair of the full file path of a file and GUID it associates with.

Example of a History JSON File:

```
{
  "/Users/Bob/test.gif":"65f5d77c-1b2a-4f41-a2c9-9daed5a59f14"
}
```

* * *

## 4) Download a Single Data File Using a GUID

* * *

Once a data file is registered and uploaded to object storage, its GUID can be used to download the file with the `gen3-client download` command.
The downloaded filename can be customized by supplying an optional `--file` argument. If the `--file` option was left blank, the original filename will be used as default filename.

Example Usage:

```
gen3-client download --profile=<profile_name> --guid=<GUID> --file=<filename>

gen3-client download --profile=bob --guid=b4642430-8c6e-465a-8e20-97c458439387 --file=test.gif

Downloading b4642430-8c6e-465a-8e20-97c458439387...
[1A  transferred 208473 / 11893028 bytes (1.75%)[K
[1A  transferred 957017 / 11893028 bytes (8.05%)[K
[1A  transferred 1757785 / 11893028 bytes (14.78%)[K
[1A  transferred 2871897 / 11893028 bytes (24.15%)[K
[1A  transferred 4177497 / 11893028 bytes (35.13%)[K
[1A  transferred 5953113 / 11893028 bytes (50.06%)[K
[1A  transferred 8076889 / 11893028 bytes (67.91%)[K
[1A  transferred 10757721 / 11893028 bytes (90.45%)[K
[1A[KSuccessfully downloaded test.gif
```

* * *

## 5) Provide a Manifest File for Bulk Download

* * *

A download manifest can be generated using a Gen3 data common's "Exploration" tool. To use the "Exploration" tool, open the common's Windmill data portal and click on "Exploration" in the top navigation bar. After a cohort has been selected, clicking the "Download Manifest" button will create the manifest for the selected files. The gen3-client will download all the files in the provided manifest using the `gen3-client download-manifest` command.

Example Usage:

```
gen3-client download-manifest --profile=<profile_name> --manifest=<manifest_file> --download-path=<path_for_files>

gen3-client download-manifest --profile=bob --manifest=manifest.json --download-path=downloads

Finished downloads/63af95d3-98c3-4d6d-a6be-26398dbfc1d9 6723044 / 6723044 bytes (100%)
Finished downloads/b30531f6-9caa-4356-a95f-5f4d6a012913 6721797 / 6721797 bytes (100%)
Finished downloads/fbac9213-3564-422a-8809-119d4401d284 2744320 / 2744320 bytes (100%)
...
Finished downloads/bc40b861-c56d-490f-b4a4-f34d3c54de5f 2959360 / 2959360 bytes (100%)
Finished downloads/24d0be10-d164-48ad-aafa-9fcaac682df9 2570240 / 2570240 bytes (100%)
330 files downloaded.
```

* * *

## 6) Generate a metadata TSV

* * *

In order to register data files in a Gen3 data commons, the filenames, md5sums, and file_size in bytes, must be submitted as metadata. The gen3-client can help collect the values of these three properties using the `gen3-client generate-tsv` command.

The template TSV for a data file node should be downloaded from the node's entry page in the data dictionary and used as a template with this command. Then the wildcard character `*` can be used to add all matching files to the specified output tsv.

To download template TSVs from a common, open the common's Windmill data portal and click on "Dictionary" in the top navigation bar to open the data dictionary. Template TSVs can be obtained from each node's page in the data dictionary by clicking on the node's name.

![Template](Gen3_Dictionary_Subject_template.png)

Example Usage:

```
gen3-client generate-tsv --from-template=<template.tsv> --output=<output.tsv> <wildcard>

gen3-client generate-tsv --from-template=imaging_file_template.tsv --output=images.tsv \*.dcm

Adding file image-1.dcm
Adding file image-2.dcm
Adding file image-3.dcm
Adding file image-4.dcm
Generated tsv images.tsv from files *.dcm!
```

> __NOTE:__ In the MacOS terminal, the asterisk "\*" is a wildcard character and needs to be escaped with a backslash "\\".

The output file will have the filename, file_size, and md5sum properties for each of the matching files filled in. In order to complete the TSV, fill in the other required properties, including a column of "urls" with the s3 bucket location of the files.

Example of an Complete TSV File:

```
read_groups.submitter_id#1	type	project_id	submitter_id	data_category	data_format	data_type	experimental_strategy	file_name	file_size	md5sum	urls
rg-1	submitted_aligned_reads	project-name	SAR1	Sequencing Reads	BAM	Aligned Reads	DNA Panel	SAR1.bam	2032590693	ba05a167e793f5c9159e468ff080647c	s3://my-data/SAR1.bam
rg-2	submitted_aligned_reads	project-name	SAR2	Sequencing Reads	BAM	Aligned Reads	DNA Panel	SAR2.bam	2352570693	da15a177e7a3f5h9159e468ff080647c	s3://my-data/SAR2.bam
...
```

* * *

## 7) How to Upload a Single Data File Using a GUID

* * *

If a record of a data file has already been registered, which means a record that represents the data file with a pre-generated GUID already exists in the Gen3 data common's database of the `Indexd` service, then gen3-client can be used to upload a file to object storage with that GUID using the `gen3-client upload-single` command.

The GUID or `object_id` for a submitted data file can then be obtained via graphQL query or viewing the data file JSON record in the graphical model of the project.

Example Usage:

```
gen3-client upload-single --profile=<profile_name> --guid=<GUID> --file=<filename>

gen3-client upload-single --profile=bob --guid=b4642430-8c6e-465a-8e20-97c458439387 --file=test.gif

Uploading data ...
test.gif  3.64 MiB / 3.64 MiB [==========================================================================================] 100.00%
Successfully uploaded file "test.gif" to GUID b4642430-8c6e-465a-8e20-97c458439387.
1 files uploaded.
```

* * *

## 8) How to Upload Multiple Data Files Using a Manifest

* * *

Users can automate the upload of a bulk of files by providing an upload manifest. Ideally the upload manifest is the same as the download manifest that can be generated automatically as described in the previous section. However, user can also create a "minimal" upload manifest on their own if needed. A valid 'minimal' upload file is a JSON file that only contains `object_id` fields. The value of each `object_id` field is the GUID of a data file that is going to be submitted. In this mode, for now we are assuming all the data files to be uploaded have the same filenames as their GUIDs.

Example of manifest.json (Minimal):

```
{
  {
    "object_id": "a12ff17c-2fc0-475a-9c21-50c19950b082"
  },
  {
    "object_id": "b12ff17c-2fc0-475a-9c21-50c19950b082"
  },
  {
    "object_id": "c12ff17c-2fc0-475a-9c21-50c19950b082"
  }
}
```

The gen3-client will upload all the files in the provided manifest using the `gen3-client upload-manifest` command.

Example Usage:

```
gen3-client upload-manifest --profile=<profile_name> --manifest=<manifest_file> --upload-path=<path_for_files>

gen3-client upload-manifest --profile=bob --manifest=manifest.json --upload-path=upload

Uploading data ...
a12ff17c-2fc0-475a-9c21-50c19950b082  3.64 MiB / 3.64 MiB [==========================================================================================] 100.00%
b12ff17c-2fc0-475a-9c21-50c19950b082  3.63 MiB / 3.63 MiB [==========================================================================================] 100.00%
c12ff17c-2fc0-475a-9c21-50c19950b082  3.65 MiB / 3.65 MiB [==========================================================================================] 100.00%
Successfully uploaded file "a12ff17c-2fc0-475a-9c21-50c19950b082" to GUID a12ff17c-2fc0-475a-9c21-50c19950b082.
Successfully uploaded file "b12ff17c-2fc0-475a-9c21-50c19950b082" to GUID b22ff17c-2fc0-475a-9c21-50c19950b082.
Successfully uploaded file "c12ff17c-2fc0-475a-9c21-50c19950b082" to GUID c22ff17c-2fc0-475a-9c21-50c19950b082.
3 files uploaded.
```
