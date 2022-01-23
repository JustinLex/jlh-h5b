## Bootstrapping Argo and applications

```shell
kubectl apply -f applications/argocd/argo_and_appset_controller.yaml
kubectl apply -f applications/argocd/argo_and_appset_controller.yaml
```
You might need to bootstrap calico too.

## Get password
```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl -n argocd delete secret argocd-initial-admin-secret
```

## Install kubeseal CLI tool
```shell
wget https://github.com/bitnami-labs/sealed-secrets/releases/latest/download/kubeseal-0.17.2-linux-amd64.tar.gz -O /tmp/kubeseal.tar.gz 
tar -xvzf /tmp/kubeseal.tar.gz -C /tmp/
install /tmp/kubeseal /usr/local/bin/kubeseal
```
Once Argo has synced, you can create SealedSecrets by piping the secret manifest into: 
```
kubeseal --controller-namespace sealed-secrets --controller-name sealed-secrets -o yaml
```
The output can be copied into a file and uploaded to git.