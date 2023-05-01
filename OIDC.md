# OIDC Authentication

The kubernetes server is set up to do OIDC authentication against Codeberg.

A new OAuth2 application was set up in Codeberg for confidential clients (see https://auth0.com/docs/get-started/applications/confidential-and-public-applications)
and a callback url of http://localhost:8000

The OIDC authentication was configured on the API server in nodes/ansible/k3s.service

The new user was added to the kubeconfig with 
```commandline
kubectl config set-credentials codeberg-jlh \
    --exec-command=kubectl \
    --exec-api-version=client.authentication.k8s.io/v1beta1 \
    --exec-arg=oidc-login \
    --exec-arg=get-token \
    --exec-arg=--oidc-issuer-url=https://codeberg.org/ \
    --exec-arg=--oidc-extra-scope=email \
    --exec-arg=--oidc-extra-scope=profile \
    --exec-arg=--oidc-client-id=11751232-5dc2-4acb-b123-44af49c8d3c2 \
    --exec-arg=--oidc-client-secret=<secret>
```