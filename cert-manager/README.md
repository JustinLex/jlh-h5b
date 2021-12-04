```shell
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.6.1 --set installCRDs=true
kubectl apply -f cert-manager/secrets.yaml
kubectl apply -f cert-manager/issuer-letsencrypt.yaml
```
