---
title: "Gen3 - Flat Model API"
date: 2019-01-25T13:08:26-06:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
---
{{% markdownwrapper %}}
# Gen3 Queries
From the GraphiQL interface of the data portal, users can use the *Graph Model* or *Flat Model* which match to Postgres and ElasticSearch databases, respectively. The same queries can be sent to both the flat and graph model API endpoints from the command-line.

## Flat Model
In the Flat Model, our microservice *Guppy* converts GraphiQL queries and hits the Elasticsearch database. Here, queries support Aggregations for string (bin counts; number of records that each key has) and numeric (summary statistics such as minimum, maximum, sum, etc) fields. For more details see the full description on our [Guppy repository on Github](https://github.com/uc-cdis/guppy/blob/master/doc/queries.md) or on the [User Guide](https://gen3.org/resources/user/query-data/#flat-model).

## Graph Model
In the Graph Model, our microservice *Peregrine* converts GraphiQL queries and hits the PostgreSQL database. For more information see the full description on our [Peregrine repository on Github](https://github.com/uc-cdis/peregrine) or on the [User Guide](https://gen3.org/resources/user/query-data/#graph-model).


{{% /markdownwrapper %}}
