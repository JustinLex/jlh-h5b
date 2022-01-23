## Bootstrapping Argo and applications

```shell
kubectl apply -f applications/argocd/argo_and_appset_controller.yaml
kubectl apply -f applications/argocd/argo_and_appset_controller.yaml
```

## Get password
```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl -n argocd delete secret argocd-initial-admin-secret
```
