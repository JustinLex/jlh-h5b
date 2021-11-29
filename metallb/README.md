```shell
helm repo add metallb https://metallb.github.io/metallb
helm install metallb metallb/metallb -f metallb/values.yaml -n metallb-system --create-namespace
```
