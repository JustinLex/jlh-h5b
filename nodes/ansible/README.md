# Ansible Playbook
This is an Ansible playbook that sets up the x86 node for the cluster 
from a fresh install of Debian 11 after the SSH keys have been added.

The x86 node also bootstraps and configures the Raspberry Pis when they come up, 
so this Ansible playbook is effectively the core of our kubernetes cluster configuration.

## Roles
There are four roles in the playbook: base, pi_image_k3s, pxe_server, and k3s.

* base does some basic preparation for the system. 
It does a system update, installs admin tools, and installs SELinux.
* pi_image_k3s runs once for each raspberry pi (but runs on the x86 node), and builds the k3s OS images for the pis.
* pxe_server Installs and starts the PXE server container, installing podman in the process.
* k3s installs k3s and CRI-O, and connects the system to the cluster as a worker node.

## Running the play
`ansible-playbook -K -i inventory.yml site.yml`
