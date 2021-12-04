# Wireguard (wg-ui)

## How to install on cluster
```shell
kubectl apply -f wireguard/deployment.yaml
kubectl apply -f wireguard/service-lb.yaml
kubectl apply -f wireguard/service-http.yaml
```
