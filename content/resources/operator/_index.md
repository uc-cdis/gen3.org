---
identifier: operator
title: Gen3 - Set up Gen3
linktitle: /resources/operator
date: 2018-09-04T22:16:21-05:00
draft: true
---

{{% markdownwrapper %}}
# Running a Gen3 Data Commons

## 1. Docker-Compose

Docker-compose allows you to quickly run a Gen3 commons on a single computer or in a single VM in a matter of minutes. 

This option is suitable for those that wish to run a small data commons, experiment with the technology, or even do local development on the Gen3 services. Using this method does not get you the full suite of automation, and logging for Gen3 commons. 

We strongly recommend you start here for your first experience running the Gen3 platform.

[Gen3 Docker-Compose](https://github.com/uc-cdis/compose-services)

## 2. Cloud Automation

Cloud automation is how we deploy Gen3 data commons in production environments on Amazon Web Services, Google Cloud Platform, Microsoft Azure, and OpenStack environments. Cloud automation is fully featured supporting integrated logging, security, and compliance steps. With cloud automation, we utilize Kubernetes to orchetrate our services into a scalable environment that can be run in a cost efficient manner for many tens to thousands of users.

Cloud automation utilizes Terraform for repeatable infrastructure deployments onto the public clouds. Additionally, we have custom Gen3 specific tooling to help automate various steps in the Kubernetes deployment process such as rolling pod versions, and scaling up. 

Gen3 deployed using cloud automation relies on a number of supporting features to be in place currently. It is a work in progress to continue to ease the Gen3 deployment process for groups without existing supporting infrastructure. We welcome all comments, feature requests, and pull requests using GitHub issues or the [Gen3 community](https://forums.gen3.org).

[Gen3 Cloud Automation](https://github.com/uc-cdis/cloud-automation)

{{% /markdownwrapper %}}