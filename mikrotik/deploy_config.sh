# Deploys the config file.

# Reboots the router in the process though :/
# Mikrotik pls

echo uploading config...
scp -o StrictHostKeyChecking=no config.rsc admin@router.home.jlh.name:/
echo applying config...
ssh -o StrictHostKeyChecking=no admin@router.home.jlh.name '/system reset-configuration keep-users=yes no-defaults=yes run-after-reset=config.rsc'
