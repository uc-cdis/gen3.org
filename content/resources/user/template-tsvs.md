---
title: "Gen3 - Template TSVs"
date: 2018-09-18T15:12:12-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---

# TSV Formatting and Templates
---
## TSV Formatting Checklist

TSVs are one record per row. Column headers are

1. Specify the same node `type` for every row. This is the name of the node or the `node_id` in the data dictionary.
2. Specify the `submitter_id` of every record by entering a unique text identifier in each row. Make sure you don't use the same `submitter_id` twice!
3. Specify the links to the parent node(s) for each record. Note: the parent records must exist!
4. Fill in all required properties. Every row in the TSV must have a value for all required properties.

## Notes about TSV Formatting

* submitter_id

* id
Every record in every node in the data commons has the property `id`, which is a UUID, not to be confused with "submitter_id" or "project_id":
https://en.wikipedia.org/wiki/Universally_unique_identifier

* links
Links are a special kind of property. Every node besides the root node `program` requires a link to it's "parent node".  The link is specified by "<parent-node-back-reference>.submitter_id". The "back reference" of the parent node, which is usually the plural form of the parent node (e.g., "cases.submitter_id" for a link to a "case" record; if you're unsure, the backref will be in the template TSV downloadable from the data dictionary viewer.

Note that you can also specify links with the UUID (or the 'id' property). So you could also make your links: "studies.id", the value of which would be the 'id' (UUID) of your study instead of the 'submitter_id'.

Some child-parent node relationships are one-to-many or many-to-many (i.e., "-to-many" relationships), meaning that one child record can have multiple parent records. For example, if a single 'case' belonged to two 'studies', then the case TSV would specify the two links with the headers: 'studies.submitter_id#1' and 'studies.submitter_id#2'.  If there was a third study, it would be 'studies.submitter_id#3'. The values of those links are the "submitter_id" properties of the study records.

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
