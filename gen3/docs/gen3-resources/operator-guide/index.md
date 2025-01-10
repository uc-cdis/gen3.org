# Gen3 Operator Guide - Configure and Deploy Gen3

This is the guide for users who want to stand up a new Gen3 instance. It includes the following content:

* [An **overview of Gen3 deployment** and considerations][deploy overview]
* A [list of prerequisite software and resources][prerequisites] for production deployment of Gen3
* A description of predeployment tasks, including [our approach to **Infrastructure as Code**][infrastructure as code], [preparing an SSL certificate][ssl], and [setting up a Secrets manager][secrets].
* A [description of the **different authentication methods**][authentication methods] that can be used in Gen3
* [A **guide to Helm deployment and configuration**][helm guide]
* Postdeployment tasks, including [**creating a Data Dictionary** and Data Model][data dictionary], [**submitting data**][submit data], [**customizing search for Query, Exploration, and Discovery pages** in Gen3][customize search], and [**customizing the front end**][customize frontend]


## Gen3 Deployment Options

### **Helm (preferred)**

Helm is a Kubernetes package manager that allows you to easily define, install, and upgrade even complex applications. It is a tool that streamlines the installation and management of applications on Kubernetes platforms. **We recommend that Gen3 users deploy with Helm.**

*[Jump to the Helm configuration and deployment guide][helm guide]*

In a Gen3 deployment, Helm serves as the primary tool for:

* **Defining Deployments:** Helm uses configuration files called charts to define how Gen3 components should be deployed. These charts encapsulate the necessary configuration, dependencies, and deployment logic.
* **Installation:** Helm streamlines the process of installing Gen3 components into your Kubernetes cluster. With Helm, you can easily deploy Gen3 services, databases, and other essential components.
* **Configuration Management:** Helm simplifies the management of configuration settings for Gen3 services. You can customize settings, such as database connection details, service replicas, and more, through Helm values.
* **Upgrades and Rollbacks:** As Gen3 evolves, Helm enables you to effortlessly upgrade your deployment to the latest versions. In case of issues, it also provides the ability to roll back to previous configurations.

### Other Deployment Options

Although we strongly recommend deploying with Helm, there may be circumstances where Helm deployment is not possible. For these cases, there are older approaches that can be used to deploy Gen3:

**Cloud-automation (legacy)**

*Cloud-automation is preserved for legacy reasons. In the future, it may no longer be supported, so we encourage all Gen3 operators to update their Gen3 installation to use [Gen3 Helm][helm guide].*

Gen3 cloud-automation  was used in the past to deploy Gen3 data commons in production environments on Amazon Web Services, Google Cloud Platform, Microsoft Azure, and OpenStack environments. Cloud-automation is fully-featured, supporting integrated logging, security, and compliance steps. With cloud-automation, we utilize Kubernetes to orchestrate our services into a scalable environment that can be run in a cost-efficient manner for many tens to thousands of users.

Even so, cloud-automation is a "bespoke solution" for CTDS, biased to how CTDS deploys Gen3 with limited configuration overrides. It also has a steep learning curve. Because of these disadvantages, we have developed the Helm approach to configure and deploy Gen3; **cloud-automation is no longer recommended for deployment.**

[Although we do not recommend using this, you can explore Gen3 cloud-automation here][cloud-automation]

**Compose-services (deprecated)**

*Compose-services is deprecated, and is no longer maintained. We are linking to this for legacy purposes.*

Compose-services was used to deploy Gen3 at a small scale, for experimental commons, small commons, or local development of the Gen3 stack. Deployment used Docker containers for the Gen3 microservices and nginx. The microservices and nginx images were pulled from quay.io (master), while Postgres (9.5) images were pulled from Docker Hub. Nginx was used as a reverse proxy to each of the services.

[Although we do not recommend using this, you can explore Gen3 compose-services here][compose-services]

<!-- Links -->
[Gen3 User Guide]: ../user-guide/index.md
[Gen3 Developer Guide]: ../developer-guide/index.md
[cloud-automation]: https://github.com/uc-cdis/cloud-automation/blob/master/doc/csoc-free-commons-steps.md
[compose-services]: https://github.com/uc-cdis/compose-services/tree/master
[helm guide]: helm/index.md
[deploy overview]: helm/helm-deploy-overview.md
[prerequisites]: prerequisites.md
[infrastructure as code]: iac-overview.md
[ssl]: ssl-cert.md
[secrets]: secrets-mgr.md
[authentication methods]: gen3-authn-methods.md
[data dictionary]: create-data-dictionary.md
[submit data]: submit-structured-data.md
[customize search]: customize-search.md
[customize frontend]: customize-frontend.md
[ssl]: ssl-cert.md
[secrets]: tutorial_secrets-mgr.md
