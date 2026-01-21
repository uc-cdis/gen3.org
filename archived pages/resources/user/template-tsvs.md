---
title: "Gen3 - TSV Formatting and Templates"
date: 2018-09-18T15:12:12-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---

# TSV Formatting and Templates
---
TSVs, or tab-separated values files, are the most commonly used format for data submission to a Gen3 Data Commons.

One TSV is submitted per node in the graphical data model starting with the root node `program` and next its child node `project`. Note: often a data commons administrator will create these first two nodes for a data submitter, thus the data submitter should begin their submission by preparing TSVs for the child node(s) of `project`.

The column headers of a TSV are the properties of a node, and the rows in TSVs are individual data records. Thus, the number of rows in a TSV minus the header is the number of records that will be created or updated when the TSV is submitted to a Gen3 Data Commons.

---
## TSV Formatting Checklist

1. Specify the node `type` for every row. This is the name of the node (or `node_id`), and it must be exactly the same for every row.
2. Specify the `submitter_id` of every record by entering a unique text identifier in each row. Make sure you don't use the same value in more than one row of your TSV because every record in a project must have a unique `submitter_id`!
3. Specify the links to the parent node(s) for each record. Note: parent records must exist before submitting child records! You can specify either the links with either the `parents.submitter_id` or the `parents.id`
4. Fill in all required properties. Every row in the TSV must have a value for all required properties. Optional properties can be filled in for only some rows or the column can be left out entirely.

## Notes about TSV Formatting

* submitter_id

	Every row in the TSV / record in a node must have a unique `submitter_id`. This can be any textual identifier, usually something human-readable or encoding some information, e.g., `case-1234_lung_cancer`, `sample_blood_draw2_month6`.

* id

	Every record in every node in the data commons has the property `id`, which is a [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier), not to be confused with "submitter_id" or "project_id".

* links

	Links are a special kind of property. Every node besides the root node `program` requires a link to it's "parent node".  The link is specified by "<parent-node-backref>.submitter_id". The "backref" of the parent node is usually the plural form of the parent node (e.g., "subjects.submitter_id" for a link to a "subject" record; if unsure, the backref will be in the template TSV downloadable from the data dictionary viewer).

	> Note: that you can alternatively specify links with the `id` property using the TSV column header `studies.id`. The value in this column would be the `id` (UUID) of your study instead of the `submitter_id`. When creating links, you can use `submitter_id`, `id`, or both, but only one is required. Most users prefer using a parent record's `submitter_id` to specify links because they're typically more human-readable than an `id`, which is a random 128-bit UUID.

	Some child-parent node relationships are one-to-many or many-to-many (i.e., "-to-many" relationships), meaning that one child record can have multiple parent records in the same parent node. For example, if a single `subject` belonged to three `studies`, then the `subject` TSV would specify the three links by submitting a comma-separated list of the parent submitter_ids: `study_1,study_2,study_3`.

    > Note: Comma-separated lists are generally how "array" variables (properties that take lists as their value), like links, are formatted in a TSV.

    If submitting multiple links in JSON format, the three parent studies would look like this:

```
  "studies": [
    {
      "submitter_id": "study_1"
    },
    {
      "submitter_id": "study_2"
    },
    {
      "submitter_id": "study_3"
    }
  ],
```

* program

	The `program` node has the property `name`, the `project` node has the property `code`, and every other node has the property `submitter_id`. These all serve the same basic function, which is to give that record a more human-readable call-name (the internal call-name is the UUID).

* project

	A project also has the property `project_id`, which is the unique combination of the program `name` and the project `code`. So, for your project, the program is `prog` and the project code is `proj`; so your `project_id` is the dash-separated combination: `prog-proj`.


## Template TSVs for metadata submission
* * *

Here are some sample TSV file templates for example nodes in a Gen3 data dictionary.

Look at the "Dictionary" section of a [Gen3 data commons](gen3.datacommons.io/dd) to find the complete list of nodes and download template TSVs for that data commons' data model.

[study.tsv](study.tsv)

[case.tsv](case.tsv)

[biospecimen.tsv](biospecimen.tsv)

[sample.tsv](sample.tsv)

[aliquot.tsv](aliquot.tsv)

[analyte.tsv](analyte.tsv)
