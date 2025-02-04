---
draft: false
authors:
  - qureshi
date: 2023-10-13
slug: k8s tools
categories:
  - Operator
  - CTDS
tags:
  - Kubernetes
  - Minikube
  - Kind
  - K3s
  - Local Development
  - Lightweight Kubernetes
  - Container Orchestration
  - CI/CD
  - Development Tools
  - Docker
  - Rancher Desktop
  - Kubernetes Clusters
  - DevOps
  - Kubernetes Management
  - Containerization
  - Microservices
  - Kubernetes Alternatives
  - Kubernetes Learning
  - Kubernetes Testing
  - Resource Optimization

---

# Boost Your K8s Productivity with These Handy Tools


Managing Kubernetes clusters and resources can get complicated quickly. Thankfully, there are some great open source tools that make working with k8s much easier. In this post, I'll highlight some of my favorite k8s productivity boosters.

## kubectl Aliases

One of the first things I do when setting up my workstation to work with Kubernetes environments is create a set of aliases for common kubectl commands. This saves a ton of typing! Some useful aliases include:

```
alias k=kubectl
alias kg=kubectl get
alias kgp=kubectl get pod
alias kd=kubectl describe
alias ke=kubectl edit
```

<details>
<summary>Full list of aliases!</summary>


```
if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi

# This command is used a LOT both below and in daily life
alias k=kubectl

# Execute a kubectl command against all namespaces
alias kca='f(){ kubectl "$@" --all-namespaces;  unset -f f; }; f'

# Apply a YML file
alias kaf='kubectl apply -f'

# Drop into an interactive terminal on a container
alias keti='kubectl exec -ti'

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc='kubectl config use-context'
alias kcsc='kubectl config set-context'
alias kcdc='kubectl config delete-context'
alias kccc='kubectl config current-context'

# List all contexts
alias kcgc='kubectl config get-contexts'

# General aliases
alias kdel='kubectl delete'
alias kdelf='kubectl delete -f'

# Pod management.
alias kgp='kubectl get pods'
alias kgpw='kgp --watch'
alias kgpwide='kgp -o wide'
alias kep='kubectl edit pods'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'

# get pod by label: kgpl "app=myapp" -n myns
alias kgpl='kgp -l'

# Service management.
alias kgs='kubectl get svc'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'
alias kes='kubectl edit svc'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'

# Ingress management
alias kgi='kubectl get ingress'
alias kei='kubectl edit ingress'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'

# Namespace management
alias kgns='kubectl get namespaces'
alias kens='kubectl edit namespace'
alias kdns='kubectl describe namespace'
alias kdelns='kubectl delete namespace'
alias kcn='kubectl config set-context $(kubectl config current-context) --namespace'

# ConfigMap management
alias kgcm='kubectl get configmaps'
alias kecm='kubectl edit configmap'
alias kdcm='kubectl describe configmap'
alias kdelcm='kubectl delete configmap'

# Secret management
alias kgsec='kubectl get secret'
alias kdsec='kubectl describe secret'
alias kdelsec='kubectl delete secret'

# Deployment management.
alias kgd='kubectl get deployment'
alias kgdw='kgd --watch'
alias kgdwide='kgd -o wide'
alias ked='kubectl edit deployment'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias ksd='kubectl scale deployment'
alias krsd='kubectl rollout status deployment'
kres(){
    kubectl set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
}

# Rollout management.
alias kgrs='kubectl get rs'
alias krh='kubectl rollout history'
alias kru='kubectl rollout undo'

# Port forwarding
alias kpf="kubectl port-forward"

# Tools for accessing all information
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'

# Logs
alias kl='kubectl logs'
alias klf='kubectl logs -f'

# File copy
alias kcp='kubectl cp'

# Node Management
alias kgno='kubectl get nodes'
alias keno='kubectl edit node'
alias kdno='kubectl describe node'
alias kdelno='kubectl delete node'

```
</details>

I stole my k8s aliases from a [Github Gist](https://gist.github.com/doevelopper/ff4a9a211e74f8a2d44eb4afb21f0a38). Huge shoutout to Github User [doevelopper](https://gist.github.com/doevelopper)


## k9s

https://k9scli.io

k9s provides a terminal UI for interacting with your Kubernetes clusters. It's great for get a quick overview of pods, nodes, services etc. Some of the handy features include:

- Live filtering of resources
- Easy log viewing
- Executing containers
- Resource editing

k9s makes it super easy to manage Kubernetes in a terminal-centric workflow.

[![asciicast](https://asciinema.org/a/305944.svg)](https://asciinema.org/a/305944)

## kubectx and kubens

kubectx and kubens allow you to quickly switch between Kubernetes contexts and namespaces. This comes in handy when you're working with multiple clusters or namespaces.

Some examples:

kubens staging - switch to staging namespace
kubectx minikube - change context to minikube cluster

No more typing out full context and namespace names!

Here's a kubectx demo:
![kubectx demo](https://github.com/ahmetb/kubectx/raw/master/img/kubectx-demo.gif)

...and here's a kubens demo:
![kubens demo](https://github.com/ahmetb/kubectx/raw/master/img/kubens-demo.gif)

**Credit:**
Created and released by [Ahmet Alp Balkan](https://github.com/ahmetb)
