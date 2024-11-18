# Minimal local deployment of Gen3 using Helm

An important strength of Gen3 deployment with Helm is that the Gen3 Helm repo provides reasonable default configurations, permitting speedy generic Gen3 deployment with relatively few user-specified values. This means that users can employ a step-wise approach to deployment that limits the variables at each step, significantly simplifying troubleshooting for any problems that are encountered during this initial deployment.

Therefore, **new Gen3 operators should consider first deploying the minimal, most generic Gen3 deployment with Helm.** It will allow them to establish that all of the necessary software is installed and functional, and lets them walk through basic Gen3 deployment on their computer in 30-60 minutes (assuming pre-installation of all necessary software). Once a Gen3 operator has the minimal Gen3 deployed locally, they can begin customizing in a systematic way that simplifies troubleshooting by limiting the changes made at each step.

The simplest minimal deployment is deploying locally to your localhost, without any SSL certificate or host domain. Although you can deploy a Gen3 instance with all the default values in this way, full configuration and some Gen3 tools depend on the site having an SSL certificate.

We provide instructions for minimal deployment with or without an SSL certificate and host domain in the example below. The bulk of the instructions are identical, regardless. In the few places where instructions are different, we provide distinct instructions for these using the following visual callouts:

!!! local "Local deployment with no SSL certificate"

    The information specific to local deployment with no SSL will be here. Note that, although you can deploy Gen3 with no SSL, some tools or features may require that the Gen3 site has an SSL for full functionality.

!!! served "Local deployment to a host domain with SSL"

    The information specific to deployment to a host domain with an SSL will be here.

## Prerequisites to locally deploy generic Gen3

* Install Helm (https://helm.sh/docs/intro/install/) - there are options for installation using a package installer, or downloading directly, for various OS. Note that we will need the Helm CLI, which may not come with all packages.
* Install Docker (https://docs.docker.com/desktop/)
* Install kubectl (https://kubernetes.io/docs/tasks/tools/#kubectl)
* Prepare to install Kind https://kind.sigs.k8s.io/docs/user/quick-start/ *(we include installation as part of the instructions below)*
* Install Certbot (or some other tool to get your SSL Certificate)
* You will need a host site you control
* Install K9s (https://k9scli.io/) - this is used to give a visual view of what’s going on with your deployment

## Use Kind to set up a local Kubernetes cluster in Docker

### Install Kind in the same folder as your Docker binary

First, identify the path to your Docker binary using the `which docker` command:

```
(base) MacBook-Pro ~ % which docker
/usr/local/bin/docker
```

Install Kind in the same folder as your docker binary. Here are installation options for different OS: https://kind.sigs.k8s.io/docs/user/quick-start/#installation.
Since I have an M1 Mac, I used:

```
[ $(uname -m) = arm64 ] curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-darwin-arm64
chmod +x ./kind
mv ./kind /some-dir-in-your-PATH/kind
```

But, I replaced the `.../some-dir-in-your-PATH/kind` section in the last line above with the path to my Docker binary (be sure to remove the `docker` part and replace with `kind`). I also needed to use `sudo` in the last line for it to run successfully, so the last line was:

```
sudo mv ./kind /usr/local/bin/kind
```

After installing, run `kind` to be sure it’s functional - the output shown demonstrates it is working.

```
(base) MacBook-Pro ~ % kind
kind creates and manages local Kubernetes clusters using Docker container 'nodes'
Usage:
  kind [command]...
```

### Make sure Docker is installed and running

On Mac or Windows, all you need to do is open Docker Desktop.
On Linux, you can use the Docker CLI to run either `sudo systemctl start docker` or `sudo service docker start`.

!!! info

     If you run `docker ps` and you see this output, Docker is not running:
    `Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`

### Set up Kubernetes in Docker

Using Kind, we will set up a local Kubernetes cluster.

Since we will rely on port 80/443, we also need to forward that to the Kind cluster. The cluster can be created using this command:

```
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    kubeadmConfigPatches:
      - |
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "ingress-ready=true"
    extraPortMappings:
      - containerPort: 80
        hostPort: 80
        protocol: TCP
      - containerPort: 443
        hostPort: 443
        protocol: TCP
EOF
```

This output indicates it is working:
```
Creating cluster "kind" ...
...
Set kubectl context to "kind-kind"
You can now use your cluster with:
kubectl cluster-info --context kind-kind
```

## Set up an ingress controller

Next, we need to set up an ingress controller.

You can monitor how this setup is going by opening `http://localhost/` in your browser.

* Before you deploy nginx controller, you should see nothing at localhost
* After you deploy nginx controller, you should see `404 Not Found`

For this example, we will use nginx-ingress: https://kind.sigs.k8s.io/docs/user/ingress/:

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

The manifest contains kind-specific patches to forward the hostPorts to the ingress controller, set taint tolerations, and schedule it to the custom labeled node.

This output is what is expected when successfully created:
```
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
...
ingressclass.networking.k8s.io/nginx created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
```

Now the ingress is all set up. To ensure that you do not proceed until it is ready to process requests, run:

```
kubectl wait --namespace ingress-nginx \
    --for=condition=ready pod \
    --selector=app.kubernetes.io/component=controller \
    --timeout=90s
```

It’s ready when the output indicates the condition is met.

!!! info

     If you do not see `condition met`, it means the pod isn’t healthy. This could be for a variety of reasons (e.g., not able to pull images, out of space); the message that appears instead of `condition met` should help point toward the problem.

## Obtain certificate and create K8s secret

!!! local "Local deployment with no SSL certificate"

    You can deploy locally with no SSL or host domain, although some features and tools may have limited functionality without an SSL. If this is how you will deploy, you do not need to create a certificate. You can skip to [Create a minimal values.yaml](#create-a-minimal-valuesyaml).

!!! served "Local deployment to a host domain with SSL"

    If you choose to deploy with an SSL certificate and you do not yet have one, follow the instructions in this section. If you already have an SSL certificate, you can skip to [Create a minimal values.yaml](#create-a-minimal-valuesyaml)


You will need to have a host site that you own to proceed. Here, our host site is `sara.dev.planx-pla.net`.

### Certbot to generate a certificate

A certificate can be generated using [Certbot](https://certbot.eff.org/). You can look here to get the specific installation instructions for your environment: https://certbot.eff.org/instructions

Once installed, you can run a commmand like this to generate a certificate:

```
sudo certbot certonly --manual --preferred-challenges=dns -d sara.dev.planx-pla.net
```

Here is the expected output from this command. Note that it will ask you to create a DNS TXT record to verify domain ownership - don’t press Enter until you have verified that the DNS TXT record is published (see below)

```
(base) saravolkdegarcia@Saras-MacBook-Pro ~ % sudo certbot certonly --manual --preferred-challenges=dns -d sara.dev.planx-pla.net
Password:
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Enter email address (used for urgent renewal and security notices)
 (Enter 'c' to cancel): s….edu
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.4-April-3-2024.pdf. You must agree in
order to register with the ACME server. Do you agree?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: y
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing, once your first certificate is successfully issued, to
share your email address with the Electronic Frontier Foundation, a founding
partner of the Let's Encrypt project and the non-profit organization that
develops Certbot? We'd like to send you email about our work encrypting the web,
EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: n
Account registered.
Requesting a certificate for sara.dev.planx-pla.net
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please deploy a DNS TXT record under the name:
_acme-challenge.sara.dev.planx-pla.net.
with the following value:
0LiInLyaHawLgZHfRN_OA_oFUa6QhdtkDQo6P-47lkE
Before continuing, verify the TXT record has been deployed. Depending on the DNS
provider, this may take some time, from a few seconds to multiple minutes. You can
check if it has finished deploying with aid of online tools, such as the Google
Admin Toolbox: https://toolbox.googleapps.com/apps/dig/#TXT/_acme-challenge.sara.dev.planx-pla.net.
Look for one or more bolded line(s) below the line ';ANSWER'. It should show the
value(s) you've just added.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
```

### Deploy the DNS TXT record

The details for this will vary depending on your DNS hosting provider. A general overview can be found here:
https://www.id123.io/knowledgebase/adding-a-txt-record-to-a-dns-server/

### Verify the DNS TXT record has been deployed

After you have deployed the DNS TXT record, you can use any DNS lookup tool (e.g.,  https://mxtoolbox.com/SuperTool.aspx) to verify that it has been deployed. To verify deployment, copy/paste the name of the DNS record from the challenge request, then click the dropdown to select TXT Lookup. Then, click the TXT Lookup button.

![Screenshot of MXToolbox TXT lookup tool](../img/mxtool-lookup1.png)

You should see that it is able to find the record and it matches what was specified in the challenge request (see below). If you don’t see it when you check, try again in a couple minutes.

![Results of MXToolbox TXT lookup tool after your challenge is successfully published](../img/mxtool-lookup2.png)

### Trigger the challenge verification

Once you verify that you can see the record, then press Enter in your terminal to continue. It will finish issuing the certificate, and it will show you the paths at which the certificate and key are saved:

```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/sara.dev.planx-pla.net/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/sara.dev.planx-pla.net/privkey.pem
This certificate expires on 2024-12-31.
These files will be updated when the certificate renews.
NEXT STEPS:
- This certificate will not be renewed automatically. Autorenewal of --manual certificates requires the use of an authentication hook script (--manual-auth-hook) but one was not provided. To renew this certificate, repeat this same certbot command before the certificate's expiry date.
```

## Create a minimal values.yaml

Once you have a certificate, you can use this to create a minimal Gen3 values.yaml for Helm deployment. This provides any values for the Gen3 umbrella chart that are different than the default configuration. You can create this file in your preferred IDE or text editor. Save it as “values.yaml”

!!! local "Local deployment with no SSL certificate"

    If you are deploying locally and you are deploying with all the default values configured in the Helm Gen3 repo, you do not need to have a Gen3 values.yaml at this stage. When you are ready to override any default values, you can create a Gen3 values.yaml at that point.

!!! served "Local deployment to a host domain with SSL"

    You will need a Gen3 values.yaml to provide your SSL certificate and point to your host site. Use the instructions in this sections to create one.

A minimal values.yaml will have a `global` section with nested `hostname` and `tls` sections. (I have elided most of the key and certificate body, but left the structure visible so you can see how it was organized.) Note that there is one private key, but two certificates in my example. You may have more or fewer certificates; be sure you include all certificates from your output. (These should have all the certificates in the SSL certificate chain.)

```
global:
hostname: sara.dev.planx-pla.net

    tls:
        key: |
        -----BEGIN PRIVATE KEY-----
        M...W
        -----END PRIVATE KEY-----
    cert: |
        -----BEGIN CERTIFICATE-----
        MII...jk=
        -----END CERTIFICATE-----
        -----BEGIN CERTIFICATE-----
        MIIEV...yH04=
        -----END CERTIFICATE-----
```

You can get the body of the key and the certificates using the `sudo cat` command with the path to your key and certificates, as indicated in the output at the end of the certificate creation:

```
sudo cat /etc/letsencrypt/live/sara.dev.planx-pla.net/fullchain.pem
sudo cat /etc/letsencrypt/live/sara.dev.planx-pla.net/privkey.pem
```
The output from these `cat` commands will be the key and certificate values that you need to add to the values.yaml.

!!! warning "Security Note"

     Remember to keep your key private! Protect the values.yaml from public view.

### Adding to the Gen3 values.yaml later

Deploying initially with a minimal values.yaml will allow you to limit the number of places you need to troubleshoot if your Gen3 deployment has problems. It is much easier to troubleshoot problems if there are fewer variables that could be the problem. Proceed with your first deployment using only the minimal values.yaml (or no Gen3 values.yaml at all, if deploying without SSL).

However, once you know you have your instance up, you will want to expand the values.yaml to customize your instance. There is information at the end of this tutorial that will help you customize your values.yaml.

## Deploy Gen3 with Helm

Add the Gen3 Helm repo locally to your Helm installation:

```
helm repo add gen3 https://helm.gen3.org
```

!!! info

     if you already had this repo added to your Helm installation, you can run `helm repo update` to pull in any changes since you added it.

Deploy Gen3 using your values.yaml with the command below.

* Where `dev` is what we’re calling our release
* `gen3/gen3` means the chart we’re deploying is `gen3` (after slash) from the helm repo called `gen3` (before slash)
* If you have no Gen3 values.yaml, remove the `-f values.yaml` part
* If the values.yaml is named differently, update the name
* If the values.yaml is located somewhere other than the directory you are in for your terminal, change directories to where the values.yaml is before running the command, or else include the path to the values.yaml from the current directory

```
helm upgrade --install dev gen3/gen3 -f values.yaml
```

### Use K9s to monitor progress of deployment

*Note: Ctrl+C will allow you to exit K9s and return to the terminal.*

Type `k9s` into your terminal to start K9s and let you see the pods as they come up.

![K9s screen showing pods rolling up](../img/k9s-1.png)

At the start, some services are not running because they’re waiting for their databases to be created. You’ll see, for example “arborist-dbcreate” complete before “arborist-deployment” can start. Your Gen3 deployment is ready when all the pods in the status column have the “Running” or “Complete” status.

#### Troubleshooting pods that are stuck in Pending

You can use the arrow keys to navigate through the list to select a particular pod to examine. For example, our portal-deployment pod is stuck in “pending”. Use the arrow keys to highlight the portal pod, and then you can type “d” to “describe” the pod.

![K9s screen showing portal deployment pod stuck in pending](../img/k9s-portal-pending.png)

![K9s showing portal deployment pod detail](../img/k9s-portal-detail-1.png)

In the Describe screen, you can scroll up or down to view more details with the arrow keys. Here, we scroll down to bottom to look at Events. We see that there is a message about Insufficient memory.

![K9s showing insufficient memory in Events](../img/k9s-portal-detail-2.png)

Scrolling up, we see that it is requesting 4 Gi:

![K9s showing portal is requesting 4Gi memory](../img/k9s-portal-detail-3.png)

To solve this problem, there are a couple of options:

First, we can go to Docker Desktop and give the container more memory. But since it currently has 8 Gi, that seems like it should be enough.

![Docker Desktop showing the container is allocated 8Gi memory](../img/docker-8gi.png)

So instead, we can add to the minimal values.yaml to tell the portal to request less memory by using a pre-built image (which will require fewer resources from your computer).  Note that `portal` should be on the same level of indent as `global`.

```
global: ...

portal:
    resources:
        requests:
        cpu: "0.2"
            memory: 100Mi
    image:
        repository: quay.io/cdis/data-portal-prebuilt
        tag: dev
```

After saving the changes to your values.yaml, return to your terminal window. You can use Ctrl+C to get out of k9s and return to the terminal. Re-run the command below to restart (will restart only the changed pods).

```
helm upgrade --install dev gen3/gen3 -f values.yaml
```

Here, if you look again in k9s, you will see another portal pod coming up (the lower one). Once it is healthy, the old pod (the upper one) will just be deleted.

![Another portal pod is spinning up under the stuck pending one](../img/k9s-portal-restart.png)

## Point your domain to localhost

!!! local "Local deployment with no SSL certificate"

    If you are deploying directly to localhost with no SSL, you can skip to [View Your New Deployment](#view-your-new-deployment).

!!! served "Local deployment to a host domain with SSL"

    Follow the instructions below to point your host site to the localhost.

In your terminal, run the following command:

```
kubectl get ingress
```

Here, you want to look in the output for something in the address. If you don’t have anything under `ADDRESS`, something may be wrong. In our output (below), we do see “localhost”, so it looks good. (If there is not anything, use K9s to explore what could be wrong.)

```
NAME           CLASS    HOSTS                    ADDRESS     PORTS     AGE
revproxy-dev   <none>   sara.dev.planx-pla.net   localhost   80, 443   6m41s
```

Now, we need to point the sara.dev.planx-pla.net domain to localhost. To do that, we need to update the file `/etc/hosts`. You can use Nano or Vi or whatever your preferred command-line text editor is - here, we’re using Nano. Run this command from inside the Helm directory:

```
sudo nano /etc/hosts
```

This will open the file in the text editor.
You will always have 127.0.0.1 for localhost as the first line.
Create a new line after that to make an entry for our host site. Since we’re running this locally, we will use the IP for our localhost. But note: if you’re running this in a remote host, that should be the IP address of the remote host.

![Add an association for host site to appropriate IP](../img/localhost-redirect.png)

Save your file changes and return to your terminal.

## View your new deployment!

Type your host site name (`localhost` if you deployed without an SSL) in your browser, and view your newly-deployed Gen3!

![Landing page for generic Gen3 deployment](../img/generic-Gen3-landing.png)

!!! info

     If you deploy with the minimal values.yaml described above, your Gen3 instance will deploy, and it will show a Google login button, but you will not be able to log in. This is expected. You will get the authorization error below. See the next section for more information about adding login options.

![Google login error when Google login is not yet configured](../img/google-login-error.png)

## Customizing your Gen3 deployment

Now that you have successfully deployed your minimal Gen3 instance, you can customize the deployment away from the default options.

### Adding to the Gen3 values.yaml

#### How to deploy updates to the values.yaml

After saving any changes to your values.yaml, return to your terminal window. (If necessary, use Ctrl+C to get out of K9s and return to the terminal.) Re-run the command below to restart your Gen3 with the new values.yaml. You can monitor the progress of the new deployment

```
helm upgrade --install dev gen3/gen3 -f values.yaml
```

#### Adding login options to your deployment
Note: If you deploy with the minimal values.yaml, your Gen3 instance will deploy, and it will show a Google login button, but you will not be able to log in. Instead, you will get an authorization error. Below are several options for adding login capabilities to your Gen3 deployment.

##### Mock authorization (for development only)
To deploy an instance that allows a mock authorization, add these Arborist and Fence config sections to the minimal values.yaml described above

!!! warning

     Mock authorization should only be configured for development or testing purposes - do not use this in production.

```
global:
hostname: sara.dev.planx-pla.net

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

##### Google login

To deploy an instance that will allow you to log in with Google, see here:
https://github.com/uc-cdis/gen3-helm?tab=readme-ov-file#google-login-generation

#### Other customization options in the Gen3 values.yaml

An important advantage to using Helm to manage Gen3 deployment is that, in the absence of any customization, Helm will use reasonable default options. This is why the minimal yaml works to permit successful deployment; if there is not a specific selection made about a Gen3 feature, Helm will use a built-in default.

To customize your Gen3 deployment, you will override the default options by defining other values to use. You can see many examples of different customization options in our [example Gen3 values.yaml here](https://github.com/uc-cdis/gen3-helm/blob/master/helm/gen3/values.yaml)
