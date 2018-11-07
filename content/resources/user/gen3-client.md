---
title: "Gen3 - Gen3 Client"
date: 2018-11-06T15:09:45-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
* * *
# Download and Upload Files using the gen3-client
* * *
The gen3-client provides an easy-to-use, command-line interface for uploading and downloading data files from a Gen3 data commons.

* * *
## 1) Installation Instructions
* * *

The gen3-client can be [downloaded from Github](https://github.com/uc-cdis/cdis-data-client/releases/tag/0.2.1) for Windows, Linux or Mac OS, or it can be installed from source using Google's [GO language](https://golang.org/dl/)(instructions in Github README).

* To install, download the correct file for your operating system to the location of your choice, unzip it, and add that location to your path. The program is executed from the command-line by running the command: `gen3-client <options>`

Or, in the case that you haven't added the client to your path, execute the program with the following command: `path/to/binary/gen3-client <options>`, where `path/to/binary` is `./` if working from the same directory as the client executable.

Example:
```
./gen3-client <options>
./gen-client --version
```

To see the help menu for the tool, simply type in `gen3-client` or `./gen3-client`.

### Windows Installation Instructions:

Download the Windows 64-bit version of the gen3-client [here](https://github.com/uc-cdis/cdis-data-client/releases/download/0.2.1/dataclient_win64.zip)

Add the unzipped executable to a directory, for example:
 "C:\Program Files\gen3-client\gen3-client.exe"

1. Open the Start Menu and type "edit environment variables",
2. Open the option "Edit the system environment variables"
3. In the "System Properties" window that opens up, on the "Advanced" tab, click on the "Environment Variables" button.
4. In the box labeled "System Variables", find the "Path" variable and click "Edit"
5. In the window that pops up, click "New"
6. Type in the full directory path of the executable file (e.g., "C:\Program Files\gen3-client")
7. Click "Ok" on all the open windows and restart the command prompt if it is already open

Now you should be able to run the tool on the command-line from any directory by typing `gen3-client` (typing this alone should display the help menu).

* * *
## 2) Configure a Profile with Credentials
* * *
Before using it to upload or download data, the gen3-client needs to be configured with API credentials downloaded from the user's data commons Profile:

1. Download your credentials.json from the data commons by clicking on "Profile" in the top navigation bar.
2. From the command-line, run the `gen3-client configure` command (see examples below).
3. Enter the API endpoint of your data commons.

Example:
```
gen3-client configure --profile <profile-name> --cred <credentials.json>

Linux / Mac OS:
gen3-client configure --profile bob --cred /Users/Bob/Downloads/credentials.json
API endpoint: https://data.mycommons.org

Windows:
gen3-client configure --profile bob --cred C:\Users\Bob\Downloads\credentials.json
API endpoint: https://data.mycommons.org
```

When successfully executed, this will create a configuration file, which contains all the API keys and urls associated with each commons profile configured, located in your user folder:
```
Windows: C:\Users\Bob\.gen3\config
Mac/Linux: /Users/Bob/.gen3/config
```
* Note: These keys must be treated like important passwords: never email or paste the contents of the `credentials.json` or gen3-client `config` file into a messenger app!

* * *
## 3) Upload a data file using its GUID
* * *
When metadata records are created in any node in a Gen3 data commons, these records are assigned a unique, 128-bit ID called a ['GUID'](https://dataguids.org/).

GUIDs are generated on the back-end, not submitted by users, and they are stored in the property 'object_id'. The GUID or object_id for a submitted data_file can be obtained via graphQL query or viewing the data_file json record in the graphical model of the project.

Once the GUIDs for files to upload are in hand, the gen3-client can be used to upload files to object storage using the `gen3-client upload` command.

Example:
```
gen3-client upload --profile <profile-name> --guid <GUID> --file=<filename>

gen3-client upload --profile bob --guid dg.7519/b4642430-8c6e-465a-8e20-97c458439387 --file=test.gif

Uploading data ...
Successfully uploaded file "test.gif" to GUID dg.7519/b4642430-8c6e-465a-8e20-97c458439387.
```
* * *
## 4) Download a data file using its UUID
* * *
Once a data file is registered and uploaded to object storage, its GUID can be used to download the file with the `gen3-client download` command.

Example:
```
gen3-client download --profile <profile name> --guid <GUID> --file=<filename>

gen3-client download --profile bob --guid b4642430-8c6e-465a-8e20-97c458439387 --file=test.gif
Downloading dg.7519/b4642430-8c6e-465a-8e20-97c458439387...
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
## 5) Provide a manifest file for bulk download
* * *
A file download manifest can be generated using the data commons' "Exploration" tool by selecting a cohort then clicking on the "Manifest" button. The gen3-client will download all the files in the provided manifest using the `gen3-client download-manifest` command.

Example:
```
gen3-client download-manifest --download-path <path for files> --manifest <manifest file>

gen3-client download-manifest --manifest manifest.json --profile bob --download-path downloads
Finished downloads/63af95d3-98c3-4d6d-a6be-26398dbfc1d9 6723044 / 6723044 bytes (100%)
Finished downloads/b30531f6-9caa-4356-a95f-5f4d6a012913 6721797 / 6721797 bytes (100%)
Finished downloads/fbac9213-3564-422a-8809-119d4401d284 2744320 / 2744320 bytes (100%)
...
Finished downloads/bc40b861-c56d-490f-b4a4-f34d3c54de5f 2959360 / 2959360 bytes (100%)
Finished downloads/24d0be10-d164-48ad-aafa-9fcaac682df9 2570240 / 2570240 bytes (100%)
330 files downloaded.
```

* * *
## 6) Provide a manifest file for bulk upload
* * *
Users who need to semi-automate upload of a collection of files can modify the following shell script to fit their needs.

The following shell script can be run from the command-line like:
`sh gen3_manifest.sh <profile_name> <manifest_filename>`
Where <profile_name> is the name of the profile configured in [step 2](link to step 2) above, and <manifest_filename> is the filename/path of the manifest file.

The manifest file should not contain headers and each row should be only a GUID and filename separated by a tab, for example:
```
a12ff17c-2fc0-475a-9c21-50c19950b082	filename-1.txt
b22ff17c-2fc0-475a-9c21-50c19950b082	filename-2.txt
c32ff17c-2fc0-475a-9c21-50c19950b082	filename-3.txt
```
Here is the example shell script for uploading files. The script text should be added to a file named, e.g., 'gen3_manifest.sh', and the script should then be run in the directory containing the files:

```
#!/bin/bash
cat $2 | while read line
do
f=`echo $line | tr -d '\r'`
guid=$(echo $f | awk '{print $1}')
fname=$(echo $f | awk '{print $2}')
if [ -f "$fname" ]
then
	echo Uploading file $fname with UUID $uuid
	gen3-client upload --profile $1 --guid $guid --file $fname
	echo Upload of $fname complete!
else
	echo $file not found.
	exit 1
fi
done
```

* * *
## 7) Generate a metadata TSV
* * *
In order to register data files in a Gen3 data commons, the files' filenames, md5sums, and file_size in bytes must be submitted as metadata. The gen3-client can help collect the values of these three properties using the `gen3-client generate-tsv` command.

The template TSV for a data file node should be downloaded from the node's entry page in the data dictionary and used as a template with this command. Then the wildcard character `*` can be used to add all matching files to the specified output tsv.

Example:
```
gen3-client generate-tsv --from-template <template.tsv> --output <output.tsv> <wildcard>

gen3-client generate-tsv --from-template submission_imaging_file_template.tsv --output images.tsv \*.dcm
Adding file image-1.dcm
Adding file image-2.dcm
Adding file image-3.dcm
Adding file image-4.dcm
Generated tsv images.tsv from files *.dcm!
```
* Note that in Mac OS terminal, the asterisk ("\*", wildcard character) needs to be escaped with a backslash.

The output file will have the filename, file_size, and md5sum properties for each of the matching files filled in. In order to complete the TSV, fill in the other required properties, including a column of "urls" with the s3 bucket location of the files:

```
read_groups.submitter_id#1	type	project_id	submitter_id	data_category	data_format	data_type	experimental_strategy	file_name	file_size	md5sum	urls
rg-1	submitted_aligned_reads	project-name	SAR1	Sequencing Reads	BAM	Aligned Reads	DNA Panel	SAR1.bam	2032590693	ba05a167e793f5c9159e468ff080647c	s3://my-data/SAR1.bam
rg-2	submitted_aligned_reads	project-name	SAR2	Sequencing Reads	BAM	Aligned Reads	DNA Panel	SAR2.bam	2352570693	da15a177e7a3f5h9159e468ff080647c	s3://my-data/SAR2.bam
...
```
