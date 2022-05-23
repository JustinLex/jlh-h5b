echo base64\'d ca.crt
kubectl -n tmeit get secret sa-token-gh-actions-deploy -o jsonpath='{.data.ca.crt}'
echo plaintext-token
kubectl -n tmeit get secret sa-token-gh-actions-deploy -o jsonpath='{.data.token}' | base64 -d
