# Infrastructure as Code Overview

Similar to how [Helm][helm] helps with the gen3 software management, [Terraform][terraform] plays a crucial role in simplifying the deployment and management of infrastructure components within our supported cloud platforms, currently AWS. We define templates for the infrastructure components in the form of terraform modules, which are then used to deploy the infrastructure components in the cloud. The terraform modules are defined in the [Gen3 Terraform][Gen3 terraform] GitHub repository.

## Role of Terraform in Gen3 Deployment

In a Gen3 deployment, Terraform serves as the primary tool for:

* **Defining Cloud Infrastructure**: Terraform uses directories of configuration files called modules to define what infrastructure should be deployed. These modules encapsulate the necessary configuration, dependencies, and deployment logic.

* **Provisioning**: Terraform streamlines the process of provisioning cloud infrastructure to support and run your gen3 instance. With terraform, you can easily deploy and manage the infrastructure components, necessary for your gen3 deployment in the cloud.

* **Configuration Management**: Terraform simplifies the management of configuration settings necessary for creating cloud infrastructure. You can customize settings, such as database size and type, EKS(AWS's managed kubernetes service) versions, and more, through terraform configuration files.

* **Upgrades and Maintenance**: As Gen3 and the cloud evolves, terraform enables you to effortlessly upgrade your infrastructure to deploy the latest, greatest and most secure hardware and configuration within the cloud. Using terraform, you can easily scale or modify your infrastructure to meet the growing needs of your gen3 deployment.

### Installation and Configuration of Helm

If you haven't already installed and configured terraform for your Gen3 deployment, follow these steps:

1. **Installation**: Install Terraform by following their official guide, [official terraform installation guide][terraform installation]. We have written and tested our terraform on version 1.2, as well as our deprecated 0.11 versions of modules, so we recommend using either of those versions with their respective modules.


With terraform installed and configured, you are ready to deploy and manage cloud infrastructure necessary to run gen3 within AWS effortlessly, ensuring a production ready gen3 system.



<!-- Links -->

[helm]: https://helm.sh
[terraform]: https://www.terraform.io/
[Gen3 terraform]: https://github.com/uc-cdis/gen3-terraform
[terraform installation]: https://github.com/uc-cdis/gen3-terraform
