# Ansible Playbook
This is an Ansible playbook that sets up the x86 node for the cluster 
from a fresh install of Debian 11 after the SSH keys have been added.

## Roles
There are three roles, base, pxe and k3s.

* base does some basic preparation for the system. 
It does a system update, installs admin tools, installs podman, and installs SELinux.
* pxe prepares the OS images for the raspberry pis and starts the PXE server container.
* k3s installs k3s and CRI-O, and connects the system to the cluster as a worker node.

## Running the play
`ansible-playbook -K -i cloyster.home.jlh.name, playbook.yml`
