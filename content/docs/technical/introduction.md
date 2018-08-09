# Gen3 Technical Documentation
This documentation is intended for developers who want to understand the design and architecture of Gen3.

To understand the initiatives of Gen3, go to https://gen3.org

Gen3 software is a set of services that enables users to use the data and compute resources from various cloud providers easily. And on top of those resources, provide a user-friendly environment to organize, query the data and run computational analysis.


## Data management

The following diagram describes all the user interactions in data management aspect.
![data management interations](gen3-diagrams/data-interactions.png)

1. fence microservice provides authentication and authorization framework for all Gen3 services & resources.
2. download/upload data. Gen3 doesn't have services sitting between user and cloud storage services so that user can fully leverage the cloud provider's power, but it provides tools and services to enable users to access protected data security with temporary credentials.

3. windmill serves static html, javascript and image files to create a view for users to interact with Gen3 microservices.
4. sheepdog microservice allows user to do metadata submission.
5. peregrine microservice allows user to do GraphQL query on live metadata.
6. indexd microservice allows user to find physical location for data object.
7. gen3-arranger exposes GraphQL query interface for a flattened/materialized view of metadata that's ETLed from graph metadata to Elasticsearch.

### Data Submission System
People generate a lot of data during experiments and studies. They would like to organize the data and annotate the data to describe how they are generated and all the context for the data. All the 'context' is preserved in our 'metadata' database. The metadata store is presented in a graph-like relational model to depict the normalized relationships of all the concepts. Take [bloodpac](https://www.bloodpac.org/data-group/) data model as an example, it describes how you start from having a particular study that's done on a bunch of `cases`( aka patients ), the doctors gathered some clinical informtion about each patient which is kept in various clinical nodes like `diagnosis`, `family history`, etc. The hositpical also gathered some samples from the patient and sent them to sequencing center which finally produced some sequencing files stored in `submitted unaligned reads`.

In order for a Gen3 Commons to preserve these metadata, we first need to come up with a consistent datamodel with standard terminologies to describe all these information. We decided to do the data modeling using jsonschema and store them as yaml files in [github](https://github.com/occ-data/bpadictionary) so it's easy for domain experts to make changes there and track all the data modeling activities. The schema is then translated to database ORM([psqlgraph](https://github.com/NCI-GDC/psqlgraph)) and used by Gen3 microservices to do metadata validation and database interactions.

The currently supported database backend is postgres, which is not necessarily the optimal choice for complicated graph traversals. But we went with it because of its robustness as a traditional relational database. The data dictionary described in jsonschema is translated to very typical relational datamodel in postgres. Basically every node type is a table and every edge type is a table as the many-to-many proxy between two node tables. The non-conventional schema design is that, all the properties are stored as jsonb in postgres instead of separate columns. This was a compromise to support very frequent data modeling changes required by domain experts with a sacrifise of query performance because of lack of statistics on jsonb.

Sheepdog uses the dictionary-driven ORM to do metadta validation and submission as described in following diagram:
![metadata-submission](gen3-diagrams/metadata-submission.png).

Peregrine exposes a query interface for the normalized metadata via GraphQL interface:
![metadata-query](gen3-diagrams/metadata-query.png).

Separately, users use [cdis-data-client](https://github.com/uc-cdis/cdis-data-client) to request temporary urls to do raw data download/upload:
![data-download-upload](gen3-diagrams/data-download-upload.png).

### Data Exploration System
_This is an alpha feature_

After we collect valuable data from various submitters, we would like to expose them in a web UI in a user friendly way. Understanding the datamodel and knowing how to traverse the graph is intimidating for a general Gen3 user, so we created an ETL application - [tube](https://github.com/uc-cdis/tube) to denormalize the graph to several types of flat documents to cater several major use cases.

Tube is driven by configuration files which describe the flat document structure and the mapping logic from the graph model, so that it's generic and can support various datamodels in different commons. For most of the biomedical commons, there are two type of flat documents that satisfies majority of users:
- file-centric document that denormalize biospecimen and clinical attributes for each file. This targets bioinformaticians who wants to filter by specific clinical/biospecimen attributes, and select a bunch of files to run analysis.
- case-centric document that denormalize biospecimen and clinical attributes for each case. This targets clinicians who wants to see distributions based on clinical attributes among cases( AKA patient most of the times ).

[living document for data exploration architecture](https://github.com/uc-cdis/cdis-wiki/tree/master/dev/gen3/data_explorer)
