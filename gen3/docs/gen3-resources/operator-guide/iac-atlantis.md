# Atlantis

[Atlantis][Atlantis] is a tool for running Terraform Workflows with ease.  It allows for collaborting on Terraform and enables developers and operators to run terraform plan and apply directly from Terraform pull requests. Atlantis then comments back on the pull request with the output.


## Prerequisites

### Downloads

You will need a working kubernetes cluster and to follow the steps outlined in the [Atlantis documentation][Atlantis] to cofigure it to work with a github repo and your cloud.

After that is done, you may also need to install supplemental tools within the pod to have it work with our terraform modules. The best way to do this is to fork their image and add in a step to install any supplemental tools. The likely ones you will need to install are helm, kubectl, aws and postgres


## Usage

### How to use Atlantis

Atlantis is a little different than the other management processes, as you will need to use one of those, but Atlantis can add the support to run terraform in a CI/CD pipeline. This is useful if you want to automate the deployment and maintenance of your gen3 instances. This option is recommended if you want to collaborate with others on the deployment and maintenance of your gen3 instances, as it allows you to easily review and approve changes to your infrastructure through github pr's. There are a lot of possible ways to use Atlantis and the specific implementation you decide on will depend on your needs, but we will go over how to use it once you have it setup.

### Making changes

Once you have an Atlantis setup configured to your specific needs, you should be able to start making changes from pull requests. The way Atlantis works is it will watch your configured github repo for pull requests. Once it see's one it will run a specified workflow, which generally means it will plan your change. Depending on the configuration you have setup, it will then either comment on the pull request with the plan, or it will plan and apply if the plan is successful. We recommend setting it up to comment on the pull request with the plan, and then you can review the plan and approve it if it looks good. Once you approve the plan, Atlantis will apply the changes and comment on the pull request with the results. If you have it setup to run a plan and apply, then it will just comment on the pull request with the results of the apply.



<!-- Links -->
[Atlantis]: https://www.runatlantis.io/docs/installation-guide.html
