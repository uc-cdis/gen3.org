# Workspaces

Gen3 workspaces are secure data analysis environments in the cloud that can access data from one or more data resources, including Gen3 Data Commons. Workspaces are often fully integrated with a specific data commons, and coming soon are workspaces as stand-alone analysis environments with a user pay model.

Gen3 Workspaces utilize the Gen3 Framework Services for user authentication and authorization and for retrieving data objects and metadata from data resources, like Gen3 Data Commons.

By default Gen3 Workspaces include Jupyter notebooks and RStudio but can be configured to host virtually any application, including analysis workflows, data processing pipelines, or data visualization apps.

## RStudio

![alt text](img/features/rstudio.svg)

Gen3 Workspaces come pre-configured with RStudio, a development environment for the statistical programming language R. Scripts saved in the workspace persist after logging out and can be shared with colleagues for collaborative analyses.

## Jupyter Notebooks

![alt text](img/features/jupyter.svg)

Gen3 Workspaces come with the ability to create, upload, modify and run Jupyter Notebooks by default, which are interactive documents that allow you to create and share live code, equations, visualizations and narrative text.

## Custom Applications

![alt text](img/features/visualization.svg)

When users log into a Gen3 Workspace, they have the option to spin up a variety of analysis environments with different processing power and pre-loaded with different tools for various analysis tasks. Virtually any custom application that can be loaded into a docker image can be integrated into a Gen3 Workspace environment, including analysis workflows, processing pipelines, and visualization apps.
