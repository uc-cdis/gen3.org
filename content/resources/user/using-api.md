---
title: "Gen3 - Working with the API"
date: 2018-09-18T15:10:30-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---

# Using the API
* * *

* [What Does the API Do](#what-does-the-api-do)
* [Credentials to send API requests](#credentials-to-send-api-requests)
* [Querying and Downloading Metadata using the API](#querying-and-downloading-metadata-using-the-api)

---


## What Does the API Do?
* * *
The API is created programmatically based on the Gen3 commons data model. All of the work Gen3 data contributors do to prepare their metadata powers the API (see steps [4-6 in the Data Contribution section](/resources/user/submit-data)).

With the API in place, users can submit queries to find metadata information across the Gen3 commons. The API can be queried programmatically or through provided tools, like the submission portal.

The Gen3 commons uses [GraphQL](http://graphql.org/) to manage the metadata. To learn the basics of writing queries in GraphQL, please visit: <http://graphql.org/learn>.

## Credentials to send API requests
* * *
The credentials that allow access to "raw" data in the object store and ssh keys to access VMs, also allow users to programmatically query or submit data to the API. This credential is used every time an API call is made.

Each API key is valid for a month and is used to receive a temporary access token that is valid for only 30 minutes. The access token is what must be sent to the Gen3 API to access data in the commons.

For users granted data access, the API key is provided on the Profile page after clicking the "Create API key" button.

![Profile Page](API_key_profile_page.png)

While displayed, click "copy" to copy the API key to the clipboard or "download" to download a "credentials.json" file containing the id/key pair in json format.

![Copy Key](API_copy_keys.png)

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





## Querying and Downloading Metadata using the API
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
