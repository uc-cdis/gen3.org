# Gen3 Microservices

Gen3 features and functionality are enabled by independent and modular microservices.  These services can be developed, set up, and scaled independently. Microservices provide important advantages for large-scale systems that require scalability and must continue to evolve even as their code base grows very large, but increases the complexity of operating small-scale systems.

While the average user does not need to know the details and names of each microservice, if you are interested in adding new features or modifying your Gen3 system in some way it may be helpful to have a deeper understanding of a specific microservice.  We have included brief descriptions below along with a link to their documentation in GitHub.


## [Arborist][arborist github]
Arborist acts as the Gen3 Policy Engine. It is an attribute-based access control (ABAC) policy engine, designed for use with the Gen3 stack. Arborist tracks resources requiring access control, along with actions which users may perform to operate on these resources, and roles, which aggregate permissions to perform one or more actions.

It is utilized by any service to make authorization decisions, whether that be API-level access, or the permission to read or delete a specific indexed record.

Services should offload _all_ authorization related logic to Arborist as much as possible.

## [Data Portal][data portal github]
The data portal service is an interactive website that allows users to explore, submit, and download data. The Windmill service utilizes the APIs offered by the data commons just as any other externally built app could.

## [Fence][fence github]
Fence is an authentication (AuthN) and authorization (AuthZ) service which utilizes OpenID Connect flow (an extension of OAuth2) to generate tokens for clients. It can also provide tokens directly to a user. Clients and users may then use those tokens (JWT) with other Gen3 Data Commons services to access protected endpoints that require specific permissions. Fence can be configured to support different Identity Providers (IDPs) for AuthN. At the moment, supported IDPs include Google, and Shibboleth supporting providers such as NIH iTrust.

Fence also handles the authorization syncing (though the results end up in Arborist), the management of necessary AWS/Google IAM credentials for administering signed URLs to end-users, and the exposure of the APIs for signed URL generation (both Gen3's and GA4GH DRS).

> **NOTE**: The Fence images serving signed URLs are typically deployed as a separate kubernetes service `presigned-url-fence` with much greater scaling capabilities (to separate traffic related to authN/Z from data access traffic). The Indexd service still handles the management of the indexed records themselves (with their GUIDs and DRS URIs).
>
> This separation of concerns (records vs data access) is intentional, but the fact that the Fence codebase holds both authN/Z and data access logic (requiring 2 kubernetes services of the same image) is known technical debt. It is likely that in the future a new service or mechanism for retrieving file-based data will replace `presigned-url-fence`.

## [Guppy][guppy github]
Server that supports GraphQL queries on data from elasticsearch. Guppy integrates with the Gen3 Policy Engine, Arborist, to filter out results that a user should not see. This is done by comparing a list of resources the user has access to (from Arborist), with the specified authorization resources of the records they are querying.

## [Hatchery][hatchery github]
Hatchery creates Kubernetes Pods for workspace services. Workspace services must expose HTTP servers. Ambassador is used to proxy user traffic through to their container workspace once it is launched by Hatchery.

## [Helm][helm github]
Gen3 relies upon Helm to manage installation and management of Kubernetes applications. Helm is used to build "charts", which are packages of Kubernetes resources that are used to deploy apps to a cluster. Helm is the recommended way to deploy Gen3.

## [Indexd][indexd github]
The Indexd service provides permanent, digital, globally unique IDs (GUIDs) for data objects. These IDs can be used to retrieve the data, or query the metadata associated with the object. The Indexd service tracks the locations and hash of every asset (file) in the data commons object store. It exports RESTful APIs for registering a new asset, and retrieving data for an existing asset.

## [Manifest Service][manifest service github]
This service handles reading from and writing to a user's S3 folder containing their manifests. A manifest is a JSON file that lists records a researcher may be interested in analyzing. This service stores a manifest to a user folder in an s3 bucket and delivers it for later use, such as when the researcher wants to mount the manifest in their workspace. If the "prefix" config variable is set, user folders will be stored in a directory of that name within the s3 bucket.

> **NOTE**: We are developing a comprehensive replacement of this service, which will include real cohort management and better integration of selected data across UI pages.

## [Metadata Service (MDS)][MDS github]
The Metadata Service provides an API for retrieving JSON metadata of GUIDs. It is a flexible option for "semi-structured" data (key:value mappings).  The content of the MDS powers the Data Portal Discovery Page for a Data Commons. The Gen3 SDK can be used to upload and edit the metadata. This service includes a feature known as the aggregated metadata service (AggMDS), which caches metadata from the metadata services of multiple data commons. The AggMDS holds the content viewable in a Data Portal Discovery page for a Data Mesh.

## [Peregrine][peregrine github]
Peregrine is the metadata seeking service which responds to GraphQL search queries and translates them to queries over the graph-like postgres database for structured data. The service translates the GraphQL search into the appropriate statements which are run against the PostgreSQL backend before being returned as friendly JSON.

## [Requestor][requestor github]
Requestor exposes an API to manage access requests.

## [Sheepdog][sheepdog github]
The Sheepdog service is responsible for herding user submissions of metadata into the graph database. The submissions are quality controlled against the data dictionary to ensure all required fields are present and have appropriate data values. The Sheepdog service is also responsible for supporting bulk export of the metadata into TSV or JSON formats.

## [Sower][sower github]
Sower dispatches Kubernetes jobs.

## [Tube][tube github]
Microservice that controls the ETL process of structured data.

## [Workspace Token Service][wts github]
The Gen3 workspace token service acts as an OIDC client which acts on behalf of users to request refresh tokens from Fence. This happens when a user logs into a workspace from the browser. WTS then stores the refresh token for that user, and manages access tokens and refresh tokens for workers that belong to specific users in the workspace.


# Microservice NGINX Route Table

This table is helpful for debugging errors in front-end applications like [Windmill: data portal](https://github.com/uc-cdis/data-portal) or other Gen3 clients. You can easily identify the running service that is returning an error, based on its absolute HTTP request path. [Source](https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/revproxy/gen3.nginx.conf).

> **NOTE**: We intend to eventually have a more centralized API definition and potentially an API Gateway, while shifting towards an API First development strategy.

| Microservice                 | URL Path Prefix (NGINX Location) | GitHub Repository                                                                          |
|------------------------------|----------------------------------|--------------------------------------------------------------------------------------------|
| ambassador-service           | /lw-workspace/proxy/             | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/ambassador           |
| arborist-service             | /gen3-authz                      | https://github.com/uc-cdis/arborist                                                        |
| arborist-service             | ~ /authz/?                       | https://github.com/uc-cdis/arborist                                                        |
| arborist-service             | /authz/resources                 | https://github.com/uc-cdis/arborist                                                        |
| arborist-service             | /gen3-authz-test                 | https://github.com/uc-cdis/arborist                                                        |
| fence-service                | /authn-proxy                     | https://github.com/uc-cdis/fence                                                           |
| fence-service                | /user/                           | https://github.com/uc-cdis/fence                                                           |
| fenceshib-service            | /                                | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/fenceshib            |
| google-sa-validation-service | /google-sa-validation-status/    | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/google-sa-validation |
| grafana                      | /grafana/                        |                                                                                            |
| guppy-service                | /guppy/                          | https://github.com/uc-cdis/guppy                                                           |
| hatchery-service             | /lw-workspace/                   | https://github.com/uc-cdis/hatchery                                                        |
| indexd-service               | /ga4gh/                          | https://github.com/uc-cdis/indexd                                                          |
| indexd-service               | /index/                          | https://github.com/uc-cdis/indexd                                                          |
| jupyterhub-service           | /lw-workspace/                   | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/jupyterhub           |
| jupyterhub-service           | /lw-workspace/hub/logout         | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/jupyterhub           |
| manifestservice-service      | /manifests/                      | https://github.com/uc-cdis/manifestservice                                                 |
| metadata-service     | /mds/                      | https://github.com/uc-cdis/metadata-service
| peregrine-service            | /peregrine/_status               | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /peregrine/_version              | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /api/search                      | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /api/v0/submission/graphql       | https://github.com/uc-cdis/peregrine                                                       |
| peregrine-service            | /api/v0/submission/getschema     | https://github.com/uc-cdis/peregrine                                                       |
| pidgin-service               | /coremetadata/                   | https://github.com/uc-cdis/pidgin                                                          |
| prometheus-server            | /prometheus/                     | https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/monitoring           |
| sheepdog-service             | /api/                            | https://github.com/uc-cdis/sheepdog                                                        |
| sower-service                | /job/                            | https://github.com/uc-cdis/sower                                                           |
| workspace-token-service      | /wts/                            | https://github.com/uc-cdis/workspace-token-service                                         |




[arborist github]: https://github.com/uc-cdis/arborist
[data portal github]: https://github.com/uc-cdis/data-portal
[fence github]: https://github.com/uc-cdis/fence
[guppy github]: https://github.com/uc-cdis/guppy
[hatchery github]: https://github.com/uc-cdis/hatchery
[helm github]: https://github.com/uc-cdis/gen3-helm
[indexd github]: https://github.com/uc-cdis/indexd
[manifest service github]: https://github.com/uc-cdis/manifestservice
[MDS github]: https://github.com/uc-cdis/metadata-service
[peregrine github]: https://github.com/uc-cdis/peregrine
[requestor github]: https://github.com/uc-cdis/requestor
[sheepdog github]: https://github.com/uc-cdis/sheepdog
[sower github]: https://github.com/uc-cdis/sower
[tube github]: https://github.com/uc-cdis/tube
[wts github]: https://github.com/uc-cdis/workspace-token-service
