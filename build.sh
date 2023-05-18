#!/bin/bash

set -uex pipefail

apt-get update && apt-get -y upgrade

declare -i aptCount=$(yq '.apt[]' < /tmp/packages.yml | wc -l)
declare -a aptPackages=( $(yq '.apt[]' < /tmp/packages.yml) )
apt-get -y install ${aptPackages[@]}

declare -i cpanCount=$(yq '.cpan[]' < /tmp/packages.yml | wc -l)
declare -a cpanPackages=( $(yq '.cpan[]' < /tmp/packages.yml) )
cpan -I ${cpanPackages[@]}

curl -LJ https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip -o /tmp/uplink_linux_amd64.zip
unzip /tmp/uplink_linux_amd64.zip -d /usr/local/bin/
chmod 755 /usr/local/bin/uplink
