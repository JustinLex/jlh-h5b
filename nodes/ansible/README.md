# Ansible Playbook
This is an Ansible playbook that sets up the x86 node for the cluster 
from a fresh install of Debian 11 after the SSH keys have been added.

## Roles
There are four roles roles, base, pi_image_k3s, pxe, and k3s.

* base does some basic preparation for the system. 
It does a system update, installs admin tools, and installs SELinux.
* pi_image_k3s runs once for each raspberry pi (but runs on the x86 node), and builds the OS images for the pis.
* pxe Installs and starts the PXE server container, installing podman in the process.
* k3s installs k3s and CRI-O, and connects the system to the cluster as a worker node.

## Running the play
`ansible-playbook -K -i cloyster.home.jlh.name, playbook.yml`
