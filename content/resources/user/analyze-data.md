---
title: "Gen3 - Data Analysis"
date: 2018-09-18T15:09:06-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Data Analysis in a Gen3 Data Commons
* * *

How data is accessed in a Gen3 data commons is determined by the commons' sponsor(s), data contributor(s), and/or  operator(s). Some data commons may be able to grant users permissions to download data files directly to their local computers, while others may choose to allow analysis only in the Gen3-provided Workspace. Other data commons may have rules that data cannot be downloaded outside of a Virtual Private Cloud (VPC). In these cases, data analysts may need to access and configure a virtual machine (VM) in the VPC where all analyses will be done. Please contact with <Gen3-support@datacommons.io> to receive further instructions.

Data can be analyzed in the Gen3 Workspace or using the Gen3 SDK. For a general introduction to data analysis, feel free to take a look at our webinars on our [YouTube channel](https://www.youtube.com/channel/UCMCwQy4EDd1BaskzZgIOsNQ/videos).

* [1. Using the Gen3 Workspace](#1-using-the-gen3-workspace)
* [2. Getting Files into the Gen3 Workspace](#2-getting-files-into-the-gen3-workspace)
* [3. Working with the proxy and whitelists](#3-orking-with-the-proxy-and-whitelists)
* [4. Using the Gen3 SDK](#4-using-the-gen3-sdk)


* * *
## 1. Using the Gen3 Workspace
* * *

The software stack that powers Gen3 data commons' features a built-in "Workspace" where users can access a Jupyter Hub for data exploration and analysis. Jupyter Hub allows the creation of Python and R Jupyter notebooks and execution of scripts from the command-line in a Linux terminal.

An individual's Workspace includes a persistent drive in which analysis notebooks, scripts, data files, etc., are saved and persist even after logout. When a user logs out of their Workspace, their personal drive is unmounted, but when they log back in, the drive is mounted to their new VM, making their previously saved files and analyses accessible.

To access the workspace, click "Workspace" in the top navigation bar of the data portal.

![Data portal Workspace button](workspace_button2020.png)

You will then be presented with Workspace options, which display different VM flavors with varying processor and memory specifications and different tools pre-installed.

![Spawner Options](workspace_flavors2020.png)

After choosing a flavor, you will see your personal JupyterHub appear.
Click “New” and choose your Notebook to start the Jupyter server in your Workspace:

![New Workspace](workspace_new_nb2020.png)

The Jupyter Workspace supports interactive programming sessions in the Python and R languages. Code blocks are entered in cells, which can be executed individually or all at once. Code documentation and comments can also be entered in cells, and the cell type can be set to support Markdown. Results, including plots, tables, and graphics, can be generated in the workspace and downloaded as files.

After editing a Jupyter notebook, it can be saved in the Workspace to revisit later by clicking the "Save" icon or by clicking "File" and then clicking "Save and Checkpoint". Notebooks and files can also be downloaded from the server to your local computer by clicking "File" then "Download as". Similarly, notebooks and files can be uploaded to the Jupyter server from a local computer by clicking on the "Upload" button from the server's home page.

![Upload Save Download Notebook](upload_save_download.gif)

The following clip illustrates downloading the credentials.json from the "Identity" page in the data portal, then uploading that file to the Jupyter Workspace and reading it in a Python notebook named "Gen3_authentication.ipynb":

![Python Notebook](authentication.gif)

This clip demonstrates creating a new Jupyter notebook in the R language:

![Python Notebook](R_jupyter_notebook_workspace.gif)

Terminal sessions can also be started in the Workspace and used to download other tools.

![Terminal Session](terminal_session.gif)

You can manage active Notebook and terminal processes by clicking on "Running". Clicking "Shutdown" will terminate the terminal session or close the Jupyter notebook. Be sure to save your notebooks before terminating them.

![Manage Running Sessions](running.gif)

## 2. Getting Files into the Gen3 Workspace
* * *
In order to download data files directly from a Gen3 data commons into your workspace, install and use the [gen3-client](https://github.com/uc-cdis/cdis-data-client/releases/latest) in a terminal window from your Workspace.  Launch a terminal window by clicking on the "New" dropdown menu, then click on "Terminal".

From the command line, download the latest [Linux version of the gen3-client](https://github.com/uc-cdis/cdis-data-client/releases/latest) using the `wget` command. Next, unzip the archive and add it to your path:

Example:
```
wget https://github.com/uc-cdis/cdis-data-client/releases/download/0.3.0/dataclient_linux.zip
unzip dataclient_linux.zip
PATH=$PATH:~/
```
Now the gen3-client should be ready to use in your JupyterHub terminal.

Other files you might need, like your `credentials.json` file to configure a profile or a download `manifest.json` file can be uploaded to your server by clicking on the "Upload" button or just dragging and dropping into the 'Files' tab. Text can also be pasted into a file by clicking "New", then choosing "Text File". Filenames can be changed by clicking the checkbox next to the file and then clicking the "Rename" button that appears.

Example:
```
jovyan@jupyter-user:~$ wget https://github.com/uc-cdis/cdis-data-client/releases/download/0.3.0/dataclient_linux.zip
Resolving github-production-release-asset-2e65be.s3.amazonaws.com
Connecting to github-production-release-asset-2e65be.s3.amazonaws.com
HTTP request sent, awaiting response... 200 OK
Length: 3886413 (3.7M) [application/octet-stream]
Saving to: ‘dataclient_linux.zip’
dataclient_linux.zip           100%[===================================================>]   3.71M  20.6MB/s    in 0.2s

jovyan@jupyter-user:~$ unzip dataclient_linux.zip
Archive:  dataclient_linux.zip
  inflating: gen3-client

jovyan@jupyter-user:~$ PATH=$PATH:~/

jovyan@jupyter-user:~$ gen3-client configure --profile bob --cred credentials.json
  API endpoint: https://data.gen3.org

jovyan@jupyter-user:~$ gen3-client download --profile bob --guid d4a40383-802d-4639-9b8b-e82c900f2c66 --file=results.txt
  Successfully downloaded results.txt

jovyan@jupyter-user:~$ mkdir files

jovyan@jupyter-user:~$ gen3-client download-manifest --manifest manifest.json --download-path files--profile bob
  Finished files/a30531c6-9caa-4356-a95f-5f4d6a012913 6721797 / 6721797 bytes (100%)
  Finished files/5737b1de-22f0-45ce-a3b8-cfacc66c7ec0 6716095 / 6716095 bytes (100%)
  2 files downloaded.
```

## 3. Working with the proxy and whitelists
* * *

<h4> Working with the Proxy </h4>

To prevent unauthorized traffic, the Gen3 VPC utilizes a proxy.   If you are using one of the custom VMs setup, there is already a line in your .bashrc file to handle traffic requests.

```
export http_proxy=http://cloud-proxy.internal.io:3128
export https_proxy=$http_proxy
```

Alternatively, if you have a different service or a tool that needs to call out, you can set the proxy with each command.

```
https_proxy=https://cloud-proxy.internal.io:3128 aws s3 ls s3://gen3-data/ --profile <profilename>
```

<h4> Whitelists </h4>

Additionally, to aid Gen3 Commons security, tool installation from outside sources is managed through a whitelist.   If you have problems installing a tool you need for your work, contact <Gen3-support@datacommons.io> and with a list of any sites you might wish to install tools from.    After passing a security review,  these can be added to the whitelist to facilitate access.



## 4. Using the Gen3 SDK
* * *

The bioinformatics team at the Center for Translational Data Science (CTDS) at University of Chicago has put together a basic python library and a sample analysis notebook to help jumpstart commons analyses. In short, the SDK entails classes that do basic API requests for the user and authenticates, such as 1) *Gen3Auth*, which contains an authorization wrapper to support JWT-based authentication, 2) *Gen3Submission*, which interacts with the Gen3's submission service including GraphQL queries, and 3) *Gen3Index*, which interacts with the Gen3's Indexd service for GUID brokering and resolution. Below we show how to get started and a selection of commonly used SDK classes/functions to interact with a Gen3 data commons.

> __NOTE:__ The complete SDK documentation can be found on [Github](https://github.com/uc-cdis/gen3sdk-python) or on the [API documentation page](https://uc-cdis.github.io/gen3sdk-python/_build/html/index.html). The Gen3 community is encouraged to add to the functions library or improve the notebook.

### How to get started
To [install the Gen3 SDK](https://gen3sdk-python.readthedocs.io/en/latest/install.html), you can use the python installer 'pip':

```
# Install Gen3 SDK:
pip install gen3

# To clone and develop the source:
git clone https://github.com/uc-cdis/gen3sdk-python.git

# As the Gen3 community updates repositories, you can keep them up to date using:
git pull origin master

```

### Examples
1) Start interacting with the data commons using the authentication class _Gen3Auth_
```
import gen3
from gen3.auth import Gen3Auth
endpoint = "https://gen3.datacommons.io/"
creds = "/user/directory/credentials.json"
auth = Gen3Auth(endpoint, creds)
```

2) Functions in the most commonly used class _Gen3Submission_ can be used to list programs/projects and export structured metadata from a node.

2.1) All available programs in the data commons will be shown with the function `get_programs`. The following commands:

```
from gen3.submission import Gen3Submission
sub = Gen3Submission(endpoint, auth)
sub.get_programs()
```

will return: `{'links': ['/v0/submission/OpenNeuro',
  '/v0/submission/GEO',
  '/v0/submission/OpenAccess',
  '/v0/submission/DEV']}`

2.2) All projects under a particular program ("OpenAccess") will be shown with the function `get_projects`. The following commands:

```
from gen3.submission import Gen3Submission
sub = Gen3Submission(endpoint, auth)
sub.get_projects("OpenAccess")
```

will return "CCLE" as the project under the program: `{'links': ['/v0/submission/OpenAccess/CCLE']}`

2.3) All structured metadata stored under one node of a project can be exported as a tsv file with the function `export_node`. The following commands:

```
from gen3.submission import Gen3Submission
sub = Gen3Submission(endpoint, auth)
program = "OpenAccess"
project = "CCLE"
node_type = "aligned_reads_file"
fileformat = "tsv"
filename = "OpenAccess_CCLE_aligned_reads_file.tsv"
sub.export_node(program, project, node_type, fileformat, filename)
```

will return: `Output written to file: OpenAccess_CCLE_aligned_reads_file.tsv`


3) The function `get_record` in the class _Gen3Index_ is used to show all metadata associated with a given id by interacting with Gen3's Indexd service. Guids can be found on the Exploration page (https://gen3.datacommons.io/explorer) under the `Files` tab. The following commands:

```
from gen3.index import Gen3Index
ind = Gen3Index(endpoint, auth)
record1 = ind.get_record("92183610-735e-4e43-afd6-7b15c91f6d10")
print(record1)
```

will return: `{'acl': ['*'], 'authz': ['/programs/OpenAccess/projects/CCLE'], 'baseid': 'e9bd6198-300c-40c8-97a1-82dfea8494e4', 'created_date': '2020-03-13T16:08:53.743421', 'did': '92183610-735e-4e43-afd6-7b15c91f6d10', 'file_name': None, 'form': 'object', 'hashes': {'md5': 'cbccc3cd451e09cf7f7a89a7387b716b'}, 'metadata': {}, 'rev': '13077495', 'size': 15411918474, 'updated_date': '2020-03-13T16:08:53.743427', 'uploader': None, 'urls': ['https://api.gdc.cancer.gov/data/30dc47eb-aa58-4ff7-bc96-42a57512ba97'], 'urls_metadata': {'https://api.gdc.cancer.gov/data/30dc47eb-aa58-4ff7-bc96-42a57512ba97': {}}, 'version': None}`
