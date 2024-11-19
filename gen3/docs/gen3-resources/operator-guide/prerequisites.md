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




## Tutorial for Production Deployment


This guide walks you through deploying Gen3 in a production environment on AWS using Infrastructure as Code (IaC), Kubernetes, and GitOps best practices. This approach ensures a robust, scalable, and repeatable deployment process.

### Key Benefits

- **Infrastructure as Code (IaC)**
    - **Efficiency:** Streamlines and automates infrastructure provisioning, eliminating error-prone manual steps.
    - **Reproducibility:** Easily create consistent environments, reducing deployment inconsistencies.
    - **Scalability:** Quickly scale up or down to meet demand, adapting to changing requirements.
- **Kubernetes**
    - **Robust Platform:** Leverages Kubernetes for container orchestration, providing scalability and resilience for your Gen3 applications.
    - **Extensive Ecosystem:** Tap into a vast array of tools and resources to customize and extend your Kubernetes deployment.
- **GitOps**
    - **Version Control:** Manage your infrastructure and application configurations in Git for better tracking and rollback capabilities.
    - **Automation:** Automate deployments and updates, reducing manual intervention and risk of errors.
- **Secrets Management**
    - **Security:** Securely store and manage sensitive credentials (e.g., database passwords, API keys) using AWS Secrets Manager.
    - **Seamless Integration:** Easily retrieve secrets from within your applications, adhering to security best practices.



### 1. Admin VM (Jump Box) Setup

The Admin VM, also known as a jump box or bastion host, serves as your secure entry point into your production environment. You'll control your Gen3 deployment from this machine, so it's crucial to follow best practices to protect it:

1. **Create a Dedicated EC2 Instance:**
   - Launch a new EC2 instance specifically for your Admin VM. Avoid using existing instances or shared resources.
   - Choose an instance type with appropriate resources for your workload (e.g., t3.medium or similar).

2. **Security Groups (Firewall):**
   - Restrict inbound traffic to the Admin VM:
     - Allow SSH access (port 22) only from your trusted IP addresses or a specific bastion host security group.
     - Limit other incoming traffic (e.g., RDP) as needed.
   - Outbound traffic can be more permissive, allowing access to your Gen3 infrastructure components and other necessary AWS services.

3. **SSH Key Pair:**
   - Create a new SSH key pair specifically for the Admin VM. Avoid using default or shared key pairs.
   - Securely store the private key on your local machine and never share it.

4. **OS Hardening:**
   - Choose a minimal base operating system (e.g., Ubuntu Server, Amazon Linux 2) and apply updates regularly.
   - Disable unnecessary services and protocols.
   - Enforce strong password policies or, ideally, use SSH key-based authentication exclusively.

5. **Additional Security Measures (Recommended):**
   - Enable multi-factor authentication (MFA) for SSH access.
   - Use a centralized logging solution to monitor access and activity on the Admin VM.
   - Regularly review and update security groups as needed.
   - Consider implementing intrusion detection or prevention systems (IDS/IPS).

6. **Connect to Admin VM:**
   - Use SSH from your local machine with the private key you created:
     ```bash
     ssh -i your_private_key.pem ec2-user@<your_admin_vm_public_ip>
     ```

### 2. Admin VM Software Installation

Install the following tools on your Admin VM:

1. **AWS CLI:** Pre-installed on most Amazon Linux and Ubuntu instances. If not, follow [this guide][aws cli user guide] to install and configure it.
2. **Terraform:** Install Terraform using [this guide][terraform user guide].
3. **kubectl:**  Install kubectl following the instructions [here][kubectl].
4. **Helm:** Install Helm using [this guide][helm].
5. **k9s (Optional):** Install k9s [here][k9s]for a terminal-based UI for your Kubernetes cluster.

### 3. Infrastructure Deployment with Terraform

Use the provided Terraform module to create your infrastructure:

```terraform
# ... (Your Terraform configuration)
```

Customize: Adjust the Terraform variables to match your desired configuration.
Plan & Apply: Run terraform plan to preview the changes and terraform apply to create the infrastructure.

### 4. GitOps Repository Structure for Helm Charts and Terraform Outputs

This section outlines the steps to create a GitOps repository structure where you can upload a values.yaml file generated by Terraform and manage multiple Helm charts for different environments (referred to as "commons").

Please see an example of a gen3 gitops repository here: https://github.com/uc-cdis/gitops-example/tree/master

#### Repository Structure:

The repository will have the following structure:

```
gitops-repo/
├── commons1/
│   ├── Chart.yaml
│   ├── values/
│   │   │
│   │   └── values.yaml (Terraform output)
│   ├── templates/
│   │   └── app.yaml
├── commons2/
│   ├── Chart.yaml
│   ├── values/
│   │   │
│   │   └── values.yaml (Terraform output)
│   ├── templates/
│   │   └── app.yaml
```

#### Step-by-Step Instructions:
1. Create the GitOps Repository
2. Initialize a new Git repository:
    ```
    git init gitops-gen3
    cd gitops-gen3
    ```
3. Create a directory for each "common" (environment):
    ```
    mkdir common1 common2
    ```
4. Setting Up the Common Directory
   For each common directory (e.g., common1), create the following structure:
   ```
   touch common1/Chart.yaml
   ```
   Example `Chart.yaml` content:
   ```
    apiVersion: v2
    name: common1.org
    description: common1.org argo application

    type: application

    # This is the chart version. This version number should be incremented each time you make changes
    # to the chart and its templates, including the app version.
    # Versions are expected to follow Semantic Versioning (https://semver.org/)
    version: 0.1.0

    # This is the version number of the application being deployed. This version number should be
    # incremented each time you make changes to the application. Versions are not expected to
    # follow Semantic Versioning. They should reflect the version the application is using.
    appVersion: "1.0"
   ```
5. Create a values folder to organize values files:
   ```
   mkdir common1/values
   ```
   Place the main Terraform output file and additional values files in this folder:
   ```
   touch common1/values/values.yaml
   touch common1/values/fence.yaml
   touch common1/values/guppy.yaml
   etc...
   ```
6. Create a templates folder to house the Argocd application file:
    ```
    mkdir common1/templates
    touch common1/templates/app.yaml
    ```
    Example app.yaml content:
    ```
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
    name: gen3-commons1
    namespace: argocd
    finalizers:
    - resources-finalizer.argocd.argoproj.io
    spec:
    project: default
    sources:
        - path: helm/gen3
        repoURL: https://github.com/uc-cdis/gen3-helm
        targetRevision: master
        helm:
            releaseName: commons1
            valueFiles:
            - $values/commons1.org/values/values.yaml
            - $values/commons1.org/values/fence.yaml
            - $values/commons1.org/values/portal.yaml
            - $values/commons1.org/values/guppy.yaml
            - $values/commons1.org/values/hatchery.yaml
            - $values/commons1.org/values/etl.yaml
        - repoURL: 'https://github.com/uc-cdis/gen3-gitops.git'
        targetRevision: master
        ref: values
    destination:
        server: "https://kubernetes.default.svc"
        namespace: default
    syncPolicy:
        syncOptions:
        - CreateNamespace=true
        automated:
        selfHeal: true
    ```

7. Commit and Push to Repository
   PLEASE NOTE!:
   It is crucial to ensure that sensitive information, such as secret access keys, database passwords, and any other confidential data, is never uploaded to GitHub. This helps prevent unauthorized access and potential security breaches.

   To securely manage sensitive data, we have incorporated external secrets into our Helm charts. Users can utilize this feature to safely handle and store their sensitive information.

   For more details on managing sensitive data using external secrets, please refer to our External Secrets Operator documentation [HERE][secrets manager].

    Add and commit your changes:
    ```
    git add .
    git commit -m "Initial commit with common1 structure and Terraform output"
    ```
    Push to your remote repository:
    ```
    git remote add origin <remote-repository-url>
    git push -u origin main
    ```

<!-- ### Gen3 Future Gitops Plan:
Deploy gen3 using the ArgoCD App of Apps structure.

The ArgoCD App of Apps structure utilizes a root app.yaml file to deploy a set of child applications, each responsible for a specific part of the overall gen3 ecosystem.

Please feel free to read more about this general structure [HERE](https://www.eksworkshop.com/docs/automation/gitops/argocd/app-of-apps/).

In the same GitOps repository created in the previous step, you will add an `eks-resources` Helm chart. This chart will include a root `App.yaml` file (`eks-resources/App.yaml`) designed to deploy all necessary EKS resources. These resources may include:
Calico
CoreDNS
VPC CNI
External Secrets Operator
K9s
Etc.

The eks-resources chart will have the following structure:
```
eks-resources/
├── Chart.yaml
├── values.yaml
├── App.yaml
├── values/
│   └── application1-values.yaml
│   └── application2-values.yaml
├── templates/
│   └── application1.yaml
│   └── application2.yaml
```
Example `App.yaml` content:
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: eks-resources
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  destination:
    namespace: argocd
    server: https://kubernetes.default.svc
  source:
    repoURL: https://github.com/uc-cdis/gen3-gitops.git
    targetRevision: master
    path: eks-resources
  syncPolicy:
    automated:
      selfHeal: true
``` -->



<!-- Reference Links -->
[argo wrapper]: https://github.com/uc-cdis/argo-wrapper
[aws cli user guide]: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
[terraform user guide]: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
[kubectl]: https://kubernetes.io/docs/tasks/tools/
[helm]: https://helm.sh/docs/helm/helm_install/
[k9s]: https://k9scli.io/topics/install/
[secrets manager]: tutorial_secrets-mgr.md
