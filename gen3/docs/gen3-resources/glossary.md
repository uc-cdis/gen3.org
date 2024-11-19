# Gen3 Glossary

## Commons Services Operations Center (CSOC)
A Common Services Operations Center is an operations center operated by a commons services provider for setting up, configuring, operating, and monitoring data commons, data meshes, data hubs, and other data platforms for managing, analyzing, and sharing data.
## Crosswalk
Linking patients from across data commons where some patient data exists in commons A and additional data exists in commons B.  This linkage is recorded in the metadata service. An example of how to set this up is found [here][crosswalk setup].
## Data Commons
A data commons co-locates data with cloud computing infrastructure and com- monly used software services, tools, and applications for managing, integrating, analyzing and shar- ing data that are exposed through web portals and APIs to create an interoperable resource for a research community. A data commons provides services so that the data is findable, accessible, interoperable and reusable (FAIR)
## Data Dictionary
Every Gen3 data commons employs a data model, which serves to describe, organize, and harmonize data sets submitted by different users. Data harmonization facilitates cross-project analyses and is thus one of the pillars of the data commons paradigm. The data model organizes experimental metadata variables, “properties”, into linked categories, “nodes”, through the use of a data dictionary. The data dictionary lists and describes all nodes in the data model, as well as defines and describes the properties in each node. A Gen3 Data Dictionary is specified by a YAML file per node. Additional details on Gen3 data dictionaries can be found [here][data dictionary overview].
## Data Hub
A data hub is a data platform in a data mesh that supports search and discovery of data in one, two, or more data platforms in a data mesh. Typically, the data itself remains in the data repository, data commons, or other data platform in the mesh, but the metadata for the data is typically replicated in the data hub. Data hubs often are connected to workspaces or analysis environments operated by the data hub so the data can be analyzed.
## Data Mesh (aka Data Fabric or Data Ecosystem)
Data meshes contain multiple data commons, data repositories, or data resources that can interoperate using a common set of services. Each data commons or repository may have distinct data types, data models, and data governance.  A mesh provides for discovery of data from connected repositories and allows users to bring this data together in one place for joint analysis. To see how to set up the necessary services for running a data mesh view instructions [here][AggMDS].
## Data Types
### Structured Data
Data is structured if it is organized into records and fields, with each record consisting of one or more data elements (data fields). In biomedical data, data fields are often restricted to controlled vocabularies to make querying them easier. In Gen3 this would include clinical or experimental data submitted to the graph model, which is queriable via a GraphQL API.  It can be flattened (via ETL) and the result viewable on the Data Portal Exploration Page.
### Semi-structured Data
Semi-structured data is organized as unique identifiers with flexible key/value pairs (including nesting). The key/value pairs may be consistent between records, but are not required to be. This is typically used for storing publicly available metadata about available datasets or additional public metadata about samples.  The MDS and AggMDS both include semi-structured data and power the Discovery Page.
### Unstructured Data
Unstructured data represents files on a hard drive or cloud storage with no consistent schema. These data tend to represent either bulk clinical and phenotypic data in spreadsheet format or patient level data such as images or genomic sequencing files.
## Data Portal Pages
See an in-depth description of each page [here][Data Portal User Guide].
### Data Dictionary Page
Interactive page that shows the data dictionary in both a graph and table format.  It is powered by the data dictionary YAML files and allows users to see the controlled vocabulary across all data model nodes.
### Discovery Page
Powered by the metadata service.  Typically includes public metadata at the project level including search fields, tags, and study page fields.  
### Explorer Page
Primary page for exploring data within a Gen3 data commons.  It is powered by flattened data within the Guppy microservice.  It is highly configurable based on operator requirements for building cohorts.
### Landing Page
Contains some basic summary text and optionally a histogram of data pulled from Guppy (flattened data)
## DOIs
A Digital Object Identifier is an identifier used to permanently and stably identify (usually digital) objects. DOIs provide a standard mechanism for retrieval of metadata about the object, and generally a means to access the data object itself. A DOI is a specific ISO standard for a particular class of persistent identifiers and is supported by the DOI Foundation.
## Edge Node
Edge nodes may be created at clinics, labs, hospitals, or academic institutions to share data with data platforms.  The data platform nodes connect with a data hub (forming a data fabric/mesh) to provide a federated platform for data discovery.  Edge nodes share only a subset of the data they store with data platforms
## ETL
Structured data submitted to commons are stored in PostgreSQL. Querying data from PostgreSQL with multiple join is painful and inefficient. So, we use ElasticSearch as a place to store materialized dataset. Extract-transform-load (ETL) is a process that creates the materialized data from PostgreSQL and store them in ElasticSearch.  This is accomplished via the Tube microservice. More details of running an ETL can be found [here](operator-guide/customize-search.md#etl).
## FAIR Data
FAIR data are data which meet the principles of findability, accessibility, interoper- ability, and reusability [12]. There is now an extensive literature on FAIR data.
## Framework Services
Framework Services or Data Commons Framework (DCF) Services is the term used by Gen3 to refer to data mesh services in the narrow middle architecture, for data meshes, such as the NCI Cancer Research Data Commons. These are set of standards-based services with open APIs for authentication, authorization, creating and accessing FAIR data objects, and for working with bulk structured data in machine readable, self-contained format.
## Globally Unique Identifier (GUID)
A GUID is an essentially unique identifier that is generated by an algorithm so that no central authority is needed, but rather different programs running in different locations can generate GUID with a low probability that they will collide. A common format for a GUID is the hexadecimal representation of a 128 bit binary number.
## Kubernetes
An open-source system for automating deployment, scaling, and management of containerized applications, which Gen3 is built from.
## Microservice
Microservices are a software architecture that organizes software into small, independent services that communicate over well defined APIs. These services can be developed, set up, and scaled independently. A more traditional architecture is to put all the APIs and other required functionality into a single application. This is sometimes called a monolithic architecture. Microservices provide important advantages for large-scale systems that require scalability and must continue to evolve even as their code base grows very large, but increases the complexity of operating small-scale systems.
## Flattened Data
Structured data that has been processed via Tube and stored in elasticsearch to accelerate searchability.  
## Gen3 Client
The Gen3 Client is a command-line tool for downloading, uploading, and submitting data files to and from a Gen3 data commons.  Some of the same functionality can be found in the Gen3 SDK. You can find installation and use instructions [here][Gen3 client docs].
## Gen3 SDK
The Gen3 Software Development Kit (SDK) for Python provides classes and functions for handling common tasks when interacting with a Gen3 commons. It also exposes a Command Line Interface (CLI). The API for a commons can be overwhelming, so this SDK/CLI aims to simplify communication with various microservices.  It can also download and upload files like the Gen3 Client.  You can find installation and use instructions [here][SDK docs].
## Gen3 Microservices
Brief descriptions of the most relevant microservices are included below.  For more detail and links to their respective repositories please visit the [Developer's Guide][Microservices].
### Aggregated Metadata Service (AggMDS)
The aggregated MDS is a service which caches metadata from commons metadata services and becomes a centralize API for browsing Metadata with clients such as the Ecosystem browser. The AggMDS holds the content viewable in a Data Portal Discovery page for a Data Mesh.
### Arborist
Arborist is an attribute-based access control (ABAC) policy engine, designed for use with the Gen3 stack. Arborist tracks resources requiring access control, along with actions which users may perform to operate on these resources, and roles, which aggregate permissions to perform one or more actions
### Data Portal
A generic data portal that supports some basic interaction with Gen3 services like peregrine, sheepdog and fence
### Indexd
The Indexd service provides permanent digital IDs for data objects. These IDs can be used to retrieve the data, or query the metadata associated with the object. The Indexd service tracks the locations and hash of every asset (file) in the data commons object store.  It exports RESTful APIs for registering a new asset, and retrieving data for an existing asset.
### Fence
The Fence service controls access to the metadata, submission, indexing, and data itself. Fence is an authentication (AuthN) and authorization (AuthZ) service which utilizes OpenID Connect flow (an extension of OAuth2) to generate tokens for clients. It can also provide tokens directly
to a user. Clients and users may then use those tokens (JWT) with other Gen3 Data Commons services to access protected endpoints that require specific permissions. Fence can be configured to support different Identity Providers (IDPs) for AuthN. At the moment, supported IDPs include Google, and Shibboleth supporting providers such as NIH iTrust.
### Guppy
Server that support GraphQL queries on data from elasticsearch.
### Hatchery
Hatchery creates Kubernetes Pods for workspace services. Workspace services must expose HTTP servers. Ambassador is used to proxy user traffic through to their container workspace once it is launched by Hatchery.
### Helm
Gen3 relies upon Helm to manage installation and management of Kubernetes applications. Helm is used to build ”charts”, which are packages of Kubernetes resources that are used to deploy apps to a cluster. Helm is the recommended way to deploy Gen3.
### Metadata Service (MDS)
The Metadata Service provides an API for retrieving JSON metadata of GUIDs. It is a flexible option for "semi-structured" data (key:value mappings).  The content of the MDS powers the Data Portal Discovery Page for a Data Commons. The Gen3 SDK can be used to upload and edit the metadata.
### Pelican
Provides Docker images with Sower jobs to export and import PFB in Gen3.
### Peregrine
Peregrine is the high speed metadata seeking service which responds to GraphQL search queries. The GraphQL service allows Commons operators and users to precisely query only the information they are most interested in from the metadata collections. The service translates the GraphQL search into the appropriate statements which are run against the PostgreSQL backend before being returned as friendly JSON.
### Sheepdog
The Sheepdog service is responsible for herding user submissions of metadata into the graph database. The submissions are quality controlled against the data dictionary to ensure all required fields are present and have appropriate data values. The Sheepdog service is also responsible for supporting bulk export of the metadata into TSV or JSON formats.
### Sower
Sower dispatches Kubernetes jobs.
### Tube
Microservice that controls the ETL process of structured data.
### Workspace Token Service
The Gen3 workspace token service acts as an OIDC client which acts on behalf of users to request refresh tokens from Fence. This happens when a user logs into a workspace from the browser. WTS then stores the refresh token for that user, and manages access tokens and refresh tokens for workers that belong to specific users in the workspace.
## Portable Format for Biomedical data (PFB)
PFB is a serialization file format designed to store bio-medical data and metadata. The format is built on top Avro to make it fast, extensible and interoperable between different systems. You can find the GitHub repo [here][PFB GitHub] and the publication [here][PFB Pub].
## Workspace
Gen3 workspaces are secure data analysis environments in the cloud that can access data from one or more data resources, including Gen3 Data Commons. Gen3 Workspaces use the Gen3 Framework Services for user authentication and authorization, data object indexing, and metadata services. Gen3 Workspaces support Jupyter notebooks, RStudio notebooks, and other custom applications that can access data through Gen3 open APIs.  For instructions on the use of a workspace see [here][workspace use].  





[crosswalk setup]: https://github.com/uc-cdis/gen3sdk-python/blob/master/docs/howto/crosswalk.md
[data dictionary overview]: operator-guide/create-data-dictionary.md
[AggMDS]: operator-guide/customize-search.md#discovery-page
[Data Portal User Guide]: user-guide/portal.md
[Microservices]: developer-guide/microservices.md
[Gen3 client docs]: user-guide/access-data.md#installation-instructions
[SDK docs]: user-guide/search.md#exporting-structured-data-programmatically
[PFB GitHub]: https://github.com/uc-cdis/pypfb
[PFB Pub]: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1010944
[workspace use]: user-guide/analyze-data.md
