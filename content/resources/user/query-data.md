---
title: "Gen3 - How to Query the Data"
date: 2020-03-02T16:16:20-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---
{{% markdownwrapper %}}
# Querying Metadata in a Gen3 Data Commons
* * *

* [Queries in the Submission Portal: GraphiQL](#queries-in-the-submission-portal-graphiql)
* [Find specific files by querying 'datanode'](#find-specific-files-by-quering-datanode)

---

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





## Find specific files by querying 'datanode'
---
The following guide provides details on how to send graphQL queries to retrieve data from a Gen3 Data Commons.

* Metadata for specific files can be obtained by including arguments in "datanode" queries. The following are some commonly used arguments (not an exhaustive list):
    * `submitter_id: "a_submitter_id"`: get information for a specific submitter_id
    * `quick_search: "a_substring"`: get information for all files with partial matches in submitter_id
    * `file_name: "a_filename.txt"`: get information for files matching a specified filename.
* For example, the following arguments can be used to obtain similar results:
    * `quick_search: "sub-70080"` will return files with the substring "sub-70080" in the submitter_id.
    * `file_name: "sub-70080_T1w.nii.gz"` will return only files with that exact filename.
    * `submitter_id: "OpenNeuro-ds000030_sub-70080_T1w.nii_6ff0"` will return only the file with that exact submitter_id, which must be unique within a node.
* The following example query can be pasted into the graphiQL interface at https://gen3.datacommons.io/query (be sure to click "Switch to Graph Model"). Note that in this example, there are three individual "datanode" queries that are sent simultaneously and assigned labels ("match_file_name", "match_quick_search", and "match_submitter_id"):

```

{
  match_file_name: datanode (file_name: "sub-70080_T1w.nii.gz") {
        project_id object_id id md5sum file_size file_name
        data_type data_format data_category
    }
  match_quick_search: datanode (quick_search: "sub-70080") {
    project_id object_id id md5sum file_size file_name
    data_type data_format data_category
  }
  match_submitter_id: datanode (submitter_id: "OpenNeuro-ds000030_sub-70080_T1w.nii_6ff0") {
      project_id object_id id md5sum file_size file_name
      data_type data_format data_category
  }
}
```

* Result: applying the `file_name` and `submitter_id` arguments returns only the files that match the provided string exactly, while the `quick_search` argument returns all files with a submitter_id that matches the sub-string, two in this case.

```
{
  "data": {
    "match_file_name": [
      {
        "data_category": "T1-weighted Image",
        "data_format": "NII/NIfTI",
        "data_type": "fMRI Image",
        "file_name": "sub-70080_T1w.nii.gz",
        "file_size": 11427935,
        "id": "e95e513e-b76e-4de9-aef5-6b9d74e2e60f",
        "md5sum": "c800fe80a333e8d3439c854dea3fdad2",
        "object_id": "31525da9-7b09-48ea-966d-dd9e93786ff0",
        "project_id": "OpenNeuro-ds000030"
      }
    ],
    "match_quick_search": [
      {
        "data_category": "T1-weighted Image",
        "data_format": "NII/NIfTI",
        "data_type": "fMRI Image",
        "file_name": "sub-70080_T1w.nii.gz",
        "file_size": 11427935,
        "id": "e95e513e-b76e-4de9-aef5-6b9d74e2e60f",
        "md5sum": "c800fe80a333e8d3439c854dea3fdad2",
        "object_id": "31525da9-7b09-48ea-966d-dd9e93786ff0",
        "project_id": "OpenNeuro-ds000030"
      },
      {
        "data_category": "Diffusion-weighted Image",
        "data_format": "NII/NIfTI",
        "data_type": "fMRI Image",
        "file_name": "sub-70080_dwi.nii.gz",
        "file_size": 39484002,
        "id": "f50e6f27-8d02-49f1-b30b-9a3d32c6075d",
        "md5sum": "c37bbeb51c85471a7da4f3675c836f71",
        "object_id": "94b1d6ef-5e4b-4945-bf31-bb7f06881c97",
        "project_id": "OpenNeuro-ds000030"
      }
    ],
    "match_submitter_id": [
      {
        "data_category": "T1-weighted Image",
        "data_format": "NII/NIfTI",
        "data_type": "fMRI Image",
        "file_name": "sub-70080_T1w.nii.gz",
        "file_size": 11427935,
        "id": "e95e513e-b76e-4de9-aef5-6b9d74e2e60f",
        "md5sum": "c800fe80a333e8d3439c854dea3fdad2",
        "object_id": "31525da9-7b09-48ea-966d-dd9e93786ff0",
        "project_id": "OpenNeuro-ds000030"
      }
    ]
  }
}
```
