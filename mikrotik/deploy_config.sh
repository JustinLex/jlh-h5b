#!/bin/bash

# Deploys the config file.

# Reboots the router in the process though :/
# Mikrotik pls

scp config.rsc admin@192.168.88.1:/
ssh admin@192.168.88.1 '/system reset-configuration keep-users=yes no-defaults=yes run-after-reset=config.rsc'
