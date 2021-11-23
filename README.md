# jlh-h5b
A Kubernetes-based Homelab


## Architecture

### Cluster architcture
* Single cluster
  * No need for multiple clusters
  * All software can run on primary cluster
  * Bootstrapping and storage can run alongside cluster on x86 node
  * No hardware available to spin up mutliple clusters without use of clunky VMs anyways

* 1 controlplane, 2 worker nodes
  * Worker node redundancy
    * Even if a node goes down, services are still responsive
  * No controlplane redundancy
     * Controlplane is usually only needed when actively administering the cluster, so uptime is not important.
     * Controlplane is still separate from worker nodes to ensure responsiveness

* No redundant persistent storage nodes
  * Save costs and space on a second NAS-focused node
  * Storage durability is still very high
  * Stateless containers are always up
    * even if k8s API goes down
    * even if persistent storage goes down
    * Useful for ensuring VPN access is maintained
   * Maybe failover serving direct from B2 remote backups?

### Hardware
* 3 Node cluster
  * 1 big, robust x86 node
    * Ryzen-based for future scaling
    * 64GB ECC RAM
    * Persistant storage
      * ZFS for checksums, dedup, and RAID 
      * HDDs will have L2ARC and SLOG on NVMe boot drives
    * IPMI for robustness and high uptime
    * 10G networking for high capacity
    * Worker node with big capacity and x86 support
  * Controlplane Raspberry pi 4B
    * 4GB RAM
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
  * x86 Node will be leader in normal situations
  * Local traffic policy so that TCP applications aren't confused about source
  * This means that x86 node will run all TCP applications, such as ingress, Wireguard, and game servers, and these will not be load balanced
    * However ingress and wireguard will fail over to raspi nodes if x86 node goes down
  * HTTP servers and internal services will still load balance across servers

* Istio service mesh
  * Inter-pod network segmentation?

### Agent configuration
* Minimal RBAC
  * Cluster only administered by me
  * Only need service accounts for meta services like monitoring or job spawners

### Monitoring
  * x86 node IPMI
    * IPMI sensors and events
  * Nodes
    * Linux performance metrics
    * System logs
  * Kubernetes metrics
    * Kubernetes granular usage metrics
    * Kubernetes events
  * Containers
    * Per process usage metrics
    * container logs
  * Networking
    * Firewall logs and statistics
    * DHCP logs
    * Wifi events and throughput metrics
  * Home Assistant
    * Sensor metrics
    * Event logs
  