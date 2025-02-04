# Prerequisites for Production Deployment of Gen3

## Overview

Before initiating a Gen3 deployment, it's essential to ensure that you have the following prerequisites in place:

### System Requirements

#### Hardware:
* Adequate hardware resources, including CPU, RAM, and storage, to support the expected workload and data volume of your Gen3 deployment.
* Specifications may vary based on the scale and requirements of your Gen3 environment.

### Software Requirements

#### Kubernetes:
* Kubernetes is a fundamental requirement for Gen3 deployments. Ensure that you have a Kubernetes cluster set up, configured, and accessible.
* Gen3 is designed to work with Kubernetes for container orchestration.
* Utilizing a managed Kubernetes service for production deployments enhances reliability, scalability, and security in your Gen3 environment

#### Helm:
* Helm, the Kubernetes package manager, is used to deploy and manage Gen3 components.

### Access to Necessary Resources

#### Cloud Provider Account (if applicable):
* If your Gen3 deployment is in a cloud environment, you'll need access to a cloud provider account (e.g., AWS, GCP, Azure) with the necessary permissions to create and manage resources.

#### Storage:
* Ensure you have ample and scalable storage resources to accommodate data storage and backups, with careful planning for future data growth.
* Gen3 supports S3-compatible object storage systems, making it a versatile and efficient storage solution.


### Required Knowledge and Permissions

#### Technical Expertise:
* Ensure that your team possesses the technical expertise required to set up and maintain a Gen3 deployment. This includes cloud-native technologies like Kubernetes, Helm, Docker, as well as knowledge related to cloud computing environments.


## Specific Services

### PostgreSQL

Most Gen3 services rely on PostgreSQL for relational data storage. This includes services like Fence, Peregrine, and more.

PostgreSQL is required to provide:

* Relational data storage
* Transaction support
* Advanced data types
* Performance at scale
* Reliability and backups

For production deployments, a managed PostgreSQL service is recommended:

* On AWS: RDS or Aurora
* On Google Cloud: Cloud SQL
* On Azure: Azure Database for PostgreSQL

Using a fully managed PostgreSQL service avoids the overhead of maintaining PostgreSQL and simplifies operations.

### Elasticsearch

Elasticsearch is used in Gen3 for indexing and searching data. It provides:

* Full text search
* Flexible querying
* Scalable analytics
* Fast aggregations

For production, a managed Elasticsearch service is recommended:

On AWS: Amazon Elasticsearch Service

Using a fully managed service simplifies operations.

Currently Gen3 supports up to Elasticsearch 7. Support for newer versions is in progress. When deploying, use Elasticsearch 7 or earlier.

#### ETL process for Guppy
Gen3 uses an ETL (Extract, Transform, Load) process to optimize data for easier exploration.

This ETL pipeline:

* Extracts data from the Sheepdog database
* Transforms the data into an optimized format
* Loads the transformed data into Elasticsearch

The Elasticsearch index powers the guppy service used in data explorer UI:

* Fast filtering and aggregation
* Quick exploration of complex datasets
* Summary stats and visualizations

The ETL process runs on new data added to Sheepdog, keeping the Guppy cache synchronized.

The ETL job handles ingesting large amounts of data, so Guppy can quickly serve queries and visualizations.

### Argo

**Argo Workflows** is an optional component used in certain Gen3 commons to define and execute automated workflows. Please be aware that Argo-Workflows support is currently in progress and will soon become a mandatory requirement.

It plays a role in simplifying and automating complex tasks within the Gen3 ecosystem.

#### Key Features

Argo Workflows provides the following key features:

* **Workflow Definitions in YAML**: Argo allows you to define workflows using YAML, providing a human-readable and easily maintainable way to describe your processes.

* **DAG-based Orchestration**: The orchestration of tasks in Argo Workflows is based on directed acyclic graphs (DAGs), making it suitable for managing complex dependencies between tasks.

* **User Interface (UI) and API**: Argo offers a user-friendly web-based UI and a programmable API to facilitate the execution of workflows on demand. This enables users to interact with and manage their workflows efficiently.

* **Metrics and Logs**: Argo Workflows provides comprehensive metrics and logs, offering insight into the status and performance of running workflows. This observability feature is crucial for monitoring and troubleshooting workflows.

#### Use Cases in Gen3

Argo Workflows is integral to Gen3, serving various purposes, including:

* **ETL Pipelines**: Gen3 utilizes Argo Workflows to automate Extract, Transform, Load (ETL) processes, enabling efficient data ingestion and transformation.

* **Usersync**: The Usersync process, responsible for synchronizing user data, is orchestrated using Argo Workflows, ensuring user information remains up-to-date.

* **Administrative and Housekeeping Tasks**: Argo Workflows is employed for automating administrative and housekeeping tasks within the Gen3 environment, such as data archiving, backup management, and resource scaling.

#### Prerequisites for Workflow Automation

Argo Workflows is a critical prerequisite for any Gen3 commons aiming to leverage workflow automation. The integration of Argo Workflows with Gen3's authentication and authorization systems is facilitated through the [**argo-wrapper**][argo wrapper] service. This integration ensures secure and controlled access to workflow execution capabilities within the Gen3 platform.

By configuring Argo Workflows and the associated `argo-wrapper` service, Gen3 commons can harness the power of workflow automation to streamline data processing, user management, and administrative tasks.

For detailed information on setting up Argo Workflows and configuring the `argo-wrapper` service within your Gen3 environment, please refer to the official Gen3 documentation and relevant installation guides.





<!-- Reference Links -->
[argo wrapper]: https://github.com/uc-cdis/argo-wrapper
