# Gen3 Glossary

## Allow Lists
An allow list is simply a list of users (identified based on your method of authentication) that controls which users have access to which data.  It is in the form of a user.yaml file that is maintained by the operator of your Gen3 system. Gaining access may require you to sign a Data Use Agreement.  Data access is granted at the program or project level.  

Alternatively, an allow list may also refer to a list of authorized tools within a Gen3 workspace.
## API
Gen3 services expose APIs (or Application Programming Interface), which allows users to interact directly with the system or data without using the Data Portal or GUI.  An Open API refers to an API that does not require any authentication.  
## Commons Services Operations Center (CSOC)
A Common Services Operations Center is an operations center operated by a commons services provider for setting up, configuring, operating, and monitoring data commons, data meshes, data hubs, and other data platforms for managing, analyzing, and sharing data.
## Crosswalk
Typically, used for linking patients from across data commons where some patient data exists in commons A and additional data exists in commons B. This linkage enables metadata associations across commons and the promise of richer datasets.  Crosswalks can be made for several types of metadata and are recorded in the metadata service. An example of how to set this up is found [here][crosswalk setup].
## Data Commons
A data commons co-locates data with cloud computing infrastructure and commonly used software services, tools, and applications for managing, integrating, analyzing and sharing data that are exposed through web portals and APIs to create an interoperable resource for a research community. A data commons provides services so that the data is findable, accessible, interoperable and reusable (FAIR)
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
FAIR data are data which meet the principles of findability, accessibility, interoperability, and reusability [12]. There is now an extensive literature on FAIR data.
## Framework Services
Framework Services or Data Commons Framework (DCF) Services is the term used by Gen3 to refer to data mesh services in the narrow middle architecture, for data meshes, such as the NCI Cancer Research Data Commons. These are set of standards-based services with open APIs for authentication, authorization, creating and accessing FAIR data objects, and for working with bulk structured data in machine-readable, self-contained format.

## Flattened Data
Structured data that has been processed via Tube and stored in elasticsearch to accelerate searchability.
## Gen3 Client
The Gen3 Client is a command-line tool for downloading, uploading, and submitting data files to and from a Gen3 data commons.  Some of the same functionality can be found in the Gen3 SDK. You can find installation and use instructions [here][Gen3 client docs].
## Gen3 SDK
The Gen3 Software Development Kit (SDK) for Python provides classes and functions for handling common tasks when interacting with a Gen3 commons. It also exposes a Command Line Interface (CLI). The API for a commons can be overwhelming, so this SDK/CLI aims to simplify communication with various microservices.  It can also download and upload files like the Gen3 Client.  You can find installation and use instructions [here][SDK docs].
## Gen3 Microservices
A simple list of most relevant microservices are included below.  For a description of each service and links to their respective repositories please visit the [Developer's Guide][Microservices].

* Data Portal
* Indexd
* Fence
* Guppy
* Hatchery
* Helm
* Metadata Service (MDS)
* Pelican
* Peregrine
* Requestor
* Sheepdog
* Sower
* Tube
* Workspace Token Service

## Globally Unique Identifier (GUID)
A GUID is an essentially unique identifier that is generated by an algorithm so that no central authority is needed, but rather different programs running in different locations can generate GUID with a low probability that they will collide. A common format for a GUID is the hexadecimal representation of a 128-bit binary number. Some external systems may use the term Universallt Unique Identifier (UUID), which is essentially the same thing.
## Graph model
The graph model refers to the structured data within a Gen3 data commons.  The "graph" is defined by the relationship between nodes that is specified in the data dictionary.  This can be flattened via Tube and stored in elasticsearch to accelerate searchability.
## Kubernetes
An open-source system for automating deployment, scaling, and management of containerized applications, which Gen3 is built from.
## Manifest
Usually refers to a file manifest.  This is a json formatted file that includes GUIDs, file names, md5 checksums, and file sizes for files of interest.  It can be used by the gen3 client or SDK to download files provided a user has the appropriate credentials.
## Microservice
Microservices are a software architecture that organizes software into small, independent services that communicate over well-defined APIs. These services can be developed, set up, and scaled independently. A more traditional architecture is to put all the APIs and other required functionality into a single application. This is sometimes called a monolithic architecture. Microservices provide important advantages for large-scale systems that require scalability and must continue to evolve even as their code base grows very large, but increases the complexity of operating small-scale systems.
## Persistent Drive
This is a directory in a Gen3 workspace that allows a user to store files that will remain available after termination of the workspace session.  It will be represented as `pd`.
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
[SDK docs]: user-guide/search.md#the-gen3-sdk
[PFB GitHub]: https://github.com/uc-cdis/pypfb
[PFB Pub]: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1010944
[workspace use]: user-guide/analyze-data.md
