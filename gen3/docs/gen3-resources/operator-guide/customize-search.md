# Customize Gen3 Search Interface

## Prepare for Search

**Query page:**

* must have Sheepdog, Peregrine, and Guppy installed and configured for Query page to load
* Graph Model depends on Sheepdog and Peregrine
* Flat Model depends on ETL mapping, Tube, Guppy and ElasticSearch
* https://gen3.org/resources/user/access-data/#querying-structured-data

**Exploration page:**

* must have ETL mapping, Tube, Guppy, and ElasticSearch
* https://gen3.org/resources/user/access-data/#exploration-page
* The exploration page has one or several tabs at the top, which each represent a flattened ElasticSearch document of structured metadata records across all the projects in the data commons, which is displayed as a table towards the bottom center of the page.
* The main tabs in the Exploration Page, the available filters, and the properties listed in the data table are entirely customizable

**Discovery page:**

* Depends on data in Metadata Service: https://github.com/uc-cdis/metadata-service
* Customize and enable the Discovery Page by editing the table items, advanced search fields, tags, and study page fields (i.e. page that opens up upon clicking on a study). The Discovery Page is powered by the Metadata Service on the backend. Tools such as the Python SDK can be used to upload and edit metadata.
* Review the code to enable the Discovery Page: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L173
* Review the code to edit the Discovery Page: https://github.com/uc-cdis/cdis-manifest/blob/551f0963e60f6000ae8b9987592495406a031c81/gen3.datacommons.io/portal/gitops.json#L175-L297

* customize Gen3 search interface

      * ETL:

          * https://github.com/uc-cdis/tube
          * https://gen3.org/resources/operator/#6-etl-and-data-explorer-configurations

      * data explorer

          * https://github.com/uc-cdis/data-portal/blob/master/docs/portal_config.md

from text created by Dan and Justin:

three microservices Peregrine, Guppy, and Tube were developed to support both “graph” and “flat” abstracted data models. Peregrine transforms GraphQL queries into Structured Query Language (SQL) statements into the data commons backend. Tube flattens the graph data into an ElasticSearch format, which is then able to be queried by Guppy. Execution of GraphQL queries are possible through both Gen3-developed APIs as well as browser-based GUIs.

The Peregrine microservice is a high-speed metadata query service that interprets GraphQL search queries into Gen3’s abstracted graph. This microservice allows Commons operators and users to precisely and powerfully query information from the metadata collections. The service translates the GraphQL search into SQL statements which are run against the PostgreSQL backend before being returned as a user-friendly JSON format.

Construction of the “flat” model starts with the Tube microservice, which extracts, transforms, and loads (ETL) the underlying relational database into the flattened ElasticSearch format.  ElasticSearch is used due to its enhanced performance with the type of metadata queries run by users.  The ETL process is run when changes are made to the graph so subsequent queries match between “graph” and “flat” abstractions. Once transformed, like Peregrine, the Guppy microservice transforms GraphQL statements into Elastic Search Query DSL.
