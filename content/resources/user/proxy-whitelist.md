---
title: "Gen3 - Working with the Proxy and Whitelist"
date: 2018-09-18T15:11:58-05:00
linktitle: /resources/user
---

## Working with the proxy and whitelists
* * *

<h4> Working with the Proxy </h4>

To prevent unauthorized traffic, the Gen3 VPC utilizes a proxy.   If you are using one of the custom VMs setup, there is already a line in your .bashrc file to handle traffic requests.   

```
export http_proxy=http://cloud-proxy.internal.io:3128
export https_proxy=$http_proxy
```

Alternatively, if you have a different service or a tool that needs to call out, you can set the proxy with each command.  

```
https_proxy=https://cloud-proxy.internal.io:3128 aws s3 ls s3://gen3-data/ --profile <profilename>
```

<h4> Whitelists </h4>

Additionally, to aid Gen3 Commons security, tool installation from outside sources is managed through a whitelist.   If you have problems installing a tool you need for your work, contact <Gen3-support@datacommons.io> and with a list of any sites you might wish to install tools from.    After passing a security review,  these can be added to the whitelist to facilitate access.
