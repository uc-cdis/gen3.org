---
title: "Gen3 - Working with the API"
date: 2018-09-18T15:10:30-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---

# Using the API
* * *
## What Does the API Do?
* * *
The API is created programmatically based on the Gen3 commons data model. All of the work Gen3 data contributors do to prepare their metadata powers the API (see steps [4-6 in the Data Contribution section](submit-data.md)).

With the API in place, users can submit queries to find metadata information across the Gen3 commons. The API can be queried programmatically or through provided tools, like the submission portal.

The Gen3 commons uses [GraphQL](http://graphql.org/) to manage the metadata. To learn the basics of writing queries in GraphQL, please visit: <http://graphql.org/learn>.

* * *
## Credentials to Query the API
* * *
The credentials that allow access to "raw" data in the object store and ssh keys to access VMs, also allow users to programmatically query or submit data to the API. This credential is used every time an API call is made.

Each API key is valid for a month and is used to receive a temporary access token that is valid for only 30 minutes. The access token is what must be sent to the Gen3 API to access data in the commons.

For users granted data access, the API key is provided on the Profile page after clicking the "Create API key" button.

* * *

![Profile Page](/img/profile-page.png)

* * *

While displayed, click "copy" to copy the API key to the clipboard or "download" to download a "credentials.json" file containing the id/key pair in json format.

* * *

![Copy Key](/img/copy-keys.png)

* * *

In python, the following command is sent, using the module "requests", to receive the access token:

```
# Save the copied credentials.json from the website into a variable "key":
key =  { "api_key": "<actual-key>", "key_id": "<a-key-uuid>" }

# Import the "requests" python module:
import requests

# Pass the API key to the Gen3 API using "requests.post" to receive the access token:
token = requests.post('https://gen3.commons.io/user/credentials/cdis/access_token', json=key).json()

# Now the access_token should be displayed when the following line is entered:
token

```

When submitting a graphQL query to the Gen3 API, or requesting data download/upload, include the access token in the request header:

```
headers = {'Authorization': 'bearer '+ token['access_token']}

# A GraphQL Endpoint Query Using the "key" JSON:
query = {'query':"""{project(first:0){project_id id}}"""};
ql = requests.post('https://gen3.commons.io/api/v0/submission/graphql/', json=query, headers=headers)
print(ql.text) # display the response

# Data Download via API Endpoint Request:
durl = 'https://gen3.commons.io/api/v0/submission/<program>/<project>/export?format=tsv&ids=' + ids[0:-1] # define the download url with the UUIDs of the records to download in "ids" list
dl = requests.get(durl, headers=headers)
print(dl.text) # display response

# Data Upload via API Endpoint Request:
headers['content-type']='text/tab-separated-values' # add the content-type to header
u = requests.put('https://gen3.commons.io/api/v0/submission/project-id', data=tsv, headers=headers)
```

If an an error such as "You don't have access... " occurs, then the API key is most likely out of date and a new access token will need to be made.

* * *

## Queries in the Submission Portal: GraphiQL
* * *

Queries can directly run in the submission portal by clicking the "Query" magnifying glass or directly at: https://gen3.datacommons.io/query. The query portal has been optimized to autocomplete fields based on content, increase speed and responsiveness, and generally make it easier for Gen3 members to find information.

> __NOTE:__ For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL of other data commons powered by Gen3.

![GraphQL Query](gQL-query.gif)

### Pagination and Offsets
Queries by defult return the first 10 entries. To return more entries, the query call can specify a larger number such as `(first:100)`.

In the case that too many results are returned, a timeout error might occur. In that case, use [pagination](http://graphql.org/learn/pagination/) to break up the query.

For example, if there are 2,550 records returned, and the graphiQL query is timing out with ```(first:3000)```, then break the query into multiple queries with offsets:

```
(first:1000, offset:0) 		# this will return records 0-1000
(first:1000, offset:1000) 	# this will return records 1000-2000
(first:1000, offset:2000) 	# this will return records 2000-2,550
```
Updating the example template `details from experiment` sample query to call the first 1000, the call becomes:

```
{
	"query":" query Test {
		experiment (first:1000, submitter_id: "<INSERT submitter_id>") {
			experimental_intent
			experimental_description
			number_samples_per_experimental_group
			type_of_sample
			type_of_specimen
		}
	} "
}
```

* * *
## Browsing by List of Projects
* * *
The metadata submission portal https://gen3.datacommons.io/submission can be used to browse a individual project by node. Select a project by clicking 'Submit Data' on the right side and then either explore the nodes in the "Toggle view" by clicking on individual nodes, or, by clicking the "browse nodes" button to the left. From this screen queries can be made by node in the dropdown at the left.

<h4> Example: Find Projects and browse Nodes</h4>
![Browse by node](projects-nodes-view.png)

This feature can also download the tsv associated with the node, or if a user has "write" access to the this project, delete existing nodes.

* * *
## Graphing a Project
* * *

A user can review a graph of an individual project, by toggling between views of the completed nodes and the full graph.

<h4> Example:  Graphing a Project </h4>
![Graphing a project](graph-a-project.gif)

* * *
## Using the Gen3 SDK
* * *

The bioinformatics team at the Center for Translational Data Science (CTDS) at University of Chicago has put together a basic software development kit (SDK) to help users interact with the Gen3 API, which can be found on [Github](https://github.com/uc-cdis/gen3sdk-python). The Gen3 community is encouraged to help improve the gen3sdk by adding functions to the library or developing Jupyter Notebooks that use it.

> __NOTE:__ As the Gen3 community updates repositories, keep them up to date using `git pull origin master`.

To [install the Gen3 SDK](https://gen3sdk-python.readthedocs.io/en/latest/install.html), use the python installer 'pip'.

Example:
```
# Install Gen3 SDK:
pip install gen3

# To clone and develop the source:
git clone https://github.com/uc-cdis/gen3sdk-python.git
```

* * *
# Querying and Downloading Metadata using the API
* * *
Users with read access to a project can download individual metadata records in the project or all records in a specified node of the project using the API.

The API endpoint for downloading all the records in a single node of a project is:
```
{commons-url}/api/v0/submission/{program}/{project}/export/?node_label={node}&format={json/tsv}
 Where:
{commons-url} is the gen3 data commons url (for example, 'data.bloodpac.org'),
{program} is the program name (for example, 'bpa'),
{project} is the project name
{node} is the name of the node
{json/tsv} is the format in which data will be downloaded, either json or tsv
 ```
For example, submitting the following API request will download all the records in the 'sample' node of the project 'training-example' in an example data commons (https://gen3.datacommons.io) as a tab-separated values file (TSV):
```
 https://gen3.datacommons.io/api/v0/submission/training/example/export/?node_label=sample&format=tsv
```

 The API endpoint for downloading a single record in a project is as follows:
```
{commons-url}/api/v0/submission/{program}/{project}/export?ids={ids}&format={json/tsv}
 Where:
{commons-url} is the gen3 data commons url (for example, 'data.bloodpac.org'),
{program} is the program name (for example, 'bpa'),
{project} is the project name
{ids} is a comma separated list of the UUIDs for the records to be downloaded
{json/tsv} is the format in which data will be downloaded, either json or tsv
 ```

 For example, submitting the following API request will download the two records corresponding to the UUIDs (bae26d13-9231-44e7-b6da-8057b35ad829 and e2b5705f-cd0b-4f4b-bb37-0c3e3032b71d), which are in the 'read_group' node of the project 'training-example' in the example data commons. This downloads a 'read_group.tsv' file.

 ```
 https://gen3.datacommons.io/api/v0/submission/training/example/export?ids=bae26d13-9231-44e7-b6da-8057b35ad829,e2b5705f-cd0b-4f4b-bb37-0c3e3032b71d&format=tsv
```

 If the list of UUIDs contains ids from different nodes in a project, then the data returned will be an archive containing a separate tsv/json per node.

 For example, if we add a third UUID to the previous comma-separated list of ids (c003a4b4-7d92-49d0-a412-375905328dca), which is the UUID of a record in the 'sample' node, then submitting the following request will download a 'tar.gz' archive containing a 'sample.tsv' and a 'read_group.tsv'.

 ```
 https://gen3.datacommons.io/api/v0/submission/training/example/export?ids=aae26d13-9231-44e7-b6da-8057b35ad829,d2b5705f-cd0b-4f4b-bb37-0c3e3032b71d,c003a4b4-7d92-49d0-a412-375905328dca&format=tsv
```
