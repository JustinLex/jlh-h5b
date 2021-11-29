```shell
helm repo add metallb https://metallb.github.io/metallb
kubectl create namespace metallb-system
helm install metallb metallb/metallb -f metallb/values.yaml -n metallb-system
```
