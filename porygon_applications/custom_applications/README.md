# Custom Applications

This directory contains Kubernetes manifests I've written myself.

Each directory corresponds to a namespace for an application, 
and everything inside that directory is installed to that directory.

`root-appset.yaml` at the root of the directory here is an ApplicationSet 
that creates the namespaces for each directory and loads the manifests inside them.