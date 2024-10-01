# Analyze Data - Workspace

The Gen3 platform for creating data commons co-locates data management with analysis workspaces, apps and tools. Workspaces are highly customizable by the operators of a Gen3 data commons and offer a variety of VM images (virtual machines) pre-configured with tools for specific analysis tasks. Custom applications for executing bioinformatics workflows or exploratory analyses may be integrated in the navigation bar as well. The following documentation primarily covers exploratory data analysis in the standard Gen3 Workspace, which can be accessed by clicking the “Workspace” icon in the top navigation bar or navigating to the [/workspace][workspace] endpoint.

## Launch Workspace

Click on the “Workspace” icon or navigate to the [/workspace][workspace] endpoint to see a list of pre-configured virtual machine (VM) images offered by the data commons and click the “Launch” button to spin-up a VM.

![Image of preconfigured VM workspace options][img VM options]

Once connected to a workspace VM, the persistent drive named “/pd” can be seen in the Files tab of either JupyterHub or RStudio. All data, notebooks, or scripts that need to persist in the cloud after workspace termination should be saved in this “pd” drive. When logging out of a workspace, this personal drive is unmounted but saved, so that when launching a new workspace VM, the drive can be mounted again to make the saved work accessible.

Jupyter notebooks and other analysis-related files like scripts can be uploaded to JupyterHub by clicking the “upload” button. Make sure to save files to the “/pd” directory if they need to remain accessible after logging out.

![Upload button for Jupyter notebook][img Jupyter upload]

Alternatively, a new notebook can be created by clicking “New” and then choosing the type of notebook, for example, “Python 3” or “R”.

![New workspace dropdown for Jupyter notebook][img Jupyter new workspace]

JupyterHub supports interactive programming sessions in the Python and R languages. Code blocks are entered in cells, which can be executed individually or all at once. Code documentation and comments can also be entered in cells, and the cell type can be set to support Markdown. Results, including plots, tables, and graphics, can be generated in the workspace and downloaded as files.

After editing a Jupyter Notebook, it can be saved in the workspace by clicking the “Save” icon or by clicking “File” and then clicking “Save and Checkpoint”. Notebooks and files can also be downloaded from the server to a local computer by clicking “File” then “Download as”.

![Image showing how to save and download options for the Jupyter notebook][img Jupyter save]

The following clip demonstrates creating a new Jupyter Notebook in the R language.

![GIF demonstrating how to create and use a new Jupyter notebook in R][gif Make Jupyter in R]

Terminal sessions can also be started in the Workspace and used to download other tools.

![GIF showing how to open a new terminal window and install other tools][gif Open Terminal in Jupyter]

You can manage active notebooks and terminal processes by clicking on the tab “Running”. Click “Shutdown” to close the terminal session or Jupyter Notebook. Be sure to save your notebooks before terminating them, and again, ensure any notebooks to be accessed later are saved in the “pd” directory.

![GIF showing how manage Jupyter notebooks on the Running tab][gif Jupyter Running tab]

## Getting Files into the Gen3 Workspace
Bringing in files into the Gen3 Workspace can be achieved via the UI (directly from the Exploration page) or programmatically. Find below a description of both methods.

> Note: Not every PlanX Data Commons has the function in the UI enabled; users are advised to follow available commons-specific documentation.

### Exporting Files from the Exploration Tab to the Workspace
The Exploration page allows to search through data and create cohorts, which can be exported to the Workspace. After a cohort has been selected, the data can be exported to a Workspace by clicking “Export to Workspace”. Do not navigate away from the browser after clicking the button. Allow up to 5 minutes to export your files. A popup window will appear confirming that exporting a “manifest” to the workspace has been successful. Find the data or data files in the folder “data” on your persistent drive “/pd”. Please note, that the workspace mounts up to 5 different manifests while the workspace is running, but shows only the latest exported manifest in a newly launched workspace.

![Screenshot of Exploration page showing how to export data to a Workspace with button][img Export Data to Workspace]

### Getting Files into the Workspace programmatically

In order to download data files directly and programmatically from a Gen3 data commons into your workspace, install and use the [gen3-client][gen3 client] in a terminal window from your Workspace. Launch a terminal window by clicking on the “New” dropdown menu, then click on “Terminal”.

From the command line, download the latest [Linux version of the gen3-client][linux gen3 client] using the `wget` command. Next, unzip the archive and add it to your path:

Example:
```
wget https://github.com/uc-cdis/cdis-data-client/releases/download/2020.11/dataclient_linux.zip
unzip dataclient_linux.zip
PATH=$PATH:~/
```
Now the gen3-client should be ready to use in the JupyterHub terminal.

Other required files, like the `credentials.json` file which contains API keys needed to configure a profile or a download `manifest.json` file can be uploaded to the workspace by clicking on the “Upload” button or by dragging and dropping into the ‘Files’ tab. Text can also be pasted into a file by clicking “New”, then choosing “Text File”. Filenames can be changed by clicking the checkbox next to the file and then clicking the “Rename” button that appears.

Example:
```
jovyan@jupyter-user:~$ wget https://github.com/uc-cdis/cdis-data-client/releases/download/2020.11/dataclient_linux.zip
--2020-11-12 19:33:45-- Resolving github-production-release-asset-2e65be.s3.amazonaws.com
Connecting to github-production-release-asset-2e65be.s3.amazonaws.com
HTTP request sent, awaiting response... 200 OK
Length: 7445539 (7.1M) [application/octet-stream]
Saving to: ‘dataclient_linux.zip’
dataclient_linux.zip            100%[=====================================================>]   7.10M  --.-KB/s    in 0.05s
2020-11-12 19:33:45 (143 MB/s) - ‘dataclient_linux.zip’ saved [7445539/7445539]


jovyan@jupyter-user:~$ unzip dataclient_linux.zip
Archive:  dataclient_linux.zip
  inflating: gen3-client

jovyan@jupyter-user:~$ PATH=$PATH:~/

jovyan@jupyter-user:~$ gen3-client configure --apiendpoint=https://gen3.datacommons.io --profile=demo --cred=credentials.json
2020/11/12 19:43:51 Profile 'demo' has been configured successfully.

jovyan@jupyter-user:~$ gen3-client download-single --profile=demo --guid=6e312ac3-874d-4cad-b84b-474aa0209d49 --no-prompt --skip-completed
2020/11/12 20:06:43 Preparing file info for each file, please wait...
 1 / 1 [===========================================================================================================] 100.00% 0s
2020/11/12 20:06:43 File info prepared successfully
pheno_63878_2.txt  78.53 KiB / 78.53 KiB [============================================================================] 100.00%
2020/11/12 20:06:44 1 files downloaded.

jovyan@jupyter-user:~$ mkdir files

jovyan@jupyter-user:~$ gen3-client download-multiple --profile=demo --manifest=file-manifest-demo.json --skip-completed
2020/11/12 22:18:13 Reading manifest...
 18.17 KiB / 18.17 KiB [====================================================================] 100.00% 0s
2020/11/12 22:18:18 Total number of GUIDs: 98
2020/11/12 22:18:18 Preparing file info for each file, please wait...
 98 / 98 [==================================================================================] 100.00% 3s
2020/11/12 22:18:21 File info prepared successfully
GSM1558792_Sample9_3.CEL.gz  4.04 MiB / 4.04 MiB [=============================================] 100.00%
GSM1558835_Sample31_1.CEL.gz  4.18 MiB / 4.18 MiB [============================================] 100.00%
GSM1558866_Sample46_3.CEL.gz  4.02 MiB / 4.02 MiB [============================================] 100.00%
GSM1558804_Sample15_3.CEL.gz  4.19 MiB / 4.19 MiB [============================================] 100.00%
GSM1558810_Sample18_3.CEL.gz  4.16 MiB / 4.16 MiB [============================================] 100.00%
GSM1558854_Sample40_3.CEL.gz  4.20 MiB / 4.20 MiB [====================....
2020/11/12 22:18:55 98 files downloaded.

jovyan@jupyter-user:~$  mv *.gz files
```

## Working with the proxy and whitelists

### Working with the Proxy

To prevent unauthorized traffic, the Gen3 VPC utilizes a proxy. If you are using one of the custom VMs setup, there is already a line in your .bashrc file to handle traffic requests.

```
export http_proxy=http://cloud-proxy.internal.io:3128
export https_proxy=$http_proxy
```
Alternatively, if you have a different service or a tool that needs to call out, you can set the proxy with each command.
```
https_proxy=https://cloud-proxy.internal.io:3128 aws s3 ls s3://gen3-data/ --profile <profilename>
```

### Whitelists

Additionally, to aid Gen3 Commons security, the installation of tools from outside resources is managed through a whitelist. If you have problems installing a tool you need for your work, contact [support@datacommons.io][DC support email] and with a list of any sites you might wish to install tools from. After passing a security review, these can be added to the whitelist to facilitate access.


[workspace]: https://gen3.datacommons.io/workspace
[img VM options]: https://gen3.org/resources/user/analyze-data/workspace_flavors2020.png
[img Jupyter upload]: https://gen3.org/resources/user/analyze-data/notebook_upload.png
[img Jupyter new workspace]: https://gen3.org/resources/user/analyze-data/workspace_new_nb2020.png
[img Jupyter save]: https://gen3.org/resources/user/analyze-data/notebook_download.png
[gif Make Jupyter in R]: https://gen3.org/resources/user/analyze-data/R_jupyter_notebook_workspace.gif
[gif Open Terminal in Jupyter]: https://gen3.org/resources/user/analyze-data/terminal_session.gif
[gif Jupyter Running tab]: https://gen3.org/resources/user/analyze-data/running.gif
[img Export Data to Workspace]: https://gen3.org/resources/user/analyze-data/export_to_workspace.png
[gen3 client]: https://github.com/uc-cdis/cdis-data-client/releases/latest
[linux gen3 client]: https://github.com/uc-cdis/cdis-data-client/releases/latest
[DC support email]: support@datacommons.io
[Gen3 Python SDK Github]: https://github.com/uc-cdis/gen3sdk-python
[Gen3 Python SDK doc]: https://uc-cdis.github.io/gen3sdk-python/_build/html/index.html
[Jupyter demos]: https://gen3.org/resources/user/analyze-data/#5-jupyter-notebook-demos
[Gen3 Python SDK install]: https://gen3sdk-python.readthedocs.io/en/latest/install.html
[Exploration page]: https://gen3.datacommons.io/explorer
[notebook browser]: https://gen3.datacommons.io/resource-browser
[#1 Gen3_auth notebook]: https://gen3.org/resources/user/analyze-data/Gen3_authentication.html
[#1 .ipynb]: https://gen3.org/resources/user/analyze-data/Gen3_authentication.ipynb
[#2 notebook canine]: https://gen3.org/resources/user/analyze-data/notebook2_canine.html
[Canine Data Commons]: https://caninedc.org/
[#2 .ipynb]: https://gen3.org/resources/user/analyze-data/notebook2_canine.ipynb
[#3 notebook]: https://gen3.org/resources/user/analyze-data/notebook3_gen3datacommonsio.html
[Gen3 generic DC]: https://gen3.org/resources/user/analyze-data/gen3.datacommons.io
[#3 .ipynb]: https://gen3.org/resources/user/analyze-data/notebook3_gen3datacommonsio.ipynb
