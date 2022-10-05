oc get secret -n sealed-secrets -l sealedsecrets.bitnami.com/sealed-secrets-key -o yaml >/tmp/ss-cert

# kubegres-passwords
kubeseal -o yaml --recovery-unseal --recovery-private-key /tmp/ss-cert < secret-kubegres-passwords.yaml \
> secret-kubegres-passwords-unsealed.yaml

# nextcloud-secrets
kubeseal -o yaml --recovery-unseal --recovery-private-key /tmp/ss-cert < secret-nextcloud-secrets.yaml \
> secret-nextcloud-secrets-unsealed.yaml

rm /tmp/ss-cert
