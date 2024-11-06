# Databases in Gen3 Helm charts

This document describes how databases are provisioned and used in Gen3 when deploying with Helm charts.

We highly recommend using a managed PostgreSQL service like AWS RDS/Aurora, or managing PostgreSQL outside of Helm, for production Gen3 deployments.

The bundled PostgreSQL used for development is deployed with the Bitnami chart: [https://bitnami.com/stack/postgresql/helm](https://bitnami.com/stack/postgresql/helm)

## Database credentials

Every service requiring a PostgreSQL database has credentials stored in a Kubernetes secret.

Example (secret values base64 decoded):

```yaml

apiVersion: v1
kind: Secret
data:
  database: fence_gen3
  dbcreated: true
  host: gen3-postgresql
  password: example_pass
  port: 5432
  username: fence_gen3
```

Each service consumes this secret and mounts the values as environment variables to access the database.

For production, provide PostgreSQL credentials via these values:

```
global:
  postgres:
    dbCreate: true
    master:
      host: insert.postgres.hostname.here
      username: postgres
      password: <Insert.Password.Here>
      port: "5432"

fence:
  postgres:
    host: postgres.example.com
    username: fence
    port: 5432

peregrine:
  postgres:
    host: postgres.example.com
    username: peregrine
    port: 5432

sheepdog:
  postgres:
    host: postgres.example.com
    username: sheepdog
    port: 5432
```

These values can provision and configure databases for Gen3.


## Auto-generated passwords

If a per-service password is not specified, Helm will auto-generate a random password. For example:

```yaml

global:
  postgres:
    master:
      password: example_master_password

fence:
  postgres:
    host: postgres.example.com
    username: fence

peregrine:
  postgres:
    host: postgres.example.com
    username: peregrine
```

Helm will create a random password for Fence and Peregrine.

**Note:** The lookup function used to generate passwords does not work in ArgoCD. When using ArgoCD, you must explicitly define a password for each service.

## Automatic database creation through jobs

The `dbCreate` flag can be set globally or per service.

Setting `global.postgres.dbCreate: true` or `<service>.postgres.dbCreate: true` kicks off the database setup job for that service.

The setup job:

- Checks if the database exists
- Creates it if needed
- Grants privileges
- Updates `dbcreated: true` in the secret
- Services wait for this dbcreated flag before starting. - This ensures the database is ready before the service is started.

If the database setup job fails, it will not set `dbcreated: true` in the secret.

When a service starts up, it will look for this value in the secret. If dbcreated is not present or false, the service will fail to start and log an error that it cannot find dbcreated in the database secret.

This prevents services starting up before the database is ready and properly configured. The root cause of the failure can be investigated by checking the logs and status of the setup job.


<!--
## Database restoration. (BETA)
There is a job to restore dummy data for Postgres and Elasticsearch to speed up setting up ephemeral enviornments for testing purposes, and to avoid running expensive ETL jobs in CI to have a fully featured gen3 environment -->
