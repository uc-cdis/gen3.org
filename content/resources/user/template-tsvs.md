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

	Every record in every node in the data commons has the property `id`, which is a [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier), not to be confused with "submitter_id" or "project_id"

* links

	Links are a special kind of property. Every node besides the root node `program` requires a link to it's "parent node".  The link is specified by "<parent-node-backref>.submitter_id". The "backref" of the parent node is usually the plural form of the parent node (e.g., "subjects.submitter_id" for a link to a "subject" record; if unsure, the backref will be in the template TSV downloadable from the data dictionary viewer).

	Note that you can also specify links with the UUID (or the `id` property). So you could also make your links: `studies.id`, the value of which would be the `id` (UUID) of your study instead of the `submitter_id`.

	Some child-parent node relationships are one-to-many or many-to-many (i.e., "-to-many" relationships), meaning that one child record can have multiple parent records. For example, if a single `subject` belonged to two 'studies', then the `subject` TSV would specify the two links with the headers: `studies.submitter_id#1` and `studies.submitter_id#2`.  If there was a third study, it would be `studies.submitter_id#3`. The values of those links are the `submitter_id` properties of the `study` records.

* program

	The `program` node has the property `name`, the `project` node has the property `code`, and every other node has the property `submitter_id`. These all serve the same basic function, which is to give that record a more human-readable call-name (the internal call-name is the UUID).

* project

	A project also has the property `project_id`, which is the unique combination of the program `name` and the project `code`. So, for your project, the program is `prog` and the project code is `proj`; so your `project_id` is the dash-separated combination: `prog-proj`.


## Template TSVs for metadata submission
* * *

Here are some sample TSV file templates for example nodes in a Gen3 data dictionary.

Look at the "Dictionary" section, for the Gen3 data commons, to find the complete list of nodes and their template TSVs.

[study.tsv](study.tsv)

[case.tsv](case.tsv)

[biospecimen.tsv](biospecimen.tsv)

[sample.tsv](sample.tsv)

[aliquot.tsv](aliquot.tsv)

[analyte.tsv](analyte.tsv)
