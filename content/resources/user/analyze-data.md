---
title: "Gen3 - Data Analysis"
date: 2018-09-18T15:09:06-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Data Analysis in a Gen3 Data Commons

How data is accessed in a Gen3 data commons must be agreed upon by the sponsor(s), data contributor(s), and the operator(s). Some data commons have rules that data cannot be downloaded outside of a Virtual Private Cloud. In these cases, data analysts may need to access and configure a virtual machine (VM) in the VPC where all analyses will be done. Other data commons may be able to grant users permissions to download data files directly to their local computers, while others may choose to allow analysis only in the Workspace.

* * *
## Using the Gen3 Workspace
* * *
Gen3 data commons feature a Workspace where users can access a personalized Jupyter server for data exploration and analysis. To access the workspace, click "Workspace" in the top navigation bar of the data portal.
![Data portal Workspace button](workspace_button.png)

Click "Start My Server" to start the Jupyter server in your Workspace:
![Start Server](start_server.png)

Or if a server is already running, click on "My Server" to access your files.
![Workspace home](my_server.png)

You will then be presented with "Spawner Options", which display different VM flavors with varying processor and memory specifications and different tools pre-installed. After choosing a flavor and clicking Spawn, you will see your personal JupyterHub appear.

![Spawner Options](spawner_options.png)

The Jupyter Workspace supports interactive programming sessions in the Python and R languages. Code blocks are entered in cells, which can be executed individually in any order or all at once. Code documentation and comments can also be entered in cells, and the cell type can be set to support, e.g., Markdown. Results, including plots, tables, and graphics, can be generated in the workspace and downloaded as files.

After editing a Jupyter notebook, it can be saved in the Workspace to revisit later by clicking the "save" icon or "File" and then "Save and checkpoint". Notebooks and files can also be downloaded from the server to your local computer by clicking "File" then "Download as". Similarly, notebooks and files can be uploaded to the Jupyter server from a local computer by clicking on the "upload" button from the server's home page.
![Upload Save Download Notebook](upload_save_download.gif)

The following clip illustrates downloading the credentials.json from the "Identity" page in the data portal, then uploading that file to the Jupyter Workspace and reading it in a Python notebook named "Gen3_authentication.ipynb":
![Python Notebook](authentication.gif)

This clip demonstrates creating a new Jupyter notebook in the R language:
![Python Notebook](R_jupyter_notebook_workspace.gif)

Terminal sessions can also be started in the Workspace and used to download other tools.
![Terminal Session](terminal_session.gif)

You can manage active Notebook and terminal processes by clicking on "Running". Clicking "shutdown" will terminate the terminal session or close the Jupyter notebook. Be sure to save your notebooks before terminating them.
![Manage Running Sessions](running.gif)

* * *
## Running a Jupyter server on a virtual machine (VM)
* * *

The bioinformatics team at the Center for Data Intensive Science (CDIS) at University of Chicago has put together a basic python library and a sample analysis notebook to help jumpstart commons analyses.    Both can be found in your VM in the analysis folder.    They can also be found at: [https://github.com/occ-data/gen3-functions](https://github.com/occ-data/gen3-functions).    The Gen3 community is encouraged to add to the functions library or improve the notebook.  

> NOTE:   As the Gen3 community updates repositories, you can keep them up to date using `git pull origin master` in the `functions` folder.   It has already been initialized to sync with this repository.

> NOTE2: If you receive an error when trying to do `git pull`, you may need to set proxies and/or either save or drop any changes you've made:

```
# set proxies:
export http_proxy="http://cloud-proxy.internal.io:3128"
export https_proxy="http://cloud-proxy.internal.io:3128"

# to drop changes:
git stash save --keep-index
git stash drop

# or save changes
git commit .

# Update CDIS utils python libraries:
git clone https://github.com/uc-cdis/cdis-python-utils.git
cd cdis-python-utils
sudo -E python setup.py install

# unset proxies to get juypter notebook to work again
unset http_proxy;
unset https_proxy;
```

What follows in this wiki is a guide to setting up this Jupyter notebook so that you can run everything in your browser.   In the notebook, you'll learn about basic data commons operations like:  

* Querying the API for metadata associated with submissions
* Pulling data into your VM for analysis
* Running a simple analysis over a file and collection of files
* Plotting the results

## Running the notebook in your VM

After we're logged in to our analysis VM and in the functions directory (from home: `cd functions`), run the jupyter notebook server.  

Run the notebook server:
```
jupyter notebook --no-browser --port=8889
```

>NOTE:   You can stop a Juptyer server at anytime via `ctrl + c`

## Port forwarding to your VM

Next you'll want to set up a connection so that you can access the notebook being served from the VM to a browser in your local machine.   

On a terminal session from your local machine (not in the VM) setup the connection:
```
ssh -N -L localhost:8888:localhost:8889 analysis
```

> NOTE:   In the example above "analysis" is the name of the ssh shortcut we [setup back in step 2](/user-guide/data-access/#2-ssh-to-virtual-machine-config).

## Access the notebook in via browser

In your preferred browser and enter http://localhost:8888/;   Then from the VM terminal session, copy and paste the token from the notebook server into the requested spot in your browser.

<h5> Example:   Run Server, port forward, access notebook in browser</h5>
![Jupyter notebook example](jupyter.gif)

## Review and follow the notebook

<h4> Credentials </h4>

The notebook makes use of both a [.secrets file](/appendices/api/#secrets-credentials-to-query) that came preloaded in your VM in the home directory that lets you query the metadata API from the VM, and the [s3 profile you created](/user-guide/data-access/#4-access-raw-data-storage-from-virtual-machine) to pull 'raw' data into your VM for analysis.

The first thing you'll want to do is update the "profile" variable in the first cell to whatever the name of your s3 profile is.       

>NOTE:  If you have forgotten what you called your profile, you can always take a look at the credential file to review.  From the VM run:  `vi ~/.aws/credentials`.  

<h4> Jupyter Basics </h4>
If you're not familiar with Jupyter notebooks, you have a few options to run the commands inside.   You can review line by line (select cell - `Shift+Enter`) or you can run all from the "Kernel" menu at the top of the browser.   

<h4> Shutting Down your Server</h4>
When you're done working, we encourage you to shut down your Jupyter server via `ctrl + c` in the VM that's running it.  You don't have to do this every time, but you should do it when you don't need it any more.   

<h4> VM Termination </h4>
At this point in the Gen3 commons development, you should contact support@datacommons.io when you no longer need your VM active.   Active VMs accrue hourly charges (currently paid for by the Consortium and grants), so it's important to not waste valuable resources.   
