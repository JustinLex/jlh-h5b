# PXE Containers
This is a collection of containers that provide a PXE server used to boot the Raspberry Pis used for my Kubernetes cluster.

## How it works
The server will serve OS images that match the mac address of the connecting device.

The OS images are not part of this container, but are built in the nodes/ansible Ansible Playbook.

The OS images are built on the x86 server before it runs the PXE server and 
are pre-configured so that the Pi gets a unique hostname and joins the cluster automatically.

## Configuing the Pis
Assuming that we're running Raspberry Pi 4s, the Raspberry Pis' EEPROMs must be configured for network boot.

The MAC addresses for the Raspberry Pis must also be added to inventory.yaml in ansible

## This runs on bare metal
Since this container is used to bootstrap the cluster, obviously it shouldn't be hosted in the cluster.

## Credit
A lot of the PXE and RasPi EEPROM configuration was taken from linuxhit's amazing guide on RasPi PXE boot:
https://linuxhit.com/raspberry-pi-pxe-boot-netbooting-a-pi-4-without-an-sd-card/
