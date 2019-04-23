---
title: "Gen3 - Data Analysis"
date: 2018-09-18T15:09:06-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Data Analysis in a Gen3 Data Commons

How data is accessed in a Gen3 data commons is determined by the commons' sponsor(s), data contributor(s), and/or  operator(s). Some data commons have rules that data cannot be downloaded outside of a Virtual Private Cloud (VPC). In these cases, data analysts may need to access and configure a virtual machine (VM) in the VPC where all analyses will be done. Other data commons may be able to grant users permissions to download data files directly to their local computers, while others may choose to allow analysis only in the Gen3-provided Workspace.

* * *
## Using the Gen3 Workspace
* * *

The software stack that powers Gen3 data commons' features a built-in "Workspace" where users can access a Jupyter Hub for data exploration and analysis. Jupyter Hub allows the creation of Python and R Jupyter notebooks and execution of scripts from the command-line in a Linux terminal.

An individual's Workspace includes a persistent drive in which analysis notebooks, scripts, data files, etc., are saved and persist even after logout. When a user logs out of their Workspace, their personal drive is unmounted, but when they log back in, the drive is mounted to their new VM, making their previously saved files and analyses accessible.

To access the workspace, click "Workspace" in the top navigation bar of the data portal.

![Data portal Workspace button](workspace_button.png)

Click "Start My Server" to start the Jupyter server in your Workspace:

![Start Server](start_server.png)

Or if a server is already running, click on "My Server" to access your files.

![Workspace home](my_server.png)

You will then be presented with "Spawner Options", which display different VM flavors with varying processor and memory specifications and different tools pre-installed. After choosing a flavor and clicking the "Spawn" button, you will see your personal JupyterHub appear.

![Spawner Options](spawner_options.png)

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

* * *
## Getting Files into the Gen3 Workspace
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

* * *
## Using the Gen3 SDK
* * *

The bioinformatics team at the Center for Translational Data Science (CTDS) at University of Chicago has put together a basic python library and a sample analysis notebook to help jumpstart commons analyses. These can be found on [Github](https://github.com/uc-cdis/gen3sdk-python). The Gen3 community is encouraged to add to the functions library or improve the notebook.  

> __NOTE:__   As the Gen3 community updates repositories, you can keep them up to date using `git pull origin master`.

To [install the Gen3 SDK](https://gen3sdk-python.readthedocs.io/en/latest/install.html), you can use the python installer 'pip'.

Example:
```
# Install Gen3 SDK:
pip install gen3

# To clone and develop the source:
git clone https://github.com/uc-cdis/gen3sdk-python.git
```

For more detailed information on how to use the Gen3 SDK, see the Gen3 SDK section of the [API documentation](/resources/user/using-api).

* * *
## Running a Jupyter Server on a Virtual Machine (VM)
* * *

1. Login to your 'analysis' VM.

	If accessing your VM through a head node, you can use a config file (~/.ssh/config) to create a "multiple hop" ssh tunnel to your VM:
	```
	Host headnode
		Hostname 12.345.678.90
		User bob
		IdentityFile ~/.ssh/id_rsa
		ForwardAgent yes

	Host analysis
		Hostname 171.60.63.71
		User ubuntu
		ProxyCommand ssh -q -AXY headnode -W %h:%p
	```
2. After logging in to your 'analysis' VM, startup a jupyter notebook server from the command-line.

	Example:
	```
	jupyter notebook --no-browser --port=8889
	```

	> __NOTE:__   You can stop a Juptyer server at anytime via `ctrl + c`

3. Port forwarding to your VM.

	Next you will want to set up a connection so that you can access the notebook being served from the VM to a browser in your local machine.

	Setup the connection on a terminal session from your local machine, not in the VM.

	Example:
	```
	ssh -N -L localhost:8888:localhost:8889 analysis
	```

	> NOTE:   In the example above, "analysis" is the name of the ssh shortcut that was [setup back in step 2](/user-guide/data-access/#2-ssh-to-virtual-machine-config).

4. Access the notebook via your browser.

	In your preferred browser enter http://localhost:8888/;   then from the VM terminal session, copy and paste the token from the notebook server into the requested spot in your browser.

 	Example:   Run Server, port forward, access notebook in browser</h5>
	![Jupyter notebook example](jupyter.gif)


5. Shutting Down your Server.

	When done working on the Jupyter server, we encourage users to shut down the Jupyter server via `ctrl + c` in the VM.  This does not have to be done every time, but should be done when the Jupyter server is not in use.

6. VM Termination.

	At this point in the Gen3 commons development, you should contact support@datacommons.io when the active VM is no longer needed. Active VMs accrue hourly charges, currently paid for by grants, so it is important to not waste valuable resources.
