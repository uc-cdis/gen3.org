---
title: "Gen3 - Managing Timepoints"
date: 2018-09-18T15:12:17-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---

# Managing Timepoints in a Submission
* * *

Some elements of submitted datasets can be related to each other in terms of time. To stay in compliance with HIPAA, Gen3 commons create timelines without using real dates. Every other date field is anchored by the "index_date" in the "case" node.

In this field, dates for events such as "Study Enrollment" or "Diagnosis" can be entered. For more information about the `index_date` field please go to the `case` node in the dictionary, https://gen3.datacommons.io/dd/case.

> __NOTE:__ For these user guides, https://gen3.datacommons.io is an example URL and can be replaced with the URL of other data commons powered by Gen3.

<h4> Examples of Submissions Using Multiple Date Times </h4>

Patient A enrolls in a study on July 1, and has a sample taken on July 10. For patient A:

* `case.index_date` = "Study Enrollment"

* `biospecimen.days_to_procurement` = July 10 - July 1 = 9

Alternatively if patient A was diagnosed 2 years before the study began, the `index_date` for "Diagnosis" would be treated like this:

* `case.index_date` = "Diagnosis"

* `biospecimen.days_to_procurment` = July 10, 2017 - July 1, 2015 =  739

<h4> Negative Dates </h4>

Days to values can also be negative. If an `index_date` event occurs after the event, the `days_to` values would be presented as negative.

If Patient A had a biospecimen taken when they were initially diagnosed:

* `case.index_date` = "Study Enrollment"

* `biospecimen.days_to_procurement` = July 10, 2015 - July 1, 2017 = -721

<h4> No Time Series </h4>

The `days_to_procurement` and `days_to_collection` are required fields. If there are no data available, Gen3 commons allow escape values of "Unknown" and "Not Applicable". Please use "Unknown" in the instances where there is an established time series, but are unable to note the date of the event. Use "Not Applicable" if there is no time series at all.
