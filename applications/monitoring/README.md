# Monitoring meta-app
This directory contains a meta-app for installing all of the monitoring components of the jlh-h5b cluster.
This Application is installed by the root ApplicationSet in the `argocd` Application, and then in turn installs
its children Applications that install charts from Helm and manifests from the child directories in git.

All Applications installed by this meta-app begin with `monitoring-` and 
Applications that end in `-helm` target Helm charts.