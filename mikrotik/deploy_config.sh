#!/bin/bash

# Deploys the config file.

# Reboots the router in the process though :/
# Mikrotik pls

echo uploading config...
scp config.rsc admin@router.home:/
echo applying config...
ssh admin@router.home '/system reset-configuration keep-users=yes no-defaults=yes run-after-reset=config.rsc'
