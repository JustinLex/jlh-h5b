# kubegres-passwords
kubeseal -o yaml \
--controller-name sealed-secrets \
--controller-namespace sealed-secrets \
--scope cluster-wide \
< secret-kubegres-passwords-unsealed.yaml\
> secret-kubegres-passwords.yaml

# nextcloud-secrets
kubeseal -o yaml \
--controller-name sealed-secrets \
--controller-namespace sealed-secrets \
--scope cluster-wide \
< secret-nextcloud-secrets-unsealed.yaml\
> secret-nextcloud-secrets.yaml
