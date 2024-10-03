## Gen3 Terraform

[**Gen3-terraform**][Gen3 Terraform] contains our terraform modules for deploying and managing cloud infrastructure necessary for running gen3 within AWS. The modules are organized into directories based on the version of terraform they correspond to, then the type of infrastructure they deploy. The tf_files directory contains our deprecated 0.11 versions of modules, while the tf_files-1.0 directory contains our >1.0 versions of modules, although we have been using version 1.2 of terraform with these modules, so we recommend using that version of terraform with these modules. Under these directories we break down into clouds and then individual portions of clouds. If using the latest terraform modules, the most important module will be the commons one, which will spin up all the necessary infrastructure for a gen3 commons. The other modules are used if you'd like to spin up individual components or supplementary infrastructure within a commons, like service accounts, AWS roles etc. It should go without saying, but you will need admin access to an AWS account to be able to run our terraform modules for AWS.

## Usage

There are are a few ways to utilize our terraform modules, which will largely depend on how many instances you plan to run and how hands off you want the maintenance to be. The following are a few options that we have utilized:

- **Running Terraform within the cloned repo**: This option allows you to run terraform directly within the cloned repo, which is useful for testing and development. This option is not recommended for production use, as it is not as secure as the other options, and it is not as easy to maintain. This option is also not recommended if you plan to run multiple instances of gen3, as you will have to clone the repo for each instance, and it will be difficult to maintain the state files for each instance.
- **Referencing our Terraform modules within your own modules**: This option allows you to reference our modules within your own modules, which is useful if you want to customize the modules to your needs. This option is recommended if you plan to run a few instances of gen3, as you can create a module for each instance, and it will be easier to maintain the state files for each instance. This option is also recommended if you want to customize the modules to your needs, as you can easily do so within your own modules.
- **Wrapping terraform with Terragrunt**: This option allows you to wrap terraform with terragrunt, which is useful if you want to run many instances of gen3, as it will allow you to run terraform across multiple modules at once. This option also let's you set configuration heirarchally, so you can set configuration at the root level, and it will be inherited by all the modules, allowing you to perform standard maintanance across every instance with ease. This approach adds a new layer of complexity though, so it is only recommended if you plan on managing many instances of gen3.
- **Running terraform or terragrunt with Atlantis**: This option can be used with the two above options, and it allows you to run terraform or terragrunt in a CI/CD pipeline, which is useful if you want to automate the deployment and maintenance of your gen3 instances. This option is recommended if you want to collaborate with others on the deployment and maintenance of your gen3 instances, as it allows you to easily review and approve changes to your infrastructure through github pr's.

The terraform modules are the backbone of our infrastructure deployment, and there are many ways to utilize them effectively. We have provided a few examples of how we have utilized them, but we encourage you to explore other options as well, and find the one that works best for you. In the following sections we will go into detail on how to setup the above options, and how to utilize them to deploy and maintain your gen3 instances.


## Running Terraform from Gen3-Terraform


### Prerequisites

#### Downloads

You will need to follow the process outlined in the [**Terraform Getting Started**][Terraform prereqs] page to download terraform. Once you have that downloaded you will need to clone our [**gen3-terraform repo**][Gen3 Terraform]. You will also need to install the [**AWS CLI**][AWS CLI] to let terraform interact with AWS. Depending on the deployments you run, you may also need to install [**kubectl**][kubectl] and [**postgres**][postgres].

#### Cloud Credentials

You will need to configure your AWS CLI to have admin access to your account, that way terraform can deploy the necessary infrastructure within your account. There are a few ways to accomplish this, but the easiest way is to create a new IAM user, attach the "arn:aws:iam::aws:policy/AdministratorAccess" to the user and then create a access key/id. Once you have the key and secret you will need to create a file at ~/.aws/credentials and add the following.

```bash
[default]
aws_access_key_id=<access key>
aws_secret_access_key=<secret key>
```

This access can be verified by running the following.

```bash
aws sts get-caller-identity
```

If it returns the username of your user, then your credentials are properly configured.


### Deployment

#### Prepare the deployment

To run terraform directly from the gen3-terraform repo you'll need to start by navigating to the directory of the module you want to use. We recommend using the terraform 1.0 [**commons module**][terraform commons module]. This will provision all the necessary config for a production gen3 instance. If you just want to create a more basic development cluster you can use [**this module**][terraform generic commons] instead.

Once you're in the correct directory, you'll want to make a couple supplemental files to tell terraform how to store the information about the state of your deployment. Create a provider.tf file to tell terraform which cloud we are using.

```bash
provider "aws" {}
```

Next create a backend.tf file, to tell terraform where to store the state file in s3.

```bash
terraform {
  backend "s3" {
    bucket = "s3 bucket name"
    encrypt = "true"
    key = "directory in bucket/terraform.tfstate"
    region = "us-east-1"
  }
}
```

Next take a look at the variables.tf file to see the possible variables you can change. To set the variables you can edit the default values in this file, or more ideally, you can create a config.tfvars file which will set the values for the variables. The file will look like this.

```bash
vpc_name="your commons name"
aws_region="us-east-1"
...
```

Once that is all setup you can proceed to running terraform.

#### Running terraform

Terraform will run in 2 parts, an initial plan and then an apply. This allows you to see the changes to your infrastructure to prevent unwanted changes that may affect the uptime of your application. Initially it should show only additions, but as you perform maintenance you will likely want to look at the plan more closely to ensure important resources are not deleted or modified.

To create a terraform plan, you can run the following.

```bash
terraform plan -var-file config.tfvars
```

Terraform should automatically pull in all the configuration from any files with a .tf extension in the current directory, as well as all references to the modules referenced in those files. The -var-file flag says to use the variables within the config.tfvars as variables within the module. After running this you should see a plan with a few hundred resources being added to your account.

The next step is to apply these changes if you're happy with them. To do that you can run a similar command, but change plan to apply.

```bash
terraform apply -var-file config.tfvars
```

It will ask you if you want to commit these changes and if you approve them then terraform will run for a while and create the resources.


#### Note

Terraform may time out creating resources or run into errors. If it does, it can be normal due to long provisioning processes and race conditions. If you see errors run apply a couple more times and if the errors persist, reach out over our community slack channel ffor assistance.


### Maintenance

#### Changing Infrastructure

The steps for performing maintenance are similar to deployment. You will need to access the cloned repo and go to the directory where you ran terraform. This will contain all the configuration you setup as well as a reference to your state file. If you don't have this, you can always recreate it from scratch and as long as your state file still exists in the S3 bucket you configured, everything will work as normal.

Once you are in the properly prepped repo, you can make a change to the config.tfvars file, for example changing eks_version from 1.24 to 1.25 to ugrade EKS. After you make that change run a plan, although this time you will want to check the plan more carefully to make sure only the change you intend to make is happening, and run an apply.

#### Destroying Your Infrastructure

To destroy your infrastructure you can run the exact same commands as the plan and apply, only you will add a --destroy flag to the end.

```bash
terraform plan -var-file config.tfvars --destroy
terraform apply -var-file config.tfvars --destroy
```

This will let you see everything that will be destroyed and once you apply the change the destruction will commence.


## Running Terraform as a Module


### Prerequisites

#### Downloads

You will need to follow the process outlined in the [**Terraform Getting Started**][Terraform prereqs] page to download terraform. Once you have that downloaded you will need to clone our [**gen3-terraform repo**][terraform commons module]. You will also need to install the [**AWS CLI**][AWS CLI] to let terraform interact with AWS. Depending on the deployments you run, you may also need to install [**kubectl**][kubectl] and [**postgres**][postgres].

#### Cloud Credentials

You will need to configure your AWS CLI to have admin access to your account, that way terraform can deploy the necessary infrastructure within your account. There are a few ways to accomplish this, but the easiest way is to create a new IAM user, attach the "arn:aws:iam::aws:policy/AdministratorAccess" to the user and then create a access key/id. Once you have the key and secret you will need to create a file at ~/.aws/credentials and add the following.

```bash
[default]
aws_access_key_id=<access key>
aws_secret_access_key=<secret key>
```

This access can be verified by running the following.

```bash
aws sts get-caller-identity
```

If it returns the username of your user, then your credentials are properly configured.

### Deployment

#### Prepare the deployment

To run terraform by referencing our modules from your own you'll need to start by creating a terraform repo, or utilizing one you already have. We recommend using the terraform 1.0 [**commons module**][terraform commons module]. This will provision all the necessary config for a production gen3 instance. If you just want to create a more basic development cluster you can use [**this module**][terraform generic commons] instead.

Once you decide the module you want to use you'll want to create a .tf file that references our module, making sure to include the reference to the github repo as well as the variables you'll be passing into the module. Since you will likely want to use the module as is, you will likely want to pass in every variable. It should look similar to the following.

```bash
provider "aws" {}

terraform {
  backend "s3" {
    bucket = "s3 bucket"
    encrypt = "true"
    key = "directory in bucket/terraform.tfstate"
    region = "us-east-1"
  }
}


module "commons" {
  source = "git::github.com/uc-cdis/gen3-terraform.git//tf_files-1.0/aws/commons?ref=master"

  vpc_name=var.vpc_name
  iam_role_name=var.iam_role_name
  vpc_cidr_block=var.vpc_cidr_block
  vpc_flow_logs=var.vpc_flow_logs
  vpc_flow_traffic=var.vpc_flow_traffic
  aws_region=var.aws_region
  aws_cert_name=var.aws_cert_name
  csoc_account_id=var.csoc_account_id
  peering_cidr=var.peering_cidr
  fence_db_size=var.fence_db_size
  sheepdog_db_size=var.sheepdog_db_size
  indexd_db_size=var.indexd_db_size
  db_password_fence=var.db_password_fence
  db_password_peregrine=var.db_password_peregrine
  db_password_sheepdog=var.db_password_sheepdog
  db_password_indexd=var.db_password_indexd
  portal_app=var.portal_app
  fence_snapshot=var.fence_snapshot
  peregrine_snapshot=var.peregrine_snapshot
  sheepdog_snapshot=var.sheepdog_snapshot
  indexd_snapshot=var.indexd_snapshot
  fence_db_instance=var.fence_db_instance
  sheepdog_db_instance=var.sheepdog_db_instance
  indexd_db_instance=var.indexd_db_instance
  hostname=var.hostname
  kube_ssh_key=var.kube_ssh_key
  kube_additional_keys=var.kube_additional_keys
  hmac_encryption_key=var.hmac_encryption_key
  sheepdog_secret_key=var.sheepdog_secret_key
  sheepdog_indexd_password=var.sheepdog_indexd_password
  sheepdog_oauth2_client_id=var.sheepdog_oauth2_client_id
  config_folder=var.config_folder
  sheepdog_oauth2_client_secret=var.sheepdog_oauth2_client_secret
  ami_account_id=var.ami_account_id
  squid_image_search_criteria=var.squid_image_search_criteria
  peering_vpc_id=var.peering_vpc_id
  squid-nlb-endpointservice-name=var.squid-nlb-endpointservice-name
  slack_webhook=var.slack_webhook
  secondary_slack_webhook=var.secondary_slack_webhook
  alarm_threshold=var.alarm_threshold
  csoc_managed=var.csoc_managed
  csoc_peering=var.csoc_peering
  mailgun_api_key=var.mailgun_api_key
  mailgun_smtp_host=var.mailgun_smtp_host
  mailgun_api_url=var.mailgun_api_url
  fence_ha=var.fence_ha
  sheepdog_ha=var.sheepdog_ha
  indexd_ha=var.indexd_ha
  fence_maintenance_window=var.fence_maintenance_window
  sheepdog_maintenance_window=var.sheepdog_maintenance_window
  indexd_maintenance_window=var.indexd_maintenance_window
  fence_backup_retention_period=var.fence_backup_retention_period
  sheepdog_backup_retention_period=var.sheepdog_backup_retention_period
  indexd_backup_retention_period=var.indexd_backup_retention_period
  fence_backup_window=var.fence_backup_window
  sheepdog_backup_window=var.sheepdog_backup_window
  indexd_backup_window=var.indexd_backup_window
  engine_version=var.engine_version
  fence_auto_minor_version_upgrade=var.fence_auto_minor_version_upgrade
  indexd_auto_minor_version_upgrade=var.indexd_auto_minor_version_upgrade
  sheepdog_auto_minor_version_upgrade=var.sheepdog_auto_minor_version_upgrade
  users_bucket_name=var.users_bucket_name
  fence_database_name=var.fence_database_name
  sheepdog_database_name=var.sheepdog_database_name
  indexd_database_name=var.indexd_database_name
  fence_db_username=var.fence_db_username
  sheepdog_db_username=var.sheepdog_db_username
  indexd_db_username=var.indexd_db_username
  fence_allow_major_version_upgrade=var.fence_allow_major_version_upgrade
  sheepdog_allow_major_version_upgrade=var.sheepdog_allow_major_version_upgrade
  indexd_allow_major_version_upgrade=var.indexd_allow_major_version_upgrade
  ha-squid_instance_type=var.ha-squid_instance_type
  ha-squid_instance_drive_size=var.ha-squid_instance_drive_size
  deploy_single_proxy=var.deploy_single_proxy
  ha-squid_bootstrap_script=var.ha-squid_bootstrap_script
  ha-squid_extra_vars=var.ha-squid_extra_vars
  branch=var.branch
  fence-bot_bucket_access_arns=var.fence-bot_bucket_access_arns
  deploy_ha_squid=var.deploy_ha_squid
  ha-squid_cluster_desired_capasity=var.ha-squid_cluster_desired_capasity
  ha-squid_cluster_min_size=var.ha-squid_cluster_min_size
  ha-squid_cluster_max_size=var.ha-squid_cluster_max_size
  deploy_sheepdog_db=var.deploy_sheepdog_db
  deploy_fence_db=var.deploy_fence_db
  deploy_indexd_db=var.deploy_indexd_db
  single_squid_instance_type=var.single_squid_instance_type
  network_expansion=var.network_expansion
  rds_instance_storage_encrypted=var.rds_instance_storage_encrypted
  fence_max_allocated_storage=var.fence_max_allocated_storage
  sheepdog_max_allocated_storage=var.sheepdog_max_allocated_storage
  indexd_max_allocated_storage=var.indexd_max_allocated_storage
  activation_id=var.activation_id
  customer_id=var.customer_id
  fips=var.fips
  ignore_fence_changes=var.ignore_fence_changes
  ignore_sheepdog_changes=var.ignore_sheepdog_changes
  ignore_indexd_changes=var.ignore_indexd_changes
  prevent_fence_destroy=var.prevent_fence_destroy
  prevent_sheepdog_destroy=var.prevent_sheepdog_destroy
  prevent_indexd_destroy=var.prevent_indexd_destroy
  deploy_alarms=var.deploy_alarms
  ec2_keyname=var.ec2_keyname
  instance_type=var.instance_type
  jupyter_instance_type=var.jupyter_instance_type
  workflow_instance_type=var.workflow_instance_type
  secondary_cidr_block=var.secondary_cidr_block
  users_policy=var.users_policy
  worker_drive_size=var.worker_drive_size
  eks_version=var.eks_version
  workers_subnet_size=var.workers_subnet_size
  bootstrap_script=var.bootstrap_script
  jupyter_bootstrap_script=var.jupyter_bootstrap_script
  kernel=var.kernel
  jupyter_worker_drive_size=var.jupyter_worker_drive_size
  workflow_bootstrap_script=var.workflow_bootstrap_script
  workflow_worker_drive_size=var.workflow_worker_drive_size
  cidrs_to_route_to_gw=var.cidrs_to_route_to_gw
  organization_name=var.organization_name
  jupyter_asg_desired_capacity=var.jupyter_asg_desired_capacity
  jupyter_asg_max_size=var.jupyter_asg_max_size
  jupyter_asg_min_size=var.jupyter_asg_min_size
  workflow_asg_desired_capacity=var.workflow_asg_desired_capacity
  workflow_asg_max_size=var.workflow_asg_max_size
  workflow_asg_min_size=var.workflow_asg_min_size
  iam-serviceaccount=var.iam-serviceaccount
  domain_test=var.domain_test
  deploy_workflow=var.deploy_workflow
  secondary_availability_zones=var.secondary_availability_zones
  deploy_jupyter=var.deploy_jupyter
  dual_proxy=var.dual_proxy
  single_az_for_jupyter=var.single_az_for_jupyter
  oidc_eks_thumbprint=var.oidc_eks_thumbprint
  sns_topic_arn=var.sns_topic_arn
  fips_ami_kms=var.fips_ami_kms
  fips_enabled_ami=var.fips_enabled_ami
  availability_zones=var.availability_zones
  deploy_eks=var.deploy_eks
  deploy_es=var.deploy_es
  ebs_volume_size_gb=var.ebs_volume_size_gb
  encryption=var.encryption
  es_instance_type=var.es_instance_type
  es_instance_count=var.es_instance_count
  es_version=var.es_version
  es_linked_role=var.es_linked_role
  cluster_identifier=var.cluster_identifier
  cluster_instance_identifier=var.cluster_instance_identifier
  cluster_instance_class=var.cluster_instance_class
  cluster_engine=var.cluster_engine
  cluster_engine_version=var.cluster_engine_version
  master_username=var.master_username
  storage_encrypted=var.storage_encrypted
  apply_immediate=var.apply_immediate
  engine_mode=var.engine_mode
  serverlessv2_scaling_min_capacity=var.serverlessv2_scaling_min_capacity
  serverlessv2_scaling_max_capacity=var.serverlessv2_scaling_max_capacity
  skip_final_snapshot=var.skip_final_snapshot
  final_snapshot_identifier=var.final_snapshot_identifier
  backup_retention_period=var.backup_retention_period
  preferred_backup_window=var.preferred_backup_window
  password_length=var.password_length
  deploy_aurora=var.deploy_aurora
  deploy_rds=var.deploy_rds
  use_asg=var.use_asg
  use_karpenter=var.use_karpenter
  karpenter_version=var.karpenter_version
  deploy_cloud_trail=var.deploy_cloud_trail
  send_logs_to_csoc=var.send_logs_to_csoc
  route_table_name=var.route_table_name
  eks_public_access=var.eks_public_access
  deploy_gen3=var.deploy_gen3
  ambassador_enabled=var.ambassador_enabled
  arborist_enabled=var.arborist_enabled
  argo_enabled=var.argo_enabled
  audit_enabled=var.audit_enabled
  aws-es-proxy_enabled=var.aws-es-proxy_enabled
  dbgap_enabled=var.dbgap_enabled
  dd_enabled=var.dd_enabled
  dictionary_url=var.dictionary_url
  dispatcher_job_number=var.dispatcher_job_number
  fence_enabled=var.fence_enabled
  guppy_enabled=var.guppy_enabled
  hatchery_enabled=var.hatchery_enabled
  indexd_enabled=var.indexd_enabled
  indexd_prefix=var.indexd_prefix
  ingress_enabled=var.ingress_enabled
  manifestservice_enabled=var.manifestservice_enabled
  metadata_enabled=var.metadata_enabled
  netpolicy_enabled=var.netpolicy_enabled
  peregrine_enabled=var.peregrine_enabled
  pidgin_enabled=var.pidgin_enabled
  portal_enabled=var.portal_enabled
  public_datasets=var.public_datasets
  requestor_enabled=var.requestor_enabled
  revproxy_arn=var.revproxy_arn
  revproxy_enabled=var.revproxy_enabled
  sheepdog_enabled=var.sheepdog_enabled
  slack_send_dbgap=var.slack_send_dbgap
  ssjdispatcher_enabled=var.ssjdispatcher_enabled
  tier_access_level=var.tier_access_level
  tier_access_limit=var.tier_access_limit
  usersync_enabled=var.usersync_enabled
  usersync_schedule=var.usersync_schedule
  useryaml_s3_path=var.useryaml_s3_path
  wts_enabled=var.wts_enabled
  fence_config_path=var.fence_config_path
  useryaml_path=var.useryaml_path
  gitops_path=var.gitops_path
  google_client_id=var.google_client_id
  google_client_secret=var.google_client_secret
  fence_access_key=var.fence_access_key
  fence_secret_key=var.fence_secret_key
  upload_bucket=var.upload_bucket
  namespace=var.namespace
  secrets_manager_enabled=var.secrets_manager_enabled
  ci_run=var.ci_run
}
```

Next you'll need to define the variables you just passed into our module, since this is technically a new terraform module. So you'll need to make a variables.tf file that should be an exact clone of the variables.tf file of our variables.tf file. If you are adding this to an existing module then you can just append our variables to your current file.

Once that is all setup you can proceed to running terraform.

#### Running terraform

Terraform will run in 2 parts, an initial plan and then an apply. This allows you to see the changes to your infrastructure to prevent unwanted changes that may affect the uptime of your application. Initially it should show only additions, but as you perform maintenance you will likely want to look at the plan more closely to ensure important resources are not deleted or modified.

To create a terraform plan, you can run the following.

```bash
terraform plan -var-file config.tfvars
```

Terraform should automatically pull in all the configuration from any files with a .tf extension in the current directory, as well as all references to the modules referenced in those files. The -var-file flag says to use the variables within the config.tfvars as variables within the module. After running this you should see a plan with a few hundred resources being added to your account.

The next step is to apply these changes if you're happy with them. To do that you can run a similar command, but change plan to apply.

```bash
terraform apply -var-file config.tfvars
```

It will ask you if you want to commit these changes and if you approve them then terraform will run for a while and create the resources.


#### Note

Terraform may time out creating resources or run into errors. If it does, it can be normal due to long provisioning processes and race conditions. If you see errors run apply a couple more times and if the errors persist, reach out over our community slack channel for assistance.


### Maintenance

#### Changing Infrastructure

The steps for performing maintenance are similar to deployment. You will need to access the cloned repo and go to the directory where you ran terraform. This will contain all the configuration you setup as well as a reference to your state file. If you don't have this, you can always recreate it from scratch and as long as your state file still exists in the S3 bucket you configured, everything will work as normal.

Once you are in the properly prepped repo, you can make a change to the config.tfvars file, for example changing eks_version from 1.24 to 1.25 to ugrade EKS. After you make that change run a plan, although this time you will want to check the plan more carefully to make sure only the change you intend to make is happening, and run an apply.

#### Destroying Your Infrastructure

To destroy your infrastructure you can run the exact same commands as the plan and apply, only you will add a --destroy flag to the end.

```bash
terraform plan -var-file config.tfvars --destroy
terraform apply -var-file config.tfvars --destroy
```

This will let you see everything that will be destroyed and once you apply the change the destruction will commence.


<!-- overview -->
[Gen3 Terraform]: https://github.com/uc-cdis/gen3-terraform

<!-- Running Terraform from Gen3-Terraform -->
[Terraform prereqs]: https://github.com/uc-cdis/gen3-terraform/tree/master?tab=readme-ov-file#prerequisites
[AWS CLI]: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
[kubectl]: https://kubernetes.io/docs/tasks/tools/
[postgres]: https://www.postgresql.org/download/
[terraform commons module]: https://github.com/uc-cdis/gen3-terraform/tree/master/tf_files/aws/commons
[terraform generic commons]: https://github.com/uc-cdis/gen3-terraform/tree/master/tf_files/aws/generic_commons

<!-- Running Terraform as a Module -->
