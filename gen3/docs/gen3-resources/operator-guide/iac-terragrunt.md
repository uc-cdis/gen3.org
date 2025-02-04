# Terragrunt


Terragrunt is a way to deploy and manage Gen3 systems. It is a wrapper around the gen3-terraform repo, which contains the terraform modules used to deploy and manage gen3 commons.



Using a terragrunt repo allows you to deploy and manage multiple Gen3 commons at once, and it also allows you to set configuration in a heirarchical manner, having it inherited by all the commons, allowing you to perform standard maintenance across every instance with ease.


## Prerequisites


### Downloads

You will need to follow the process outlined in the [**Terraform Getting Started**][Terraform prereqs] page to download terraform. Once you have that downloaded you will need to clone our [**gen3-terraform repo**][Gen3 Terraform]. You will also need to install the [**AWS CLI**][AWS CLI] to let terraform interact with AWS. Depending on the deployments you run, you may also need to install [**kubectl**][kubectl] and [**postgres**][postgres]. Last you will need to install [**terragrunt**][terragrunt].

### Cloud Credentials

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



## Deployment

### Prepare the deployment

To run terragrunt you'll need to start by creating a terragrunt repo, or utilizing one you already have. We recommend using the terraform 1.0 [**commons module**][terraform commons module] module within your terragrunt repo. This will provision all the necessary config for a production gen3 instance. If you just want to create a more basic development cluster you can use [**this module**][terraform generic commons] instead.

If you decided to take the terragrunt approach then it's likely you have multiple instances of gen3 you plan on managing, otherwise we do not recommend using terragrunt as it will be overkill. With that in mind, the next step is to logically break down how you want your directory structure to look. We deploy commons within different AWS account, and can have multiple commons per account, depending on need, so our directory structure looks as follows

```
Cloud Provider -> Account Number -> Commons Instance(ie prod/staging) -> terraform module folder
```

However, if you have one account you run things out of then it could also look like this.

```
Commons Instance(Prod/Staging/Dev) -> terraform module folder
```

The actual breakdown doesn't matter as much, but it will help you with maintenance tasks due to how terragrunt runs. Terragrunt allows variables to be set at higher levels and cascade down. So if you want to deploy an EKS version change across each commons, you can set the variable at the root level and have it cascade down. Furthermore, if you want to split these up by Prod/Staging you can just as easily run an upgrade in staging first, then production by setting the variable in a config file within those directories respectively. The lower level variable declarations take precedence though, so if you hard code one of your commons to have a certain EKS version, then it will stay there even if you include the change in a higher level. This makes maintenance of many many commons easy, although if you don't have many, then it doesn't make much sense to use terragrunt, as terraform will suffice.

Once you decide on your directory structure you'll want to create terragrunt config files in each level of your hierarchy. These files should have a .hcl extension and look like the following.

```bash
inputs = merge(local.account_vars.inputs, {
  vpc_name         = local.vpc_name
  users_policy     = local.vpc_name
  es_instance_type = "t3.small.elasticsearch"
})

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  vpc_name       = "testvpc"
}
```

The important parts are as follows. First, the inputs section is what gets cascaded down into the final variables file. The merge section contains a reference to the local.account_vars.inputs, which if you look at the locals section references "read_terragrunt_config(find_in_parent_folders("account.hcl"))", which basically means it is pulling the config from a file in higher level called account.hcl. That file will look similar to this one, but have variables being set in the inputs section that you want to cascade down into the next file etc. You need to make sure the hcl file names are unique to avoid any weirdness, but with that set, you should be able to set most of your variables to cascase down into your actual terraform directory.

Once you are in the lowest level directory, the directory where you will add your terraform, you will make another .hcl file, but it will look like the following.

```bash

locals {
  # Load environment-wide variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  vpc_name = local.environment_vars.inputs.vpc_name

  account_number = local.environment_vars.locals.account_vars.locals.account_number
}

terraform {
  source = "git::github.com/uc-cdis/gen3-terraform.git//tf_files-1.0/aws/commons?ref=master"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {}
EOF
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = merge(local.environment_vars.inputs, {
  hostname="test.planx-pla.net"
  deploy_rds=true
  eks_version="1.24"
})


remote_state {
  backend = "s3"
  config = {
    bucket = "bucket name"
    encrypt = true
    key = "directory in bucket/terraform.tfstate"
    region = "your aws region"
  }
}
```

This should look somewhat similar to the setup within the [**running terraform as a module**](iac-terraform.md#running-terraform-as-a-module), but there are a few small changes. For one, we are setting the inputs section to merge in the variables from higher up in the hierarchy, and we have changed the syntax around setting a few other terraform blocks.

Once this is setup, you can do the same with any other commons deployments you have by setting up other directories with files that look like this. After all of your commons are defined in the repo, you can move on to running terragrunt.

### Running terragrunt

Terragrunt will run similar to terraform, in that it has a plan and apply phase. In fact it supports the exact same arguments as terraform, with a major exception, the run-all command. Terragrunt allows you to set run-all as the first argument, and any supported terrafrom command after that will run against every defined terrafrom module under the current directory in your repo. To put this more plainly, if you run the following

```bash
terragrunt run-all plan
```

from the root level of your repo, it will plan every terraform module defined. Whereas, if you run it from a specific instance of a commons it will only plan that one commons module. This should show why logically defining your directory structure at the beginning is so powerful. If you know the difference places you want to make changes in order, you can very easily move from directory to directory and make changes incrementally, against subsets of your different gen3 instances.

With that in mind, the commands to run changes are as follows

This will run a single plan
```bash
terragrunt plan
```

This will run a plan against all resources under the current directory
```bash
terragrunt run-all plan
```

This will run a single apply
```bash
terragrunt apply
```

This will run an apply against all resources under the current directory
```bash
terragrunt run-all apply
```


<!-- Links -->
[Terraform prereqs]: https://github.com/uc-cdis/gen3-terraform/tree/master?tab=readme-ov-file#prerequisites
[Gen3 Terraform]: https://github.com/uc-cdis/gen3-terraform
[AWS CLI]: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
[kubectl]: https://kubernetes.io/docs/tasks/tools/
[postgres]: https://www.postgresql.org/download/
[terragrunt]: https://terragrunt.gruntwork.io/docs/getting-started/install/
[terraform commons module]: https://github.com/uc-cdis/gen3-terraform/tree/master/tf_files/aws/commons
[terraform generic commons]: https://github.com/uc-cdis/gen3-terraform/tree/master/tf_files/aws/generic_commons
