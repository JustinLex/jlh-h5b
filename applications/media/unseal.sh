oc get secret -n sealed-secrets -l sealedsecrets.bitnami.com/sealed-secrets-key -o yaml >/tmp/ss-cert

# basic-auth
kubeseal --recovery-unseal --recovery-private-key /tmp/ss-cert < secret-basic-auth.yaml \
| jq -r '.data."auth"' | base64 --decode > htpasswd

rm /tmp/ss-cert