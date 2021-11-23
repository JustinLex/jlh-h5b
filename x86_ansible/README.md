# x86 Ansible Play
This is an Ansible play that sets up the x86 node for the cluster 
from a fresh install of Debian 11 after the SSH keys have been added.

## Running the play
`ansible-playbook -K -i cloyster.home.jlh.name, playbook.yml`
