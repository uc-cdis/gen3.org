---
title: "Gen3 - Working with the API"
date: 2018-09-18T15:10:30-05:00
linktitle: /resources/user
---

# Working with the API
* * *
## What does the API do?
* * *
The API is created programmatically based on the [Gen3 commons data model](https://github.com/occ-data/datadictionary).   All of the work Gen3 data contributors do to prepare their metadata powers the API (see steps [4-6 in the Data Contribution section](/user-guide/data-contribution/#4-prepare-metadata-that-fits-the-data-model)).   

With the API in place, users can submit queries to find whatever metadata information they might like across the Gen3 commons.   The API can be queried programmatically or through provided tools like the submission portal.  

We use [GraphQL](http://graphql.org/) to manage the metadata in the Gen3 commons.  To learn the basics of writing queries in Graph QL, we recommend [this introduction](http://graphql.org/learn/).

* * *
## What's an example of the API at work?  
* * *
The Gen3 commons team has created a few matrices to help describe submitted data.   These are linked to from: <https://www.gen3.org/data-group/>

These query the API for the desired metadata and return the matrices.   They run on cron jobs that update hourly, so if you're submitting data or adding to the commons, you can watch your entry appear.   If you are a member and would like to view these matrices, contact info@gen3.org for a username and password.   

* * *
## Credentials to query the API
* * *
Like your credentials that let you access "raw" data in the object store or your ssh keys that let you access a VM, there is also a credential that lets you programmatically query or submit data to the API. This credential is used every time you make an API call.

Each API key is valid for a month and is used to receive a temporary access token that is valid for only 30 minutes. The access token is what must be sent to the Gen3 API to access data in the commons.

For users granted data access, the API key is provided on your Profile page when you click "Create API key".
* * *
![Profile Page](/img/profile-page.png)
* * *
While displayed, you can click "copy" to copy the API key to your clipboard or "download" to download a "credentials.json" file containing the id/key pair in json format.
* * *
![Copy Key](/img/copy-keys.png)
* * *

In python, the following command is sent, using the module "requests", to receive the access token:
```
# Save your copied credentials.json from the website into a variable "key":
key =  { "api_key": "<actual-key>", "key_id": "<a-key-uuid>" }

# Import the "requests" python module:
import requests

# Pass the API key to the Gen3 API using "requests.post" to receive the access token:
token = requests.post('https://gen3.commons.io/user/credentials/cdis/access_token', json=key).json()

# Now you should see your access_token displayed when you enter:
token

```

When submitting a graphQL query to the Gen3 API, or requesting data download/upload, include the access token in your request header:

```
headers = {'Authorization': 'bearer '+ token['access_token']}

# a graphQL endpoint query using the "key" json:
query = {'query':"""{project(first:0){project_id id}}"""};
ql = requests.post('https://gen3.commons.io/api/v0/submission/graphql/', json=query, headers=headers)
print(ql.text) # display the response

# Data download via API endpoint request:
durl = 'https://gen3.commons.io/api/v0/submission/<program>/<project>/export?format=tsv&ids=' + ids[0:-1] # define the download url with the UUIDs of the records to download in "ids" list
dl = requests.get(durl, headers=headers)
print(dl.text) # display response

# Data upload via API endpoint request:
headers['content-type']='text/tab-separated-values' # add the content-type to header
u = requests.put('https://gen3.commons.io/api/v0/submission/project-id', data=tsv, headers=headers)
```

If you receive an error like "You don't have access... ", then you will most likely need to update your API key or request a new access token.

* * *

## Queries in the submission portal:   graphQL
* * *
You can run queries directly in the submission portal by clicking the "Query" magnifying glass or directly at: <https://data.gen3.org/graphql>. Queries are essential as you begin analyses. The query portal has been optimized to autocomplete fields based on content, increase speed and responsiveness, and generally make it easier for Gen3 members to find what they need.

![GraphQL Query](/img/gQL-query.gif)

### Pagination and Offsets:   Default = first 10 entries
Queries by defult return the first 10 entries. If you want more than that, you can specify it in the query call: ```(first:1000)```

In the case that too many results are returned, you may receive a timeout error. In that case, you may want to use [pagination](http://graphql.org/learn/pagination/). For example, if there are 2,550 records returned, and your graphiQL query is timing out with ```(first:3000)```, then break your query into multiple queries with offsets:

```
(first:1000, offset:0) 		# this will return records 0-1000
(first:1000, offset:1000) 	# this will return records 1000-2000
(first:1000, offset:2000) 	# this will return records 2000-2,550
```
Updating the example template [`details from experiment`](/assets/details_from_experiment.json) sample query to call the first 1000, the call becomes:  

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
## Browsing by project node    
* * *
The metadata submission portal [https://data.gen3.org/](https://data.gen3.org/) can be used to browse an individual submission by node.   Just select a project and then click the "browse nodes" button to the right.    From there, you'll get a screen like below where you can query by node in the dropdown at the left.

<h4> Example:  Browse by node </h4>
![Browse by node](/img/browse-by-node.png)

You can also use this feature to download the tsv associated with the node, or if you have "write" access to the this project, delete existing nodes.   

* * *
## Graphing a project
* * *
You can also review a graph of an individual project, toggling between views of the completed nodes and the full graph.  

<h5> Example:  Graphing a project </h5>
![Graphing a project](/img/graph-a-project.gif)

