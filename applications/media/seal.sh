# basic-auth
kubectl create --dry-run=client -o json \
secret generic basic-auth \
--from-file auth=htpasswd \
| kubeseal -o yaml \
--controller-name sealed-secrets \
--controller-namespace sealed-secrets \
--scope cluster-wide \
> secret-basic-auth.yaml
