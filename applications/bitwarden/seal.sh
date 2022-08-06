# database-url
kubectl create --dry-run=client -o json \
secret generic database-url \
--from-file DATABASE_URL=database-url \
| kubeseal -o yaml \
--controller-name sealed-secrets \
--controller-namespace sealed-secrets \
--scope cluster-wide \
> secret-database-url.yaml

# kubegres-passwords
kubeseal -o yaml \
--controller-name sealed-secrets \
--controller-namespace sealed-secrets \
--scope cluster-wide \
< secret-kubegres-passwords-unsealed.yaml\
> secret-kubegres-passwords.yaml
