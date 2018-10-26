---
title: "Gen3 - Managing Timepoints"
date: 2018-09-18T15:12:17-05:00
linktitle: /resources/user
layout: withtoc
menuname: userMenu
---

## Managing timepoints in a submission
* * *

Some elements of submitted datasets could be related to each other in time.   To stay in compliance with HIPAA, Gen3 commons create timelines without using real dates.   Every other date field is anchored by the "index_date" in the "case" node.  

In this field you can have things like "Study Enrollment" or "Diagnosis".   Study the case node in the dictionary for more information on the index_date field:  https://data.Gen3.org/dd/case

<h4> Examples of submissions using multiple date times </h4>

Patient A enrolls in a study on July 1, and has a sample taken on July 10. For patient A you would report:
* case.index_date = "Study Enrollment"
* biospecimen.days_to_procurement = July 10 - July 1 = 9

Alternatively if they were diagnosed 2 years before the study began and you wanted to use that as the index_date nothing is stopping you:
* case.index_date = "Diagnosis"
* biospecimen.days_to_procurment = July 10, 2017 - July 1, 2015 =  739

<h5> Negative Dates </h5>

Days to values can also be negative. If you have an index_date event that occurs after the event, you would present those days_to values as negative. If Patient A had a biospecimen taken when they were initially diagnosed:
* case.index_date = "Study Enrollment"
* biospecimen.days_to_procurement = July 10, 2015 - July 1, 2017 = -721

<h5> No Time Series </h5>

The days_to_procurement and days_to_collection are required fields. If you do not have any data for these, we allow escape values of "Unknown" and "Not Applicable". Please use "Unknown" in the instances where you have established a time series but are unable to pin down the date of the event. Use "Not Applicable" if you do not have a time series at all.
