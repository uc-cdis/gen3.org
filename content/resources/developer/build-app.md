---
title: "Gen3 - Build App"
date: 2018-09-12T23:17:36-05:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
---
{{% markdownwrapper %}}
# Building Apps for Gen3 Data Commons
* * *

## 1. Authentication
* * *

We use JWT as our token format -> you are required to get short lived access tokens to access our services
We use OIDC to provide the necessary handshakes for linking accounts and getting long lived tokens
Standard oauth2 libraries should be compatible with Gen3

__You need to provide a redirect (callback) url to the data commons you wish to build an app for and they will give you a client id & client secret__

## 2. GraphQL Queries
* * *

We use [http://graphql.org](GraphQL) as the langauge for querying Gen3 data commons. In addition, we also have a few convenience endpoints which make specific queries easier. For example, the GraphQL introspection query which returns the schema for the GraphQL queries is easily obtained through the GET endpoint available at `/api/v0/submission/getschema`

The standard GraphQL endpoint for a Gen3 commons is available via POST at `/api/v0/submission/graphql`

## 3. GraphQL Queries You Want To Run
* * *


### Return a list of all the projects and if they are open access

```
{"query":"query { project(first:0) {code, project_id, availability_type}}"}
```

* First:0 means return all, otherwise it defaults to the first 10. 
* Project_id = <program>-<project> used to reference any projects
* Code = project name in the project node
* Availability_type = is this project open access to everyone or not

### Return counts of specific nodes for the whole commons

```
{
  count1: _case_count
  count2: _study_count
  count3: _aliquot_count
  fileCount1: _aggregated_snp_array_count
}
```


### Query for files in a commons

```
{
  fileData_submitted_unaligned_reads: submitted_unaligned_reads(first: 100) {
    project_id
    id
    file_name
    data_category
    data_format
    data_type
    file_size
  }
}
```

## 4. Retrieve The Dictionary JSON Schema

While the GraphQL introspection endpoint returns useful information necessary for executing queries, it does not contain the complete data model and dictionary schema. That schema may be accessed via a GET to `/api/v0/submission/_dictionary/_all`



{{% /markdownwrapper %}}