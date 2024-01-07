# How to set up storage on a node

## New Nodes - /var drive
The /var drive is stored on an m.2 drive.
This helps with cluster/log persistence,
and to help store large amounts of container images and logs without filling up the 60GB flash drive.
(For example, on Latios and Latias, /var is a 500GB NVMe drive.)

### Format the drive with GPT and create a single partition
```commandline
echo -e 'label: gpt\ntype=linux, size=+' | sudo sfdisk /dev/disk/by-id/nvme-UMIS_RPETJ512MGE2QDQ_SS0L25217X1RC18J24R2
```

### Format the partition with XFS
```commandline
sudo mkfs.xfs /dev/disk/by-id/nvme-UMIS_RPETJ512MGE2QDQ_SS0L25217X1RC18J24R2-part1
```

### Add the partition to the node config
Get the XFS UUID with the following command:
```commandline
sudo blkid -s UUID -o value /dev/disk/by-id/nvme-UMIS_RPETJ512MGE2QDQ_SS0L25217X1RC18J24R2-part1
```

Then add the filesystem to the node config by adding the following code block with the UUID you got.
```nix
# Mount /var
fileSystems."/var" = { 
  device = "/dev/disk/by-uuid/39fa028d-e147-428f-9f9f-6fbf2af76871";
  fsType = "xfs";
};
```

Rebuild the node image and the partition will be mounted automatically!


## Adding NVMe SSDs to Ceph
Rook handles everything?


## Adding SATA disks to Ceph
Adding HDDs/QVO-SSDs to Ceph is more complicated than NVMe SSDs, since these drives must reserve space on a cache drive.

We use a central NVMe drive to cache the WAL and DB for all of the hard drives on a Ceph node.

https://docs.ceph.com/en/reef/rados/configuration/bluestore-config-ref/

### Provisioning a cache drive
GPT+LVM. LUKS?

### Adding LVM Volume to cache drive
1TB storage = 50GB cache
