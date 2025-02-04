# Configure Revproxy for Helm Deployment

## Revproxy

### What Does it Do

Revproxy is a core service to a commons which handles networking within the Kubernetes cluster.

Note:
Revproxy is essentially an nginx container, which contains informtation about the endpoints within the cluster. There must be an endpoint set up for Revproxy to be able to send traffic to it and start normally. Because we have many services that may or may not be set up, we only configure Revproxy with the services that are deployed to a commons. The `kube-setup-revproxy` script will look at current deployments and add configuration files from  [here (in the ...)](https://github.com/uc-cdis/cloud-automation/tree/master/kube/services/revproxy/gen3.nginx.conf) to the pod. So, if a new service is added, you will need to run `kube-setup-revproxy` to set up the endpoint.

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default Revproxy values in the values.yaml here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/revproxy/values.yaml).

### How to configure it

For a full set of configuration see the [Helm README.md for Revproxy](https://github.com/uc-cdis/gen3-helm/blob/master/helm/revproxy/README.md) or read the [Revproxy values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/helm/revproxy/values.yaml) directly.
