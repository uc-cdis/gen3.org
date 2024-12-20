# Access Data Files

## Authentication and Authorization

### Authentication
Authentication refers to how a user identifies themselves to the Gen3 system.  The method of user authentication varies from system to system.  This could include eRA Commons, Google, Microsoft Office 365, InCommons, eduGAIN, ORCID, or generally anything following an OIDC standard.  This is configured by your system operator, and you can find more details in the [Gen3 Operator's Guide][configure auth].


### Authorization
Authorization indicates to which data a particular user has access.  Governance practices vary from Gen3 system to system and this can take a variety of forms, but typically falls into two buckets: allow list and dbGaP.   You can find more in-depth details on how this is configured within the [Gen3 Operator's Guide][configure auth].

#### Allow list
An allow list is simply a list of users (identified based on your method of authentication) that controls which users have access to which data.  It is in the form of a user.yaml file that is maintained by the operator of your Gen3 system.  You should contact the operator of your system or follow whatever process they have in place to request access.  Gaining access may require you to sign a Data Use Agreement.  Data access is granted at the program or project level.

#### dbGaP
Another common authorization mechanism is dbGaP.  In order to obtain access to controlled-access data via dbGaP, PIs must first obtain an [NIH eRA Commons account][era_commons] and then obtain authorization to access the data through the [NIH database of Genotypes and Phenotypes (dbGaP)][dbgap].

To obtain dbGaP access, navigate to the [dbGaP Authorized Access site][dbgap auth] and follow the instructions. This process includes working with your institutional research office, reviewing the consent agreement for the particular project, and writing a Research Use Statement and thus can take a significant amount of time.

#### Bulk allow list
Another option is to use a bulk allow list from an SFTP server in the same format as dbGaP, but not actually controlled by dbGaP.

#### Requestor Service
Operators can also take advantage of the Requestor Service for dynamic authorization. In this case Gen3 interacts with another system where authorization requests are reviewed, approved, denied, or revoked.


## Download Files Using the Gen3-client
The gen3-client provides an easy-to-use, command-line interface for uploading and downloading data files to and from a Gen3 data commons from the terminal or command prompt, respectively.  In some systems "download" may be restricted to only within a Gen3 Workspace.  Note that Gen3 also comes with an SDK tool that can perform many of the same functions as the client for downloading along with many other features not found in the client.  You can read more about the Python SDK tool [here][sdk_github].

This guide has the following sections:

### Installation Instructions
A binary executable of the latest version of the gen3-client should be [downloaded from Github][Gen3 Client]. Choose the file that matches your operating system (Windows, Linux, or macOS).

No installation is necessary. Simply download the correct version for your operating system and unzip the archive. The program is then executed from the command-line by running the command `gen3-client <options>`. For more detailed instructions, see the section below for your operating system.

> **Note:** Do not try to run the program by double-clicking on it. Instead, execute the program from within the shell / terminal / command prompt. The program does not provide a graphical user interface (GUI) at this time; so, commands are sent by typing them into the terminal.

#### Mac OS X / Linux Installation Instructions

1. Download the latest Mac OS X or Linux version of the gen3-client [here][Gen3 Client].
2. Unzip the archive.
3. Add the unzipped executable to a directory, for example: `~/.gen3/gen3-client.exe`.
4. Open a terminal window.
5. Add the directory containing the executable to your Path environment variable by entering this command in the terminal: `echo 'export PATH=$PATH:~/.gen3' >> ~/.bash_profile`.
6. Run `source ~/.bash_profile` or restart your terminal.
7. Now you can execute the program by opening a terminal window and entering the command `gen3-client`.

#### Windows Installation Instructions
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


#### View the Help Menu
To check that your copy of the client is working and confirm the version, the tool can be run on the command-line in your terminal or command prompt by entering `gen3-client`. Typing this alone or `gen3-client help` will display the help menu. For help on a particular command, enter: `gen3-client <command> help`. Note that you must provide the full path of the tool in order for the commands to run, for example, `./gen3-client` while working from the directory containing the client. Alternatively, you can [add the location of the gen3-client executable to your shell’s PATH environment variable][PATH].

### Configure a Profile with Credentials

Before using the gen3-client to upload or download data, the gen3-client needs to be configured with API credentials downloaded from the user’s data commons Profile:

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




### Download a Single Data File Using a GUID


Files with a valid storage location in the file index database (AKA *indexd*) can be downloaded using the `gen3-client download-single` command by providing the file's object_id (AKA *GUID* or *did*).

For example, the indexd record for object_id ["00149bcf-e057-4ecc-b22d-53648ae0b35f"](https://gen3.datacommons.io/index/00149bcf-e057-4ecc-b22d-53648ae0b35f) points to a [location in the GDC](https://api.gdc.cancer.gov/data/47b982b3-c7ce-4ca7-8c86-c71c15979620).


Required Flags:
* --profile: The user profile specifying the api-endpoint and credentials.
* --guid: The GUID (or "object_id" in Postgres or "did" in indexd) of the file.

Optional Flags:
* --download-path: Specify the directory to store files in.
* --filename-format: The format of filename to be used, including "original", "guid" and "combined" (default "original").

* --no-prompt: If set to true, no user prompt message will be displayed regarding the filename-format.
* --protocol: The protocol to use for file download. Accepted options are: "s3", "http", "ftp", "https", and "gs".
* --rename: If "--filename-format=original" is used, this will rename files by appending a counter value to its filename when files with the same name are in the download-path, otherwise the original filename will be used.
* --skip-completed:  If set to true, the name and size of local files in the `download-path` are compared to the information in the file index database. If a local file in the `download-path` matches both the name and size, it will not be downloaded.


> __NOTE:__ The "--skip-completed" option also attempts to resume downloading partially downloaded files using a ranged download. That is, if a local file with the same name exists in the `download-path`, but the size does not match what is in the file index, the client will attempt to resume the download where it left off.


Example Usage:

```
gen3-client download-single --profile=demo --guid=00149bcf-e057-4ecc-b22d-53648ae0b35f --no-prompt --skip-completed
```

### Multiple File Download with Manifest



A download manifest can be generated using a Gen3 data common's "Exploration" tool. To use the "Exploration" tool, open the common's Windmill data portal and click on "Exploration" in the top navigation bar. After a cohort has been selected, clicking the "Download Manifest" button will create the manifest for the selected files. The gen3-client will download all the files in the provided manifest using the `gen3-client download-multiple` command.

> __NOTE:__ The download-multiple command supports multi-threaded downloads using the "--numparallel" option. While using this option will decrease time to download when downloading a batch of files, it is not recommended to use this option when trying to download extremely large files (50+ GB).


> __NOTE:__ If a download command is interrupted and results in partially downloaded files, the "--skip-completed" option can be used to attempt to resume downloading the partially downloaded files using a ranged download. The gen3-client will compare the file_size and file_name for each file in the "--download-path", and resume downloading any files in the manifest that do not match both.


Example Usage:

```
gen3-client download-multiple --profile=<profile_name> --manifest=<manifest_file> --download-path=<path_for_files>

gen3-client download-multiple --profile=demo --manifest=manifest.json --download-path=downloads

Finished downloads/63af95d3-98c3-4d6d-a6be-26398dbfc1d9 6723044 / 6723044 bytes (100%)
Finished downloads/b30531f6-9caa-4356-a95f-5f4d6a012913 6721797 / 6721797 bytes (100%)
Finished downloads/fbac9213-3564-422a-8809-119d4401d284 2744320 / 2744320 bytes (100%)
...
Finished downloads/bc40b861-c56d-490f-b4a4-f34d3c54de5f 2959360 / 2959360 bytes (100%)
Finished downloads/24d0be10-d164-48ad-aafa-9fcaac682df9 2570240 / 2570240 bytes (100%)
330 files downloaded.
```



### Quick Start for Experienced Users or Cheat Sheet



#### MAC OS
1. Download the latest version of the client:
```
!curl https://api.github.com/repos/uc-cdis/cdis-data-client/releases/latest | grep browser_download_url.*osx |  cut -d '"' -f 4 | wget -qi -
!unzip dataclient_osx.zip
!mv gen3-client /Users/demo/.gen3
!rm dataclient_osx.zip`
```
2. Configure a profile:
```
gen3-client configure --profile=demo --cred=~/Downloads/demo-credentials.json --apiendpoint=https://nci-crdc-demo.datacommons.io/`
```
3. Check your authorization privileges:
```
gen3-client auth --profile=demo
```
4. Upload a file:
```
gen3-client upload --profile=demo --upload-path=test.txt
```
5. Download a file:
```
gen3-client download-single --profile=demo --guid=39b05d1f-f8a2-478c-a728-c16f6d0d8a7c --no-prompt
```

### Working from the Command-line



This section contains some general notes about working from the command-line and includes information on how to set-up your command-line shell to make working with the gen3-client easier.

#### File Paths

When you create or download a file on your computer, that file is located in a folder (or directory) in your computer's file system. For example, if you create the text file `example.txt` in the folder `My Documents`, the "full path" of that file is, for example, `C:\Users\demo\My Documents\example.txt` in Windows or `/Users/demo/Documents/example.txt` in Mac OS X.

#### Present Working Directory

After opening a shell, command prompt or terminal window, you are "in" a folder known as the "present working directory". You can change directories with the `cd <directory>` command in either shell. To view your present working directory, enter the command `echo $PWD` in a Mac terminal or `cd` alone in the Windows command prompt.

You can list the contents of your present working directory by entering the command `ls` in the Mac terminal or `dir` in the Windows command prompt. These files in the present working directory can be accessed by commands you type just by entering their filenames: for example, `cat example.txt` would print the contents of the file `example.txt` in the Mac terminal if your present working directory is `/Users/demo/Documents`. However, if you're in a different directory, you must enter the "full path" of the file: for example, if your present working directory is the `My Downloads` folder instead of `My Documents`, then you would need to specify the full path of the file and enter the command `type "C:\Users\demo\My Documents\example.txt"`, to print the file's contents in the Windows command prompt.

#### Updating the PATH Environment Variable

When working in your shell, you can define variables that help make work easier. One such variable is PATH, which is a list of directories where executable programs are located. By adding a folder to the PATH, programs in that folder can be executed from any other folder/directory regardless of the present working directory.

So, by adding the directory containing the gen3-client program to your PATH variable, you can run it from any working directory without specifying the "full path" of the program. Simply enter the command `gen3-client`, and you will run the program.

> __Note:__ In the case that you haven't properly added the client to your path, the program can still be executed from any directory with the following command: `/full/path/to/executable/gen3-client <options>`. If you are working in the directory containing the executable, then `/full/path/to/executable` is simply `./`. So the command from the executable's directory would be `./gen3-client`.

#### Sending Parameters to Programs on Command-line

Most programs require some sort of user input to run properly. Some programs will prompt you for input after execution, while other programs are sent this input during execution as "flags" (AKA "arguments" or "options"). The gen3-client uses the latter method of sending user input as command arguments during program execution.

For example, when configuring a profile with the client, the user must specify the `configure` option and also specify the profile name, API endpoint, and credentials file by adding the flags `--profile`, `--apiendpoint` and `--cred` to the end of the command (see [configuring a profile section][config profile] above for specific examples).


### Expired Token

Many commons have a limit to how long a token is good before it is expired.  Once expired you may receive an error such  

``RequestNewAccessToken with error code 401``

If this happens (and you are still authorized to access the data), you can download a new API token and re-create your profile using the previously used command.   


<!-- AuthN/Z -->

[configure auth]: ../operator-guide/gen3-authn-methods.md
[era_commons]: https://public.era.nih.gov/commonsplus/public/login.era
[dbgap]: https://www.ncbi.nlm.nih.gov/gap/
[dbgap auth]: https://dbgap.ncbi.nlm.nih.gov/aa/wga.cgi?page=login

<!--Gen3 client -->
[Gen3 Client]: https://github.com/uc-cdis/cdis-data-client/releases/latest
[sdk_github]: https://github.com/uc-cdis/gen3sdk-python
[PATH]: access-data.md#working-from-the-command-line
[img create API key]: img/Gen3_Keys.png
[config profile]: access-data.md#configure-a-profile-with-credentials
