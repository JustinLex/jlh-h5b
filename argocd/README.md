
## Docs
https://argo-cd.readthedocs.io/en/stable/getting_started/

## Installation
```shell
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f argocd/ingress.yaml
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/applicationset/v0.3.0/manifests/install.yaml
```

## Get password
```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
