helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install unifi k8s-at-home/unifi -f unifi/values.yaml
