# Helm to Configure and Deploy Gen3

## [**-*Jump to quick-start videos*-**](#getting-started-with-helm-quick-start-videos)

[**Helm**](https://helm.sh) plays a crucial role in simplifying the deployment and management of Gen3 components within your environment. It is a Kubernetes package manager that allows you to define, install, and upgrade even complex applications with ease.

If you haven't already installed Helm for your Gen3 deployment:

 > **Installation**: Install Helm by following the [official Helm installation guide](https://helm.sh/docs/intro/install/) for your specific platform.

## Why is Helm a good choice for Gen3 deployment?

Gen3 Helm includes many sensible defaults for configuration. If you are just beginning to look into Gen3 and are uncertain about configuration decisions or options - you can do minimal configuration and the defaults will help you end up with a functional generic Gen3 instance to play with.

But -- Gen3 is also highly configurable. If you are an experienced Gen3 user looking to make sophisticated configurations, Helm will facilitate that, as well.

## Role of Helm in Gen3 Deployment

In a Gen3 deployment, Helm serves as the primary tool for:

- **Defining Deployments**: Helm uses configuration files called charts to define how Gen3 components should be deployed. These charts encapsulate the necessary configuration, dependencies, and deployment logic.

- **Installation**: Helm streamlines the process of installing Gen3 components into your Kubernetes cluster. With Helm, you can easily deploy Gen3 services, databases, and other essential components.

- **Configuration Management**: Helm simplifies the management of configuration settings for Gen3 services. You can customize settings, such as database connection details, service replicas, and more, through Helm values.

- **Upgrades and Rollbacks**: As Gen3 evolves, Helm enables you to effortlessly upgrade your deployment to the latest versions. In case of issues, it also provides the ability to roll back to previous configurations.

## Helm Charts, values.yamls, templates, and more

In the Gen3 Helm repo, in the `/helm` directory, there are directories for each of the Gen3 microservices, as well as a directory called `/gen3`. Each of these folders is called a Helm "chart". Helm charts are packages of pre-configured Kubernetes resources that define and deploy microservices. A chart contains all of the resource definitions necessary to run the service inside of a Kubernetes cluster. In any Helm chart, there are several items:

* **values.yaml:** The values.yaml in a Helm chart is what defines the variables relevant for the chart
* **chart.yaml:** The chart.yaml is what makes the directory a chart; it defines the dependencies for the chart
* **templates:** The templates have incomplete fields that are completed with values from the values.yaml. Templates generate manifest files that Kubernetes can understand.

### Umbrella Chart for Coordinated Deployment (Gen3 Chart)

To coordinate the deployment of our microservices and additional development-related resources, we use the `/gen3` Helm chart as the Gen3 "umbrella" chart. This "gen3" chart serves as the central point for deploying and managing our application as a whole.

Values in the Gen3 umbrella values.yaml (also called the Gen3 values.yaml) can override default values in the microservice charts.

>For example: in the Guppy microservice chart, the default is that Guppy is not enabled (`enabled: false`). We can turn on Guppy from the Gen3 values yaml by adding a `guppy` block and including `enabled: true`, without making any changed to the Guppy values.yaml.

**Most users should only be making configuration changes in the Gen3 values.yaml, using blocks specific for the service to be configured. Users generally should NOT be editing anything charts for the microservices.**

The `gen3` chart includes the following components:

* **Microservices Helm Charts:** All individual microservice Helm charts are incorporated into the `gen3` chart, ensuring a coordinated and cohesive deployment of the entire application stack.
* **Development Resources:** Development tools and resources, such as PostgreSQL and Elasticsearch, are included in the `gen3` chart to streamline the development and testing process. These resources are essential for replicating the production environment in a development context.

### Common Chart for Shared Components

To streamline the deployment of shared components and utilities across our microservices, we have a dedicated **`common` Helm chart**. The common chart includes various components and configurations that are shared among multiple microservices. These components typically include:

- **Database Setup Jobs**: Common database setup tasks, such as schema initialization and data migration jobs, are defined within the common chart. This ensures consistent database management across microservices.

- **Secrets Management**: Shared secrets and credentials required by multiple microservices are securely managed within the common chart. This centralization enhances security and simplifies secrets management.

- **Shared Components**: Other components and utilities that are reused across microservices. This promotes code reuse and maintainability.

By centralizing these common features in a dedicated chart, we reduce redundancy, ensure consistency, and simplify the maintenance and updates of shared components.

## The benefits of charts

- **Isolation**: Each microservice operates independently within its own Helm chart, allowing for isolation and decoupling of services. This isolation enhances fault tolerance and simplifies updates and maintenance.

- **Customization**: Microservices can have their specific configurations and dependencies defined within their Helm charts, making it easier to tailor each service to its unique requirements.

## Getting started with Helm - Quick-Start Videos

### Deploy with Kind and Helm

!!! info "Quick-start to deploy Gen3 with Kind & Helm"

    This video walks through basic set up a Gen3 data commons on your laptop using Kind and Gen3 Helm charts.

<p align="center"><iframe width="560" height="315" src="https://www.youtube.com/embed/CFxdmFt-nIw?si=bf-1-gOZtFr_W904" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></p>

### Deploy with Minikube and Helm

!!! info "Quick-start to deploy Gen3 with Minikube & Helm"

    This video walks through basic set up a Gen3 data commons on your laptop using Minikube and Gen3 Helm charts.

<p align="center"><iframe width="560" height="315" src="https://www.youtube.com/embed/nDL1DrtJqBk?si=1S2fCzUYjw0CK_tU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></p>

### Additional post-deployment configuration tips

!!! info "Gen3 Helm Charts: SSL, Permissions, Test Data, Tabs, and more"

    This video covers several aspects of configuration after deploying Gen3, including:

    * How to generate SSL certificates for secure communication
    * Updating permissions to ensure seamless access control
    * Submitting test data to validate your configurations
    * Enabling persistence for data continuity
    * Configuring the Workspace Tab for launching notebooks
    * Configuring the Exploration Tab for advanced data discovery

<p align="center"><iframe width="560" height="315" src="https://www.youtube.com/embed/MnBxqE9gm6I?si=1xTXAAxhZ3X0Z5n2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></p>
