#!/bin/bash

# https://www.scottbrady91.com/openssl/creating-elliptical-curve-keys-using-openssl
# https://stackoverflow.com/a/67336849

echo enter username
read -r username

openssl ecparam -name prime256v1 -genkey -noout -out "$username.key"
openssl ec -in private-key.pem -pubout -out public-key.pem
openssl req -new -key private-key.pem -out "$username.csr" -subj "/CN=$username"

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: $username
spec:
  groups:
  - system:authenticated
  request: $(cat "$username.csr" | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF

kubectl certificate approve $username
kubectl get csr $username -o jsonpath='{.status.certificate}'  | base64 -d > $username.crt

base64 -w 0 < $username.crt
echo
base64 -w 0 < $username.key
echo
