# jlh-h5b
A Kubernetes-based Homelab


## Architecture

### Cluster architcture
* Single cluster
  * No need for multiple clusters
  * All software can run on primary cluster
  * Bootstrapping and storage can run alongside cluster on x86 node
  * No hardware available to spin up mutliple clusters without use of VMs?

### Hardware
* 3 Node cluster
  * 1 big, robust x86 node
    * Ryzen-based for future scaling
    * 64GB ECC RAM
    * Persistant storage
    * IPMI for robustness and high uptime
    * 10G networking for high capacity
    * Worker node with big capacity and x86 support
  * Controlplane Raspberry pi 4B
    * 4GB RAM
    * No management redundancy
  * Worker Raspberry pi 4B
    * 8GB RAM
* Metal OSes
  * Debian
    * Provides PXE server and persistant storage
    * Runs k3s to provide an x86 worker node
    * Provisioned with Ansible?
    * Base image?
  * k3OS 
    * Lightweight OS for raspberry pis
* PXE booting for Raspberry pis
  * No SD cards needed
  * Boot parameters configured as code through PXE

### Agent Selection
* Calico CNI
  * Robust, standardized layer 3 networking
  * High performance eBPF on x86 node
* MetalLB layer 2 gateway
  * No routing bottlenecks with cheap switches and routers, even at 10GB throughput
* Istio service mesh
  * Inter-pod network segmentation?

### Agent configurations
* etcd Redundancy across all nodes
  * Stateless containers are always up
    * even if k8s API goes down
    * even if persistent storage goes down
    * Useful for ensuring VPN access is maintained
* Minimal RBAC
  * Cluster only administered by me
  * Only need service accounts for meta services like monitoring or job spawners
