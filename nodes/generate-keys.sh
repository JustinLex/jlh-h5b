set -ex

## Run with nodename inside the nodes/ working directory in order to generate a systemd machine-id and ssh host keys for that node.
#
#ssh-keygen -hq -t "rsa" -b 4096 -f "./$1_rsa.key" -N "" -C "root@$1"
#ssh-keygen -hq -t "ed25519" -f "./$1_ed.key" -N "" -C "root@$1"
#
## https://stackoverflow.com/a/34329057
#hexdump -vn16 -e'4/4 "%08X" 1 "\n"' /dev/urandom | awk '{print tolower($0)}' > "./$1.id"

# Generate secret in secrets/node.age, copy pub key to node.pub
ssh-keygen -hq -t "ed25519" -f "./secrets/$1_ssh_host_ed25519_key" -N "" -C "root@$1"
mv "./secrets/$1_ssh_host_ed25519_key.pub" "./nodes/$1.pub"
git add "./nodes/$1.pub"
nix run .#agenix-rekey.apps.x86_64-linux.edit -- -i "./secrets/$1_ssh_host_ed25519_key" "./secrets/$1_ssh_host_ed25519_key.age"
rm "./secrets/$1_ssh_host_ed25519_key"
git add "./secrets/$1_ssh_host_ed25519_key.age"
