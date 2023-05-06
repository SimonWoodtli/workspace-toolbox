#!/bin/bash

set -uex pipefail

apt-get update && apt-get -y upgrade

declare -i aptCount=$(yq '.apt[]' < /tmp/recipe.yml | wc -l)
declare -a aptPackages=( $(yq '.apt[]' < /tmp/recipe.yml) )
apt-get -y install ${aptPackages[@]}

declare -i cpanCount=$(yq '.cpan[]' < /tmp/recipe.yml | wc -l)
declare -a cpanPackages=( $(yq '.cpan[]' < /tmp/recipe.yml) )
cpan -I ${cpanPackages[@]}

# test if works, I guess docker needs to be installed via firstboot-workspace
git clone https://github.com/docker/docker-install /tmp/docker
cd /tmp/docker
./install.sh
dockerd-rootless-setuptool.sh install

curl -LJ https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip -o /tmp/uplink_linux_amd64.zip
unzip -o /tmp/uplink_linux_amd64.zip
chmod 755 /tmp/uplink
mv /tmp/uplink /usr/local/bin/uplink

git clone https://git.sr.ht/~geb/dotool /tmp/dotool
cd /tmp/dotool
./install.sh
