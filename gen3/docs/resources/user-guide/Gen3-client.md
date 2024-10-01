# Download and Upload Files Using the Gen3-client
The gen3-client provides an easy-to-use, command-line interface for uploading and downloading data files to and from a Gen3 data commons from the terminal or command prompt, respectively.

This guide has the following sections:

1. [Installation Instructions](#1-installation-instructions)
2. Configure a Profile
3. Upload Data Files
4. Download Files
5. Multiple File Download with Manifest
6. Generate a Metadata Submission TSV (Deprecated)
7. Upload Single File with GUID
8. Upload Multiple Files with Manifest
9. Quick Start for Experienced Users or Cheat Sheet
10. Working from the Command-line

## 1. Installation Instructions
A binary executable of the latest version of the gen3-client should be [downloaded from Github][Gen3 Client]. Choose the file that matches your operating system (Windows, Linux, or Mac OS).

No installation is necessary. Simply download the correct version for your operating system and unzip the archive. The program is then executed from the command-line by running the command `gen3-client <options>`. For more detailed instructions, see the section below for your operating system.

> **Note:** Do not try to run the program by double-clicking on it. Instead, execute the program from within the shell / terminal / command prompt. The program does not provide a graphical user interface (GUI) at this time; so, commands are sent by typing them into the terminal.

### Mac OS X / Linux Installation Instructions

1. Download the latest Mac OS X or Linux version of the gen3-client [here][Gen3 Client].
2. Unzip the archive.
3. Add the unzipped executable to a directory, for example: `~/.gen3/gen3-client.exe`.
4. Open a terminal window.
5. Add the directory containing the executable to your Path environment variable by entering this command in the terminal: `echo 'export PATH=$PATH:~/.gen3' >> ~/.bash_profile`.
6. Run `source ~/.bash_profile` or restart your terminal.
7. Now you can execute the program by opening a terminal window and entering the command `gen3-client`.

### Windows Installation Instructions
1. [Download the Windows version of the gen3-client here][Gen3 Client].
2. Unzip the archive.
3. Add the unzipped executable to a directory, for example: `C:\Program Files\gen3-client\gen3-client.exe`.
4. Open the Start Menu and type “edit environment variables”.
5. Open the option “Edit the system environment variables”.
6. In the “System Properties” window that opens up, on the “Advanced” tab, click on the “Environment Variables” button.
7. In the box labeled “System Variables”, find the “Path” variable and click “Edit”.
8. In the window that pops up, click “New”.
9. Type in the full directory path of the executable file (for example, `C:\Program Files\gen3-client)`.
10. Click “Ok” on all the open windows and restart the command prompt if it is already open by entering `cmd` into the start menu and hitting enter.

> **Note:** To download the latest version of the file from the command-line, use the following commands from your terminal:
 ```
 # Mac OS:
 curl https://api.github.com/repos/uc-cdis/cdis-data-client/releases/latest | grep browser_download_url.*osx |  cut -d '"' -f 4 | wget -qi -
 ```
 ```
 # Linux:
 curl https://api.github.com/repos/uc-cdis/cdis-data-client/releases/latest | grep browser_download_url.*linux |  cut -d '"' -f 4 | wget -qi -
 ```


### View the Help Menu
To check that your copy of the client is working and confirm the version, the tool can be run on the command-line in your terminal or command prompt by entering `gen3-client`. Typing this alone or `gen3-client help` will display the help menu. For help on a particular command, enter: `gen3-client <command> help`. Note that you must provide the full path of the tool in order for the commands to run, for example, `./gen3-client` while working from the directory containing the client. Alternatively, you can [add the location of the gen3-client executable to your shell’s PATH environment variable][PATH].

## 2. Configure a Profile with Credentials

Before using the gen3-client to upload or download data, the gen3-client needs to be configured with API credentials downloaded from the user’s data commons Profile (via Windmill data portal):

1. To download the “credentials.json” from the data commons, the user should start from that common’s Windmill data portal, followed by clicking on “Profile” in the top navigation bar and then creating an API key. In the popup window which informs user an API key has been successfully created, click the “Download json” button to save a local copy of the API key.

   ![Screenshot of Windmill data portal showing how you can create an API key][img create API key]

2. From the command-line, run the `gen3-client configure` command with the `--cred`, `--apiendpoint`, and `--profile` flags (see examples below).

   Example Usage:
   ```
   gen3-client configure --profile=<profile_name> --cred=<credentials.json> --apiendpoint=<api_endpoint_url>

   Mac/Linux:
   gen3-client configure --profile=demo --cred=~/Downloads/demo-credentials.json --apiendpoint=https://nci-crdc-demo.datacommons.io/

   Windows:
   gen3-client configure --profile=demo --cred=C:\Users\demo\Downloads\demo-credentials.json --apiendpoint=https://nci-crdc-demo.datacommons.io/
   ```
   > **NOTE:** For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL of other data commons powered by Gen3.

   When successfully executed, this will create a configuration file, which contains all the API keys and URLs associated with each commons profile configured, located in the user folder:

   ```
   Version 1.0.0+
   Mac/Linux: /Users/demo/.gen3/gen3_client_config.ini
   Windows: C:\Users\demo\.gen3\gen3_client_config.ini
   ```
   ```
   Other older version
   Mac/Linux: /Users/demo/.gen3/config
   Windows: C:\Users\demo\.gen3\config
   ```
   > **NOTE:** These keys must be treated like important passwords; never share the contents of the `credentials.json` and gen3-client `gen3_client_config.ini` or `config` file!

   You should receive an error if you enter an incorrect API endpoint for your credentials. For example:
   ```
   ~> gen3-client configure --profile=demo --cred=~/Downloads/wrong-credentials.json --apiendpoint=https://nci-crdc-demo.datacommons.io
   2019/11/19 11:58:15 Error occurred when validating profile config: Invalid credentials for apiendpoint 'https://nci-crdc-demo.datacommons.io': check if your credentials are expired or incorrect.
   ```

   To confirm you successfully configured a profile with the correct authorization privileges, you can run the `gen3-client auth` command, which should list your access privileges for each project in the commons you have access to. For example:

   ```
   ~> gen3-client auth --profile=demo
   2019/11/19 11:59:04
   You have access to the following project(s) at https://nci-crdc-demo.datacommons.io:
   2019/11/19 11:59:04 CPTAC [read read-storage]
   2019/11/19 11:59:04 DCF [create delete read read-storage update upload write-storage]
   ```

## 3. Upload Data Files

### gen3-client upload

For the typical data contributor, the `gen3-client upload` command should be used to upload data files to a Gen3 Data Commons. The commands `upload-single` and `upload-multiple` are used only in special cases, for example, when a file or collection of files are uploaded to specific GUIDs after generating structured data records for the files. These two commands are described in further detail in sections 7 and 8 below.

When data files are uploaded to a Gen3 data common’s object storage, they are assigned a unique, 128-bit ID called a [‘GUID’][GUID], which stands for “globally unique identifier”. GUIDs are generated by the system software, not provided by users, and they are stored in the property `object_id` of a data_file’s structured data.

When using the `gen3-client upload` command, a random, unique GUID will be generated and assigned to each data file that has been submitted, and an entry in the indexd database will be created for that file, which associates the storage location of the file with the file’s object_id (“did” in the indexd record, see below for more details).

### Options and User Input Flags

The following flags can be used with the `gen3-client upload` command:

==insert table==

Example of a single file upload:

```
~> gen3-client upload --profile=demo --upload-path=test.txt
2019/11/19 12:45:41 Finish parsing all file paths for "/Users/demo/Documents/test.txt"

The following file(s) has been found in path "/Users/demo/Documents/test.txt" and will be uploaded:
	/Users/demo/Documents/test.txt

2019/11/19 12:45:41 Uploading data ...
test.txt  25 B / 25 B [=======================================================================================================================================] 100.00% 0s
2019/11/19 12:45:41 Successfully uploaded file "/Users/demo/Documents/test.txt" to GUID 1a82043e-02ec-4974-a803-7c0fd33ecfd7.
2019/11/19 12:45:41 Local succeeded log file updated


Submission Results
Finished with 0 retries | 1
Finished with 1 retry   | 0
Finished with 2 retries | 0
Finished with 3 retries | 0
Finished with 4 retries | 0
Finished with 5 retries | 0
Failed                  | 0
TOTAL                   | 1
```

Example of uploading all files within an folder:

```
~/Documents> gen3-client upload --profile=demo --upload-path=test_dir
2019/11/19 13:12:47 Finish parsing all file paths for "/Users/demo/Documents/test_dir"

The following file(s) has been found in path "/Users/demo/Documents/test_dir" and will be uploaded:
	/Users/demo/Documents/test_dir/test.doc
	/Users/demo/Documents/test_dir/test.jpg
	/Users/demo/Documents/test_dir/test_1.txt
	/Users/demo/Documents/test_dir/test_2.txt

2019/11/19 13:12:48 Uploading data ...
test.doc  46 B / 46 B [=================================================================================================================================================================] 100.00% 0s
2019/11/19 13:12:48 Successfully uploaded file "/Users/demo/Documents/test_dir/test.doc" to GUID 7d1b41d9-002e-46d0-8934-6606d246ca30.
2019/11/19 13:12:48 Local succeeded log file updated
2019/11/19 13:12:48 Uploading data ...
test.jpg  50 B / 50 B [=================================================================================================================================================================] 100.00% 0s
2019/11/19 13:12:48 Successfully uploaded file "/Users/demo/Documents/test_dir/test.jpg" to GUID 59059e8d-29bf-4f8b-b9a4-2cd0ef2420f6.
2019/11/19 13:12:48 Local succeeded log file updated
2019/11/19 13:12:48 Uploading data ...
test_1.txt  30 B / 30 B [===============================================================================================================================================================] 100.00% 0s
2019/11/19 13:12:48 Successfully uploaded file "/Users/demo/Documents/test_dir/test_1.txt" to GUID 6f6686f1-45f2-4e8d-a997-a669b9419fd3.
2019/11/19 13:12:48 Local succeeded log file updated
2019/11/19 13:12:48 Uploading data ...
test_2.txt  27 B / 27 B [===============================================================================================================================================================] 100.00% 0s
2019/11/19 13:12:49 Successfully uploaded file "/Users/demo/Documents/test_dir/test_2.txt" to GUID d8ec2f5a-0990-495f-8192-ca2f037d6236.
2019/11/19 13:12:49 Local succeeded log file updated


Submission Results
Finished with 0 retries | 4
Finished with 1 retry   | 0
Finished with 2 retries | 0
Finished with 3 retries | 0
Finished with 4 retries | 0
Finished with 5 retries | 0
Failed                  | 0
TOTAL                   | 4
```

Example of upload using wildcard. Here we specify `*txt` in the `--upload-path` to get only files with a “txt” extension in the “test_dir” directory:

```
~/Documents> gen3-client upload --profile=demo --upload-path=test_dir/*txt
2019/11/19 15:49:07 Created folder "/Users/demo/.gen3/logs/"
2019/11/19 15:49:07 Finish parsing all file paths for "/Users/demo/Documents/test_dir/*txt"

The following file(s) has been found in path "/Users/demo/Documents/test_dir/*txt" and will be uploaded:
	/Users/demo/Documents/test_dir/test_1.txt
	/Users/demo/Documents/test_dir/test_2.txt

2019/11/19 15:49:07 Uploading data ...
test_1.txt  30 B / 30 B [===============================================================================================================================================================] 100.00% 0s
2019/11/19 15:49:07 Successfully uploaded file "/Users/demo/Documents/test_dir/test_1.txt" to GUID 956890a9-b8a7-4abd-b8f7-dd0020aaf562.
2019/11/19 15:49:07 Local succeeded log file updated
2019/11/19 15:49:07 Uploading data ...
test_2.txt  27 B / 27 B [===============================================================================================================================================================] 100.00% 0s
2019/11/19 15:49:07 Successfully uploaded file "/Users/demo/Documents/test_dir/test_2.txt" to GUID 6cf194f1-c68e-4976-8ca4-a0ce9701a9f3.
2019/11/19 15:49:07 Local succeeded log file updated


Submission Results
Finished with 0 retries | 2
Finished with 1 retry   | 0
Finished with 2 retries | 0
Finished with 3 retries | 0
Finished with 4 retries | 0
Finished with 5 retries | 0
Failed                  | 0
TOTAL                   | 2
```

Example using two wildcards in one path. Here we add `test_*/` to the `--upload-path` to upload files in more than one directory, and then we add `*.jpg` to add only the files from those directories with a “.jpg” extension:

```
~/Documents> gen3-client upload --profile=demo --upload-path=./test_*/*.jpg
2019/11/19 15:53:12 Finish parsing all file paths for "/Users/demo/Documents/test_*/*.jpg"

The following file(s) has been found in path "/Users/demo/Documents/test_*/*.jpg" and will be uploaded:
	/Users/demo/Documents/test_dir/test.jpg
	/Users/demo/Documents/test_dir_2/test_2.jpg

2019/11/19 15:53:12 Uploading data ...
test.jpg  50 B / 50 B [=================================================================================================================================================================] 100.00% 0s
2019/11/19 15:53:13 Successfully uploaded file "/Users/demo/Documents/test_dir/test.jpg" to GUID 9bd009b6-e518-4fe5-9056-2b5cba163ca3.
2019/11/19 15:53:13 Local succeeded log file updated
2019/11/19 15:53:13 Uploading data ...
test_2.jpg  50 B / 50 B [===============================================================================================================================================================] 100.00% 0s
2019/11/19 15:53:13 Successfully uploaded file "/Users/demo/Documents/test_dir_2/test_2.jpg" to GUID 3d275025-8b7b-4f84-9165-72a8a174d642.
2019/11/19 15:53:13 Local succeeded log file updated


Submission Results
Finished with 0 retries | 2
Finished with 1 retry   | 0
Finished with 2 retries | 0
Finished with 3 retries | 0
Finished with 4 retries | 0
Finished with 5 retries | 0
Failed                  | 0
TOTAL                   | 2
```

### Local Submission History

<!--#1 Installation -->
[Gen3 Client]: https://github.com/uc-cdis/cdis-data-client/releases/latest
[PATH]: https://gen3.org/resources/user/gen3-client/#10-working-from-the-command-line
<!--#2 Configure Profile -->
[img create API key]: https://gen3.org/resources/user/gen3-client/Gen3_Keys.png
<!--#3 Upload Data -->
[GUID]: https://dataguids.org/
<!--#4 Download single data file -->

<!--#6 generate metadata -->
