# Configure AuthN/AuthZ for Helm Deployment

Authentication (AuthN) and authorization (AuthZ) work together as part of identity and access management (IAM). AuthN is controlled by Fence - it relates to confirming the identity of the user (often through signle sign-on). AuthZ is controlled by Arborist - it determines what an authenticated user can see and do.

## Fence (AuthZ)

### What Does it Do

Fence handles authentication, and is a core service for Gen3 data commons and any other type of Gen3 deployment. It is a required service for a commons to run at all, and will handle authentication on the `/login` endpoint as well as creating presigned url's in the presigned-url-fence pods.

For full functionality in a Gen3 instance, Fence depends on a [configured user.yaml](#how-to-configure-the-useryaml) unless you [enable mock authorization](#mock-authorization-for-development-only).

### Default settings for Fence and user.yaml

If you deploy Helm without customizing any configuration, you can see the [default Fence values here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/fence/values.yaml).

A [default user.yaml is provided in the Fence values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/helm/fence/values.yaml#L517-L726). However, it is configured with stand-in information to demonstrate where to add your real email and project name values, so it cannot work as a user.yaml without further configuration because some information is fake. For development work, you can configure Fence to use mock authorization to bypass the need for configuring the user.yaml for

### How to configure Fence

For the full set of configuration options, see the [Helm README.md for Fence](https://github.com/uc-cdis/gen3-helm/tree/master/helm/fence)

```
fence:
  # Whether or not to deploy the service or not
  enabled: true

  # What image/ tag to pull
  image:
    tag:
    repository:

  # FENCE_CONFIG
  FENCE_CONFIG:
    OPENID_CONNECT:
      google:
        client_id: "insert.google.client_id.here"
        client_secret: "insert.google.client_secret.here"

  # -- (string) USER YAML. Passed in as a multiline string.
  USER_YAML: |
    <the contents of your user.yaml here>
```

You need to ensure a proper working fence-config file. Fence is highly configurable and a lot of configuration is commons specific, but some important fields to configure are described in the next section.

#### Important Fence Config fields

**`BASE_URL`:** This should be (the url of the commons)/user.

**`DB`:** This should contain the psql connection string, which should contain the correct database, user, password and hostname.

**`OPENID_CONNECT`:** This is where different IdP's can be configured. To be able to leverage an IdP as a login option you need to add the client ID's/secrets and any other necesary config to the predefined blocks.

**`ENABLED_IDENTITY_PROVIDERS/LOGIN_OPTIONS`:** Use one of these blocks to enable/configure buttons for logging into the IdP's defined in the `OPENID_CONNECT` block.

**`DEFAULT_LOGIN_IDP`/`DEFAULT_LOGIN_URL`:** These blocks will define the default login option, which will be used by most external oidc clients.

**`dbGaP`:** This will be used to connect to an sftp server which will contain telemetry files for usersync. It is necessary for setting up authorizations outside of the useryaml.

**`AWS_CREDENTIALS`/`S3_BUCKETS/DATA_UPLOAD_BUCKET`:** The AWS_CREDENTIALS block will define credentials for service accounts used to access s3 buckets. The s3 buckets are defined in the S3_BUCKETS block, which will reference a credential in the `AWS_CREDENTIALS` block. The `DATA_UPLOAD_BUCKET` block defines the data upload bucket, which is the bucket used in the data upload flow, to upload files to a commons.

**`CIRRUS_CFG`:** If Google buckets are used, you must configure this block. It is used to set up the Google bucket workflow, which essentially creates Google users and Google bucket access groups, which get filled with users and added to bucket policies to allow implicit access to users.

For more information about Fence config options, see [the config-default.yaml in the Fence repo](https://github.com/uc-cdis/fence/blob/master/fence/config-default.yaml).

You can see examples of Fence configuration overriding defaults in context in the following [example Gen3 values.yamls](https://github.com/uc-cdis/gen3-helm/tree/master/examples):

* [aws_dev_values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/examples/aws_dev_values.yaml)
* [gke_dev_values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/examples/gke_dev_values.yaml)
* [gke_values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/examples/gke_values.yaml)

### How to configure the user.yaml

A user.yaml will control access to your data commons. To see how to construct a user.yaml properly:

[https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/user.yaml_guide.md](https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/user.yaml_guide.md)

### Fence Pods

Fence is split into 2 deployments.

* There is the regular fence deployment which handles commons authentication.
* We also split the presigned url feature of fence into a seperate deployment, the presigned-url-fence deployment.

They will both get setup and deployed with a Gen3 installation.

### Troubleshooting Fence

There are some commons sql queries that can be [found here](https://github.com/uc-cdis/cdis-wiki/blob/master/dev/gen3-sql-queries.md#fence-database). *Note: this link is only visible to CTDS employees*

## Mock authorization (for development only)

Mock authorization will bypass OIDC login and login a user with username "test". To deploy an instance that allows a mock authorization, add these Arborist and Fence config sections to the Gen3 values.yaml

!!! warning

     Mock authorization should only be configured for development or testing purposes - do not use this in production.

```
global:
hostname: [your hostname here]

    tls:
    [key and cert info]

    # Deploy postgres/elasticsearch in same deployment for development purposes.
    dev: true

arborist:
    enabled: true

fence:
    FENCE_CONFIG:
        # if true, will bypass OIDC login, and login a user with username "test"
        # WARNING: DO NOT ENABLE IN PRODUCTION (for testing purposes only)
        MOCK_AUTH: true
```

## Example: Google login

To deploy an instance that will allow you to log in with Google, see here:
[https://github.com/uc-cdis/gen3-helm?tab=readme-ov-file#google-login-generation](https://github.com/uc-cdis/gen3-helm?tab=readme-ov-file#google-login-generation)

## Setting up OIDC clients

OIDC (OpenID Connect) clients allow applications to authenticate with Fence. This setup is often necessary for external users who want to integrate their applications with Gen3. For each application, you'll need to create a unique OIDC client, which will provide a client_id and client_secret for the application to use.

Once the client is created, share the client_id and client_secret with the application owner so they can configure their application to authenticate with Fence. To create these clients you will need to exec into a fence container and [run the following commands](https://github.com/uc-cdis/fence/blob/master/docs/additional_documentation/setup.md#register-oauth-client).

## Arborist (AuthN)

### What Does Arborist Do

Arborist is the authorization service. It works with Fence to assign authorizations to a user based on their authentication information. Information around user authorizations are set within a useryaml, or telemetry file for dbgap authorized users, and put into the arborist db during usersync.

### Default settings for Arborist

If you deploy Helm without customizing any configuration, you can see the [default Arborist values here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/arborist/values.yaml).

### How to configure Arborist

For the full set of configuration options, see the [Helm README.md for Arborist](https://github.com/uc-cdis/gen3-helm/tree/master/helm/arborist)

Some common configuration options include:

**Postgres configuration**

```
# -- (map) To configure postgresql subchart
# Persistence is disabled by default
postgresql:
  primary:
    persistence:
      # -- (bool) Option to persist the dbs data.
      enabled: true
```

You can see examples of this configuration in context in the following [example Gen3 values.yamls](https://github.com/uc-cdis/gen3-helm/tree/master/examples):

* [aws_dev_values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/examples/aws_dev_values.yaml)
* [gke_dev_values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/examples/gke_dev_values.yaml)
* [gke_values.yaml](https://github.com/uc-cdis/gen3-helm/blob/master/examples/gke_values.yaml)

**Image repo/ tag**

```
arborist:
  enabled: true

  # What image/ tag to pull
  image:
    tag:
    repository:
```

Common Arborist database SQL queries can be [found here](https://github.com/uc-cdis/cdis-wiki/blob/master/dev/gen3-sql-queries.md#arborist-database). *Note: this link is only visible to CTDS employees*

## Relevant AuthN/AuthZ Tutorials

See the following tutorials for additional information relevant to AuthN/AuthZ.

* [Fence Usersync CronJob](../../tutorial_fence_usersync_job.md)
* [AWS IAM Global User](../../tutorial_global_IAM_helm_user.md)
