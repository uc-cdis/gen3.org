---
title: "Gen3 - Flat Model API"
date: 2019-01-25T13:08:26-06:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
---
{{% markdownwrapper %}}
# Gen3 Flat Model

The new flat model requires new GraphQL syntax. As it maps to the data in Elasticsearch, it requires few additional keywords to use in GraphQL query.
This page shows a selection of example queries. You can find more details on the *Guppy* query syntax on our [GitHub repositories](https://github.com/uc-cdis/guppy/blob/master/doc/queries.md).

## Querying

The flat model GraphQL for querying use two keywords: `hits`, `node` and `edges`. `hits` refer to the matched item and `edges` with `node` used to get the values from the matched item.

For example, to query `subject` and get `id`, `year_of_birth` and `vital_status` for all of them, you need to run:

```
{
  subject {
    hits {
      total
      edges {
        node {
          id
          year_of_birth
          vital_status
        }
      }
    }
  }
}
```

### Paging & Sorting

By default, flat model GraphQL returns only the first 10 matches. To find more matches, you can specify `first` and `offset` parameters for `hits`:

```
{
  subject {
    hits(last: 5, offset: 0) {
      total
      edges {
        node {
          id
          year_of_birth
          vital_status
        }
      }
    }
  }
}

```

Changing `offset`, you can iteratively get all items.

In addition, `hits` supports sorting with the `sort` keyword. In this keys it will return first 5 **subject** with the greatest **_samples_count**. `sort` supports both `asc` and `desc` sorting.

```
{
  subject {
    hits(last: 5, offset: 0, sort: [
      {
				field: "_samples_count",
				order: desc
    	}
    ]) {
      total
      edges {
        node {
          id
          vital_status
          _samples_count
        }
      }
    }
  }
}
```

Multiple sorting will sort by all fields. The following query will result in **subjects** sorted descended by `_samples_count` and for equal `_samples_count` it will sort ascending by `_aliquots_count`.

```
{
  subject {
    hits(last: 5, offset: 0, sort: [
      {
				field: "_samples_count",
				order: desc
      },
      {
        field: "_aliquots_count",
        order: asc
      }
    ]) {
      total
      edges {
        node {
          id
          _samples_count
         	_aliquots_count
          _ct_count
        }
      }
    }
  }
}
```

## Aggregations

Flat model supports two types of the aggregations: `bucket` for strings and enum values and `stats` for numerical values.

`bucket` support `key` for the actual value and `doc_count` for the number of matched items with this value.

`stats` support wider range of aggregations related to the numerical values, including `min`, `max`, `avg`, and `sum`. It has `count`, to return the total number of matched items, for which this numerical value exists.

```
{
  subject {
    aggregations {
      vital_status {
        buckets {
          key
          doc_count
        }
      }
      _samples_count {
        stats {
          min
          max
          count
          avg
          sum
        }
      }
    }
  }
}
```

## Filtering

Flat model GraphQL also supports filtering with Simple Query Object Notation, which will be covered in the next section.

`filter` supported for both `aggregations` and `hits`.

The following query will result in the **subjects** whose `vital_status` is `Alive` and their statistics on `_samples_count`.

```
{
  subject {
    aggregations(filters: {
      op: "and",
      content: [
        { op: "=", content: {
          	field: "vital_status",
          	value: "Alive"
        }}
      ]
    }) {
      _samples_count {
        stats {
          min
          max
          count
          avg
					sum
        }
      }
    }
    hits(filters: {
      op: "and",
      content: [
        { op: "=", content: {
          	field: "vital_status",
          	value: "Alive"
        }}
      ]
    }) {
      edges {
        node {
          id
          vital_status
        }
      }
    }
  }
}
```

## SQON = Simple Query Object Notation

Special syntax exists for filters in this new model. The `filter` object is a JSON, with top level `op` equal to `and`.

```
{
  op: "and",
  content: [
  ]
}
```

The `content` is a list of filters, they have the same structure and can be nested. Available operations: `=` (it can also check that the value is in a list of values), `<`, `>`, `<=`, `>=`.

The following filter will find everything with `vital_status` either `Alive` or `Unknown` and `_samples_count` greater than or equal to `2`.

```
{
  op: "and",
  content: [
    { op: "=", content: {
      field: "vital_status",
      value: ["Alive", "Unknown"]
    }},
    { op: ">=", content: {
      field: "_samples_count",
      value: 2
    }}
  ]
}
```

`filter` is fully compatible with other `hits` and `aggregations` parameters.

```
{
  subject {
    aggregations(filters: {
      op: "and",
      content: [
        { op: "=", content: {
          field: "vital_status",
          value: ["Alive", "Unknown"]
        }},
        { op: ">=", content: {
          field: "_samples_count",
          value: 2
        }}
      ]
    }) {
      _samples_count {
        stats {
          min
          max
          count
          avg
					sum
        }
      }
    }
    hits(first: 1, offset: 0, sort: [
      {
        field: "_samples_count",
        order: desc
      }
    ],
      filters: {
      op: "and",
      content: [
        { op: "=", content: {
          field: "vital_status",
          value: ["Alive", "Unknown"]
        }},
        { op: ">=", content: {
          field: "_samples_count",
          value: 2
        }}
      ]
    }) {
      edges {
        node {
          id
          vital_status
          _samples_count
        }
      }
    }
  }
}
```

{{% /markdownwrapper %}}
