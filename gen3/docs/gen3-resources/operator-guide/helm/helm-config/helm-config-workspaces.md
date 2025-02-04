# Configure Workspaces for Helm Deployment

Gen3 workspaces are secure data analysis environments in the cloud that can access data objects and metadata from data resources like the data commons or other external resources.

By default, Gen3 Workspaces include Jupyter notebooks and RStudio, but can be configured to host many other applications, including analysis workflows, data processing pipelines, or data visualization apps.

Gen3 workspaces use the Ambassador, Hatchery, and Manifestservice services to create and run the workspace in a Gen3 data commons.

## Ambassador

### What Does it Do

Ambassador is an envoy proxy. We use this service to proxy traffic toward our workspaces, Hatchery and Jupyter containers.

*Note: Currently, Ambassador is only necessary if there is a Hatchery deployment, as this is used as an envoy proxy primarily for workspaces. This may change in the future.*

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default Ambassador values in the values.yaml here](https://github.com/uc-cdis/gen3-helm/tree/master/helm/ambassador/values.yaml).

### How to configure it

For a full set of configuration see the [Helm README.md for Ambassador](https://github.com/uc-cdis/gen3-helm/tree/master/helm/ambassador) or read the [Ambassador values.yaml](https://github.com/uc-cdis/gen3-helm/tree/master/helm/ambassador/values.yaml) directly.

Example configuration using gen3 umbrella chart:

```
ambassador:
  # Whether or not to deploy the service or not
  enabled: true

  # What image/ tag to pull
  image:
    repository: quay.io/datawire/ambassador
    tag: "1.4.2"
    pullPolicy: Always
```

## Hatchery

### What Does it Do

Hatchery is used to create workspaces. It contains information about workspaces images and resources set around those images to run.

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default Hatchery values here](https://github.com/uc-cdis/gen3-helm/tree/master/helm/hatchery/values.yaml).

### How to configure it

For a full set of configuration see the [Helm README.md for Hatchery](https://github.com/uc-cdis/gen3-helm/tree/master/helm/hatchery/README.md) or read the [Hatchery values.yaml](https://github.com/uc-cdis/gen3-helm/tree/master/helm/hatchery/values.yaml) directly.

```
hatchery:
  enabled: true
  image:
    repository:
    tag:


  # -- (map) Hatchery sidcar container configuration.
  hatchery:
    sidecarContainer:
      cpu-limit: '0.1'
      memory-limit: 256Mi
      image: quay.io/cdis/ecs-ws-sidecar:master

      env:
        NAMESPACE: "{{ .Release.Namespace }}"
        HOSTNAME: "{{ .Values.global.hostname }}"

      args: []

      command:
      - "/bin/bash"
      - "./sidecar.sh"

      lifecycle-pre-stop:
      - su
      - "-c"
      - echo test
      - "-s"
      - "/bin/sh"
      - root

    containers:
      - target-port: 8888
        cpu-limit: '1.0'
        memory-limit: 2Gi
        name: "(Tutorials) Example Analysis Jupyter Lab Notebooks"
        image: quay.io/cdis/heal-notebooks:combined_tutorials__latest
        env:
          FRAME_ANCESTORS: https://{{ .Values.global.hostname }}
        args:
        - "--NotebookApp.base_url=/lw-workspace/proxy/"
        - "--NotebookApp.default_url=/lab"
        - "--NotebookApp.password=''"
        - "--NotebookApp.token=''"
        - "--NotebookApp.shutdown_no_activity_timeout=5400"
        - "--NotebookApp.quit_button=False"
        command:
        - start-notebook.sh
        path-rewrite: "/lw-workspace/proxy/"
        use-tls: 'false'
        ready-probe: "/lw-workspace/proxy/"
        lifecycle-post-start:
        - "/bin/sh"
        - "-c"
        - export IAM=`whoami`; rm -rf /home/$IAM/pd/dockerHome; rm -rf /home/$IAM/pd/lost+found;
          ln -s /data /home/$IAM/pd/; true
        user-uid: 1000
        fs-gid: 100
        user-volume-location: "/home/jovyan/pd"
        gen3-volume-location: "/home/jovyan/.gen3"
```

## Workspace Token Service (wts)

### What Does it Do

WTS acts as an OIDC client which acts on behalf of users to request refresh tokens from Fence. This happens when a user logs into a workspace from the browser. WTS then stores the refresh token for that user, and manages access tokens and refresh tokens for workers that belong to specific users in the workspace.

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default WTS values here](https://github.com/uc-cdis/gen3-helm/tree/master/helm/wts/values.yaml).

### How to configure it

Check out the [quick-start guide for WTS with Helm](https://github.com/uc-cdis/workspace-token-service/blob/master/docs/img/quickstart_helm.md).

For a full set of configuration see the [Helm README.md for WTS](https://github.com/uc-cdis/gen3-helm/tree/master/helm/wts/README.md) or read the [WTS values.yaml](https://github.com/uc-cdis/gen3-helm/tree/master/helm/wts/values.yaml) directly.


## Manifestservice

### What Does it Do

The manifestservice is used by the workspaces to mount files to a workspace. Workspace pods get setup with a sidecar container which will mount files to the data directory. This is used so that users can access files directly on the workspace container. The files pulled are defined by manifests, created through the export to workspace button in the explorer page. These manifests live in an s3 bucket which the manifestservice can query.

### Default settings

If you deploy Helm without customizing any configuration, you can see the [default Manifestservice values in the values.yaml here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/manifestservice/values.yaml).

### How to configure it

For a full set of configuration see the [Helm README.md for Manifestservice](https://github.com/uc-cdis/gen3-helm/blob/master/helm/manifestservice/README.md) or read the [Manifestservice values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/helm/manifestservice/values.yaml) directly.

```
manifestservice:
  enabled: true

  manifestserviceG3auto:
    hostname: testinstall
    # -- (string) Bucket for the manifestservice to read and write to.
    bucketName: testbucket
    # -- (string) Directory name to use within the s3 bucket.
    prefix: test
    # -- (string) AWS access key.
    awsaccesskey: ""
    # -- (string) AWS secret access key.
    awssecretkey: ""
```
