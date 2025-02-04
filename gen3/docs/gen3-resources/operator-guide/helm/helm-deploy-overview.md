# Deployment Overview

1. **Install Helm**: Ensure you have Helm installed on your local machine. You can install Helm by following the instructions provided on the Helm website: [Helm Installation Guide](https://helm.sh/docs/intro/install/).

2. **Prepare a Kubernetes Cluster**: Make sure you have a Kubernetes cluster up and running with an Ingress Controller configured. You can use a cloud provider's managed Kubernetes service or set up your own Kubernetes cluster using tools like Kubernetes in Docker (KIND) or Minikube

    >
    Note: We do not recommend Rancher Desktop for deploying Helm; we have sometimes seen issues with PostgreSQL while using Rancher. Instead, we recommend KIND or Minikube, which are lightweight and appropriate for dev setup.
    >

3. **Database Services Configuration**:

      - Determine where you want to run the database services (Elasticsearch and PostgreSQL).
      - For a development environment, you can set `global.dev` to `true` in your configuration. In this mode, Gen3 will deploy these services with minimal persistence and resource consumption.
      - For non-development environments (such as production), it is recommended to run these services externally from the Gen3 Helm charts. You will need to configure these services separately.

4. **Prepare a `values.yaml` Configuration File**:

      - Create a `values.yaml` file to customize the Gen3 deployment. This file will contain various configuration settings for your Gen3 deployment.
      - Refer to the `Configuration services with Helm` section (see navigation menu on the left) for a full list of configurations for each Gen3 service. Customize the configuration according to your requirements.

5. **Prepare SSL Certificate**:

      - Obtain an SSL/TLS certificate for securing your Gen3 deployment. You can use a certificate authority (CA) or use Let's Encrypt with Certbot for free certificates.
      - Ensure you have a valid domain name for your Gen3 deployment.

        A certificate can be created using [certbot](https://certbot.eff.org). It will ask you to create a DNS TXT record to verify domain ownership.

        ```
        sudo certbot certonly --manual --preferred-challenges=dns -d fairtox.com
        ```

        Complete the DNS challenge, wait for DNS (1-5 min) and then click continue.

        Once you have the certificate, create a Kubernetes secret with it.

        ```
        kubectl create secret tls <secret-name> --cert=<path-to-certificate.pem> --key=<path-to-key.pem>
        ```

        We will use this secret later on in our deployment.

6. **Deployment with Helm**:

      - Deploy Gen3 using Helm. Use the following command, replacing `[RELEASE_NAME]` with your desired Helm release name and `[VALUES_FILE]` with the path to your `values.yaml` file:

      ```bash
      helm install [RELEASE_NAME] gen3/gen3 -f [VALUES_FILE]
      ```
