# Gen3 Framework Services

The Gen3 Framework Services are a minimal set of software services that provide open APIs for indexing data objects, associating metadata with the data objects, and controlling user access to data via a robust and flexible access control policy engine.

Data resources using the Gen3 Framework Services get the minimal backend functionality necessary for managing data and controlling user access to it. Specifically, the services included in the Gen3 Framework Services are those for data object indexing, storing and associating metadata with data objects, and user authentication and authorization.

## Object Indexing
![alt text](img/features/index.svg)

The Gen3 data object indexing service mints permanent digital IDs, called data GUIDs (globally unique IDs), for data objects. The service tracks the physical locations and hash of every asset (file) in the data commons object store. The Gen3 platform includes landing pages which support FAIR descriptions of the data objects.

## User Authentication and Authorization

![alt text](img/features/auth.svg)

The Gen3 Framework Services include software services for user authentication and fine-grained authorization to services, metadata, and data objects via a flexible access control policy engine. Gen3 utilizes OpenID Connect for providing AuthN services with AuthZ specified on a per commons basis. Currently supported identity providers include Google and Shibboleth, supporting providers such as NIH iTrust, InCommon Federation, and eduGAIN.

## Metadata Service

![alt text](img/features/mds.svg)

The Gen3 metadata service provides support for arbitrary JSON blobs attached to globally unique identifiers (GUIDs). This provides a simple and flexible way to add additional, non-schema-enforced metadata into the system without the need for a fully-fledged, harmonized data model.
