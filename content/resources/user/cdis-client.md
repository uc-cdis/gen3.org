---
title: "Gen3 - Gen3 Client"
date: 2018-09-18T15:09:45-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
* * *
# Download and Upload Files using the CDIS Gen3 Client
* * *
The Gen3 client provides an easy-to-use, command-line interface for uploading and downloading data files from a Gen3 data commons.

* * *
## 1) Installation Instructions
* * *
The Gen3 client can be downloaded as a [compiled binary file](https://github.com/uc-cdis/cdis-data-client/releases) for Windows, Linux or Mac OS, or it can be installed from source using Google's [GO language](https://golang.org/dl/).
* * *
1) To install the binary (recommended), simply download the binary file to the location of your choice and add that location to your path. The program is executed from the command-line by running the command
```
/path/to/binary/cdis-data-client <options>
```

2) To install using GO:
  1) Install Go tools: https://golang.org/doc/install
  2) Download and install cdis-data-client:
```
mkdir -p $GOPATH/src/github.com/uc-cdis` sudo mkdir -p /usr/local/go/src/github.com/uc-cdis
cd $GOPATH/src/github.com/uc-cdis` cd /usr/local/go/src/github.com/uc-cdis
git clone git@github.com:uc-cdis/cdis-data-client.git
cd cdis-data-client
go get -d ./...
go install .
```
The program can be executed from the command-line after adding `/path/to/go/bin` to your $PATH environment variable, e.g.: `export PATH=$PATH:/usr/local/go/bin`

* * *
## 2) Configure a Profile with Credentials
* * *
The CDIS data client needs to be configured with API credentials downloaded from the user's data commons profile, usually downloaded as a file named 'credentials.json'. After running the configure command, the user will be prompted to enter the API endpoint of the commons.

Example:
```
./cdis-data-client configure --profile <profile-name> --cred </path/to/credentials.json>
./cdis-data-client configure --profile bc --cred /Users/Me/Documents/creds/bc-credentials.json
<terminal-prompt>$ API endpoint: https://data.braincommons.org/
```

When successfully executed, this will create a configuration file located at, e.g., `~/.cdis/config`, which contains all the API keys and urls associated with each commons profile configured.

* * *
## 3) Upload a data file using its UUID
* * *
When metadata records are created in any node in a Gen3 data portal, these records are assigned a unique, 128-bit ID called a 'UUID'.  When metadata records describing a data file in object storage are created in a project, [the URL of the data file's address in object storage is specified to "register" the file](/user-guide/data-contribution/#5-register-data-files-with-the-windmill-data-portal). Once a data file is registered by creating its metadata record in the data portal, its UUID can be provided to the CDIS data client along with the local path of the file to upload that file to object storage.

Example:
```
./cdis-data-client upload --profile <profile-name> --uuid f6923cf3-xxxx-xxxx-xxxx-14ab3f84f9d6 --file="~/Documents/file_to_upload"
./cdis-data-client upload --profile bc --uuid b82ff17c-2fc0-475a-9c21-50c19950b082  --file="test.txt"
```
* * *
## 4) Download a data file using its UUID
* * *
Once a data file is registered and uploaded to object storage, its UUID can be provided to the CDIS data client to download the file. A filename can also be specified for the local copy of the file with the `--file filename` option.

Example:
```
 ./cdis-data-client download --profile <profile-name> --uuid 206dfaa6-bcf1-4bc9-b2d0-77179f0f48fc --file="~/Documents/name_the_file.json"
 ./cdis-data-client download --profile bc --uuid b82ff17c-2fc0-475a-9c21-50c19950b082  --file="test.txt"
```


* * *
## 5) Provide a manifest file for bulk upload/download
* * *
The CDIS data client currently does not take a manifest file; this functionality is currently being implemented. In the meantime, users who need to semi-automate upload or download of a collection of files can modify the following shell script to fit their needs.

The following shell script can be run from the command-line like:
```
sh cdc_manifest.sh <profile_name> <manifest_filename>
```
Where `<profile_name>` is the name of the profile configured in [step 2](/appendices/cdis-data-client/#2-configure-a-profile-with-credentials) above, and `<manifest_filename>` is the filename/path of the manifest file.

The manifest file should not contain headers and each row should be only a UUID and filename separated by a tab, for example:
```
a82ff17c-2fc0-475a-9c21-50c19950b082	filename-1.txt
b82ff17c-2fc0-475a-9c21-50c19950b082	filename-2.txt
c82ff17c-2fc0-475a-9c21-50c19950b082	filename-3.txt
```
Here is the example shell script for uploading files. The script text should be added to a file named, e.g., 'cdc_manifest.sh', and the script should then be run in the directory containing the files:

```
#!/bin/bash
cat $2 | while read line
do
f=`echo $line | tr -d '\r'`
uuid=$(echo $f | awk '{print $1}')
fname=$(echo $f | awk '{print $2}')
if [ -f "$fname" ]
then
	echo Uploading file $fname with UUID $uuid
	cdis-data-client upload --profile $1 --uuid $uuid --file $fname
	echo Upload of $fname complete!
else
	echo $file not found.
	exit 1
fi
done
```
