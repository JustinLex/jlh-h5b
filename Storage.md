# Storage Architecture

## Hardware
* 3 monitors, 2 storage nodes
* RasPi worker acts as monitor on top of the 2 storage nodes

* At the moment, excluding cache disks, there is 2x2TB NVMe storage and 2x16TB of SATA storage.
* 34TB of raw HDD/QLC-SSD storage and 4TB of raw NVMe storage

### Storage nodes
* Both x86
* Both have at least 256GB of NVMe storage for holding the RocksDB for the OSDs

1. Storage node 1 is an Epyc server with over 5 SATA drives and multiple NVMe drives
2. Storage node 2 is a Ryzen server that is bandwidth-limited, but still has at least 1 SATA drive and 1 NVMe drive and can hold a replica copy of all data on storage node 1

### Drives
* All Drives are LUKS encrypted, with a basic LVM layer on top for holding Ceph OSDs/DBs.

## RADOS configuration

### Pools
* 2 pools, 1 for NVMe drives, one for HDD drives

## RADOS Block Device storage
* 1 pool, only on NVMe storage
* Used for database PVCs

## CephFS
* 1 pool, only on NVMe storage
* Used for shared configuration files, ephemeral storage, and Torrents

## Ceph Object Storage
* 2 pools, one on NVMe, one on HDD
* Both pools use NVMe for metadata
* NVMe pool stores nextcloud data
* HDD pool stores media and duplicacy backups
* Objects use compression on nextcloud bucket
* Hopefully possible to do deduplication in the future

## Backups
* Custom operator that creates a duplicacy pod for every RWX PVC and objectbucketclaim (OBC)
* Can use annotations to exclude a claim
* Duplicacy pod creates a repository for each PVC/OBC
* PVC/OBC is backed up every hour in encrypted chunks to a shared duplicacy bucket for deduplication
* Repository configs and encryption keys are uploaded to separate Ceph Object Bucket
  * This bucket is replicated offsite for safekeeping
* Duplicacy bucket in ceph is replicated to B2 continuously
* Pruning
  * Hourly backups are kept for a month
  * Daily backups are kept for a year
  * Monthly backups are kept forever

### Database backups
* All Postgres databases have a cronjob that uploads a backup to object storage hourly

### Temporary solution for object backups until backup operator is developed
* rclone pod that takes each object bucket and copies an encrypted version of it to B2 storage

### Possible hack for CephFS backups until backup operator is developed
* Duplicacy daemonset runs a backup pod on every node that has `/var/lib/kubelet/pods/` hostPath mounted
* Backup pod runs a python script that finds all of the CephFS PVCs in the hostpath and links them to a single directory
* Duplicacy will have a repository for this linking directory and back it up to a single bucket shared by all of the nodes
* This is bad because all PVCs are not mounted on every node
  * The latest version of a PVC could be backed up to any of the worker nodes' repositories and in order to restore them,
  one will have to search each node's repository for the latest version.
* We don't even know what PVC UUID corresponds to which PVC name
* But this is good enough to protect CephFS data until operator is developed
* Might be easier to just develop backup operator, we won't decide until like next year though