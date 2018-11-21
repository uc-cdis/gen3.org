---
title: "Gen3 - Data Analysis"
date: 2018-09-18T15:09:06-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Data Analysis in a Gen3 Data Commons

Data access in a Gen3 data commons must be agreed upon by the sponsor(s), data contributor(s), and the operator(s). Some data commons have rules that data cannot be downloaded outside of a Virtual Private Cloud (VPC). In these cases, data analysts may need to access and configure a virtual machine (VM) in the VPC where all analyses will be done. Other data commons may be able to grant users permissions to download data files directly to their local computers, while others may choose to allow analysis only in the Workspace.

* * *
## Using the Gen3 Workspace
* * *

Gen3 data commons feature a Workspace where users can access a personalized Jupyter server for data exploration and analysis. To access the workspace, click "Workspace" in the top navigation bar of the data portal.

![Data portal Workspace button](workspace_button.png)

Click "Start My Server" to start the Jupyter server in your Workspace:

![Start Server](start_server.png)

Or if a server is already running, click on "My Server" to access your files.

![Workspace home](my_server.png)

You will then be presented with "Spawner Options", which display different VM flavors with varying processor and memory specifications and different tools pre-installed. After choosing a flavor and clicking the "Spawn" button, you will see your personal JupyterHub appear.

![Spawner Options](spawner_options.png)

The Jupyter Workspace supports interactive programming sessions in the Python and R languages. Code blocks are entered in cells, which can be executed individually or all at once. Code documentation and comments can also be entered in cells, and the cell type can be set to support Markdown. Results, including plots, tables, and graphics, can be generated in the workspace and downloaded as files.

After editing a Jupyter notebook, it can be saved in the Workspace to revisit later by clicking the "Save" icon or by clicking "File" and then clicking "Save and checkpoint". Notebooks and files can also be downloaded from the server to your local computer by clicking "File" then "Download as". Similarly, notebooks and files can be uploaded to the Jupyter server from a local computer by clicking on the "Upload" button from the server's home page.

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

	On a terminal session from your local machine, not in the VM, setup the connection.

	Example:
	```
	ssh -N -L localhost:8888:localhost:8889 analysis
	```

	> NOTE:   In the example above "analysis" is the name of the ssh shortcut we [setup back in step 2](/user-guide/data-access/#2-ssh-to-virtual-machine-config).

4. Access the notebook in via browser.

	In your preferred browser and enter http://localhost:8888/;   Then from the VM terminal session, copy and paste the token from the notebook server into the requested spot in your browser.

 	Example:   Run Server, port forward, access notebook in browser</h5>
	![Jupyter notebook example](jupyter.gif)


5. Shutting Down your Server.

	When done working on the Jupyter server, we encourage users to shut down the Jupyter server via `ctrl + c` in the VM.  This does not have to be done every time, but should be done when the Jupyter server is not in use.

6. VM Termination.

	At this point in the Gen3 commons development, you should contact support@datacommons.io when the active VM is no longer needed. Active VMs accrue hourly charges, currently paid for by grants, so it is important to not waste valuable resources.
